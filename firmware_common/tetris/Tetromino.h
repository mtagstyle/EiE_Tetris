#ifndef TETROMINO_H
#define TETROMINO_H
#include "Defs.h"

#define TETROMINO_ROWS 5
#define TETROMINO_COLS 5

typedef struct _location
{
    sint16_t x;
    sint16_t y;
} Location;

typedef struct
{
    uint8_t     _tetromino[TETROMINO_ROWS][TETROMINO_COLS];
    Location    blockCords;
} Tetromino;

typedef enum _shapeTypes {SHAPE_T, SHAPE_LEFTL, SHAPE_RIGHTL, SHAPE_LEFTS, SHAPE_RIGHTS, SHAPE_SQUARE, SHAPE_LINE, MAX_SHAPES } shapeTypes;

Tetromino* create_tetromino(shapeTypes shape);
void       destroy_tetromino(Tetromino* tetromino);
Tetromino* change_tetromino(Tetromino* tetromino);
void       fill_tetromino(Tetromino* tetromino, uint8_t val);

void rotate_left    (Tetromino* tetromino);
void rotate_right   (Tetromino* tetromino);
void print_tetromino(Tetromino* tetromino);
void set_tetromino  (Tetromino* tetromino, uint8_t x, uint8_t y, uint8_t val);

#endif
