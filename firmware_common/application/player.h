#ifndef __GAME_PLAYER_H
#define __GAME_PLAYER_H
/*
typedef struct
{
  player* players;
  hazard* hazards;
  construction* constructions;
  objective* objectives;
} level
*/
typedef enum {PLAYERTYPE_PLATFORMER = 0, PLAYERTYPE_BUILDER = 1} playerType;

typedef enum {PLAYERSTATE_IDLE_LEFT, PLAYERSTATE_IDLE_RIGHT, PLAYERSTATE_RUN_LEFT, PLAYERSTATE_RUN_RIGHT, PLAYERSTATE_JUMP_LEFT, PLAYERSTATE_JUMP_RIGHT} platformerPlayerState;

typedef struct
{
  enum playerType type;
  void (*pfn_updatePlayer)(void);
} player

typedef struct
{
  enum platformPlayerState state;
  u8 xCords;
  u8 yCords;
  u8 xVelocity;
  u8 yVelocity;
  u8 lives;
  
} platformerPlayer

void updatePlayer();
void updatePlatformPlayer();
void updateBuilderPlayer();
#endif