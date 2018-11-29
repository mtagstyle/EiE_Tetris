#ifndef __GAME_ENGINE_H
#define __GAME_ENGINE_H

#include "player.h"

/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/
typedef struct
{
  player* players;
  hazard* hazards;
  construction* constructions;
  objective* objectives;
} level

/*******************************************************************************
* Function Prototypes
*******************************************************************************/
void LoadLevel(player *players, hazard* hazards, construction* constructions, objective* objectives);
void CleanupLevel(void);
void RenderGame();

#endif