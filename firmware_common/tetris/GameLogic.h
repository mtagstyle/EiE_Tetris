#ifndef GAME_LOGIC_H
#define GAME_LOGIC_H

#include "Grid.h"
#include "Tetromino.h"
#include "Timers.h"

typedef struct _game_instance GameInstance;
struct _game_instance
{
    Grid*       gridPtr;
    Tetromino*  blockPtr;
    uint16_t    score;
    uint16_t    level;

    //Timers
    Timer* blockFallTimer;
    void (*runState)(GameInstance* );
};

void Initialize     (GameInstance* game);
void SM_SpawnBlock  (GameInstance* game);
void SM_Idle        (GameInstance* game);
void SM_Timeout     (GameInstance* game);
void SM_Collision   (GameInstance* game);
void SM_Drop        (GameInstance* game);
void SM_Lose        (GameInstance *game);
void SM_Collapse    (GameInstance *game);

bool has_lost(GameInstance * game);
void fill_grid_with_tetromino(Grid* grid, Tetromino* tetromino);
void game_process_commands(GameInstance * game);
void print_game(GameInstance* game);
bool is_collision(Grid* grid, Tetromino* tetromino);
bool check_overlap(Grid* grid, Tetromino* tetromino);
Location blockcords_to_gridcords(Tetromino* tetromino, sint16_t y, sint16_t x);
Location gridcords_to_blockcords(Tetromino* tetromino, sint16_t y, sint16_t x);

void Control_MoveLeft   (Grid* grid, Tetromino* tetromino);
void Control_MoveRight  (Grid* grid, Tetromino* tetromino);
void Control_RotateLeft (Grid* grid, Tetromino* tetromino);
void Control_RotateRight(Grid* grid, Tetromino* tetromino);

#endif