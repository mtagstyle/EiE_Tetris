#ifndef COMMANDS_H
#define COMMANDS_H

#include "Defs.h"

#define MAX_QUEUE_SIZE 10

typedef enum {CHANNEL_DEFAULT, CHANNEL_GAMEINSTANCE, CHANNEL_GAMECONTROLLER, MAX_CHANNELS} CHANNEL_TYPES;
typedef enum {MESSAGE_INPUT_A=1, MESSAGE_INPUT_B, MESSAGE_INPUT_UP, MESSAGE_INPUT_DOWN, MESSAGE_INPUT_LEFT, MESSAGE_INPUT_RIGHT,
              MESSAGE_GUI_BLOCK_UPDATE, MESSAGE_GUI_GRID_UPDATE, MESSAGE_GUI_BORDER_UPDATE, MESSAGE_GUI_SCORE_UPDATE} MESSAGE_TYPES;

typedef struct 
{
    uint8_t size;
    uint8_t head;
    uint8_t tail;
    
    uint8_t *data;
} _circ_buffer;

typedef struct
{
    _circ_buffer buffer;
    uint8_t id;
    uint8_t open;
} _channel;

typedef struct
{
    _channel channels[MAX_CHANNELS];
} _server;

sint32_t channel_open(CHANNEL_TYPES type);
sint32_t channel_close(CHANNEL_TYPES type);
sint32_t channel_send(CHANNEL_TYPES type, uint8_t data);
sint32_t channel_dequeue(CHANNEL_TYPES type);
bool channel_is_empty(CHANNEL_TYPES type);

#endif