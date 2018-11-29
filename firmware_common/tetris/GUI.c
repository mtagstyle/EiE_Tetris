#include "GameLogic.h"
#include "GUI.h"
#include "lcd_NHD-C12864Lz.h"
#include "stdio.h"

extern u8 G_aau8LcdRamImage[LCD_IMAGE_ROWS][LCD_IMAGE_COLUMNS];    /* A complete copy of the LCD image in RAM */

#define PIXEL_SIZE 5

#define LEFTSCREEN_ROW_START 4
#define LEFTSCREEN_ROW_END   LEFTSCREEN_ROW_START + (MAX_ROW/2 * PIXEL_SIZE)
#define LEFTSCREEN_COL_START 1
#define LEFTSCREEN_COL_END   LEFTSCREEN_COL_START + (MAX_COL * PIXEL_SIZE)

#define RIGHTSCREEN_ROW_START  0
#define RIGHTSCREEN_ROW_END    RIGHTSCREEN_ROW_START + (MAX_ROW/2 * PIXEL_SIZE)
#define RIGHTSCREEN_COL_START  52
#define RIGHTSCREEN_COL_END    RIGHTSCREEN_COL_START + (MAX_COL * PIXEL_SIZE)

/**
*  Prints borders on the edges of each game segment
*/
void GUIPrintBorders()
{
    //Top Border
    for(uint8_t y = 0; y < LEFTSCREEN_ROW_START; y++)
    {
        for(uint8_t x = 0; x < LEFTSCREEN_COL_END ; x++)
        {
            GUISetPixelValue(x, y, 1);
        }
    }

    //Bottom Border
    for(uint8_t y = RIGHTSCREEN_ROW_END; y < 128; y++)
    {
        for(uint8_t x = RIGHTSCREEN_COL_START; x < RIGHTSCREEN_COL_END; x++)
        {
            GUISetPixelValue(x, y, 1);
        }
    }
    //Left Border
    for(uint8_t y = 0; y < 64; y++)
    {
        for(uint8_t x = 0; x < LEFTSCREEN_COL_START; x++)
        {
            GUISetPixelValue(x, y, 1);
        }
    }

    //Middle Border
    for(uint8_t y = 0; y < 64; y++)
    {
        for(uint8_t x = LEFTSCREEN_COL_END; x < RIGHTSCREEN_COL_START; x++)
        {
            GUISetPixelValue(x, y, 1);
        }
    }

    //Right Border
    for(uint8_t y = 0; y < 64; y++)
    {
        for(uint8_t x = RIGHTSCREEN_COL_END; x < RIGHTSCREEN_COL_END+1; x++)
        {
            GUISetPixelValue(x, y, 1);
        }
    }

    PixelBlockType gridMap;
    gridMap.u16ColumnSize = 128;
    gridMap.u16RowSize = 64;
    gridMap.u16ColumnStart = 0;
    gridMap.u16RowStart = 0;
    LcdUpdateScreenRefreshArea(&gridMap);
}

void GUIPrintTetromino(GameInstance* game)
{
    if( game != NULL )
    {
        Location block_wrt_grid;
        Grid* grid = game->gridPtr;
        Tetromino* tetromino = game->blockPtr;
        
        for(uint8_t y = 0; y < TETROMINO_ROWS; y++)
        {
            for(uint8_t x = 0; x < TETROMINO_COLS; x++)
            {
                block_wrt_grid = blockcords_to_gridcords(tetromino, y, x);
                if(tetromino->_tetromino[y][x] == 1 || grid->_grid[block_wrt_grid.y][block_wrt_grid.x] == 1)
                {
                    GUIPrintBlock(block_wrt_grid.x, block_wrt_grid.y, 1);
                }
                else
                {
                    GUIPrintBlock(block_wrt_grid.x, block_wrt_grid.y, 0);
                }
            }
        }
    }
}

void GUIPrintGrid(GameInstance* game)
{
    if( game !=  NULL )
    {
        Grid* grid = game->gridPtr;

        for(uint8_t y = 0; y < grid->numRows; y++)
        {
            for(uint8_t x = 0; x < grid->numCols; x++)
            {
                if( grid->_grid[y][x] == 1)
                    GUIPrintBlock(x, y, 1);
                else
                    GUIPrintBlock(x, y, 0);
            }
        }
    }
}

void GUIPrintBlock(uint8_t x, uint8_t y, uint8_t val)
{
    uint8_t startingY, startingX;

    //Range check to make sure we aren''t trying to print outside of the grid
    if( x < 0 || x >= MAX_COL || y < 0 || y >= MAX_ROW)
    {
        return;
    }

    //Determine which screen the block is on
    if( y < MAX_ROW/2 )
    {
        // Get starting point of pixel to print
        startingY = (y*PIXEL_SIZE) + LEFTSCREEN_ROW_START;
        startingX = (x*PIXEL_SIZE) + LEFTSCREEN_COL_START;
    }
    else if ( y >= MAX_ROW/2 && y < MAX_ROW )
    {
        startingY = (y*PIXEL_SIZE - MAX_ROW/2*PIXEL_SIZE) + RIGHTSCREEN_ROW_START;
        startingX = (x*PIXEL_SIZE) + RIGHTSCREEN_COL_START;
    }

    //Left and right
    for(uint8_t j = startingY; j < startingY + PIXEL_SIZE; j++)
    {
        GUISetPixelValue(startingX, j, val);
        GUISetPixelValue(startingX + PIXEL_SIZE-1, j, val);
    }

    //Top and bottom
    for(uint8_t i = startingX; i < startingX + PIXEL_SIZE; i++)
    {
        GUISetPixelValue(i, startingY, val);
        GUISetPixelValue(i, startingY + PIXEL_SIZE-1, val);
    }

    PixelBlockType gridMap;
    gridMap.u16ColumnSize = 128;
    gridMap.u16RowSize = 64;
    gridMap.u16ColumnStart = 0;
    gridMap.u16RowStart = 0;
    LcdUpdateScreenRefreshArea(&gridMap);
}

void GUISetPixelValue(uint8_t col, uint8_t row, uint8_t val)
{
    PixelAddressType targetPixel;
    targetPixel.u16PixelColumnAddress = col;
    targetPixel.u16PixelRowAddress = row;

    if(val > 0 )
    {
        LcdSetPixel(&targetPixel);
    }
    else if ( val == 0 )
    {
        LcdClearPixel(&targetPixel);
    }
}

void print_bottom_half(GameInstance *game)
{
    if(game != NULL)
    {    
        Grid* grid = game->gridPtr;
        Tetromino* tetromino = game->blockPtr;
        u8* ramPtr;

        uint8_t BYTE_MASK;
        uint32_t j = 2;
        
        for(uint8_t y = grid->numRows/2; y < grid->numRows ; y++)
        {
            for(uint8_t c = 0 ; c < PIXEL_SIZE; c++)
            {
                //Shift the pointer to the correct byte
                ramPtr = &(G_aau8LcdRamImage[RIGHTSCREEN_ROW_START+y*PIXEL_SIZE-(grid->numRows/2*PIXEL_SIZE)+c][6]);
                j = 2;

                //Shift the pointer to the correct bit
                BYTE_MASK = 0x04;
                int s;
                for(uint8_t x = 0; x < grid->numCols; x++)
                {
                    for(uint8_t i = 0; i < PIXEL_SIZE; i++)
                    {

                        if(grid->_grid[y][x] == 1 && (i == 0 || i == PIXEL_SIZE-1 || c == 0 || c == PIXEL_SIZE -1 ))
                            *ramPtr = *ramPtr | BYTE_MASK;
                        else
                            *ramPtr = *ramPtr & ~BYTE_MASK;

                        BYTE_MASK = BYTE_MASK << 1;
                        j++;

                        if( j % 8 == 0 )
                        {
                            ramPtr++;
                            BYTE_MASK = 0x01;
                        }
                    }
                }
            }
        }
        PixelBlockType gridMap;
        gridMap.u16ColumnSize = 128;
        gridMap.u16RowSize = 64;
        gridMap.u16ColumnStart = 0;
        gridMap.u16RowStart = 0;
        LcdUpdateScreenRefreshArea(&gridMap);
    }
}

void print_top_half(GameInstance* game)
{
    if(game != NULL)
    {    
        Grid* grid = game->gridPtr;
        Tetromino* tetromino = game->blockPtr;
        u8* ramPtr;

        uint8_t BYTE_MASK;
        uint32_t j = 0;
        
        for(uint8_t y = 0; y < grid->numRows/2 ; y++)
        {
            for(uint8_t c = 0 ; c < PIXEL_SIZE; c++)
            {
                //Shift the pointer to the correct byte
                ramPtr = &(G_aau8LcdRamImage[LEFTSCREEN_ROW_START+y*PIXEL_SIZE+c][0]);
                j = 0;

                //Shift the pointer to the correct bit
                BYTE_MASK = 0x01;
                int s;
                for(uint8_t x = 0; x < grid->numCols; x++)
                {
                    for(uint8_t i = 0; i < PIXEL_SIZE; i++)
                    {
                        if(grid->_grid[y][x] == 1 && (i == 0 || i == PIXEL_SIZE-1 || c == 0 || c == PIXEL_SIZE -1 ))
                            *ramPtr = *ramPtr | BYTE_MASK;
                        else
                            *ramPtr = *ramPtr & ~BYTE_MASK;
 
                        BYTE_MASK = BYTE_MASK << 1;
                        j++;

                        if( j % 8 == 0 )
                        {
                            ramPtr++;
                            BYTE_MASK = 0x01;
                        }
                    }
                }
            }
        }
        PixelBlockType gridMap;
        gridMap.u16ColumnSize = 128;
        gridMap.u16RowSize = 64;
        gridMap.u16ColumnStart = 0;
        gridMap.u16RowStart = 0;
        LcdUpdateScreenRefreshArea(&gridMap);
    }
}

void GUIPrintScore(uint16_t lines)
{
    PixelAddressType starting;
    starting.u16PixelColumnAddress = RIGHTSCREEN_COL_END+2;
    starting.u16PixelRowAddress = LEFTSCREEN_ROW_START+2;
    LcdLoadString("scor", LCD_FONT_SMALL, &starting); 
    starting.u16PixelRowAddress = LEFTSCREEN_ROW_START+15;
    char score[10];
    sprintf(score, "%d", lines);
    
    LcdLoadString(score, LCD_FONT_SMALL, &starting); 
}