#include "Configuration.h"
#include "InputController.h"
#include "Commands.h"

static InputMap buttonA, buttonB, sliderUp, sliderDown, sliderLeft, sliderRight;

InputMap* mappings[MAX_MAPPINGS];

bool check_button_trigger(PhysicalDevice* device)
{
    //Here, we check for only when the user lets go of the button, then we trigger a send
    if(device != NULL && device->physical_type == BUTTON)
    {
        //Button can be in pressed or unpressed state
        switch(device->data)
        {
            case BUTTON_STATE_UNPRESSED:
                if(IsButtonPressed(device->dev_address) == true)
                {
                    device->data = BUTTON_STATE_PRESSED;
                    return true;
                }
            break;

            case BUTTON_STATE_PRESSED:
                if(IsButtonPressed(device->dev_address) == false)
                {
                    device->data = BUTTON_STATE_UNPRESSED;
                }
            break;
        }
    }

    return false;
}

uint8_t read_slider(uint8_t horz_or_vertical)
{
    if(horz_or_vertical == H_SLIDER)
    {
        return CaptouchCurrentHSlidePosition();
    }
    else if(horz_or_vertical == V_SLIDER)
    {
        //VSlider's 0 is the top, while 255 is the bottom. We invert this value
        return 255-CaptouchCurrentVSlidePosition();
    }
    else
    {
        return 0; //Should never get here
    }
}

bool check_capacitive_trigger(PhysicalDevice* device)
{
    bool toReturn = false;
    if(device != NULL && device->physical_type == CAPACITIVE)
    {
        //Obtain device address parameters
        uint8_t  upOrDown =      (device->dev_address & UP_OR_DOWN_MASK) >> 8;
        uint8_t  sliderType =     device->dev_address & DEVICE_ADDRESS_MASK;
        //Obtain device data parameters
        sint16_t lastSlideValue = device->data & SLIDER_DATA_MASK;
        uint8_t  numOfIdenticalSamples = (device->data & IDENTICAL_SAMPLES_MASK) >> 8;
        uint8_t  currentSlideValue = read_slider(sliderType);

        //DebugPrintNumber(currentSlideValue);
        //DebugPrintf("  ");
        
        //Identical samples >= 10
        if( numOfIdenticalSamples >= 2 )
        {
            //Last sample != current sample
            if( lastSlideValue != currentSlideValue )
            {
                numOfIdenticalSamples = 0;
                device->data &= ~IDENTICAL_SAMPLES_MASK;
                device->data |= (numOfIdenticalSamples << 8);
            }
        }
        //Identical Samples < 10
        else if( numOfIdenticalSamples < 10 )
        {
            //Last sample == current sample
            if( lastSlideValue == currentSlideValue )
            {
                numOfIdenticalSamples++;
                device->data &= ~IDENTICAL_SAMPLES_MASK;
                device->data |= (numOfIdenticalSamples << 8);
            }
            else
            {
                //Is the current sample > threshold?
                if( upOrDown == UP )
                {
                    if( currentSlideValue > (lastSlideValue + SLIDE_SENSITIVITY))
                    {
                        //DebugPrintf("Moved right\r\n");
                        toReturn = true;
                    }
                }
                else if ( upOrDown == DOWN)
                {
                    if( currentSlideValue < (lastSlideValue-SLIDE_SENSITIVITY))
                    {
                        //DebugPrintf("Moved left\r\n");
                        toReturn = true;
                    }
                }
            }
        }

        device->data &= ~SLIDER_DATA_MASK;
        device->data |= currentSlideValue;
    }

    return toReturn;    
}

PhysicalDevice create_capacitive_device(uint16_t dev_address, uint8_t upOrDown)
{
    PhysicalDevice device;
    device.physical_type = CAPACITIVE;
    device.dev_address = 0;
    //Upper byte contains whether to check for delta up or down
    device.dev_address |= (upOrDown << 8);
    //Lower byte contains the capacitive device index
    device.dev_address |= (dev_address & DEVICE_ADDRESS_MASK);
    device.data = 0;

    device.need_send = &check_capacitive_trigger;
    return device;
}

PhysicalDevice create_button_device(uint16_t dev_address)
{
    PhysicalDevice device;
    device.physical_type = BUTTON;
    device.dev_address = dev_address;
    device.data = BUTTON_STATE_UNPRESSED;

    device.need_send = &check_button_trigger;
    return device;
}

LogicalDevice create_logical_device(LogicalInputTypes type)
{
    LogicalDevice device;
    device.logical_type = type;

    return device;
}

void InputController_Initialize(void)
{
    uint8_t i = 0;

    buttonA.logical_input =   create_logical_device(INPUT_B);
    buttonA.physical_input =  create_button_device(BUTTON_0);
    mappings[i++] = &buttonA;

    buttonB.logical_input =   create_logical_device(INPUT_A);
    buttonB.physical_input =  create_button_device(BUTTON_1);
    mappings[i++] = &buttonB;

    sliderUp.logical_input =  create_logical_device(INPUT_UP);
    sliderUp.physical_input = create_capacitive_device(V_SLIDER, UP);
    mappings[i++] = &sliderUp;

    sliderDown.logical_input =  create_logical_device(INPUT_DOWN);
    sliderDown.physical_input = create_capacitive_device(V_SLIDER, DOWN);
    mappings[i++] = &sliderDown;

    sliderLeft.logical_input =  create_logical_device(INPUT_LEFT);
    sliderLeft.physical_input = create_capacitive_device(H_SLIDER, DOWN);
    mappings[i++] = &sliderLeft;

    sliderRight.logical_input =  create_logical_device(INPUT_RIGHT);
    sliderRight.physical_input = create_capacitive_device(H_SLIDER, UP);
    mappings[i++] = &sliderRight;

    CapTouchOn();
}

void InputController_RunInputController(void)
{
    //Iterate through each thing, check to see if the physical device needs send
    for(uint8_t i = 0 ; i < MAX_MAPPINGS; i++)
    {
        InputMap* mapping = mappings[i];
        PhysicalDevice *phys_device = &(mapping->physical_input);

        //If it does, then flag for send update
        if(phys_device->need_send(phys_device) == true)
        {
            channel_send(CHANNEL_GAMECONTROLLER, mapping->logical_input.logical_type);
        }
    }
}