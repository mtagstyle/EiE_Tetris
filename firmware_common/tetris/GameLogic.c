#include <stdio.h>
#include <stdlib.h>
#include "GameLogic.h"
#include "Defs.h"
#include "Commands.h"
#include "Grid.h"

static Timer* gravityTimer = NULL;

/*==================================================
State Machine Functions
==================================================*/
void Initialize(GameInstance* game)
{
#if DEBUG_MODE
    printf("Current State: %s\n", __FUNCTION__);
#endif
    channel_open(CHANNEL_GAMEINSTANCE);
    gravityTimer = timer_create(250);

    if(game != NULL)
    {
        game->gridPtr = create_grid();
        game->blockPtr = NULL;
        game->score = 0;
        game->level = 0;
        game->blockFallTimer = timer_create(250);
        game->runState = &SM_SpawnBlock;

        timer_start(game->blockFallTimer);
    }
}

void SM_SpawnBlock(GameInstance* game)
{
#if DEBUG_MODE
    printf("Current State: %s\n", __FUNCTION__);
#endif
    // Change block type
    game->blockPtr = change_tetromino(game->blockPtr);

    Tetromino* tetromino = game->blockPtr;
    // Set position
    tetromino->blockCords.x = (game->gridPtr->numCols-TETROMINO_COLS)/2;   //This places the block right at the center x-cord of the board
    tetromino->blockCords.y = -2;                                          //This places it high enough so it hides part of the tetromino

    //Assign game with new tetromino
    game->blockPtr = tetromino;

    //Print the border
    channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_BORDER_UPDATE);
    channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_SCORE_UPDATE);

    // Change state to idle
    game->runState = &SM_Idle;
}

void SM_Idle(GameInstance* game)
{
#if DEBUG_MODE
    printf("Current State: %s\n", __FUNCTION__);
#endif

    // Check for commands (input)
    if(!channel_is_empty(CHANNEL_GAMEINSTANCE))
    {
        game_process_commands(game);
    }

    // Check to see if timer is ready
    if(timer_ready(game->blockFallTimer))
    {
        // If it is, change state to timeout
        game->runState = &SM_Timeout;
    }
}

void SM_Timeout(GameInstance* game)
{
#if DEBUG_MODE
    printf("Current State: %s\n", __FUNCTION__);
#endif
    //Check for any filled squares below the current block
    if( is_collision(game->gridPtr, game->blockPtr) )
    {
        //If there are, then go to colliison state
        game->runState = &SM_Collision;
    }
    else
    {
        //If there isn't, go to drop block state
        game->runState = &SM_Drop;
    }
}

void SM_Collision(GameInstance* game)
{
#if DEBUG_MODE
    printf("Current State: %s\n", __FUNCTION__);
#endif
    Grid* grid = game->gridPtr;
    Tetromino* tetromino = game->blockPtr;

    // Check for lose condition
    if(has_lost(game))
    {
        game->runState = &SM_Lose;
    }
    else
    {
        // Fill grid
        fill_grid_with_tetromino(grid, tetromino);
        fill_tetromino(tetromino, 0);
        bool doCollapse = false;
        // Iterate through all rows that the tetromino occupies and check for any cleared rows
        for(uint8_t y = 0; y < TETROMINO_ROWS; y++)
        {
            // X is 0 because we don't care what it is
            Location block_wrt_grid = blockcords_to_gridcords(tetromino, y, 0);
            // Range check the converted y value because block with respect to grid cords can be negative
            // and we don't want to check those values
            if( block_wrt_grid.y >= 0 && block_wrt_grid.y < MAX_ROW )
            {
                if( is_row_filled(grid, block_wrt_grid.y, 1) )
                {
                    doCollapse = true;
                    break;
                }
            }
        }

        if(doCollapse)
            game->runState = &SM_Collapse;    // If cleared row, collapse blocks
        else
            game->runState = &SM_SpawnBlock;  // If not cleared, reset block drops
    }
}

void SM_Drop(GameInstance *game)
{
#if DEBUG_MODE
    printf("Current State: %s\n", __FUNCTION__);
#endif

    Tetromino* tetromino = game->blockPtr;
    // Decrease position of the tetromino
    tetromino->blockCords.y++;
    
    // Reset timer
    timer_reset(game->blockFallTimer);

    // Block has dropped, update affected area
    channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_BLOCK_UPDATE);

    // Next state is idle
    game->runState = &SM_Idle;
}

void SM_Lose(GameInstance *game)
{
#if DEBUG_MODE
    printf("Current State: %s\n", __FUNCTION__);
#endif
}

void SM_Collapse(GameInstance *game)
{
#if DEBUG_MODE
    printf("Current State: %s\n", __FUNCTION__);
#endif
    static uint8_t SUBSTATE = 0;
    Tetromino* tetromino = game->blockPtr;
    Grid* grid = game->gridPtr;

    static uint8_t rowToClear = MAX_ROW;
    switch(SUBSTATE)
    {
        //This state means we are waiting for the timer to end
        case 0:
            rowToClear = MAX_ROW;
            for(uint8_t y = MAX_ROW - 1 ; y >= tetromino->blockCords.y; y--)
            {
                //If found, then do stuff
                if( is_row_filled(grid, y, 1) )
                {
                    rowToClear = y;
                    break;
                }
            }

            if( rowToClear != MAX_ROW )
            {
                for(sint16_t x = 0 ; x < MAX_COL; x++ )
                    grid->_grid[rowToClear][x] = 0;

                timer_reset(gravityTimer);
                timer_stop(gravityTimer);
                game->score++;

                channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_GRID_UPDATE); //Since we just cleared a row, send a grid update
                channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_SCORE_UPDATE);
                SUBSTATE = 1;
            }
            else
            {
                game->runState = &SM_SpawnBlock;
            }
        break;

        case 1:
            if(gravityTimer->active == true && timer_ready(gravityTimer))
            {
                shift_grid_down(grid, rowToClear);
                channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_GRID_UPDATE); //Since we shifted a row down, send a grid update
                SUBSTATE = 0;
            }
            else
            {
                timer_start(gravityTimer);
            }
        break;
    }
}


/*==================================================
Private Helper Functions
==================================================*/
/**
 * Check if there is a collision imminent
 **/
bool is_collision(Grid* grid, Tetromino* tetromino)
{
    bool toReturn = false;
    //Find the lowest filled block on the tetromino
    sint16_t x, y;

    //Go from left to right, finding the lowest block and seeing if there is anything below it
    for(x = 0 ; x < TETROMINO_COLS; x++)
    {
        bool found = false;
        for(y = TETROMINO_ROWS-1; y >= 0; y--)
        {
            if( !found && tetromino->_tetromino[y][x] == 1 )
            {
                found = true;
                Location block_wrt_grid = blockcords_to_gridcords(tetromino, y, x);

                //If the block has landed on the first row
                if(block_wrt_grid.y == MAX_ROW -1)
                    toReturn = true;

                else if( grid->_grid[block_wrt_grid.y+1][block_wrt_grid.x] == 1 )
                    toReturn = true;
            }
        }
    }

    return toReturn;
}

/**
 * Returns true if the tetromino is too high, false if not
 **/
bool has_lost(GameInstance * game)
{
    Tetromino* tetromino = game->blockPtr;

    for(sint16_t y = 0; y < TETROMINO_ROWS; y++)
    {
        for(sint16_t x = 0; x < TETROMINO_COLS; x++)
        {
            if( tetromino->_tetromino[y][x] == 1 )
            {
                Location block_wrt_grid = blockcords_to_gridcords(tetromino, y, x);
                if( (block_wrt_grid.y) < 0 )
                {
                    return true;
                }
            }
        }
    }

    return false;
}

/**
 * Fills the grid with 1's wherever the tetromino is
 */
void fill_grid_with_tetromino(Grid* grid, Tetromino* tetromino)
{
    for(sint16_t y = 0; y < TETROMINO_ROWS; y++)
    {
        for(sint16_t x = 0; x < TETROMINO_COLS; x++)
        {
            Location block_wrt_grid = blockcords_to_gridcords(tetromino, y, x);
            if(block_wrt_grid.x >= 0 && block_wrt_grid.x < MAX_COL && block_wrt_grid.y >= 0 && block_wrt_grid.x < MAX_ROW)
            {
                if( tetromino->_tetromino[y][x] == 1 )
                {
                    grid->_grid[block_wrt_grid.y][block_wrt_grid.x] = tetromino->_tetromino[y][x];
                }
            }
        }
    }
}

/**
 * Converts coordinates from tetromino-relative to grid-relative
 */
Location blockcords_to_gridcords(Tetromino* tetromino, sint16_t y, sint16_t x)
{
    Location gridCords;
    gridCords.x = tetromino->blockCords.x + x;
    gridCords.y = tetromino->blockCords.y + y;

    return gridCords;
}

Location gridcords_to_blockcords(Tetromino* tetromino, sint16_t y, sint16_t x)
{
    Location blockCords;
    blockCords.x = x - tetromino->blockCords.x;
    blockCords.y = y - tetromino->blockCords.y;

    return blockCords;
}

void game_process_commands(GameInstance * game)
{
    Grid* grid = game->gridPtr;
    Tetromino* tetromino = game->blockPtr;

    sint32_t value = 0;
    do
    {
        value = channel_dequeue(CHANNEL_GAMEINSTANCE);
        bool updateGUI = true;

        switch(value)
        {
            case CONTROL_LEFT:
                Control_MoveLeft(grid, tetromino);
            break;

            case CONTROL_RIGHT:
                Control_MoveRight(grid, tetromino);
            break;

            case CONTROL_ROTLEFT:
                Control_RotateLeft(grid, tetromino);
            break;

            case CONTROL_ROTRIGHT:
                Control_RotateRight(grid, tetromino);
            break;

            default:
                updateGUI = false;
            break;
        }
        if(updateGUI)
        {
            channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_BLOCK_UPDATE);
        }
    } while(value != RC_FAIL);
}

void print_game(GameInstance* game)
{
    Tetromino* tetromino = game->blockPtr;
    Grid* grid = game->gridPtr;

    for(uint16_t y = 0; y < MAX_ROW; y++)
    {
        for(uint16_t x = 0; x < MAX_COL; x++)
        {
            Location block_wrt_grid = gridcords_to_blockcords(tetromino, y, x);
            //If within range
            if( tetromino->blockCords.y <= y && y < (tetromino->blockCords.y + TETROMINO_ROWS) 
            &&  tetromino->blockCords.x <= x && x < (tetromino->blockCords.x + TETROMINO_COLS)
            &&  tetromino->_tetromino[block_wrt_grid.y][block_wrt_grid.x] == 1)
            {
                printf("%d ", 1);
            }
            else
            {
                printf("%d ", grid->_grid[y][x]);
            }
        }

        printf("\n");
    }
}

/**
* Checks for any invalid conditions i.e. tetromino overlapping grid or tetromino out of range
*/
bool check_overlap(Grid* grid, Tetromino* tetromino)
{
    for(uint8_t y = 0; y < TETROMINO_ROWS; y++)
    {
        for(uint8_t x = 0; x < TETROMINO_COLS; x++)
        {
            if( tetromino->_tetromino[y][x] == 1 )
            {
                Location block_wrt_grid = blockcords_to_gridcords(tetromino, y, x);
                
                //Out of range condition (We only care about X, because Y out of range can be valid)
                if(block_wrt_grid.x < 0 || block_wrt_grid.x >= MAX_COL)
                {
                    return true;
                }
                //Overlap condition
                if(block_wrt_grid.y > 0 && block_wrt_grid.y <= MAX_ROW)
                {
                    if( grid->_grid[block_wrt_grid.y][block_wrt_grid.x] == 1)
                    {
                        return true;
                    }
                }
            }
        }
    }

    return false;
}
/*=====================
* Game commands
======================*/

void Control_MoveLeft(Grid* grid, Tetromino* tetromino)
{
    tetromino->blockCords.x--;
    if(check_overlap(grid, tetromino))
        tetromino->blockCords.x++;
    else
        channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_BLOCK_UPDATE);
}

void Control_MoveRight(Grid* grid, Tetromino* tetromino)
{
    tetromino->blockCords.x++;
    if(check_overlap(grid, tetromino))
        tetromino->blockCords.x--;
    else
        channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_BLOCK_UPDATE);
}

void Control_RotateLeft(Grid* grid, Tetromino* tetromino)
{
    rotate_left(tetromino);
    if(check_overlap(grid, tetromino))
        rotate_right(tetromino);
    else
        channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_BLOCK_UPDATE);
}

void Control_RotateRight(Grid* grid, Tetromino* tetromino)
{
    rotate_right(tetromino);
    if(check_overlap(grid, tetromino))
        rotate_left(tetromino);
    else
        channel_send(CHANNEL_GAMECONTROLLER, MESSAGE_GUI_BLOCK_UPDATE);
}