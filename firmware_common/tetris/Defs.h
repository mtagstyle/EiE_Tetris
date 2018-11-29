#ifndef _DEFS_H
#define _DEFS_H

#include "Configuration.h"

#define ARM 1

#ifdef ARM
/*
typedef unsigned char   uint8_t;
typedef unsigned int    uint32_t;
typedef unsigned short  uint16_t;
*/
typedef short           sint16_t;
typedef int             sint32_t;
//typedef unsigned char   bool;
#endif

#define true TRUE
#define false FALSE

#define RC_SUCCESS (sint32_t)1
#define RC_FAIL (sint32_t)-1

typedef enum {CONTROL_LEFT = 1, CONTROL_RIGHT, CONTROL_UP, CONTROL_DOWN, CONTROL_ROTLEFT, CONTROL_ROTRIGHT} CONTROLS;

#define DEBUG_MODE 0

#endif