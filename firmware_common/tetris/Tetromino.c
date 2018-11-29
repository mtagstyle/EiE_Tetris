#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "Tetromino.h"
#include "Configuration.h"

extern volatile u32 G_u32SystemTime1ms;     

const uint8_t TShape[TETROMINO_ROWS][TETROMINO_COLS] = 
                                                    {   {0, 0, 0, 0, 0}, 
                                                        {0, 0, 1, 0, 0}, 
                                                        {0, 1, 1, 1, 0}, 
                                                        {0, 0, 0, 0, 0}, 
                                                        {0, 0, 0, 0, 0}  
                                                    };                      
const uint8_t LeftLShape[TETROMINO_ROWS][TETROMINO_COLS] = 
                                                    {   {0, 0, 0, 0, 0}, 
                                                        {0, 1, 1, 1, 0}, 
                                                        {0, 1, 0, 0, 0}, 
                                                        {0, 0, 0, 0, 0}, 
                                                        {0, 0, 0, 0, 0}  
                                                    };
const uint8_t RightLShape[TETROMINO_ROWS][TETROMINO_COLS] = 
                                                    {   {0, 0, 0, 0, 0}, 
                                                        {0, 1, 1, 1, 0}, 
                                                        {0, 0, 0, 1, 0}, 
                                                        {0, 0, 0, 0, 0}, 
                                                        {0, 0, 0, 0, 0}  
                                                    };
const uint8_t LeftSShape[TETROMINO_ROWS][TETROMINO_COLS] = 
                                                    {   {0, 0, 0, 0, 0}, 
                                                        {0, 1, 1, 0, 0}, 
                                                        {0, 0, 1, 1, 0}, 
                                                        {0, 0, 0, 0, 0}, 
                                                        {0, 0, 0, 0, 0}  
                                                    };
const uint8_t RightSShape[TETROMINO_ROWS][TETROMINO_COLS] = 
                                                    {   {0, 0, 0, 0, 0}, 
                                                        {0, 0, 1, 1, 0}, 
                                                        {0, 1, 1, 0, 0}, 
                                                        {0, 0, 0, 0, 0}, 
                                                        {0, 0, 0, 0, 0}  
                                                    };
const uint8_t SquareShape[TETROMINO_ROWS][TETROMINO_COLS] = 
                                                    {   {0, 0, 0, 0, 0}, 
                                                        {0, 0, 1, 1, 0}, 
                                                        {0, 0, 1, 1, 0}, 
                                                        {0, 0, 0, 0, 0}, 
                                                        {0, 0, 0, 0, 0}  
                                                    };
const uint8_t LineShape[TETROMINO_ROWS][TETROMINO_COLS] = 
                                                    {   {0, 0, 0, 0, 0}, 
                                                        {0, 0, 0, 0, 0}, 
                                                        {0, 1, 1, 1, 1}, 
                                                        {0, 0, 0, 0, 0}, 
                                                        {0, 0, 0, 0, 0}  
                                                    };

void rotate_left(Tetromino* tetromino)
{
    if(tetromino != NULL)
    {
        Tetromino temp = *tetromino;
        uint8_t x = 0, y = 0;
        for( y=0;  y < TETROMINO_ROWS; y++ )
        {
            for( x=0; x < TETROMINO_COLS; x++ )
            {
                tetromino->_tetromino[y][x] = temp._tetromino[x][(y*-1)+4];
            }
        }
    }
}

void rotate_right(Tetromino* tetromino)
{
    if(tetromino != NULL)
    {
        Tetromino temp = *tetromino;
        uint8_t x = 0, y = 0;
        for( y=0;  y < TETROMINO_ROWS; y++ )
        {
            for( x=0; x < TETROMINO_COLS; x++ )
            {
                tetromino->_tetromino[y][x] = temp._tetromino[(x*-1)+4][y];
            }
        }
    }
}

void print_tetromino(Tetromino* tetromino)
{
    if(tetromino != NULL)
    {
        uint8_t x = 0, y = 0;
        for(y = 0; y< TETROMINO_ROWS; y++)
        {
            for( x = 0; x< TETROMINO_COLS; x++ )
            {
                printf("%d ", tetromino->_tetromino[y][x]);
            }

            printf("\n");
        }
    }
}

Tetromino* create_tetromino(shapeTypes shape)
{                 
    Tetromino* tetromino = malloc(sizeof(Tetromino));                               
    switch(shape)
    {
        case SHAPE_T:
            memcpy(&(tetromino->_tetromino), &TShape, sizeof(uint8_t)*TETROMINO_ROWS*TETROMINO_COLS);
        break;
        
        case SHAPE_LEFTL:
            memcpy(&(tetromino->_tetromino), &LeftLShape, sizeof(uint8_t)*TETROMINO_ROWS*TETROMINO_COLS);
        break;
        
        case SHAPE_RIGHTL:
            memcpy(&(tetromino->_tetromino), &RightLShape, sizeof(uint8_t)*TETROMINO_ROWS*TETROMINO_COLS);
        break;
        
        case SHAPE_LEFTS:
            memcpy(&(tetromino->_tetromino), &LeftSShape, sizeof(uint8_t)*TETROMINO_ROWS*TETROMINO_COLS);
        break;
        
        case SHAPE_RIGHTS:
            memcpy(&(tetromino->_tetromino), &RightSShape, sizeof(uint8_t)*TETROMINO_ROWS*TETROMINO_COLS);
        break; 
        
        case SHAPE_SQUARE:
            memcpy(&(tetromino->_tetromino), &SquareShape, sizeof(uint8_t)*TETROMINO_ROWS*TETROMINO_COLS);
        break; 
        
        case SHAPE_LINE:
            memcpy(&(tetromino->_tetromino), &LineShape, sizeof(uint8_t)*TETROMINO_ROWS*TETROMINO_COLS);
        break;

        default:
            free(tetromino);
            return NULL;
    }
    
    tetromino->blockCords.x = 0;
    tetromino->blockCords.y = 0;

    return tetromino;
}

void destroy_tetromino(Tetromino* tetromino)
{
    if(tetromino != NULL)
        free(tetromino);
}
    
Tetromino* change_tetromino (Tetromino* tetromino)
{
    if(tetromino != NULL)
    {
        destroy_tetromino(tetromino);
    }
    
    srand((uint32_t)G_u32SystemTime1ms);
    uint32_t rng = rand() % MAX_SHAPES;
    return create_tetromino(rng);
}

void set_tetromino (Tetromino* tetromino, uint8_t x, uint8_t y, uint8_t val)
{
    if(tetromino != NULL)
    {
        tetromino->_tetromino[y][x] = val;
    }
}

void fill_tetromino(Tetromino* tetromino, uint8_t val)
{
    if(tetromino != NULL)
    {
        for(uint8_t y = 0; y < TETROMINO_ROWS; y++)
        {
            for(uint8_t x = 0; x < TETROMINO_COLS; x++)
            {
                tetromino->_tetromino[y][x] = val;
            }
        }
    }
}
