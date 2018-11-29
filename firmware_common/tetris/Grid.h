#ifndef __GRID_H
#define __GRID_H
#include "Defs.h"

#define MAX_ROW 24
#define MAX_COL 10

/*=======================
  Public
 =======================*/
typedef struct 
{
    uint8_t _grid[MAX_ROW][MAX_COL];
    uint8_t numRows;
    uint8_t numCols;
} Grid;

void    flush_grid      (Grid* grid);
void    shift_grid_down (Grid* grid, uint8_t y);
void    set_grid        (Grid* grid, uint8_t x, uint8_t y, uint8_t val);
uint8_t is_row_filled   (Grid* grid, uint8_t y, uint8_t val);
void    destroy_grid    (Grid* toDestroy);
void    print_grid      (Grid* grid);
Grid*   create_grid(void);
#endif