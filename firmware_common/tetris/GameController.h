#ifndef GAME_CONTROLLER_H
#define GAME_CONTROLLER_H

void GameControllerInitialize(void);
void GameController_RunActiveState(void);

void update_gui(void);
void update_controls(void);
void update_audio(void);
void update_game(void);

#endif