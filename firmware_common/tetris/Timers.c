#include <stdlib.h>
#include <stdio.h>

#include "Timers.h"

static Timer *timerList[MAX_TIMERS] = { NULL };

void SM_RunTimers(void)
{
    for(uint8_t i = 0 ; i < MAX_TIMERS; i++)
    {
        Timer* timer = timerList[i];
        if(timer != NULL)
        {
            if(timer->active && (timer->triggered == false) )
            {
                timer->value = timer->value - 1;
                
                if(timer->value <= 0)
                    timer->triggered = true;
            }
        }
    }
}

Timer* timer_create(uint32_t ticks)
{
    Timer* timer = NULL;
    for(uint8_t i = 0; i < MAX_TIMERS; i++)
    {
        if(timerList[i] == NULL)
        {
            timer = malloc(sizeof(Timer));
            timer->active    = false;
            timer->triggered = false;
            timer->value     = ticks;
            timer->reference = ticks;

            timerList[i] = timer;
            break;
        }
    }
    
    return timer;
}

void timer_destroy(Timer* timer)
{
    if( timer != NULL )
    {
        for(uint8_t i = 0 ; i < MAX_TIMERS; i ++)
        {
            if(timer == timerList[i])
            {
                timerList[i] = NULL;
            }
        }
        free(timer);
    }
}

void timer_start(Timer* timer)
{
    timer->active = true;
}

void timer_stop(Timer* timer)
{
    timer->active = false;
}

void timer_reset(Timer* timer)
{
    timer->value = timer->reference;
    timer->triggered = false;
}

bool timer_ready(Timer* timer)
{
    return timer->triggered;
}