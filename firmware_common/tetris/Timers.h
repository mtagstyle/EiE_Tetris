#ifndef TIMERS_H
#define TIMERS_H

#include "Defs.h"

#define MAX_TIMERS 10

typedef struct
{
    uint32_t reference;

    uint32_t value;
    bool triggered;
    bool active;
    void (*callback)(void);
} Timer;

void SM_RunTimers(void);

Timer*  timer_create(uint32_t ticks);
void    timer_destroy(Timer* timer);
void    timer_start(Timer* timer);
void    timer_stop(Timer* timer);
void    timer_reset(Timer* timer);
bool    timer_ready(Timer* timer);
#endif