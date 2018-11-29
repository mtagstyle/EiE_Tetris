#include <stdlib.h>
#include "Commands.h"
#include "Defs.h"

static _server server;

sint32_t channel_open(CHANNEL_TYPES type)
{
    if( type < MAX_CHANNELS)
    {
        _channel* channel = &(server.channels[type]);
        channel->open = 1;
        channel->id = type;

        _circ_buffer* buff = &(channel->buffer);
        buff->data = malloc(MAX_QUEUE_SIZE*sizeof(_circ_buffer));
        buff->head = 0;
        buff->tail = 0;
        buff->size = 0;

        return RC_SUCCESS;
    }

    return RC_FAIL;
}

sint32_t channel_close(CHANNEL_TYPES type)
{
    if( type < MAX_CHANNELS)
    {
        _channel* channel = &(server.channels[type]);
        channel->open = 0;
        channel->id = 0;

        _circ_buffer* buff = &(channel->buffer);
        free(channel->buffer.data);
        buff->head = 0;
        buff->tail = 0;
        buff->size = 0;

        return RC_SUCCESS;
    }

    return RC_FAIL;
}

sint32_t channel_send(CHANNEL_TYPES type, uint8_t value)
{
    //Check if channel is valid
    if( type < MAX_CHANNELS)
    {
        //Check if we are sending to a channel that someone is listening on
        _channel* channel = &(server.channels[type]);
        if(channel->open == 1)
        {
            //Check if there is enough room to send the channel
            _circ_buffer *buff = &(channel->buffer);
            if(buff->size < MAX_QUEUE_SIZE)
            {
                buff->data[buff->tail] = value;
                buff->tail = (buff->tail + 1) % MAX_QUEUE_SIZE; //Increase tail length with wraparound
                buff->size++;

                return RC_SUCCESS;
            }
        }
    }

    return RC_FAIL;
}

sint32_t channel_dequeue(CHANNEL_TYPES type)
{
    //Check if channel is valid
    if( type < MAX_CHANNELS )
    {
        //Check if we are sending to a channel that someone is listening on
        _channel* channel = &(server.channels[type]);
        if(channel->open == 1)
        {
            //Check if there is anything in the buffer to read
            _circ_buffer *buff = &(channel->buffer);
            if(buff->size > 0)
            {
                sint32_t toReturn = buff->data[buff->head];
                buff->head = (buff->head + 1) % MAX_QUEUE_SIZE;
                buff->size--;

                return toReturn;
            }
        }
    }

    return RC_FAIL;
}

bool channel_is_empty(CHANNEL_TYPES type)
{
    if(type < MAX_CHANNELS)
    {
        _channel* channel = &(server.channels[type]);
        if(channel->open == 1)
        {
            if(channel->buffer.size > 0)
                return false;
        }
    }

    return true;
}