#ifndef INPUT_CONTROLLER_H
#define INPUT_CONTROLLER_H

#include "Configuration.h"
#include "Defs.h"
#include "Commands.h"

#define MAX_MAPPINGS 6

/*=======================================
Typedefinitions for InputController
=========================================*/
/* The PHYSICAL types of input, used to determine what kind of logic to use when parsing for input */
typedef enum { CAPACITIVE=1, BUTTON } PhysicalInputTypes;
typedef struct _physical_device PhysicalDevice;
struct _physical_device
{
    PhysicalInputTypes physical_type;
    uint16_t           dev_address; //Physical identifier, for a button it is the GPIO, for a capacitive sensor, it is the capacitance index and whether we are checking for positive delta or negative delta
    bool               (*need_send)(PhysicalDevice*);
    uint32_t           data;
};

/* The LOGICAL types of input that InputController may send to GameController */
typedef enum { 
               INPUT_A=    MESSAGE_INPUT_A, 
               INPUT_B=    MESSAGE_INPUT_B,
               INPUT_UP=   MESSAGE_INPUT_UP, 
               INPUT_DOWN= MESSAGE_INPUT_DOWN, 
               INPUT_LEFT= MESSAGE_INPUT_LEFT, 
               INPUT_RIGHT=MESSAGE_INPUT_RIGHT 
} LogicalInputTypes;

typedef struct
{
    LogicalInputTypes logical_type;
} LogicalDevice;

/* The BINDING between physical input and logical input */
typedef struct
{
    LogicalDevice   logical_input;
    PhysicalDevice  physical_input;
} InputMap; 

/*=======================================
State Machine Implemenation
=========================================*/
void InputController_Initialize(void);
void InputController_RunInputController(void);

/*========================================
Capacitive Physical Device Implementation
==========================================*/
#define UP 1
#define DOWN 2
#define SLIDE_SENSITIVITY     (255/5)      //How far you have to drag your finger before sending a command
#define H_SLIDER 2
#define V_SLIDER 3

/* Device Address Masks */
#define UP_OR_DOWN_MASK       0xFF00
#define DEVICE_ADDRESS_MASK   0x00FF

/* Device Data Masks*/
#define SLIDER_DATA_MASK       0x000000FF    //Contains the analog slider data (0-255)
#define IDENTICAL_SAMPLES_MASK 0x0000FF00
PhysicalDevice create_capacitive_device(uint16_t dev_address, uint8_t upOrDown);
bool check_capacitive_trigger(PhysicalDevice* device);
uint8_t read_slider(uint8_t horz_or_vertical);

/*========================================
Button Physical Device Implementation
==========================================*/
#define BUTTON_0 0
#define BUTTON_1 1

#define BUTTON_STATE_PRESSED   1
#define BUTTON_STATE_UNPRESSED 0
PhysicalDevice create_button_device(uint16_t dev_address);
bool check_button_trigger(PhysicalDevice* device);

/*========================================
Logical Device Implementation
==========================================*/
LogicalDevice create_logical_device(LogicalInputTypes type);

#endif