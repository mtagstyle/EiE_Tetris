#include "GameController.h"
#include "GameLogic.h"
#include "Tetromino.h"
#include "Grid.h"
#include "Timers.h"
#include "GUI.h"
#include "InputController.h"
#include "Commands.h"
#include "Audio.h"

static GameInstance game;
static Timer *gui_timer, *controls_timer, *game_timer, *audio_timer;

void GameControllerInitialize(void)
{
    Initialize(&game);
    InputController_Initialize();
    Audio_Initialize();

    gui_timer =        timer_create(2);
    controls_timer =   timer_create(25);
    game_timer =       timer_create(100);
    
    timer_start(gui_timer);
    timer_start(controls_timer);
    timer_start(game_timer);

    channel_open(CHANNEL_GAMECONTROLLER);
}
void GameController_RunActiveState(void)
{
    update_game();
    update_gui();
    update_controls();
    update_audio();
}
void update_gui(void)
{
    while(!channel_is_empty(CHANNEL_GAMECONTROLLER))
    {
        sint32_t mesg = channel_dequeue(CHANNEL_GAMECONTROLLER);
        switch(mesg)
        {
            case MESSAGE_GUI_BLOCK_UPDATE:
                GUIPrintTetromino(&game);
            break;

            case MESSAGE_GUI_GRID_UPDATE:
                GUIPrintGrid(&game);
            break;

            case MESSAGE_GUI_BORDER_UPDATE:
                GUIPrintBorders();
            break;

            case MESSAGE_GUI_SCORE_UPDATE:
                GUIPrintScore(game.score);
            break;
        }
    }
}
void update_controls(void)
{
    if(timer_ready(controls_timer))
    {
        InputController_RunInputController();
        
        timer_reset(controls_timer);
    }

    if(!channel_is_empty(CHANNEL_GAMECONTROLLER))
    {
        sint32_t mesg = channel_dequeue(CHANNEL_GAMECONTROLLER);
        switch(mesg)
        {
            case MESSAGE_INPUT_A:
                Control_RotateRight(game.gridPtr, game.blockPtr);
            break;

            case MESSAGE_INPUT_B:
                Control_RotateLeft(game.gridPtr, game.blockPtr);
            break;
    
            case MESSAGE_INPUT_UP:
            break;

            case MESSAGE_INPUT_DOWN:
            break;

            case MESSAGE_INPUT_LEFT:
                Control_MoveLeft(game.gridPtr, game.blockPtr);
            break;

            case MESSAGE_INPUT_RIGHT:
                Control_MoveRight(game.gridPtr, game.blockPtr);
            break;            
        }
    }
}
void update_audio(void)
{
    Audio_RunActiveState();
}
void update_game(void)
{
    if(timer_ready(game_timer))
    {
        game.runState(&game);

        timer_reset(game_timer);
    }
}