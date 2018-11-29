#include <unistd.h>
#include "Grid.h"
#include "Tetromino.h"
#include "Commands.h"
#include "GameLogic.h"
#include <stdio.h>

void main(char argc, char** argv)
{
    //Test 1: Grid Test
    Grid* gridptr = create_grid();
    print_grid(gridptr);

    //Test 2: Rotation test
    printf("\n");
    Tetromino* tetromino = create_tetromino( SHAPE_LEFTS );
    print_tetromino(tetromino);

    for(int i = 0; i < 4; i++)
    {
        rotate_right(tetromino);
        printf("\n");
        print_tetromino(tetromino);
    }
    for(int i = 0; i < 4; i++)
    {
        rotate_left(tetromino);
        printf("\n");
        print_tetromino(tetromino);
    }

    //Test 3: Commands (IPC) test
    int result;
    result = channel_open(CHANNEL_DEFAULT);
    printf("Result from opening channel: %d\n", result);

    for(int i = 0 ; i<11; i++)
    {
        result = RC_FAIL;
        result = channel_send(CHANNEL_DEFAULT, i*5);
        printf("Result from sending the %d time is: %d\n", i, result);
    }

    for(int i = 0 ; i<11; i++)
    {
        result = RC_FAIL;
        result = channel_dequeue(CHANNEL_DEFAULT);
        printf("Result from dequeuing the %d time is: %d\n", i, result);
    }

    //Test 4: Grid tests
    tetromino->blockCords.y = -1;
    fill_grid_with_tetromino(gridptr, tetromino);
    print_grid(gridptr);

    //Test 5: Timer tests
    printf("Initializing timer: \n");
    Timer* timer = timer_create(5);
    timer_start(timer);
    while(timer->triggered == false)
    {
        printf("Timer value: %d Triggered: %d\n", timer->value, timer->triggered);
        SM_RunTimers();
        sleep(0.25);
    }

    //Test 6: Integration test
    GameInstance game;
    Initialize(&game);

    for(uint16_t y = MAX_ROW-1; y>=MAX_ROW-2; y--)
    {
        for(uint16_t x = 0; x< MAX_COL; x++)
        {
            if(x != 4 && x != 5)
            {
                set_grid(game.gridPtr, x, y, 1);
            }
        }
    }

    while(true)
    {
        usleep(250000);
        game.runState(&game);
        SM_RunTimers();

        print_game(&game);
    }
}