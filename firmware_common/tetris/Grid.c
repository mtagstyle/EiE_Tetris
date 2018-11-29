#include <stdlib.h>
#include <stdio.h>

#include "Grid.h"

void flush_grid (Grid* grid)
{
    if(grid != NULL)
    {
        uint8_t x, y;
        for(x = 0; x < grid->numCols; x++)
        {
            for(y = 0; y < grid->numRows; y++)
            {
                set_grid(grid, x, y, 0);
            }
        }
    }
}

/**
 * Deletes the row specified at y and collapses everything above it
 */
void shift_grid_down (Grid* grid, uint8_t y)
{
    if(grid != NULL)
    {
        uint8_t x;

        //Shift everything down
        for( y; y > 0 ; y-- )
        {
            for( x = 0; x < grid->numCols ; x++ )
            {
                grid->_grid[y][x] = grid->_grid[y-1][x];
            }
        }

        //Set the top of the board to be empty
        for( x = 0; x< grid->numCols; x++ )
        {
            grid->_grid[0][x] = 0;
        }
    }
}

uint8_t is_row_filled(Grid* grid, uint8_t y, uint8_t val)
{
    uint8_t retVal = 1;

    if(grid != NULL)
    {
        uint8_t x;
        
        for(x = 0;  x < grid->numCols; x++ )
        {
            if(grid->_grid[y][x] != val)
                retVal = 0;
        }
    }

    return retVal;
}

void set_grid (Grid* grid, uint8_t x, uint8_t y, uint8_t val)
{
    if(grid != NULL)
    {
        grid->_grid[y][x] = val;
    }
}

Grid* create_grid(void)
{
    //Allocate the struct
    Grid* toReturn = (Grid*)malloc(sizeof(Grid));
    
    toReturn->numCols = MAX_COL;
    toReturn->numRows = MAX_ROW;

    uint8_t x,y;

    for(y = 0; y<MAX_ROW; y++)
    {
        for(x = 0; x<MAX_COL; x++)
        {
            toReturn->_grid[y][x] = 0;
        }
    }

    return toReturn;
}

void destroy_grid(Grid* toDestroy)
{
    free(toDestroy->_grid);
    free(toDestroy);
}

void print_grid(Grid* grid)
{
    if(grid != NULL)
    {
        int row, col;
        for(row = 0; row < grid->numRows; row++)
        {
            for(col = 0; col< grid->numCols; col++)
            {
                printf("%d ", grid->_grid[row][col]);
            }
            printf("\n");
        }
    }
}