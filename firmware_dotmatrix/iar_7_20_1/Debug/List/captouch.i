#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\captouch.c"
/***********************************************************************************************************************
File: captouch.c

Description:
Driver for Capacitive Touch sensors. This code supports the horizontal slider on the MPG2 board
and any future buttons/sliders that may be added.

------------------------------------------------------------------------------------------------------------------------
API:
void CapTouchOn(void)
Activates the Captouch sensors

void CapTouchOff(void)
De-activates the Captouch sensors

u8 CaptouchCurrentHSlidePosition(void)
Returns the current horizontal slider value where "0" is the furthest left and "255" is the furthest right on the slider.

u8 CaptouchCurrentVSlidePosition(void)
Returns the current vertical slider value where "0" is the location near the bottom of the board and "255" is the top.


------------------------------------------------------------------------------------------------------------------------
DISCLAIMER: THIS CODE IS PROVIDED WITHOUT ANY WARRANTY OR GUARANTEES.  USERS MAY
USE THIS CODE FOR DEVELOPMENT AND EXAMPLE PURPOSES ONLY.  ENGENUICS TECHNOLOGIES
INCORPORATED IS NOT RESPONSIBLE FOR ANY ERRORS, OMISSIONS, OR DAMAGES THAT COULD
RESULT FROM USING THIS FIRMWARE IN WHOLE OR IN PART.
***********************************************************************************************************************/

#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
/**********************************************************************************************************************
File: configuration.h      

Description:
Main configuration header file for project.  This file bridges many of the generic features of the 
firmware to the specific features of the design. The definitions should be updated
to match the target hardware.  
 
Bookmarks:
!!!!! External module peripheral assignments
@@@@@ GPIO board-specific parameters
##### Communication peripheral board-specific parameters

Quick references:
DEBUG UART IS 115200-8-N-1
ANT BOARDTEST CHANNEL CONFIG: 4660 (0x1234), 96(0x60), 1

***********************************************************************************************************************/




/**********************************************************************************************************************
Runtime switches
***********************************************************************************************************************/
//#define MPGL2_R01                   /* Use with MPGL2-EHDW-01 revision board */


//#define STARTUP_SOUND              /* Define to include buzzer sound on startup */

//#define USE_SIMPLE_USART0   /* Define to use USART0 as a very simple byte-wise UART for debug purposes */

/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/
typedef enum {SPI, UART, USART0, USART1, USART2, USART3} PeripheralType;


/**********************************************************************************************************************
Includes
***********************************************************************************************************************/
/* Common header files */
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"
/* stdlib.h standard header */
/* Copyright 2005-2010 IAR Systems AB. */





  #pragma system_include


#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"
/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */


  #pragma system_include


/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */










/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */






#line 67 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"




/* A definiton for a function of what effects it has.
   NS  = no_state, errno, i.e. it uses no internal or external state. It may
         write to errno though
   NE  = no_state, i.e. it uses no internal or external state, not even
         writing to errno. 
   NRx = no_read(x), i.e. it doesn't read through pointer parameter x.
   NWx = no_write(x), i.e. it doesn't write through pointer parameter x.
   Rx  = returns x, i.e. the function will return parameter x.
   
   All the functions with effects also has "always_returns", 
   i.e. the function will always return.
*/

#line 103 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"









#line 12 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"
/* yvals.h internal configuration header file. */
/* Copyright 2001-2010 IAR Systems AB. */





  #pragma system_include


#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"
/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */


  #pragma system_include


/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */










/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */






#line 67 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"

#line 12 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

                /* Convenience macros */









/* Used to refer to '__aeabi' symbols in the library. */ 


                /* Versions */










/*
 * Support for some C99 or other symbols
 *
 * This setting makes available some macros, functions, etc that are
 * beneficial.
 *
 * Default is to include them.
 *
 * Disabling this in C++ mode will not compile (some C++ functions uses C99
 * functionality).
 */


  /* Default turned on when compiling C++, EC++, or C99. */
#line 59 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"





#line 70 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

                /* Configuration */
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"
/***************************************************
 *
 * DLib_Defaults.h is the library configuration manager.
 *
 * Copyright 2003-2010 IAR Systems AB.  
 *
 * This configuration header file performs the following tasks:
 *
 * 1. Includes the configuration header file, defined by _DLIB_CONFIG_FILE,
 *    that sets up a particular runtime environment.
 *
 * 2. Includes the product configuration header file, DLib_Product.h, that
 *    specifies default values for the product and makes sure that the
 *    configuration is valid.
 *
 * 3. Sets up default values for all remaining configuration symbols.
 *
 * This configuration header file, the one defined by _DLIB_CONFIG_FILE, and
 * DLib_Product.h configures how the runtime environment should behave. This
 * includes all system headers and the library itself, i.e. all system headers
 * includes this configuration header file, and the library has been built
 * using this configuration header file.
 *
 ***************************************************
 *
 * DO NOT MODIFY THIS FILE!
 *
 ***************************************************/





  #pragma system_include


/* Include the main configuration header file. */
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\INC\\c\\DLib_Config_Normal.h"
/* Customer-specific DLib configuration. */
/* Copyright (C) 2003 IAR Systems.  All rights reserved. */





  #pragma system_include


/* No changes to the defaults. */

#line 40 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"
  /* _DLIB_CONFIG_FILE_STRING is the quoted variant of above */
#line 47 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"

/* Include the product specific header file. */
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Product.h"




   #pragma system_include



/*********************************************************************
*
*       Configuration
*
*********************************************************************/

/* Wide character and multi byte character support in library.
 * This is not allowed to vary over configurations, since math-library
 * is built with wide character support.
 */


/* ARM uses the large implementation of DLib */


/* This ensures that the standard header file "string.h" includes
 * the Arm-specific file "DLib_Product_string.h". */


/* This ensures that the standard header file "fenv.h" includes
 * the Arm-specific file "DLib_Product_fenv.h". */


/* Max buffer used for swap in qsort */




/* Enable system locking  */
#line 45 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Product.h"

/* Enable AEABI support */


/* Enable rtmodel for setjump buffer size */


/* Enable parsing of hex floats */






/* Special placement for locale structures when building ropi libraries */




/* CPP-library uses software floatingpoint interface */


/* Use speedy implementation of floats (simple quad). */


/* Configure generic ELF init routines. */
#line 99 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Product.h"







#line 51 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"



/*
 * The remainder of the file sets up defaults for a number of
 * configuration symbols, each corresponds to a feature in the
 * libary.
 *
 * The value of the symbols should either be 1, if the feature should
 * be supported, or 0 if it shouldn't. (Except where otherwise
 * noted.)
 */


/*
 * Small or Large target
 *
 * This define determines whether the target is large or small. It must be 
 * setup in the DLib_Product header or in the compiler itself.
 *
 * For a small target some functionality in the library will not deliver 
 * the best available results. For instance the _accurate variants will not use
 * the extra precision packet for large arguments.
 * 
 */







/*
 * File handling
 *
 * Determines whether FILE descriptors and related functions exists or not.
 * When this feature is selected, i.e. set to 1, then FILE descriptors and
 * related functions (e.g. fprintf, fopen) exist. All files, even stdin,
 * stdout, and stderr will then be handled with a file system mechanism that
 * buffers files before accessing the lowlevel I/O interface (__open, __read,
 * __write, etc).
 *
 * If not selected, i.e. set to 0, then FILE descriptors and related functions
 * (e.g. fprintf, fopen) does not exist. All functions that normally uses
 * stderr will use stdout instead. Functions that uses stdout and stdin (like
 * printf and scanf) will access the lowlevel I/O interface directly (__open,
 * __read, __write, etc), i.e. there will not be any buffering.
 *
 * The default is not to have support for FILE descriptors.
 */





/*
 * Use static buffers for stdout
 *
 * This setting controls whether the stream stdout uses a static 80 bytes
 * buffer or uses a one byte buffer allocated in the file descriptor. This
 * setting is only applicable if the FILE descriptors are enabled above.
 *
 * Default is to use a static 80 byte buffer.
 */





/*
 * Support of locale interface
 *
 * "Locale" is the system in C that support language- and
 * contry-specific settings for a number of areas, including currency
 * symbols, date and time, and multibyte encodings.
 *
 * This setting determines whether the locale interface exist or not.
 * When this feature is selected, i.e. set to 1, the locale interface exist
 * (setlocale, etc). A number of preselected locales can be activated during
 * runtime. The preselected locales and encodings is choosen by defining any
 * number of _LOCALE_USE_xxx and _ENCODING_USE_xxx symbols. The application
 * will start with the "C" locale choosen. (Single byte encoding is always
 * supported in this mode.)
 *
 *
 * If not selected, i.e. set to 0, the locale interface (setlocale, etc) does
 * not exist. One preselected locale and one preselected encoding is then used
 * directly. That locale can not be changed during runtime. The preselected
 * locale and encoding is choosen by defining at most one of _LOCALE_USE_xxx
 * and at most one of _ENCODING_USE_xxx. The default is to use the "C" locale
 * and the single byte encoding, respectively.
 *
 * The default is not to have support for the locale interface with the "C"
 * locale and the single byte encoding.
 *
 * Supported locales
 * -----------------
 * _LOCALE_USE_C                  C standard locale (the default)
 * _LOCALE_USE_POSIX ISO-8859-1   Posix locale
 * _LOCALE_USE_CS_CZ ISO-8859-2   Czech language locale for Czech Republic
 * _LOCALE_USE_DA_DK ISO-8859-1   Danish language locale for Denmark
 * _LOCALE_USE_DA_EU ISO-8859-15  Danish language locale for Europe
 * _LOCALE_USE_DE_AT ISO-8859-1   German language locale for Austria
 * _LOCALE_USE_DE_BE ISO-8859-1   German language locale for Belgium
 * _LOCALE_USE_DE_CH ISO-8859-1   German language locale for Switzerland
 * _LOCALE_USE_DE_DE ISO-8859-1   German language locale for Germany
 * _LOCALE_USE_DE_EU ISO-8859-15  German language locale for Europe
 * _LOCALE_USE_DE_LU ISO-8859-1   German language locale for Luxemburg
 * _LOCALE_USE_EL_EU ISO-8859-7x  Greek language locale for Europe
 *                                (Euro symbol added)
 * _LOCALE_USE_EL_GR ISO-8859-7   Greek language locale for Greece
 * _LOCALE_USE_EN_AU ISO-8859-1   English language locale for Australia
 * _LOCALE_USE_EN_CA ISO-8859-1   English language locale for Canada
 * _LOCALE_USE_EN_DK ISO_8859-1   English language locale for Denmark
 * _LOCALE_USE_EN_EU ISO-8859-15  English language locale for Europe
 * _LOCALE_USE_EN_GB ISO-8859-1   English language locale for United Kingdom
 * _LOCALE_USE_EN_IE ISO-8859-1   English language locale for Ireland
 * _LOCALE_USE_EN_NZ ISO-8859-1   English language locale for New Zealand
 * _LOCALE_USE_EN_US ISO-8859-1   English language locale for USA
 * _LOCALE_USE_ES_AR ISO-8859-1   Spanish language locale for Argentina
 * _LOCALE_USE_ES_BO ISO-8859-1   Spanish language locale for Bolivia
 * _LOCALE_USE_ES_CL ISO-8859-1   Spanish language locale for Chile
 * _LOCALE_USE_ES_CO ISO-8859-1   Spanish language locale for Colombia
 * _LOCALE_USE_ES_DO ISO-8859-1   Spanish language locale for Dominican Republic
 * _LOCALE_USE_ES_EC ISO-8859-1   Spanish language locale for Equador
 * _LOCALE_USE_ES_ES ISO-8859-1   Spanish language locale for Spain
 * _LOCALE_USE_ES_EU ISO-8859-15  Spanish language locale for Europe
 * _LOCALE_USE_ES_GT ISO-8859-1   Spanish language locale for Guatemala
 * _LOCALE_USE_ES_HN ISO-8859-1   Spanish language locale for Honduras
 * _LOCALE_USE_ES_MX ISO-8859-1   Spanish language locale for Mexico
 * _LOCALE_USE_ES_PA ISO-8859-1   Spanish language locale for Panama
 * _LOCALE_USE_ES_PE ISO-8859-1   Spanish language locale for Peru
 * _LOCALE_USE_ES_PY ISO-8859-1   Spanish language locale for Paraguay
 * _LOCALE_USE_ES_SV ISO-8859-1   Spanish language locale for Salvador
 * _LOCALE_USE_ES_US ISO-8859-1   Spanish language locale for USA
 * _LOCALE_USE_ES_UY ISO-8859-1   Spanish language locale for Uruguay
 * _LOCALE_USE_ES_VE ISO-8859-1   Spanish language locale for Venezuela
 * _LOCALE_USE_ET_EE ISO-8859-1   Estonian language for Estonia
 * _LOCALE_USE_EU_ES ISO-8859-1   Basque language locale for Spain
 * _LOCALE_USE_FI_EU ISO-8859-15  Finnish language locale for Europe
 * _LOCALE_USE_FI_FI ISO-8859-1   Finnish language locale for Finland
 * _LOCALE_USE_FO_FO ISO-8859-1   Faroese language locale for Faroe Islands
 * _LOCALE_USE_FR_BE ISO-8859-1   French language locale for Belgium
 * _LOCALE_USE_FR_CA ISO-8859-1   French language locale for Canada
 * _LOCALE_USE_FR_CH ISO-8859-1   French language locale for Switzerland
 * _LOCALE_USE_FR_EU ISO-8859-15  French language locale for Europe
 * _LOCALE_USE_FR_FR ISO-8859-1   French language locale for France
 * _LOCALE_USE_FR_LU ISO-8859-1   French language locale for Luxemburg
 * _LOCALE_USE_GA_EU ISO-8859-15  Irish language locale for Europe
 * _LOCALE_USE_GA_IE ISO-8859-1   Irish language locale for Ireland
 * _LOCALE_USE_GL_ES ISO-8859-1   Galician language locale for Spain
 * _LOCALE_USE_HR_HR ISO-8859-2   Croatian language locale for Croatia
 * _LOCALE_USE_HU_HU ISO-8859-2   Hungarian language locale for Hungary
 * _LOCALE_USE_ID_ID ISO-8859-1   Indonesian language locale for Indonesia
 * _LOCALE_USE_IS_EU ISO-8859-15  Icelandic language locale for Europe
 * _LOCALE_USE_IS_IS ISO-8859-1   Icelandic language locale for Iceland
 * _LOCALE_USE_IT_EU ISO-8859-15  Italian language locale for Europe
 * _LOCALE_USE_IT_IT ISO-8859-1   Italian language locale for Italy
 * _LOCALE_USE_IW_IL ISO-8859-8   Hebrew language locale for Israel
 * _LOCALE_USE_KL_GL ISO-8859-1   Greenlandic language locale for Greenland
 * _LOCALE_USE_LT_LT   BALTIC     Lithuanian languagelocale for Lithuania
 * _LOCALE_USE_LV_LV   BALTIC     Latvian languagelocale for Latvia
 * _LOCALE_USE_NL_BE ISO-8859-1   Dutch language locale for Belgium
 * _LOCALE_USE_NL_EU ISO-8859-15  Dutch language locale for Europe
 * _LOCALE_USE_NL_NL ISO-8859-9   Dutch language locale for Netherlands
 * _LOCALE_USE_NO_EU ISO-8859-15  Norwegian language locale for Europe
 * _LOCALE_USE_NO_NO ISO-8859-1   Norwegian language locale for Norway
 * _LOCALE_USE_PL_PL ISO-8859-2   Polish language locale for Poland
 * _LOCALE_USE_PT_BR ISO-8859-1   Portugese language locale for Brazil
 * _LOCALE_USE_PT_EU ISO-8859-15  Portugese language locale for Europe
 * _LOCALE_USE_PT_PT ISO-8859-1   Portugese language locale for Portugal
 * _LOCALE_USE_RO_RO ISO-8859-2   Romanian language locale for Romania
 * _LOCALE_USE_RU_RU ISO-8859-5   Russian language locale for Russia
 * _LOCALE_USE_SL_SI ISO-8859-2   Slovenian language locale for Slovenia
 * _LOCALE_USE_SV_EU ISO-8859-15  Swedish language locale for Europe
 * _LOCALE_USE_SV_FI ISO-8859-1   Swedish language locale for Finland
 * _LOCALE_USE_SV_SE ISO-8859-1   Swedish language locale for Sweden
 * _LOCALE_USE_TR_TR ISO-8859-9   Turkish language locale for Turkey
 *
 *  Supported encodings
 *  -------------------
 * n/a                            Single byte (used if no other is defined).
 * _ENCODING_USE_UTF8             UTF8 encoding.
 */






/* We need to have the "C" locale if we have full locale support. */






/*
 * Support of multibytes in printf- and scanf-like functions
 *
 * This is the default value for _DLIB_PRINTF_MULTIBYTE and
 * _DLIB_SCANF_MULTIBYTE. See them for a description.
 *
 * Default is to not have support for multibytes in printf- and scanf-like
 * functions.
 */






/*
 * Throw handling in the EC++ library
 *
 * This setting determines what happens when the EC++ part of the library
 * fails (where a normal C++ library 'throws').
 *
 * The following alternatives exists (setting of the symbol):
 * 0                - The application does nothing, i.e. continues with the
 *                    next statement.
 * 1                - The application terminates by calling the 'abort'
 *                    function directly.
 * <anything else>  - An object of class "exception" is created.  This
 *                    object contains a string describing the problem.
 *                    This string is later emitted on "stderr" before
 *                    the application terminates by calling the 'abort'
 *                    function directly.
 *
 * Default is to do nothing.
 */






/*
 * Hexadecimal floating-point numbers in strtod
 *
 * If selected, i.e. set to 1, strtod supports C99 hexadecimal floating-point
 * numbers. This also enables hexadecimal floating-points in internal functions
 * used for converting strings and wide strings to float, double, and long
 * double.
 *
 * If not selected, i.e. set to 0, C99 hexadecimal floating-point numbers
 * aren't supported.
 *
 * Default is not to support hexadecimal floating-point numbers.
 */






/*
 * Printf configuration symbols.
 *
 * All the configuration symbols described further on controls the behaviour
 * of printf, sprintf, and the other printf variants.
 *
 * The library proves four formatters for printf: 'tiny', 'small',
 * 'large', and 'default'.  The setup in this file controls all except
 * 'tiny'.  Note that both small' and 'large' explicitly removes
 * some features.
 */

/*
 * Handle multibytes in printf
 *
 * This setting controls whether multibytes and wchar_ts are supported in
 * printf. Set to 1 to support them, otherwise set to 0.
 *
 * See _DLIB_FORMATTED_MULTIBYTE for the default setting.
 */





/*
 * Long long formatting in printf
 *
 * This setting controls long long support (%lld) in printf. Set to 1 to
 * support it, otherwise set to 0.

 * Note, if long long should not be supported and 'intmax_t' is larger than
 * an ordinary 'long', then %jd and %jn will not be supported.
 *
 * Default is to support long long formatting.
 */

#line 351 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"






/*
 * Floating-point formatting in printf
 *
 * This setting controls whether printf supports floating-point formatting.
 * Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support floating-point formatting.
 */





/*
 * Hexadecimal floating-point formatting in printf
 *
 * This setting controls whether the %a format, i.e. the output of
 * floating-point numbers in the C99 hexadecimal format. Set to 1 to support
 * it, otherwise set to 0.
 *
 * Default is to support %a in printf.
 */





/*
 * Output count formatting in printf
 *
 * This setting controls whether the output count specifier (%n) is supported
 * or not in printf. Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support %n in printf.
 */





/*
 * Support of qualifiers in printf
 *
 * This setting controls whether qualifiers that enlarges the input value
 * [hlLjtz] is supported in printf or not. Set to 1 to support them, otherwise
 * set to 0. See also _DLIB_PRINTF_INT_TYPE_IS_INT and
 * _DLIB_PRINTF_INT_TYPE_IS_LONG.
 *
 * Default is to support [hlLjtz] qualifiers in printf.
 */





/*
 * Support of flags in printf
 *
 * This setting controls whether flags (-+ #0) is supported in printf or not.
 * Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support flags in printf.
 */





/*
 * Support widths and precisions in printf
 *
 * This setting controls whether widths and precisions are supported in printf.
 * Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support widths and precisions in printf.
 */





/*
 * Support of unsigned integer formatting in printf
 *
 * This setting controls whether unsigned integer formatting is supported in
 * printf. Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support unsigned integer formatting in printf.
 */





/*
 * Support of signed integer formatting in printf
 *
 * This setting controls whether signed integer formatting is supported in
 * printf. Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support signed integer formatting in printf.
 */





/*
 * Support of formatting anything larger than int in printf
 *
 * This setting controls if 'int' should be used internally in printf, rather
 * than the largest existing integer type. If 'int' is used, any integer or
 * pointer type formatting use 'int' as internal type even though the
 * formatted type is larger. Set to 1 to use 'int' as internal type, otherwise
 * set to 0.
 *
 * See also next configuration.
 *
 * Default is to internally use largest existing internally type.
 */





/*
 * Support of formatting anything larger than long in printf
 *
 * This setting controls if 'long' should be used internally in printf, rather
 * than the largest existing integer type. If 'long' is used, any integer or
 * pointer type formatting use 'long' as internal type even though the
 * formatted type is larger. Set to 1 to use 'long' as internal type,
 * otherwise set to 0.
 *
 * See also previous configuration.
 *
 * Default is to internally use largest existing internally type.
 */









/*
 * Emit a char a time in printf
 *
 * This setting controls internal output handling. If selected, i.e. set to 1,
 * then printf emits one character at a time, which requires less code but
 * can be slightly slower for some types of output.
 *
 * If not selected, i.e. set to 0, then printf buffers some outputs.
 *
 * Note that it is recommended to either use full file support (see
 * _DLIB_FILE_DESCRIPTOR) or -- for debug output -- use the linker
 * option "-e__write_buffered=__write" to enable buffered I/O rather
 * than deselecting this feature.
 */






/*
 * Scanf configuration symbols.
 *
 * All the configuration symbols described here controls the
 * behaviour of scanf, sscanf, and the other scanf variants.
 *
 * The library proves three formatters for scanf: 'small', 'large',
 * and 'default'.  The setup in this file controls all, however both
 * 'small' and 'large' explicitly removes some features.
 */

/*
 * Handle multibytes in scanf
 *
 * This setting controls whether multibytes and wchar_t:s are supported in
 * scanf. Set to 1 to support them, otherwise set to 0.
 *
 * See _DLIB_FORMATTED_MULTIBYTE for the default.
 */





/*
 * Long long formatting in scanf
 *
 * This setting controls whether scanf supports long long support (%lld). It
 * also controls, if 'intmax_t' is larger than an ordinary 'long', i.e. how
 * the %jd and %jn specifiers behaves. Set to 1 to support them, otherwise set
 * to 0.
 *
 * Default is to support long long formatting in scanf.
 */

#line 566 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"





/*
 * Support widths in scanf
 *
 * This controls whether scanf supports widths. Set to 1 to support them,
 * otherwise set to 0.
 *
 * Default is to support widths in scanf.
 */





/*
 * Support qualifiers [hjltzL] in scanf
 *
 * This setting controls whether scanf supports qualifiers [hjltzL] or not. Set
 * to 1 to support them, otherwise set to 0.
 *
 * Default is to support qualifiers in scanf.
 */





/*
 * Support floating-point formatting in scanf
 *
 * This setting controls whether scanf supports floating-point formatting. Set
 * to 1 to support them, otherwise set to 0.
 *
 * Default is to support floating-point formatting in scanf.
 */





/*
 * Support output count formatting (%n)
 *
 * This setting controls whether scanf supports output count formatting (%n).
 * Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support output count formatting in scanf.
 */





/*
 * Support scansets ([]) in scanf
 *
 * This setting controls whether scanf supports scansets ([]) or not. Set to 1
 * to support them, otherwise set to 0.
 *
 * Default is to support scansets in scanf.
 */





/*
 * Support signed integer formatting in scanf
 *
 * This setting controls whether scanf supports signed integer formatting or
 * not. Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support signed integer formatting in scanf.
 */





/*
 * Support unsigned integer formatting in scanf
 *
 * This setting controls whether scanf supports unsigned integer formatting or
 * not. Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support unsigned integer formatting in scanf.
 */





/*
 * Support assignment suppressing [*] in scanf
 *
 * This setting controls whether scanf supports assignment suppressing [*] or
 * not. Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support assignment suppressing in scanf.
 */





/*
 * Handle multibytes in asctime and strftime.
 *
 * This setting controls whether multibytes and wchar_ts are
 * supported.Set to 1 to support them, otherwise set to 0.
 *
 * See _DLIB_FORMATTED_MULTIBYTE for the default setting.
 */





/*
 * True if "qsort" should be implemented using bubble sort.
 *
 * Bubble sort is less efficient than quick sort but requires less RAM
 * and ROM resources.
 */





/*
 * Set Buffert size used in qsort
 */





/*
 * The default "rand" function uses an array of 32 long:s of memory to
 * store the current state.
 *
 * The simple "rand" function uses only a single long. However, the
 * quality of the generated psuedo-random numbers are not as good as
 * the default implementation.
 */





/*
 * Wide character and multi byte character support in library.
 */





/*
 * Set attributes on the function used by the C-SPY debug interface to set a
 * breakpoint in.
 */





/*
 * Support threading in the library
 *
 * 0    No thread support
 * 1    Thread support with a, b, and d.
 * 2    Thread support with a, b, and e.
 * 3    Thread support with all thread-local storage in a dynamically allocated
 *        memory area and a, and b.
 *      a. Lock on heap accesses
 *      b. Optional lock on file accesses (see _DLIB_FILE_OP_LOCKS below)
 *      d. Use an external thread-local storage interface for all the
 *         libraries static and global variables.
 *      e. Static and global variables aren't safe for access from several
 *         threads.
 *
 * Note that if locks are used the following symbols must be defined:
 *
 *   _DLIB_THREAD_LOCK_ONCE_TYPE
 *   _DLIB_THREAD_LOCK_ONCE_MACRO(control_variable, init_function)
 *   _DLIB_THREAD_LOCK_ONCE_TYPE_INIT
 *
 * They will be used to initialize the needed locks only once. TYPE is the
 * type for the static control variable, MACRO is the expression that will be
 * evaluated at each usage of a lock, and INIT is the initializer for the
 * control variable.
 *
 * Note that if thread model 3 is used the symbol _DLIB_TLS_POINTER must be
 * defined. It is a thread local pointer to a dynamic memory area that
 * contains all used TLS variables for the library. Optionally the following
 * symbols can be defined as well (default is to use the default const data
 * and data memories):
 *
 *   _DLIB_TLS_INITIALIZER_MEMORY The memory to place the initializers for the
 *                                TLS memory area
 *   _DLIB_TLS_MEMORY             The memory to use for the TLS memory area. A
 *                                pointer to this memory must be castable to a
 *                                default pointer and back.
 *   _DLIB_TLS_REQUIRE_INIT       Set to 1 to require __cstart_init_tls
 *                                when needed to initialize the TLS data
 *                                segment for the main thread.
 *   _DLIB_TLS_SEGMENT_DATA       The name of the TLS RAM data segment
 *   _DLIB_TLS_SEGMENT_INIT       The name of the used to initialize the
 *                                TLS data segment.
 *
 * See DLib_Threads.h for a description of what interfaces needs to be
 * defined for thread support.
 */





/*
 * Used by products where one runtime library can be used by applications
 * with different data models, in order to reduce the total number of
 * libraries required. Typically, this is used when the pointer types does
 * not change over the data models used, but the placement of data variables
 * or/and constant variables do.
 *
 * If defined, this symbol is typically defined to the memory attribute that
 * is used by the runtime library. The actual define must use a
 * _Pragma("type_attribute = xxx") construct. In the header files, it is used
 * on all statically linked data objects seen by the application.
 */




#line 812 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"


/*
 * Turn on support for the Target-specific ABI. The ABI is based on the
 * ARM AEABI. A target, except ARM, may deviate from it.
 */

#line 826 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"


  /* Possible AEABI deviations */
#line 836 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"

#line 844 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"
  /*
   * The "difunc" table contains information about C++ objects that
   * should be dynamically initialized, where each entry in the table
   * represents an initialization function that should be called. When
   * the symbol _DLIB_AEABI_DIFUNC_CONTAINS_OFFSETS is true, each
   * entry in the table is encoded as an offset from the entry
   * location. When false, the entries contain the actual addresses to
   * call.
   */






/*
 * Turn on usage of a pragma to tell the linker the number of elements used
 * in a setjmp jmp_buf.
 */





/*
 * If true, the product supplies a "DLib_Product_string.h" file that
 * is included from "string.h".
 */





/*
 * Determine whether the math fma routines are fast or not.
 */




/*
 * Rtti support.
 */

#line 899 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"

/*
 * Use the "pointers to short" or "pointers to long" implementation of 
 * the basic floating point routines (like Dnorm, Dtest, Dscale, and Dunscale).
 */




/*
 * Use 64-bit long long as intermediary type in Dtest, and fabs.
 * Default is to do this if long long is 64-bits.
 */




/*
 * Favor speed versus some size enlargements in floating point functions.
 */




/*
 * Include dlmalloc as an alternative heap manager in product.
 *
 * Typically, an application will use a "malloc" heap manager that is
 * relatively small but not that efficient. An application can
 * optionally use the "dlmalloc" package, which provides a more
 * effective "malloc" heap manager, if it is included in the product
 * and supported by the settings.
 *
 * See the product documentation on how to use it, and whether or not
 * it is included in the product.
 */

  /* size_t/ptrdiff_t must be a 4 bytes unsigned integer. */
#line 943 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"





/*
 * Allow the 64-bit time_t interface?
 *
 * Default is yes if long long is 64 bits.
 */

  #pragma language = save 
  #pragma language = extended





  #pragma language = restore






/*
 * Is time_t 64 or 32 bits?
 *
 * Default is 32 bits.
 */




/*
 * Do we include math functions that demands lots of constant bytes?
 * (like erf, erfc, expm1, fma, lgamma, tgamma, and *_accurate)
 *
 */




/*
 * Set this to __weak, if supported.
 *
 */
#line 997 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Defaults.h"


/*
 * Deleted options
 *
 */







#line 73 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"











                /* Floating-point */

/*
 * Whenever a floating-point type is equal to another, we try to fold those
 * two types into one. This means that if float == double then we fold float to
 * use double internally. Example sinf(float) will use _Sin(double, uint).
 *
 * _X_FNAME is a redirector for internal support routines. The X can be
 *          D (double), F (float), or L (long double). It redirects by using
 *          another prefix. Example calls to Dtest will be __iar_Dtest,
 *          __iar_FDtest, or __iarLDtest.
 * _X_FUN   is a redirector for functions visible to the customer. As above, the
 *          X can be D, F, or L. It redirects by using another suffix. Example
 *          calls to sin will be sin, sinf, or sinl.
 * _X_TYPE  The type that one type is folded to.
 * _X_PTRCAST is a redirector for a cast operation involving a pointer.
 * _X_CAST  is a redirector for a cast involving the float type.
 *
 * _FLOAT_IS_DOUBLE signals that all internal float routines aren't needed.
 * _LONG_DOUBLE_IS_DOUBLE signals that all internal long double routines
 *                        aren't needed.
 */
#line 147 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"





                /* NAMING PROPERTIES */


/* Has support for fixed point types */




/* Has support for secure functions (printf_s, scanf_s, etc) */
/* Will not compile if enabled */
#line 170 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

/* Has support for complex C types */




/* If is Embedded C++ language */






/* If is true C++ language */






/* True C++ language setup */
#line 233 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"











                /* NAMESPACE CONTROL */
#line 292 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"









#line 308 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"








#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\xencoding_limits.h"
/* xencoding_limits.h internal header file */
/* Copyright 2003-2010 IAR Systems AB.  */





  #pragma system_include


#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"
/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */


  #pragma system_include


/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */










/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */






#line 67 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"

#line 12 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\xencoding_limits.h"
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"
/* yvals.h internal configuration header file. */
/* Copyright 2001-2010 IAR Systems AB. */

#line 711 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */
#line 13 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\xencoding_limits.h"

                                /* Multibyte encoding length. */


#line 24 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\xencoding_limits.h"




#line 42 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\xencoding_limits.h"

                                /* Utility macro */














#line 317 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"



                /* FLOATING-POINT PROPERTIES */

                /* float properties */
#line 335 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

                /* double properties */
#line 360 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

                /* long double properties */
                /* (must be same as double) */




#line 382 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"


                /* INTEGER PROPERTIES */

                                /* MB_LEN_MAX */







  #pragma language=save
  #pragma language=extended
  typedef long long _Longlong;
  typedef unsigned long long _ULonglong;
  #pragma language=restore
#line 405 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"






  typedef unsigned short int _Wchart;
  typedef unsigned short int _Wintt;


#line 424 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

#line 432 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

                /* POINTER PROPERTIES */


typedef signed int  _Ptrdifft;
typedef unsigned int     _Sizet;

/* IAR doesn't support restrict  */


                /* stdarg PROPERTIES */






/* This struct definition must not be inside namespace std, or
   overloading will be wrong in full C++ */
  typedef struct __va_list
  {
    char  *_Ap;
  } __va_list;

  typedef __va_list __Va_list;





__intrinsic __nounwind void __iar_Atexit(void (*)(void));



  typedef struct
  {       /* state of a multibyte translation */
    unsigned int _Wchar;
    unsigned int _State;
  } _Mbstatet;
#line 481 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"










typedef struct
{       /* file position */

  _Longlong _Off;    /* can be system dependent */



  _Mbstatet _Wstate;
} _Fpost;







                /* THREAD AND LOCALE CONTROL */

#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Threads.h"
/***************************************************
 *
 * DLib_Threads.h is the library threads manager.
 *
 * Copyright 2004-2010 IAR Systems AB.  
 *
 * This configuration header file sets up how the thread support in the library
 * should work.
 *
 ***************************************************
 *
 * DO NOT MODIFY THIS FILE!
 *
 ***************************************************/





  #pragma system_include


/*
 * DLib can support a multithreaded environment. The preprocessor symbol 
 * _DLIB_THREAD_SUPPORT governs the support. It can be 0 (no support), 
 * 1 (currently not supported), 2 (locks only), and 3 (simulated TLS and locks).
 */

/*
 * This header sets the following symbols that governs the rest of the
 * library:
 * ------------------------------------------
 * _DLIB_MULTI_THREAD     0 No thread support
 *                        1 Multithread support
 * _DLIB_GLOBAL_VARIABLES 0 Use external TLS interface for the libraries global
 *                          and static variables
 *                        1 Use a lock for accesses to the locale and no 
 *                          security for accesses to other global and static
 *                          variables in the library
 * _DLIB_FILE_OP_LOCKS    0 No file-atomic locks
 *                        1 File-atomic locks

 * _DLIB_COMPILER_TLS     0 No Thread-Local-Storage support in the compiler
 *                        1 Thread-Local-Storage support in the compiler
 * _DLIB_TLS_QUAL         The TLS qualifier, define only if _COMPILER_TLS == 1
 *
 * _DLIB_THREAD_MACRO_SETUP_DONE Whether to use the standard definitions of
 *                               TLS macros defined in xtls.h or the definitions
 *                               are provided here.
 *                        0 Use default macros
 *                        1 Macros defined for xtls.h
 *
 * _DLIB_THREAD_LOCK_ONCE_TYPE
 *                        type for control variable in once-initialization of 
 *                        locks
 * _DLIB_THREAD_LOCK_ONCE_MACRO(control_variable, init_function)
 *                        expression that will be evaluated at each lock access
 *                        to determine if an initialization must be done
 * _DLIB_THREAD_LOCK_ONCE_TYPE_INIT
 *                        initial value for the control variable
 *
 ****************************************************************************
 * Description
 * -----------
 *
 * If locks are to be used (_DLIB_MULTI_THREAD != 0), the following options
 * has to be used in ilink: 
 *   --redirect __iar_Locksyslock=__iar_Locksyslock_mtx
 *   --redirect __iar_Unlocksyslock=__iar_Unlocksyslock_mtx
 *   --redirect __iar_Lockfilelock=__iar_Lockfilelock_mtx
 *   --redirect __iar_Unlockfilelock=__iar_Unlockfilelock_mtx
 *   --keep     __iar_Locksyslock_mtx
 * and, if C++ is used, also:
 *   --redirect __iar_Initdynamicfilelock=__iar_Initdynamicfilelock_mtx
 *   --redirect __iar_Dstdynamicfilelock=__iar_Dstdynamicfilelock_mtx
 *   --redirect __iar_Lockdynamicfilelock=__iar_Lockdynamicfilelock_mtx
 *   --redirect __iar_Unlockdynamicfilelock=__iar_Unlockdynamicfilelock_mtx
 * Xlink uses similar options (-e and -g). The following lock interface must
 * also be implemented: 
 *   typedef void *__iar_Rmtx;                   // Lock info object
 *
 *   void __iar_system_Mtxinit(__iar_Rmtx *);    // Initialize a system lock
 *   void __iar_system_Mtxdst(__iar_Rmtx *);     // Destroy a system lock
 *   void __iar_system_Mtxlock(__iar_Rmtx *);    // Lock a system lock
 *   void __iar_system_Mtxunlock(__iar_Rmtx *);  // Unlock a system lock
 * The interface handles locks for the heap, the locale, the file system
 * structure, the initialization of statics in functions, etc. 
 *
 * The following lock interface is optional to be implemented:
 *   void __iar_file_Mtxinit(__iar_Rmtx *);    // Initialize a file lock
 *   void __iar_file_Mtxdst(__iar_Rmtx *);     // Destroy a file lock
 *   void __iar_file_Mtxlock(__iar_Rmtx *);    // Lock a file lock
 *   void __iar_file_Mtxunlock(__iar_Rmtx *);  // Unlock a file lock
 * The interface handles locks for each file stream.
 * 
 * These three once-initialization symbols must also be defined, if the 
 * default initialization later on in this file doesn't work (done in 
 * DLib_product.h):
 *
 *   _DLIB_THREAD_LOCK_ONCE_TYPE
 *   _DLIB_THREAD_LOCK_ONCE_MACRO(control_variable, init_function)
 *   _DLIB_THREAD_LOCK_ONCE_TYPE_INIT
 *
 * If an external TLS interface is used, the following must
 * be defined:
 *   typedef int __iar_Tlskey_t;
 *   typedef void (*__iar_Tlsdtor_t)(void *);
 *   int __iar_Tlsalloc(__iar_Tlskey_t *, __iar_Tlsdtor_t); 
 *                                                    // Allocate a TLS element
 *   int __iar_Tlsfree(__iar_Tlskey_t);               // Free a TLS element
 *   int __iar_Tlsset(__iar_Tlskey_t, void *);        // Set a TLS element
 *   void *__iar_Tlsget(__iar_Tlskey_t);              // Get a TLS element
 *
 */

/* We don't have a compiler that supports tls declarations */



#line 157 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Threads.h"

  /* Thread support, library supports threaded variables in a user specified
     memory area, locks on heap and on FILE */

  /* See Documentation/ThreadsInternal.html for a description. */





  


#line 176 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Threads.h"





#line 187 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Threads.h"





  #pragma language=save 
  #pragma language=extended
  __intrinsic __nounwind void __iar_dlib_perthread_initialize(void  *);
  __intrinsic __nounwind void  *__iar_dlib_perthread_allocate(void);
  __intrinsic __nounwind void __iar_dlib_perthread_destroy(void);
  __intrinsic __nounwind void __iar_dlib_perthread_deallocate(void  *);









  #pragma segment = "__DLIB_PERTHREAD" 
  #pragma segment = "__DLIB_PERTHREAD_init" 


























#line 242 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Threads.h"

  /* The thread-local variable access function */
  void  *__iar_dlib_perthread_access(void  *);
  #pragma language=restore



























    /* Make sure that each destructor is inserted into _Deallocate_TLS */
  









  /* Internal function declarations. */






  





  
  typedef void *__iar_Rmtx;
  

  
  __intrinsic __nounwind void __iar_system_Mtxinit(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_system_Mtxdst(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_system_Mtxlock(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_system_Mtxunlock(__iar_Rmtx *m);

  __intrinsic __nounwind void __iar_file_Mtxinit(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_file_Mtxdst(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_file_Mtxlock(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_file_Mtxunlock(__iar_Rmtx *m);

  /* Function to destroy the locks. Should be called after atexit and 
     _Close_all. */
  __intrinsic __nounwind void __iar_clearlocks(void);


#line 323 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Threads.h"

  





  

#line 341 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Threads.h"

  typedef unsigned _Once_t;



  













#line 510 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

#line 520 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

                /* THREAD-LOCAL STORAGE */
#line 528 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"


                /* MULTITHREAD PROPERTIES */

  
  
  /* The lock interface for DLib to use. */ 
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Locale(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Malloc(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Stream(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Debug(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_StaticGuard(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock(unsigned int);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Locale(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Malloc(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Stream(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Debug(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_StaticGuard(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock(unsigned int);

  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Initdynamicfilelock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Dstdynamicfilelock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Lockdynamicfilelock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlockdynamicfilelock(__iar_Rmtx *);
  
  
#line 568 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

                /* LOCK MACROS */
#line 576 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

#line 694 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"

                /* MISCELLANEOUS MACROS AND FUNCTIONS*/





#line 709 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\yvals.h"



/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */
#line 13 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ysizet.h"
/* ysizet.h internal header file. */
/* Copyright 2003-2010 IAR Systems AB.  */





  #pragma system_include


#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"
/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */


  #pragma system_include


/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */










/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */






#line 67 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"

#line 12 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ysizet.h"



                /* type definitions */




typedef _Sizet size_t;




typedef unsigned int __data_size_t;











#line 14 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"


/* Module consistency. */
#pragma rtmodel="__dlib_full_locale_support",   "0"





extern int __aeabi_MB_CUR_MAX(void);


#line 34 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"





                /* MACROS */













                /* TYPE DEFINITIONS */


  typedef _Wchart wchar_t;


typedef struct
{       /* result of int divide */
  int quot;
  int rem;
} div_t;

typedef struct
{       /* result of long divide */
  long quot;
  long rem;
} ldiv_t;



    #pragma language=save
    #pragma language=extended
    typedef struct
    {     /* result of long long divide */
      _Longlong quot;
      _Longlong rem;
    } lldiv_t;
    #pragma language=restore



                /* DECLARATIONS */
 /* low-level functions */
__intrinsic __nounwind int atexit(void (*)(void));

  __intrinsic __noreturn __nounwind void _Exit(int) ;

__intrinsic __noreturn __nounwind void exit(int) ;
__intrinsic __nounwind char * getenv(const char *);
__intrinsic __nounwind int system(const char *);



             __intrinsic __noreturn __nounwind void abort(void) ;
_Pragma("function_effects = no_state, always_returns")     __intrinsic __nounwind int abs(int);
             __intrinsic __nounwind void * calloc(size_t, size_t);
_Pragma("function_effects = no_state, always_returns")     __intrinsic __nounwind div_t div(int, int);
             __intrinsic __nounwind void free(void *);
_Pragma("function_effects = no_state, always_returns")     __intrinsic __nounwind long labs(long);
_Pragma("function_effects = no_state, always_returns")     __intrinsic __nounwind ldiv_t ldiv(long, long);


    #pragma language=save
    #pragma language=extended
    _Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long llabs(long long);
    _Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind lldiv_t lldiv(long long, long long);
    #pragma language=restore


             __intrinsic __nounwind void * malloc(size_t);
_Pragma("function_effects = no_write(1), always_returns")    __intrinsic __nounwind int mblen(const char *, size_t);
_Pragma("function_effects = no_read(1), no_write(2), always_returns") __intrinsic __nounwind size_t mbstowcs(wchar_t *, 
                                          const char *, size_t);
_Pragma("function_effects = no_read(1), no_write(2), always_returns") __intrinsic __nounwind int mbtowc(wchar_t *, const char *, 
                                     size_t);
             __intrinsic __nounwind int rand(void);
             __intrinsic __nounwind void srand(unsigned int);
             __intrinsic __nounwind void * realloc(void *, size_t);
_Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind long strtol(const char *, 
                                      char **, int);
_Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind unsigned long strtoul(const char *, char **, int);
_Pragma("function_effects = no_read(1), no_write(2), always_returns") __intrinsic __nounwind size_t wcstombs(char *, 
                                          const wchar_t *, size_t);
_Pragma("function_effects = no_read(1), always_returns")    __intrinsic __nounwind int wctomb(char *, wchar_t);


    #pragma language=save
    #pragma language=extended
    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind long long strtoll(const char *, char **, int);
    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind unsigned long long strtoull(const char *, 
                                                          char **, int);
    #pragma language=restore





#line 188 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"



    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind unsigned long __iar_Stoul(const char *, char **, 
                                                        int);
    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind float         __iar_Stof(const char *, char **, long);
    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind double        __iar_Stod(const char *, char **, long);
    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind long double   __iar_Stold(const char *, char **, 
                                                          long);
    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind long          __iar_Stolx(const char *, char **, int, 
                                                        int *);
    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind unsigned long __iar_Stoulx(const char *, char **,
                                                         int, int *);
    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind float         __iar_Stofx(const char *, char **, 
                                                        long, int *);
    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind double        __iar_Stodx(const char *, char **, 
                                                        long, int *);
    _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind long double   __iar_Stoldx(const char *, char **, 
                                                         long, int *);

      #pragma language=save
      #pragma language=extended
      _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind _Longlong   __iar_Stoll(const char *, char **, 
                                                        int);
      _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind _ULonglong   __iar_Stoull(const char *, char **, 
                                                          int);
      _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind _Longlong    __iar_Stollx(const char *, char **, 
                                                          int, int *);
      _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind _ULonglong   __iar_Stoullx(const char *, char **, 
                                                           int, int *);
      #pragma language=restore








typedef int _Cmpfun(const void *, const void *);

_Pragma("function_effects = no_write(1,2), always_returns") __intrinsic void * bsearch(const void *, 
                                                   const void *, size_t,
                                                   size_t, _Cmpfun *);
             __intrinsic void qsort(void *, size_t, size_t, 
                                               _Cmpfun *);
             __intrinsic void __qsortbbl(void *, size_t, size_t, 
                                                    _Cmpfun *);
_Pragma("function_effects = no_write(1), always_returns")    __intrinsic __nounwind double atof(const char *);
_Pragma("function_effects = no_write(1), always_returns")    __intrinsic __nounwind int atoi(const char *);
_Pragma("function_effects = no_write(1), always_returns")    __intrinsic __nounwind long atol(const char *);


    #pragma language=save
    #pragma language=extended
    _Pragma("function_effects = no_write(1), always_returns") __intrinsic __nounwind long long atoll(const char *);
    #pragma language=restore

  _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind float strtof(const char *, 
                                         char **);
  _Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind long double strtold(const char *, char **);

_Pragma("function_effects = no_write(1), no_read(2), always_returns") __intrinsic __nounwind double strtod(const char *, 
                                        char **);
                                        

                                        
               __intrinsic __nounwind size_t __iar_Mbcurmax(void);

  _Pragma("function_effects = no_state, always_returns")     __intrinsic __nounwind int __iar_DLib_library_version(void);

  


#line 276 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"



  
  typedef void _Atexfun(void);
  
#line 304 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"


                /* INLINES, FOR C and C++ */
    #pragma inline=no_body
    double atof(const char *_S)
    {      /* convert string to double */
      return (__iar_Stod(_S, 0, 0));
    }

    #pragma inline=no_body
    int atoi(const char *_S)
    {      /* convert string to int */
      return ((int)__iar_Stoul(_S, 0, 10));
    }

    #pragma inline=no_body
    long atol(const char *_S)
    {      /* convert string to long */
      return ((long)__iar_Stoul(_S, 0, 10));
    }



        #pragma language=save
        #pragma language=extended
        #pragma inline=no_body
        long long atoll(const char *_S)
        {      /* convert string to long long */



            return ((long long)__iar_Stoull(_S, 0, 10));

        }
        #pragma language=restore



    #pragma inline=no_body
    double strtod(const char * _S, char ** _Endptr)
    {      /* convert string to double, with checking */
      return (__iar_Stod(_S, _Endptr, 0));
    }


      #pragma inline=no_body
      float strtof(const char * _S, char ** _Endptr)
      {      /* convert string to float, with checking */
        return (__iar_Stof(_S, _Endptr, 0));
      }

      #pragma inline=no_body
      long double strtold(const char * _S, char ** _Endptr)
      {      /* convert string to long double, with checking */
        return (__iar_Stold(_S, _Endptr, 0));
      }


    #pragma inline=no_body
    long strtol(const char * _S, char ** _Endptr, 
                int _Base)
    {      /* convert string to unsigned long, with checking */
      return (__iar_Stolx(_S, _Endptr, _Base, 0));
    }

    #pragma inline=no_body
    unsigned long strtoul(const char * _S, char ** _Endptr, 
                          int _Base)
    {      /* convert string to unsigned long, with checking */
      return (__iar_Stoul(_S, _Endptr, _Base));
    }



        #pragma language=save
        #pragma language=extended
        #pragma inline=no_body
        long long strtoll(const char * _S, char ** _Endptr,
                          int _Base)
        {      /* convert string to long long, with checking */



            return (__iar_Stoll(_S, _Endptr, _Base));

        }

        #pragma inline=no_body
        unsigned long long strtoull(const char * _S, 
                                    char ** _Endptr, int _Base)
        {      /* convert string to unsigned long long, with checking */



            return (__iar_Stoull(_S, _Endptr, _Base));

        }
        #pragma language=restore





  #pragma inline=no_body
  int abs(int i)
  {      /* compute absolute value of int argument */
    return (i < 0 ? -i : i);
  }

  #pragma inline=no_body
  long labs(long i)
  {      /* compute absolute value of long argument */
    return (i < 0 ? -i : i);
  }



      #pragma language=save
      #pragma language=extended
      #pragma inline=no_body
      long long llabs(long long i)
      {      /* compute absolute value of long long argument */
        return (i < 0 ? -i : i);
      }
      #pragma language=restore



#line 465 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"




#line 494 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"

/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */
#line 44 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\string.h"
/* string.h standard header */
/* Copyright 2009-2010 IAR Systems AB. */




  #pragma system_include


#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"
/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */


  #pragma system_include


/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */










/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */






#line 67 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"

#line 11 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\string.h"
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ysizet.h"
/* ysizet.h internal header file. */
/* Copyright 2003-2010 IAR Systems AB.  */

#line 30 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ysizet.h"







#line 13 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\string.h"

#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Product_string.h"
/**************************************************
 *
 * ARM-specific configuration for string.h in DLib.
 *
 * Copyright 2006 IAR Systems. All rights reserved.
 *
 * $Id: DLib_Product_string.h 78576 2014-05-05 13:37:27Z mats $
 *
 **************************************************/





  #pragma system_include




  
  

  /*
   * The following is pre-declared by the compiler.
   *
   * __INTRINSIC void __aeabi_memset (void *, size_t, int);
   * __INTRINSIC void __aeabi_memcpy (void *, const void *, size_t);
   * __INTRINSIC void __aeabi_memmove(void *, const void *, size_t);
   */


  /*
   * Inhibit inline definitions for routines with an effective
   * ARM-specific implementation.
   *
   * Not in Cortex-M1 and Cortex-MS1
   */



#line 47 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\DLib_Product_string.h"



  /*
   * Redirect calls to standard functions to the corresponding
   * __aeabi_X function.
   */


  #pragma inline=forced_no_body
  __intrinsic __nounwind void * memcpy(void * _D, const void * _S, size_t _N)
  {
    __aeabi_memcpy(_D, _S, _N);
    return _D;
  }


  #pragma inline=forced_no_body
  __intrinsic __nounwind void * memmove(void * _D, const void * _S, size_t _N)
  {
    __aeabi_memmove(_D, _S, _N);
    return _D;
  }


  #pragma inline=forced_no_body
  __intrinsic __nounwind void * memset(void * _D, int _C, size_t _N)
  {
    __aeabi_memset(_D, _N, _C);
    return _D;
  }

  
  



#line 16 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\string.h"



                /* macros */




                /* declarations */

_Pragma("function_effects = no_state, no_write(1,2), always_returns")   __intrinsic __nounwind int        memcmp(const void *, const void *,
                                                size_t);
_Pragma("function_effects = no_state, no_read(1), no_write(2), returns 1, always_returns") __intrinsic __nounwind void *     memcpy(void *, 
                                                const void *, size_t);
_Pragma("function_effects = no_state, no_read(1), no_write(2), returns 1, always_returns") __intrinsic __nounwind void *     memmove(void *, const void *, size_t);
_Pragma("function_effects = no_state, no_read(1), returns 1, always_returns")    __intrinsic __nounwind void *     memset(void *, int, size_t);
_Pragma("function_effects = no_state, no_write(2), returns 1, always_returns")    __intrinsic __nounwind char *     strcat(char *, 
                                                const char *);
_Pragma("function_effects = no_state, no_write(1,2), always_returns")   __intrinsic __nounwind int        strcmp(const char *, const char *);
_Pragma("function_effects = no_write(1,2), always_returns")     __intrinsic __nounwind int        strcoll(const char *, const char *);
_Pragma("function_effects = no_state, no_read(1), no_write(2), returns 1, always_returns") __intrinsic __nounwind char *     strcpy(char *, 
                                                const char *);
_Pragma("function_effects = no_state, no_write(1,2), always_returns")   __intrinsic __nounwind size_t     strcspn(const char *, const char *);
                 __intrinsic __nounwind char *     strerror(int);
_Pragma("function_effects = no_state, no_write(1), always_returns")      __intrinsic __nounwind size_t     strlen(const char *);
_Pragma("function_effects = no_state, no_write(2), returns 1, always_returns")    __intrinsic __nounwind char *     strncat(char *, 
                                                 const char *, size_t);
_Pragma("function_effects = no_state, no_write(1,2), always_returns")   __intrinsic __nounwind int        strncmp(const char *, const char *, 
                                                 size_t);
_Pragma("function_effects = no_state, no_read(1), no_write(2), returns 1, always_returns") __intrinsic __nounwind char *     strncpy(char *, 
                                                 const char *, size_t);
_Pragma("function_effects = no_state, no_write(1,2), always_returns")   __intrinsic __nounwind size_t     strspn(const char *, const char *);
_Pragma("function_effects = no_write(2), always_returns")        __intrinsic __nounwind char *     strtok(char *, 
                                                const char *);
_Pragma("function_effects = no_write(2), always_returns")        __intrinsic __nounwind size_t     strxfrm(char *, 
                                                 const char *, size_t);


  _Pragma("function_effects = no_write(1), always_returns")      __intrinsic __nounwind char *   strdup(const char *);
  _Pragma("function_effects = no_write(1,2), always_returns")   __intrinsic __nounwind int      strcasecmp(const char *, const char *);
  _Pragma("function_effects = no_write(1,2), always_returns")   __intrinsic __nounwind int      strncasecmp(const char *, const char *, 
                                                   size_t);
  _Pragma("function_effects = no_state, no_write(2), always_returns")    __intrinsic __nounwind char *   strtok_r(char *, const char *, char **);
  _Pragma("function_effects = no_state, no_write(1), always_returns")    __intrinsic __nounwind size_t   strnlen(char const *, size_t);




#line 81 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\string.h"
  _Pragma("function_effects = no_state, no_write(1), always_returns")    __intrinsic __nounwind void *memchr(const void *_S, int _C, size_t _N);
  _Pragma("function_effects = no_state, no_write(1), always_returns")    __intrinsic __nounwind char *strchr(const char *_S, int _C);
  _Pragma("function_effects = no_state, no_write(1,2), always_returns") __intrinsic __nounwind char *strpbrk(const char *_S, const char *_P);
  _Pragma("function_effects = no_state, no_write(1), always_returns")    __intrinsic __nounwind char *strrchr(const char *_S, int _C);
  _Pragma("function_effects = no_state, no_write(1,2), always_returns") __intrinsic __nounwind char *strstr(const char *_S, const char *_P);




                /* Inline definitions. */


                /* The implementations. */

_Pragma("function_effects = no_state, no_write(1), always_returns")    __intrinsic __nounwind void *__iar_Memchr(const void *, int, size_t);
_Pragma("function_effects = no_state, no_write(1), always_returns")    __intrinsic __nounwind char *__iar_Strchr(const char *, int);
               __intrinsic __nounwind char *__iar_Strerror(int, char *);
_Pragma("function_effects = no_state, no_write(1,2), always_returns") __intrinsic __nounwind char *__iar_Strpbrk(const char *, const char *);
_Pragma("function_effects = no_state, no_write(1), always_returns")    __intrinsic __nounwind char *__iar_Strrchr(const char *, int);
_Pragma("function_effects = no_state, no_write(1,2), always_returns") __intrinsic __nounwind char *__iar_Strstr(const char *, const char *);


                /* inlines and overloads, for C and C++ */
#line 168 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\string.h"
                /* Then the overloads for C. */
    #pragma inline
    void *memchr(const void *_S, int _C, size_t _N)
    {
      return (__iar_Memchr(_S, _C, _N));
    }

    #pragma inline
    char *strchr(const char *_S, int _C)
    {
      return (__iar_Strchr(_S, _C));
    }

    #pragma inline
    char *strpbrk(const char *_S, const char *_P)
    {
      return (__iar_Strpbrk(_S, _P));
    }

    #pragma inline
    char *strrchr(const char *_S, int _C)
    {
      return (__iar_Strrchr(_S, _C));
    }

    #pragma inline
    char *strstr(const char *_S, const char *_P)
    {
      return (__iar_Strstr(_S, _P));
    }


  #pragma inline
  char *strerror(int _Err)
  {
    return (__iar_Strerror(_Err, 0));
  }

#line 451 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\string.h"






#line 479 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\string.h"

/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */
#line 45 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
//  ----------------------------------------------------------------------------
//          ATMEL Microcontroller Software Support  -  ROUSSET  -
//  ----------------------------------------------------------------------------
//  Copyright (c) 2009, Atmel Corporation
// 
//  All rights reserved.
// 
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
// 
//  - Redistributions of source code must retain the above copyright notice,
//  this list of conditions and the disclaimer below.
// 
//  Atmel's name may not be used to endorse or promote products derived from
//  this software without specific prior written permission. 
//  
//  DISCLAIMER:  THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
//  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
//  DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
//  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
//  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
//  OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
//  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
//  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//  ----------------------------------------------------------------------------
// File Name           : AT91SAM3U4.h
// Object              : AT91SAM3U4 definitions
// Generated           : AT91 SW Application Group  11/17/2009 (13:04:57)

//  ----------------------------------------------------------------------------





typedef volatile unsigned int AT91_REG;// Hardware register definition





// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR System Peripherals
// *****************************************************************************

typedef struct _AT91S_SYS {
	AT91_REG	 HSMC4_CFG; 	// Configuration Register
	AT91_REG	 HSMC4_CTRL; 	// Control Register
	AT91_REG	 HSMC4_SR; 	// Status Register
	AT91_REG	 HSMC4_IER; 	// Interrupt Enable Register
	AT91_REG	 HSMC4_IDR; 	// Interrupt Disable Register
	AT91_REG	 HSMC4_IMR; 	// Interrupt Mask Register
	AT91_REG	 HSMC4_ADDR; 	// Address Cycle Zero Register
	AT91_REG	 HSMC4_BANK; 	// Bank Register
	AT91_REG	 HSMC4_ECCCR; 	// ECC reset register
	AT91_REG	 HSMC4_ECCCMD; 	// ECC Page size register
	AT91_REG	 HSMC4_ECCSR1; 	// ECC Status register 1
	AT91_REG	 HSMC4_ECCPR0; 	// ECC Parity register 0
	AT91_REG	 HSMC4_ECCPR1; 	// ECC Parity register 1
	AT91_REG	 HSMC4_ECCSR2; 	// ECC Status register 2
	AT91_REG	 HSMC4_ECCPR2; 	// ECC Parity register 2
	AT91_REG	 HSMC4_ECCPR3; 	// ECC Parity register 3
	AT91_REG	 HSMC4_ECCPR4; 	// ECC Parity register 4
	AT91_REG	 HSMC4_ECCPR5; 	// ECC Parity register 5
	AT91_REG	 HSMC4_ECCPR6; 	// ECC Parity register 6
	AT91_REG	 HSMC4_ECCPR7; 	// ECC Parity register 7
	AT91_REG	 HSMC4_ECCPR8; 	// ECC Parity register 8
	AT91_REG	 HSMC4_ECCPR9; 	// ECC Parity register 9
	AT91_REG	 HSMC4_ECCPR10; 	// ECC Parity register 10
	AT91_REG	 HSMC4_ECCPR11; 	// ECC Parity register 11
	AT91_REG	 HSMC4_ECCPR12; 	// ECC Parity register 12
	AT91_REG	 HSMC4_ECCPR13; 	// ECC Parity register 13
	AT91_REG	 HSMC4_ECCPR14; 	// ECC Parity register 14
	AT91_REG	 HSMC4_Eccpr15; 	// ECC Parity register 15
	AT91_REG	 Reserved0[40]; 	// 
	AT91_REG	 HSMC4_OCMS; 	// OCMS MODE register
	AT91_REG	 HSMC4_KEY1; 	// KEY1 Register
	AT91_REG	 HSMC4_KEY2; 	// KEY2 Register
	AT91_REG	 Reserved1[50]; 	// 
	AT91_REG	 HSMC4_WPCR; 	// Write Protection Control register
	AT91_REG	 HSMC4_WPSR; 	// Write Protection Status Register
	AT91_REG	 HSMC4_ADDRSIZE; 	// Write Protection Status Register
	AT91_REG	 HSMC4_IPNAME1; 	// Write Protection Status Register
	AT91_REG	 HSMC4_IPNAME2; 	// Write Protection Status Register
	AT91_REG	 HSMC4_FEATURES; 	// Write Protection Status Register
	AT91_REG	 HSMC4_VER; 	// HSMC4 Version Register
	AT91_REG	 HMATRIX_MCFG0; 	//  Master Configuration Register 0 : ARM I and D
	AT91_REG	 HMATRIX_MCFG1; 	//  Master Configuration Register 1 : ARM S
	AT91_REG	 HMATRIX_MCFG2; 	//  Master Configuration Register 2
	AT91_REG	 HMATRIX_MCFG3; 	//  Master Configuration Register 3
	AT91_REG	 HMATRIX_MCFG4; 	//  Master Configuration Register 4
	AT91_REG	 HMATRIX_MCFG5; 	//  Master Configuration Register 5
	AT91_REG	 HMATRIX_MCFG6; 	//  Master Configuration Register 6
	AT91_REG	 HMATRIX_MCFG7; 	//  Master Configuration Register 7
	AT91_REG	 Reserved2[8]; 	// 
	AT91_REG	 HMATRIX_SCFG0; 	//  Slave Configuration Register 0
	AT91_REG	 HMATRIX_SCFG1; 	//  Slave Configuration Register 1
	AT91_REG	 HMATRIX_SCFG2; 	//  Slave Configuration Register 2
	AT91_REG	 HMATRIX_SCFG3; 	//  Slave Configuration Register 3
	AT91_REG	 HMATRIX_SCFG4; 	//  Slave Configuration Register 4
	AT91_REG	 HMATRIX_SCFG5; 	//  Slave Configuration Register 5
	AT91_REG	 HMATRIX_SCFG6; 	//  Slave Configuration Register 6
	AT91_REG	 HMATRIX_SCFG7; 	//  Slave Configuration Register 5
	AT91_REG	 HMATRIX_SCFG8; 	//  Slave Configuration Register 8
	AT91_REG	 HMATRIX_SCFG9; 	//  Slave Configuration Register 9
	AT91_REG	 Reserved3[42]; 	// 
	AT91_REG	 HMATRIX_SFR0 ; 	//  Special Function Register 0
	AT91_REG	 HMATRIX_SFR1 ; 	//  Special Function Register 1
	AT91_REG	 HMATRIX_SFR2 ; 	//  Special Function Register 2
	AT91_REG	 HMATRIX_SFR3 ; 	//  Special Function Register 3
	AT91_REG	 HMATRIX_SFR4 ; 	//  Special Function Register 4
	AT91_REG	 HMATRIX_SFR5 ; 	//  Special Function Register 5
	AT91_REG	 HMATRIX_SFR6 ; 	//  Special Function Register 6
	AT91_REG	 HMATRIX_SFR7 ; 	//  Special Function Register 7
	AT91_REG	 HMATRIX_SFR8 ; 	//  Special Function Register 8
	AT91_REG	 HMATRIX_SFR9 ; 	//  Special Function Register 9
	AT91_REG	 HMATRIX_SFR10; 	//  Special Function Register 10
	AT91_REG	 HMATRIX_SFR11; 	//  Special Function Register 11
	AT91_REG	 HMATRIX_SFR12; 	//  Special Function Register 12
	AT91_REG	 HMATRIX_SFR13; 	//  Special Function Register 13
	AT91_REG	 HMATRIX_SFR14; 	//  Special Function Register 14
	AT91_REG	 HMATRIX_SFR15; 	//  Special Function Register 15
	AT91_REG	 Reserved4[39]; 	// 
	AT91_REG	 HMATRIX_ADDRSIZE; 	// HMATRIX2 ADDRSIZE REGISTER 
	AT91_REG	 HMATRIX_IPNAME1; 	// HMATRIX2 IPNAME1 REGISTER 
	AT91_REG	 HMATRIX_IPNAME2; 	// HMATRIX2 IPNAME2 REGISTER 
	AT91_REG	 HMATRIX_FEATURES; 	// HMATRIX2 FEATURES REGISTER 
	AT91_REG	 HMATRIX_VER; 	// HMATRIX2 VERSION REGISTER 
	AT91_REG	 PMC_SCER; 	// System Clock Enable Register
	AT91_REG	 PMC_SCDR; 	// System Clock Disable Register
	AT91_REG	 PMC_SCSR; 	// System Clock Status Register
	AT91_REG	 Reserved5[1]; 	// 
	AT91_REG	 PMC_PCER; 	// Peripheral Clock Enable Register
	AT91_REG	 PMC_PCDR; 	// Peripheral Clock Disable Register
	AT91_REG	 PMC_PCSR; 	// Peripheral Clock Status Register
	AT91_REG	 PMC_UCKR; 	// UTMI Clock Configuration Register
	AT91_REG	 PMC_MOR; 	// Main Oscillator Register
	AT91_REG	 PMC_MCFR; 	// Main Clock  Frequency Register
	AT91_REG	 PMC_PLLAR; 	// PLL Register
	AT91_REG	 Reserved6[1]; 	// 
	AT91_REG	 PMC_MCKR; 	// Master Clock Register
	AT91_REG	 Reserved7[3]; 	// 
	AT91_REG	 PMC_PCKR[8]; 	// Programmable Clock Register
	AT91_REG	 PMC_IER; 	// Interrupt Enable Register
	AT91_REG	 PMC_IDR; 	// Interrupt Disable Register
	AT91_REG	 PMC_SR; 	// Status Register
	AT91_REG	 PMC_IMR; 	// Interrupt Mask Register
	AT91_REG	 PMC_FSMR; 	// Fast Startup Mode Register
	AT91_REG	 PMC_FSPR; 	// Fast Startup Polarity Register
	AT91_REG	 PMC_FOCR; 	// Fault Output Clear Register
	AT91_REG	 Reserved8[28]; 	// 
	AT91_REG	 PMC_ADDRSIZE; 	// PMC ADDRSIZE REGISTER 
	AT91_REG	 PMC_IPNAME1; 	// PMC IPNAME1 REGISTER 
	AT91_REG	 PMC_IPNAME2; 	// PMC IPNAME2 REGISTER 
	AT91_REG	 PMC_FEATURES; 	// PMC FEATURES REGISTER 
	AT91_REG	 PMC_VER; 	// APMC VERSION REGISTER
	AT91_REG	 Reserved9[64]; 	// 
	AT91_REG	 DBGU_CR; 	// Control Register
	AT91_REG	 DBGU_MR; 	// Mode Register
	AT91_REG	 DBGU_IER; 	// Interrupt Enable Register
	AT91_REG	 DBGU_IDR; 	// Interrupt Disable Register
	AT91_REG	 DBGU_IMR; 	// Interrupt Mask Register
	AT91_REG	 DBGU_CSR; 	// Channel Status Register
	AT91_REG	 DBGU_RHR; 	// Receiver Holding Register
	AT91_REG	 DBGU_THR; 	// Transmitter Holding Register
	AT91_REG	 DBGU_BRGR; 	// Baud Rate Generator Register
	AT91_REG	 Reserved10[9]; 	// 
	AT91_REG	 DBGU_FNTR; 	// Force NTRST Register
	AT91_REG	 Reserved11[40]; 	// 
	AT91_REG	 DBGU_ADDRSIZE; 	// DBGU ADDRSIZE REGISTER 
	AT91_REG	 DBGU_IPNAME1; 	// DBGU IPNAME1 REGISTER 
	AT91_REG	 DBGU_IPNAME2; 	// DBGU IPNAME2 REGISTER 
	AT91_REG	 DBGU_FEATURES; 	// DBGU FEATURES REGISTER 
	AT91_REG	 DBGU_VER; 	// DBGU VERSION REGISTER 
	AT91_REG	 DBGU_RPR; 	// Receive Pointer Register
	AT91_REG	 DBGU_RCR; 	// Receive Counter Register
	AT91_REG	 DBGU_TPR; 	// Transmit Pointer Register
	AT91_REG	 DBGU_TCR; 	// Transmit Counter Register
	AT91_REG	 DBGU_RNPR; 	// Receive Next Pointer Register
	AT91_REG	 DBGU_RNCR; 	// Receive Next Counter Register
	AT91_REG	 DBGU_TNPR; 	// Transmit Next Pointer Register
	AT91_REG	 DBGU_TNCR; 	// Transmit Next Counter Register
	AT91_REG	 DBGU_PTCR; 	// PDC Transfer Control Register
	AT91_REG	 DBGU_PTSR; 	// PDC Transfer Status Register
	AT91_REG	 Reserved12[6]; 	// 
	AT91_REG	 DBGU_CIDR; 	// Chip ID Register
	AT91_REG	 DBGU_EXID; 	// Chip ID Extension Register
	AT91_REG	 Reserved13[46]; 	// 
	AT91_REG	 EFC0_FMR; 	// EFC Flash Mode Register
	AT91_REG	 EFC0_FCR; 	// EFC Flash Command Register
	AT91_REG	 EFC0_FSR; 	// EFC Flash Status Register
	AT91_REG	 EFC0_FRR; 	// EFC Flash Result Register
	AT91_REG	 Reserved14[1]; 	// 
	AT91_REG	 EFC0_FVR; 	// EFC Flash Version Register
	AT91_REG	 Reserved15[122]; 	// 
	AT91_REG	 EFC1_FMR; 	// EFC Flash Mode Register
	AT91_REG	 EFC1_FCR; 	// EFC Flash Command Register
	AT91_REG	 EFC1_FSR; 	// EFC Flash Status Register
	AT91_REG	 EFC1_FRR; 	// EFC Flash Result Register
	AT91_REG	 Reserved16[1]; 	// 
	AT91_REG	 EFC1_FVR; 	// EFC Flash Version Register
	AT91_REG	 Reserved17[122]; 	// 
	AT91_REG	 PIOA_PER; 	// PIO Enable Register
	AT91_REG	 PIOA_PDR; 	// PIO Disable Register
	AT91_REG	 PIOA_PSR; 	// PIO Status Register
	AT91_REG	 Reserved18[1]; 	// 
	AT91_REG	 PIOA_OER; 	// Output Enable Register
	AT91_REG	 PIOA_ODR; 	// Output Disable Registerr
	AT91_REG	 PIOA_OSR; 	// Output Status Register
	AT91_REG	 Reserved19[1]; 	// 
	AT91_REG	 PIOA_IFER; 	// Input Filter Enable Register
	AT91_REG	 PIOA_IFDR; 	// Input Filter Disable Register
	AT91_REG	 PIOA_IFSR; 	// Input Filter Status Register
	AT91_REG	 Reserved20[1]; 	// 
	AT91_REG	 PIOA_SODR; 	// Set Output Data Register
	AT91_REG	 PIOA_CODR; 	// Clear Output Data Register
	AT91_REG	 PIOA_ODSR; 	// Output Data Status Register
	AT91_REG	 PIOA_PDSR; 	// Pin Data Status Register
	AT91_REG	 PIOA_IER; 	// Interrupt Enable Register
	AT91_REG	 PIOA_IDR; 	// Interrupt Disable Register
	AT91_REG	 PIOA_IMR; 	// Interrupt Mask Register
	AT91_REG	 PIOA_ISR; 	// Interrupt Status Register
	AT91_REG	 PIOA_MDER; 	// Multi-driver Enable Register
	AT91_REG	 PIOA_MDDR; 	// Multi-driver Disable Register
	AT91_REG	 PIOA_MDSR; 	// Multi-driver Status Register
	AT91_REG	 Reserved21[1]; 	// 
	AT91_REG	 PIOA_PPUDR; 	// Pull-up Disable Register
	AT91_REG	 PIOA_PPUER; 	// Pull-up Enable Register
	AT91_REG	 PIOA_PPUSR; 	// Pull-up Status Register
	AT91_REG	 Reserved22[1]; 	// 
	AT91_REG	 PIOA_ABSR; 	// Peripheral AB Select Register
	AT91_REG	 Reserved23[3]; 	// 
	AT91_REG	 PIOA_SCIFSR; 	// System Clock Glitch Input Filter Select Register
	AT91_REG	 PIOA_DIFSR; 	// Debouncing Input Filter Select Register
	AT91_REG	 PIOA_IFDGSR; 	// Glitch or Debouncing Input Filter Clock Selection Status Register
	AT91_REG	 PIOA_SCDR; 	// Slow Clock Divider Debouncing Register
	AT91_REG	 Reserved24[4]; 	// 
	AT91_REG	 PIOA_OWER; 	// Output Write Enable Register
	AT91_REG	 PIOA_OWDR; 	// Output Write Disable Register
	AT91_REG	 PIOA_OWSR; 	// Output Write Status Register
	AT91_REG	 Reserved25[1]; 	// 
	AT91_REG	 PIOA_AIMER; 	// Additional Interrupt Modes Enable Register
	AT91_REG	 PIOA_AIMDR; 	// Additional Interrupt Modes Disables Register
	AT91_REG	 PIOA_AIMMR; 	// Additional Interrupt Modes Mask Register
	AT91_REG	 Reserved26[1]; 	// 
	AT91_REG	 PIOA_ESR; 	// Edge Select Register
	AT91_REG	 PIOA_LSR; 	// Level Select Register
	AT91_REG	 PIOA_ELSR; 	// Edge/Level Status Register
	AT91_REG	 Reserved27[1]; 	// 
	AT91_REG	 PIOA_FELLSR; 	// Falling Edge/Low Level Select Register
	AT91_REG	 PIOA_REHLSR; 	// Rising Edge/ High Level Select Register
	AT91_REG	 PIOA_FRLHSR; 	// Fall/Rise - Low/High Status Register
	AT91_REG	 Reserved28[1]; 	// 
	AT91_REG	 PIOA_LOCKSR; 	// Lock Status Register
	AT91_REG	 Reserved29[6]; 	// 
	AT91_REG	 PIOA_VER; 	// PIO VERSION REGISTER 
	AT91_REG	 Reserved30[8]; 	// 
	AT91_REG	 PIOA_KER; 	// Keypad Controller Enable Register
	AT91_REG	 PIOA_KRCR; 	// Keypad Controller Row Column Register
	AT91_REG	 PIOA_KDR; 	// Keypad Controller Debouncing Register
	AT91_REG	 Reserved31[1]; 	// 
	AT91_REG	 PIOA_KIER; 	// Keypad Controller Interrupt Enable Register
	AT91_REG	 PIOA_KIDR; 	// Keypad Controller Interrupt Disable Register
	AT91_REG	 PIOA_KIMR; 	// Keypad Controller Interrupt Mask Register
	AT91_REG	 PIOA_KSR; 	// Keypad Controller Status Register
	AT91_REG	 PIOA_KKPR; 	// Keypad Controller Key Press Register
	AT91_REG	 PIOA_KKRR; 	// Keypad Controller Key Release Register
	AT91_REG	 Reserved32[46]; 	// 
	AT91_REG	 PIOB_PER; 	// PIO Enable Register
	AT91_REG	 PIOB_PDR; 	// PIO Disable Register
	AT91_REG	 PIOB_PSR; 	// PIO Status Register
	AT91_REG	 Reserved33[1]; 	// 
	AT91_REG	 PIOB_OER; 	// Output Enable Register
	AT91_REG	 PIOB_ODR; 	// Output Disable Registerr
	AT91_REG	 PIOB_OSR; 	// Output Status Register
	AT91_REG	 Reserved34[1]; 	// 
	AT91_REG	 PIOB_IFER; 	// Input Filter Enable Register
	AT91_REG	 PIOB_IFDR; 	// Input Filter Disable Register
	AT91_REG	 PIOB_IFSR; 	// Input Filter Status Register
	AT91_REG	 Reserved35[1]; 	// 
	AT91_REG	 PIOB_SODR; 	// Set Output Data Register
	AT91_REG	 PIOB_CODR; 	// Clear Output Data Register
	AT91_REG	 PIOB_ODSR; 	// Output Data Status Register
	AT91_REG	 PIOB_PDSR; 	// Pin Data Status Register
	AT91_REG	 PIOB_IER; 	// Interrupt Enable Register
	AT91_REG	 PIOB_IDR; 	// Interrupt Disable Register
	AT91_REG	 PIOB_IMR; 	// Interrupt Mask Register
	AT91_REG	 PIOB_ISR; 	// Interrupt Status Register
	AT91_REG	 PIOB_MDER; 	// Multi-driver Enable Register
	AT91_REG	 PIOB_MDDR; 	// Multi-driver Disable Register
	AT91_REG	 PIOB_MDSR; 	// Multi-driver Status Register
	AT91_REG	 Reserved36[1]; 	// 
	AT91_REG	 PIOB_PPUDR; 	// Pull-up Disable Register
	AT91_REG	 PIOB_PPUER; 	// Pull-up Enable Register
	AT91_REG	 PIOB_PPUSR; 	// Pull-up Status Register
	AT91_REG	 Reserved37[1]; 	// 
	AT91_REG	 PIOB_ABSR; 	// Peripheral AB Select Register
	AT91_REG	 Reserved38[3]; 	// 
	AT91_REG	 PIOB_SCIFSR; 	// System Clock Glitch Input Filter Select Register
	AT91_REG	 PIOB_DIFSR; 	// Debouncing Input Filter Select Register
	AT91_REG	 PIOB_IFDGSR; 	// Glitch or Debouncing Input Filter Clock Selection Status Register
	AT91_REG	 PIOB_SCDR; 	// Slow Clock Divider Debouncing Register
	AT91_REG	 Reserved39[4]; 	// 
	AT91_REG	 PIOB_OWER; 	// Output Write Enable Register
	AT91_REG	 PIOB_OWDR; 	// Output Write Disable Register
	AT91_REG	 PIOB_OWSR; 	// Output Write Status Register
	AT91_REG	 Reserved40[1]; 	// 
	AT91_REG	 PIOB_AIMER; 	// Additional Interrupt Modes Enable Register
	AT91_REG	 PIOB_AIMDR; 	// Additional Interrupt Modes Disables Register
	AT91_REG	 PIOB_AIMMR; 	// Additional Interrupt Modes Mask Register
	AT91_REG	 Reserved41[1]; 	// 
	AT91_REG	 PIOB_ESR; 	// Edge Select Register
	AT91_REG	 PIOB_LSR; 	// Level Select Register
	AT91_REG	 PIOB_ELSR; 	// Edge/Level Status Register
	AT91_REG	 Reserved42[1]; 	// 
	AT91_REG	 PIOB_FELLSR; 	// Falling Edge/Low Level Select Register
	AT91_REG	 PIOB_REHLSR; 	// Rising Edge/ High Level Select Register
	AT91_REG	 PIOB_FRLHSR; 	// Fall/Rise - Low/High Status Register
	AT91_REG	 Reserved43[1]; 	// 
	AT91_REG	 PIOB_LOCKSR; 	// Lock Status Register
	AT91_REG	 Reserved44[6]; 	// 
	AT91_REG	 PIOB_VER; 	// PIO VERSION REGISTER 
	AT91_REG	 Reserved45[8]; 	// 
	AT91_REG	 PIOB_KER; 	// Keypad Controller Enable Register
	AT91_REG	 PIOB_KRCR; 	// Keypad Controller Row Column Register
	AT91_REG	 PIOB_KDR; 	// Keypad Controller Debouncing Register
	AT91_REG	 Reserved46[1]; 	// 
	AT91_REG	 PIOB_KIER; 	// Keypad Controller Interrupt Enable Register
	AT91_REG	 PIOB_KIDR; 	// Keypad Controller Interrupt Disable Register
	AT91_REG	 PIOB_KIMR; 	// Keypad Controller Interrupt Mask Register
	AT91_REG	 PIOB_KSR; 	// Keypad Controller Status Register
	AT91_REG	 PIOB_KKPR; 	// Keypad Controller Key Press Register
	AT91_REG	 PIOB_KKRR; 	// Keypad Controller Key Release Register
	AT91_REG	 Reserved47[46]; 	// 
	AT91_REG	 PIOC_PER; 	// PIO Enable Register
	AT91_REG	 PIOC_PDR; 	// PIO Disable Register
	AT91_REG	 PIOC_PSR; 	// PIO Status Register
	AT91_REG	 Reserved48[1]; 	// 
	AT91_REG	 PIOC_OER; 	// Output Enable Register
	AT91_REG	 PIOC_ODR; 	// Output Disable Registerr
	AT91_REG	 PIOC_OSR; 	// Output Status Register
	AT91_REG	 Reserved49[1]; 	// 
	AT91_REG	 PIOC_IFER; 	// Input Filter Enable Register
	AT91_REG	 PIOC_IFDR; 	// Input Filter Disable Register
	AT91_REG	 PIOC_IFSR; 	// Input Filter Status Register
	AT91_REG	 Reserved50[1]; 	// 
	AT91_REG	 PIOC_SODR; 	// Set Output Data Register
	AT91_REG	 PIOC_CODR; 	// Clear Output Data Register
	AT91_REG	 PIOC_ODSR; 	// Output Data Status Register
	AT91_REG	 PIOC_PDSR; 	// Pin Data Status Register
	AT91_REG	 PIOC_IER; 	// Interrupt Enable Register
	AT91_REG	 PIOC_IDR; 	// Interrupt Disable Register
	AT91_REG	 PIOC_IMR; 	// Interrupt Mask Register
	AT91_REG	 PIOC_ISR; 	// Interrupt Status Register
	AT91_REG	 PIOC_MDER; 	// Multi-driver Enable Register
	AT91_REG	 PIOC_MDDR; 	// Multi-driver Disable Register
	AT91_REG	 PIOC_MDSR; 	// Multi-driver Status Register
	AT91_REG	 Reserved51[1]; 	// 
	AT91_REG	 PIOC_PPUDR; 	// Pull-up Disable Register
	AT91_REG	 PIOC_PPUER; 	// Pull-up Enable Register
	AT91_REG	 PIOC_PPUSR; 	// Pull-up Status Register
	AT91_REG	 Reserved52[1]; 	// 
	AT91_REG	 PIOC_ABSR; 	// Peripheral AB Select Register
	AT91_REG	 Reserved53[3]; 	// 
	AT91_REG	 PIOC_SCIFSR; 	// System Clock Glitch Input Filter Select Register
	AT91_REG	 PIOC_DIFSR; 	// Debouncing Input Filter Select Register
	AT91_REG	 PIOC_IFDGSR; 	// Glitch or Debouncing Input Filter Clock Selection Status Register
	AT91_REG	 PIOC_SCDR; 	// Slow Clock Divider Debouncing Register
	AT91_REG	 Reserved54[4]; 	// 
	AT91_REG	 PIOC_OWER; 	// Output Write Enable Register
	AT91_REG	 PIOC_OWDR; 	// Output Write Disable Register
	AT91_REG	 PIOC_OWSR; 	// Output Write Status Register
	AT91_REG	 Reserved55[1]; 	// 
	AT91_REG	 PIOC_AIMER; 	// Additional Interrupt Modes Enable Register
	AT91_REG	 PIOC_AIMDR; 	// Additional Interrupt Modes Disables Register
	AT91_REG	 PIOC_AIMMR; 	// Additional Interrupt Modes Mask Register
	AT91_REG	 Reserved56[1]; 	// 
	AT91_REG	 PIOC_ESR; 	// Edge Select Register
	AT91_REG	 PIOC_LSR; 	// Level Select Register
	AT91_REG	 PIOC_ELSR; 	// Edge/Level Status Register
	AT91_REG	 Reserved57[1]; 	// 
	AT91_REG	 PIOC_FELLSR; 	// Falling Edge/Low Level Select Register
	AT91_REG	 PIOC_REHLSR; 	// Rising Edge/ High Level Select Register
	AT91_REG	 PIOC_FRLHSR; 	// Fall/Rise - Low/High Status Register
	AT91_REG	 Reserved58[1]; 	// 
	AT91_REG	 PIOC_LOCKSR; 	// Lock Status Register
	AT91_REG	 Reserved59[6]; 	// 
	AT91_REG	 PIOC_VER; 	// PIO VERSION REGISTER 
	AT91_REG	 Reserved60[8]; 	// 
	AT91_REG	 PIOC_KER; 	// Keypad Controller Enable Register
	AT91_REG	 PIOC_KRCR; 	// Keypad Controller Row Column Register
	AT91_REG	 PIOC_KDR; 	// Keypad Controller Debouncing Register
	AT91_REG	 Reserved61[1]; 	// 
	AT91_REG	 PIOC_KIER; 	// Keypad Controller Interrupt Enable Register
	AT91_REG	 PIOC_KIDR; 	// Keypad Controller Interrupt Disable Register
	AT91_REG	 PIOC_KIMR; 	// Keypad Controller Interrupt Mask Register
	AT91_REG	 PIOC_KSR; 	// Keypad Controller Status Register
	AT91_REG	 PIOC_KKPR; 	// Keypad Controller Key Press Register
	AT91_REG	 PIOC_KKRR; 	// Keypad Controller Key Release Register
	AT91_REG	 Reserved62[46]; 	// 
	AT91_REG	 RSTC_RCR; 	// Reset Control Register
	AT91_REG	 RSTC_RSR; 	// Reset Status Register
	AT91_REG	 RSTC_RMR; 	// Reset Mode Register
	AT91_REG	 Reserved63[1]; 	// 
    AT91_REG SUPC_CR;   // Supply Controller Control Register
    AT91_REG SUPC_SMMR; // Supply Controller Supply Monitor Mode Register
    AT91_REG SUPC_MR;   // Supply Controller Mode Register
    AT91_REG SUPC_WUMR; // Supply Controller Wake Up Mode Register
    AT91_REG SUPC_WUIR; // Supply Controller Wake Up Inputs Register
    AT91_REG SUPC_SR;   // Supply Controller Status Register
	AT91_REG	 Reserved64[2]; 	// 

	AT91_REG	 RTTC_RTMR; 	// Real-time Mode Register
	AT91_REG	 RTTC_RTAR; 	// Real-time Alarm Register
	AT91_REG	 RTTC_RTVR; 	// Real-time Value Register
	AT91_REG	 RTTC_RTSR; 	// Real-time Status Register
	AT91_REG	 Reserved65[4]; 	// 
	AT91_REG	 WDTC_WDCR; 	// Watchdog Control Register
	AT91_REG	 WDTC_WDMR; 	// Watchdog Mode Register
	AT91_REG	 WDTC_WDSR; 	// Watchdog Status Register
	AT91_REG	 Reserved66[1]; 	// 
	AT91_REG	 RTC_CR; 	// Control Register
	AT91_REG	 RTC_MR; 	// Mode Register
	AT91_REG	 RTC_TIMR; 	// Time Register
	AT91_REG	 RTC_CALR; 	// Calendar Register
	AT91_REG	 RTC_TIMALR; 	// Time Alarm Register
	AT91_REG	 RTC_CALALR; 	// Calendar Alarm Register
	AT91_REG	 RTC_SR; 	// Status Register
	AT91_REG	 RTC_SCCR; 	// Status Clear Command Register
	AT91_REG	 RTC_IER; 	// Interrupt Enable Register
	AT91_REG	 RTC_IDR; 	// Interrupt Disable Register
	AT91_REG	 RTC_IMR; 	// Interrupt Mask Register
	AT91_REG	 RTC_VER; 	// Valid Entry Register
	AT91_REG	 SYS_GPBR[8]; 	// General Purpose Register
	AT91_REG	 Reserved67[19]; 	// 
	AT91_REG	 RSTC_VER; 	// Version Register
} AT91S_SYS, *AT91PS_SYS;




// -------- GPBR : (SYS Offset: 0x1290) GPBR General Purpose Register -------- 


// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR HSMC4 Chip Select interface
// *****************************************************************************

typedef struct _AT91S_HSMC4_CS {
	AT91_REG	 HSMC4_SETUP; 	// Setup Register
	AT91_REG	 HSMC4_PULSE; 	// Pulse Register
	AT91_REG	 HSMC4_CYCLE; 	// Cycle Register
	AT91_REG	 HSMC4_TIMINGS; 	// Timmings Register
	AT91_REG	 HSMC4_MODE; 	// Mode Register
} AT91S_HSMC4_CS, *AT91PS_HSMC4_CS;
#line 466 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_SETUP : (HSMC4_CS Offset: 0x0) HSMC4 SETUP -------- 




// -------- HSMC4_PULSE : (HSMC4_CS Offset: 0x4) HSMC4 PULSE -------- 




// -------- HSMC4_CYCLE : (HSMC4_CS Offset: 0x8) HSMC4 CYCLE -------- 


// -------- HSMC4_TIMINGS : (HSMC4_CS Offset: 0xc) HSMC4 TIMINGS -------- 
#line 488 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_MODE : (HSMC4_CS Offset: 0x10) HSMC4 MODE -------- 
#line 510 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR AHB Static Memory Controller 4 Interface
// *****************************************************************************

typedef struct _AT91S_HSMC4 {
	AT91_REG	 HSMC4_CFG; 	// Configuration Register
	AT91_REG	 HSMC4_CTRL; 	// Control Register
	AT91_REG	 HSMC4_SR; 	// Status Register
	AT91_REG	 HSMC4_IER; 	// Interrupt Enable Register
	AT91_REG	 HSMC4_IDR; 	// Interrupt Disable Register
	AT91_REG	 HSMC4_IMR; 	// Interrupt Mask Register
	AT91_REG	 HSMC4_ADDR; 	// Address Cycle Zero Register
	AT91_REG	 HSMC4_BANK; 	// Bank Register
	AT91_REG	 HSMC4_ECCCR; 	// ECC reset register
	AT91_REG	 HSMC4_ECCCMD; 	// ECC Page size register
	AT91_REG	 HSMC4_ECCSR1; 	// ECC Status register 1
	AT91_REG	 HSMC4_ECCPR0; 	// ECC Parity register 0
	AT91_REG	 HSMC4_ECCPR1; 	// ECC Parity register 1
	AT91_REG	 HSMC4_ECCSR2; 	// ECC Status register 2
	AT91_REG	 HSMC4_ECCPR2; 	// ECC Parity register 2
	AT91_REG	 HSMC4_ECCPR3; 	// ECC Parity register 3
	AT91_REG	 HSMC4_ECCPR4; 	// ECC Parity register 4
	AT91_REG	 HSMC4_ECCPR5; 	// ECC Parity register 5
	AT91_REG	 HSMC4_ECCPR6; 	// ECC Parity register 6
	AT91_REG	 HSMC4_ECCPR7; 	// ECC Parity register 7
	AT91_REG	 HSMC4_ECCPR8; 	// ECC Parity register 8
	AT91_REG	 HSMC4_ECCPR9; 	// ECC Parity register 9
	AT91_REG	 HSMC4_ECCPR10; 	// ECC Parity register 10
	AT91_REG	 HSMC4_ECCPR11; 	// ECC Parity register 11
	AT91_REG	 HSMC4_ECCPR12; 	// ECC Parity register 12
	AT91_REG	 HSMC4_ECCPR13; 	// ECC Parity register 13
	AT91_REG	 HSMC4_ECCPR14; 	// ECC Parity register 14
	AT91_REG	 HSMC4_Eccpr15; 	// ECC Parity register 15
	AT91_REG	 Reserved0[40]; 	// 
	AT91_REG	 HSMC4_OCMS; 	// OCMS MODE register
	AT91_REG	 HSMC4_KEY1; 	// KEY1 Register
	AT91_REG	 HSMC4_KEY2; 	// KEY2 Register
	AT91_REG	 Reserved1[50]; 	// 
	AT91_REG	 HSMC4_WPCR; 	// Write Protection Control register
	AT91_REG	 HSMC4_WPSR; 	// Write Protection Status Register
	AT91_REG	 HSMC4_ADDRSIZE; 	// Write Protection Status Register
	AT91_REG	 HSMC4_IPNAME1; 	// Write Protection Status Register
	AT91_REG	 HSMC4_IPNAME2; 	// Write Protection Status Register
	AT91_REG	 HSMC4_FEATURES; 	// Write Protection Status Register
	AT91_REG	 HSMC4_VER; 	// HSMC4 Version Register
	AT91_REG	 HSMC4_DUMMY; 	// This rtegister was created only ti have AHB constants
} AT91S_HSMC4, *AT91PS_HSMC4;
#line 600 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_CFG : (HSMC4 Offset: 0x0) Configuration Register -------- 
#line 620 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_CTRL : (HSMC4 Offset: 0x4) Control Register -------- 
#line 635 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_SR : (HSMC4 Offset: 0x8) HSMC4 Status Register -------- 
#line 665 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_IER : (HSMC4 Offset: 0xc) HSMC4 Interrupt Enable Register -------- 
// -------- HSMC4_IDR : (HSMC4 Offset: 0x10) HSMC4 Interrupt Disable Register -------- 
// -------- HSMC4_IMR : (HSMC4 Offset: 0x14) HSMC4 Interrupt Mask Register -------- 
// -------- HSMC4_ADDR : (HSMC4 Offset: 0x18) Address Cycle Zero Register -------- 

// -------- HSMC4_BANK : (HSMC4 Offset: 0x1c) Bank Register -------- 
#line 680 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_ECCCR : (HSMC4 Offset: 0x20) ECC Control Register -------- 

// -------- HSMC4_ECCCMD : (HSMC4 Offset: 0x24) ECC mode register -------- 
#line 692 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_ECCSR1 : (HSMC4 Offset: 0x28) ECC Status Register 1 -------- 
#line 717 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_ECCPR0 : (HSMC4 Offset: 0x2c) HSMC4 ECC parity Register 0 -------- 



// -------- HSMC4_ECCPR1 : (HSMC4 Offset: 0x30) HSMC4 ECC parity Register 1 -------- 
// -------- HSMC4_ECCSR2 : (HSMC4 Offset: 0x34) ECC Status Register 2 -------- 
#line 747 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_ECCPR2 : (HSMC4 Offset: 0x38) HSMC4 ECC parity Register 2 -------- 
// -------- HSMC4_ECCPR3 : (HSMC4 Offset: 0x3c) HSMC4 ECC parity Register 3 -------- 
// -------- HSMC4_ECCPR4 : (HSMC4 Offset: 0x40) HSMC4 ECC parity Register 4 -------- 
// -------- HSMC4_ECCPR5 : (HSMC4 Offset: 0x44) HSMC4 ECC parity Register 5 -------- 
// -------- HSMC4_ECCPR6 : (HSMC4 Offset: 0x48) HSMC4 ECC parity Register 6 -------- 
// -------- HSMC4_ECCPR7 : (HSMC4 Offset: 0x4c) HSMC4 ECC parity Register 7 -------- 
// -------- HSMC4_ECCPR8 : (HSMC4 Offset: 0x50) HSMC4 ECC parity Register 8 -------- 
// -------- HSMC4_ECCPR9 : (HSMC4 Offset: 0x54) HSMC4 ECC parity Register 9 -------- 
// -------- HSMC4_ECCPR10 : (HSMC4 Offset: 0x58) HSMC4 ECC parity Register 10 -------- 
// -------- HSMC4_ECCPR11 : (HSMC4 Offset: 0x5c) HSMC4 ECC parity Register 11 -------- 
// -------- HSMC4_ECCPR12 : (HSMC4 Offset: 0x60) HSMC4 ECC parity Register 12 -------- 
// -------- HSMC4_ECCPR13 : (HSMC4 Offset: 0x64) HSMC4 ECC parity Register 13 -------- 
// -------- HSMC4_ECCPR14 : (HSMC4 Offset: 0x68) HSMC4 ECC parity Register 14 -------- 
// -------- HSMC4_ECCPR15 : (HSMC4 Offset: 0x6c) HSMC4 ECC parity Register 15 -------- 
// -------- HSMC4_OCMS : (HSMC4 Offset: 0x110) HSMC4 OCMS Register -------- 


// -------- HSMC4_KEY1 : (HSMC4 Offset: 0x114) HSMC4 OCMS KEY1 Register -------- 

// -------- HSMC4_OCMS_KEY2 : (HSMC4 Offset: 0x118) HSMC4 OCMS KEY2 Register -------- 

// -------- HSMC4_WPCR : (HSMC4 Offset: 0x1e4) HSMC4 Witre Protection Control Register -------- 


// -------- HSMC4_WPSR : (HSMC4 Offset: 0x1e8) HSMC4 WPSR Register -------- 
#line 778 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HSMC4_VER : (HSMC4 Offset: 0x1fc) HSMC4 VERSION Register -------- 
// -------- HSMC4_DUMMY : (HSMC4 Offset: 0x200) HSMC4 DUMMY REGISTER -------- 
#line 802 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR AHB Matrix2 Interface
// *****************************************************************************

typedef struct _AT91S_HMATRIX2 {
	AT91_REG	 HMATRIX2_MCFG0; 	//  Master Configuration Register 0 : ARM I and D
	AT91_REG	 HMATRIX2_MCFG1; 	//  Master Configuration Register 1 : ARM S
	AT91_REG	 HMATRIX2_MCFG2; 	//  Master Configuration Register 2
	AT91_REG	 HMATRIX2_MCFG3; 	//  Master Configuration Register 3
	AT91_REG	 HMATRIX2_MCFG4; 	//  Master Configuration Register 4
	AT91_REG	 HMATRIX2_MCFG5; 	//  Master Configuration Register 5
	AT91_REG	 HMATRIX2_MCFG6; 	//  Master Configuration Register 6
	AT91_REG	 HMATRIX2_MCFG7; 	//  Master Configuration Register 7
	AT91_REG	 Reserved0[8]; 	// 
	AT91_REG	 HMATRIX2_SCFG0; 	//  Slave Configuration Register 0
	AT91_REG	 HMATRIX2_SCFG1; 	//  Slave Configuration Register 1
	AT91_REG	 HMATRIX2_SCFG2; 	//  Slave Configuration Register 2
	AT91_REG	 HMATRIX2_SCFG3; 	//  Slave Configuration Register 3
	AT91_REG	 HMATRIX2_SCFG4; 	//  Slave Configuration Register 4
	AT91_REG	 HMATRIX2_SCFG5; 	//  Slave Configuration Register 5
	AT91_REG	 HMATRIX2_SCFG6; 	//  Slave Configuration Register 6
	AT91_REG	 HMATRIX2_SCFG7; 	//  Slave Configuration Register 5
	AT91_REG	 HMATRIX2_SCFG8; 	//  Slave Configuration Register 8
	AT91_REG	 HMATRIX2_SCFG9; 	//  Slave Configuration Register 9
	AT91_REG	 Reserved1[42]; 	// 
	AT91_REG	 HMATRIX2_SFR0 ; 	//  Special Function Register 0
	AT91_REG	 HMATRIX2_SFR1 ; 	//  Special Function Register 1
	AT91_REG	 HMATRIX2_SFR2 ; 	//  Special Function Register 2
	AT91_REG	 HMATRIX2_SFR3 ; 	//  Special Function Register 3
	AT91_REG	 HMATRIX2_SFR4 ; 	//  Special Function Register 4
	AT91_REG	 HMATRIX2_SFR5 ; 	//  Special Function Register 5
	AT91_REG	 HMATRIX2_SFR6 ; 	//  Special Function Register 6
	AT91_REG	 HMATRIX2_SFR7 ; 	//  Special Function Register 7
	AT91_REG	 HMATRIX2_SFR8 ; 	//  Special Function Register 8
	AT91_REG	 HMATRIX2_SFR9 ; 	//  Special Function Register 9
	AT91_REG	 HMATRIX2_SFR10; 	//  Special Function Register 10
	AT91_REG	 HMATRIX2_SFR11; 	//  Special Function Register 11
	AT91_REG	 HMATRIX2_SFR12; 	//  Special Function Register 12
	AT91_REG	 HMATRIX2_SFR13; 	//  Special Function Register 13
	AT91_REG	 HMATRIX2_SFR14; 	//  Special Function Register 14
	AT91_REG	 HMATRIX2_SFR15; 	//  Special Function Register 15
	AT91_REG	 Reserved2[39]; 	// 
	AT91_REG	 HMATRIX2_ADDRSIZE; 	// HMATRIX2 ADDRSIZE REGISTER 
	AT91_REG	 HMATRIX2_IPNAME1; 	// HMATRIX2 IPNAME1 REGISTER 
	AT91_REG	 HMATRIX2_IPNAME2; 	// HMATRIX2 IPNAME2 REGISTER 
	AT91_REG	 HMATRIX2_FEATURES; 	// HMATRIX2 FEATURES REGISTER 
	AT91_REG	 HMATRIX2_VER; 	// HMATRIX2 VERSION REGISTER 
} AT91S_HMATRIX2, *AT91PS_HMATRIX2;
#line 893 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MATRIX_MCFG0 : (HMATRIX2 Offset: 0x0) Master Configuration Register ARM bus I and D -------- 
#line 903 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MATRIX_MCFG1 : (HMATRIX2 Offset: 0x4) Master Configuration Register ARM bus S -------- 
// -------- MATRIX_MCFG2 : (HMATRIX2 Offset: 0x8) Master Configuration Register -------- 
// -------- MATRIX_MCFG3 : (HMATRIX2 Offset: 0xc) Master Configuration Register -------- 
// -------- MATRIX_MCFG4 : (HMATRIX2 Offset: 0x10) Master Configuration Register -------- 
// -------- MATRIX_MCFG5 : (HMATRIX2 Offset: 0x14) Master Configuration Register -------- 
// -------- MATRIX_MCFG6 : (HMATRIX2 Offset: 0x18) Master Configuration Register -------- 
// -------- MATRIX_MCFG7 : (HMATRIX2 Offset: 0x1c) Master Configuration Register -------- 
// -------- MATRIX_SCFG0 : (HMATRIX2 Offset: 0x40) Slave Configuration Register 0 -------- 
#line 918 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MATRIX_SCFG1 : (HMATRIX2 Offset: 0x44) Slave Configuration Register 1 -------- 


// -------- MATRIX_SCFG2 : (HMATRIX2 Offset: 0x48) Slave Configuration Register 2 -------- 


// -------- MATRIX_SCFG3 : (HMATRIX2 Offset: 0x4c) Slave Configuration Register 3 -------- 


// -------- MATRIX_SCFG4 : (HMATRIX2 Offset: 0x50) Slave Configuration Register 4 -------- 


// -------- MATRIX_SCFG5 : (HMATRIX2 Offset: 0x54) Slave Configuration Register 5 -------- 


// -------- MATRIX_SCFG6 : (HMATRIX2 Offset: 0x58) Slave Configuration Register 6 -------- 


// -------- MATRIX_SCFG7 : (HMATRIX2 Offset: 0x5c) Slave Configuration Register 7 -------- 


// -------- MATRIX_SCFG8 : (HMATRIX2 Offset: 0x60) Slave Configuration Register 8 -------- 



// -------- MATRIX_SCFG9 : (HMATRIX2 Offset: 0x64) Slave Configuration Register 9 -------- 



// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x110) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x114) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x118) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x11c) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x120) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x124) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x128) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x12c) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x130) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x134) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x138) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x13c) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x140) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x144) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x148) Special Function Register 0 -------- 
// -------- MATRIX_SFR0 : (HMATRIX2 Offset: 0x14c) Special Function Register 0 -------- 
// -------- HMATRIX2_VER : (HMATRIX2 Offset: 0x1fc)  VERSION  Register -------- 


// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR NESTED vector Interrupt Controller
// *****************************************************************************

typedef struct _AT91S_NVIC {
	AT91_REG	 Reserved0[1]; 	// 
	AT91_REG	 NVIC_ICTR; 	// Interrupt Control Type Register
	AT91_REG	 Reserved1[2]; 	// 
	AT91_REG	 NVIC_STICKCSR; 	// SysTick Control and Status Register
	AT91_REG	 NVIC_STICKRVR; 	// SysTick Reload Value Register
	AT91_REG	 NVIC_STICKCVR; 	// SysTick Current Value Register
	AT91_REG	 NVIC_STICKCALVR; 	// SysTick Calibration Value Register
	AT91_REG	 Reserved2[56]; 	// 
	AT91_REG	 NVIC_ISER[8]; 	// Set Enable Register
	AT91_REG	 Reserved3[24]; 	// 
	AT91_REG	 NVIC_ICER[8]; 	// Clear enable Register
	AT91_REG	 Reserved4[24]; 	// 
	AT91_REG	 NVIC_ISPR[8]; 	// Set Pending Register
	AT91_REG	 Reserved5[24]; 	// 
	AT91_REG	 NVIC_ICPR[8]; 	// Clear Pending Register
	AT91_REG	 Reserved6[24]; 	// 
	AT91_REG	 NVIC_ABR[8]; 	// Active Bit Register
	AT91_REG	 Reserved7[56]; 	// 
	AT91_REG	 NVIC_IPR[60]; 	// Interrupt Mask Register
	AT91_REG	 Reserved8[516]; 	// 
	AT91_REG	 NVIC_CPUID; 	// CPUID Base Register
	AT91_REG	 NVIC_ICSR; 	// Interrupt Control State Register
	AT91_REG	 NVIC_VTOFFR; 	// Vector Table Offset Register
	AT91_REG	 NVIC_AIRCR; 	// Application Interrupt/Reset Control Reg
	AT91_REG	 NVIC_SCR; 	// System Control Register
	AT91_REG	 NVIC_CCR; 	// Configuration Control Register
	AT91_REG	 NVIC_HAND4PR; 	// System Handlers 4-7 Priority Register
	AT91_REG	 NVIC_HAND8PR; 	// System Handlers 8-11 Priority Register
	AT91_REG	 NVIC_HAND12PR; 	// System Handlers 12-15 Priority Register
	AT91_REG	 NVIC_HANDCSR; 	// System Handler Control and State Register
	AT91_REG	 NVIC_CFSR; 	// Configurable Fault Status Register
	AT91_REG	 NVIC_HFSR; 	// Hard Fault Status Register
	AT91_REG	 NVIC_DFSR; 	// Debug Fault Status Register
	AT91_REG	 NVIC_MMAR; 	// Mem Manage Address Register
	AT91_REG	 NVIC_BFAR; 	// Bus Fault Address Register
	AT91_REG	 NVIC_AFSR; 	// Auxiliary Fault Status Register
	AT91_REG	 NVIC_PFR0; 	// Processor Feature register0
	AT91_REG	 NVIC_PFR1; 	// Processor Feature register1
	AT91_REG	 NVIC_DFR0; 	// Debug Feature register0
	AT91_REG	 NVIC_AFR0; 	// Auxiliary Feature register0
	AT91_REG	 NVIC_MMFR0; 	// Memory Model Feature register0
	AT91_REG	 NVIC_MMFR1; 	// Memory Model Feature register1
	AT91_REG	 NVIC_MMFR2; 	// Memory Model Feature register2
	AT91_REG	 NVIC_MMFR3; 	// Memory Model Feature register3
	AT91_REG	 NVIC_ISAR0; 	// ISA Feature register0
	AT91_REG	 NVIC_ISAR1; 	// ISA Feature register1
	AT91_REG	 NVIC_ISAR2; 	// ISA Feature register2
	AT91_REG	 NVIC_ISAR3; 	// ISA Feature register3
	AT91_REG	 NVIC_ISAR4; 	// ISA Feature register4
	AT91_REG	 Reserved9[99]; 	// 
	AT91_REG	 NVIC_STIR; 	// Software Trigger Interrupt Register
	AT91_REG	 Reserved10[51]; 	// 
	AT91_REG	 NVIC_PID4; 	// Peripheral identification register
	AT91_REG	 NVIC_PID5; 	// Peripheral identification register
	AT91_REG	 NVIC_PID6; 	// Peripheral identification register
	AT91_REG	 NVIC_PID7; 	// Peripheral identification register
	AT91_REG	 NVIC_PID0; 	// Peripheral identification register b7:0
	AT91_REG	 NVIC_PID1; 	// Peripheral identification register b15:8
	AT91_REG	 NVIC_PID2; 	// Peripheral identification register b23:16
	AT91_REG	 NVIC_PID3; 	// Peripheral identification register b31:24
	AT91_REG	 NVIC_CID0; 	// Component identification register b7:0
	AT91_REG	 NVIC_CID1; 	// Component identification register b15:8
	AT91_REG	 NVIC_CID2; 	// Component identification register b23:16
	AT91_REG	 NVIC_CID3; 	// Component identification register b31:24
} AT91S_NVIC, *AT91PS_NVIC;
#line 1092 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- NVIC_ICTR : (NVIC Offset: 0x4) Interrupt Controller Type Register -------- 
#line 1110 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- NVIC_STICKCSR : (NVIC Offset: 0x10) SysTick Control and Status Register -------- 




// -------- NVIC_STICKRVR : (NVIC Offset: 0x14) SysTick Reload Value Register -------- 

// -------- NVIC_STICKCVR : (NVIC Offset: 0x18) SysTick Current Value Register -------- 

// -------- NVIC_STICKCALVR : (NVIC Offset: 0x1c) SysTick Calibration Value Register -------- 



// -------- NVIC_IPR : (NVIC Offset: 0x400) Interrupt Priority Registers -------- 




// -------- NVIC_CPUID : (NVIC Offset: 0xd00) CPU ID Base Register -------- 





// -------- NVIC_ICSR : (NVIC Offset: 0xd04) Interrupt Control State Register -------- 
#line 1145 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- NVIC_VTOFFR : (NVIC Offset: 0xd08) Vector Table Offset Register -------- 




// -------- NVIC_AIRCR : (NVIC Offset: 0xd0c) Application Interrupt and Reset Control Register -------- 
#line 1162 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- NVIC_SCR : (NVIC Offset: 0xd10) System Control Register -------- 



// -------- NVIC_CCR : (NVIC Offset: 0xd14) Configuration Control Register -------- 
#line 1173 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- NVIC_HAND4PR : (NVIC Offset: 0xd18) System Handlers 4-7 Priority Register -------- 




// -------- NVIC_HAND8PR : (NVIC Offset: 0xd1c) System Handlers 8-11 Priority Register -------- 




// -------- NVIC_HAND12PR : (NVIC Offset: 0xd20) System Handlers 12-15 Priority Register -------- 




// -------- NVIC_HANDCSR : (NVIC Offset: 0xd24) System Handler Control and State Register -------- 
#line 1203 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- NVIC_CFSR : (NVIC Offset: 0xd28) Configurable Fault Status Registers -------- 



// -------- NVIC_BFAR : (NVIC Offset: 0xd38) Bus Fault Address Register -------- 
#line 1214 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- NVIC_PFR0 : (NVIC Offset: 0xd40) Processor Feature register0 (ID_PFR0) -------- 


// -------- NVIC_PFR1 : (NVIC Offset: 0xd44) Processor Feature register1 (ID_PFR1) -------- 

// -------- NVIC_DFR0 : (NVIC Offset: 0xd48) Debug Feature register0 (ID_DFR0) -------- 

// -------- NVIC_MMFR0 : (NVIC Offset: 0xd50) Memory Model Feature register0 (ID_MMFR0) -------- 



// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR NESTED vector Interrupt Controller
// *****************************************************************************

typedef struct _AT91S_MPU {
	AT91_REG	 MPU_TYPE; 	// MPU Type Register
	AT91_REG	 MPU_CTRL; 	// MPU Control Register
	AT91_REG	 MPU_REG_NB; 	// MPU Region Number Register
	AT91_REG	 MPU_REG_BASE_ADDR; 	// MPU Region Base Address Register
	AT91_REG	 MPU_ATTR_SIZE; 	// MPU  Attribute and Size Register
	AT91_REG	 MPU_REG_BASE_ADDR1; 	// MPU Region Base Address Register alias 1
	AT91_REG	 MPU_ATTR_SIZE1; 	// MPU  Attribute and Size Register alias 1
	AT91_REG	 MPU_REG_BASE_ADDR2; 	// MPU Region Base Address Register alias 2
	AT91_REG	 MPU_ATTR_SIZE2; 	// MPU  Attribute and Size Register alias 2
	AT91_REG	 MPU_REG_BASE_ADDR3; 	// MPU Region Base Address Register alias 3
	AT91_REG	 MPU_ATTR_SIZE3; 	// MPU  Attribute and Size Register alias 3
} AT91S_MPU, *AT91PS_MPU;
#line 1256 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MPU_TYPE : (MPU Offset: 0x0)  -------- 



// -------- MPU_CTRL : (MPU Offset: 0x4)  -------- 



// -------- MPU_REG_NB : (MPU Offset: 0x8)  -------- 

// -------- MPU_REG_BASE_ADDR : (MPU Offset: 0xc)  -------- 



// -------- MPU_ATTR_SIZE : (MPU Offset: 0x10)  -------- 
#line 1280 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR CORTEX_M3 Registers
// *****************************************************************************

typedef struct _AT91S_CM3 {
	AT91_REG	 CM3_CPUID; 	// CPU ID Base Register
	AT91_REG	 CM3_ICSR; 	// Interrupt Control State Register
	AT91_REG	 CM3_VTOR; 	// Vector Table Offset Register
	AT91_REG	 CM3_AIRCR; 	// Application Interrupt and Reset Control Register
	AT91_REG	 CM3_SCR; 	// System Controller Register
	AT91_REG	 CM3_CCR; 	// Configuration Control Register
	AT91_REG	 CM3_SHPR[3]; 	// System Handler Priority Register
	AT91_REG	 CM3_SHCSR; 	// System Handler Control and State Register
} AT91S_CM3, *AT91PS_CM3;
#line 1306 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- CM3_CPUID : (CM3 Offset: 0x0)  -------- 
// -------- CM3_AIRCR : (CM3 Offset: 0xc)  -------- 

// -------- CM3_SCR : (CM3 Offset: 0x10)  -------- 



// -------- CM3_SHCSR : (CM3 Offset: 0x24)  -------- 


// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Peripheral DMA Controller
// *****************************************************************************

typedef struct _AT91S_PDC {
	AT91_REG	 PDC_RPR; 	// Receive Pointer Register
	AT91_REG	 PDC_RCR; 	// Receive Counter Register
	AT91_REG	 PDC_TPR; 	// Transmit Pointer Register
	AT91_REG	 PDC_TCR; 	// Transmit Counter Register
	AT91_REG	 PDC_RNPR; 	// Receive Next Pointer Register
	AT91_REG	 PDC_RNCR; 	// Receive Next Counter Register
	AT91_REG	 PDC_TNPR; 	// Transmit Next Pointer Register
	AT91_REG	 PDC_TNCR; 	// Transmit Next Counter Register
	AT91_REG	 PDC_PTCR; 	// PDC Transfer Control Register
	AT91_REG	 PDC_PTSR; 	// PDC Transfer Status Register
} AT91S_PDC, *AT91PS_PDC;
#line 1345 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PDC_PTCR : (PDC Offset: 0x20) PDC Transfer Control Register -------- 




// -------- PDC_PTSR : (PDC Offset: 0x24) PDC Transfer Status Register -------- 

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Debug Unit
// *****************************************************************************

typedef struct _AT91S_DBGU {
	AT91_REG	 DBGU_CR; 	// Control Register
	AT91_REG	 DBGU_MR; 	// Mode Register
	AT91_REG	 DBGU_IER; 	// Interrupt Enable Register
	AT91_REG	 DBGU_IDR; 	// Interrupt Disable Register
	AT91_REG	 DBGU_IMR; 	// Interrupt Mask Register
	AT91_REG	 DBGU_CSR; 	// Channel Status Register
	AT91_REG	 DBGU_RHR; 	// Receiver Holding Register
	AT91_REG	 DBGU_THR; 	// Transmitter Holding Register
	AT91_REG	 DBGU_BRGR; 	// Baud Rate Generator Register
	AT91_REG	 Reserved0[9]; 	// 
	AT91_REG	 DBGU_FNTR; 	// Force NTRST Register
	AT91_REG	 Reserved1[40]; 	// 
	AT91_REG	 DBGU_ADDRSIZE; 	// DBGU ADDRSIZE REGISTER 
	AT91_REG	 DBGU_IPNAME1; 	// DBGU IPNAME1 REGISTER 
	AT91_REG	 DBGU_IPNAME2; 	// DBGU IPNAME2 REGISTER 
	AT91_REG	 DBGU_FEATURES; 	// DBGU FEATURES REGISTER 
	AT91_REG	 DBGU_VER; 	// DBGU VERSION REGISTER 
	AT91_REG	 DBGU_RPR; 	// Receive Pointer Register
	AT91_REG	 DBGU_RCR; 	// Receive Counter Register
	AT91_REG	 DBGU_TPR; 	// Transmit Pointer Register
	AT91_REG	 DBGU_TCR; 	// Transmit Counter Register
	AT91_REG	 DBGU_RNPR; 	// Receive Next Pointer Register
	AT91_REG	 DBGU_RNCR; 	// Receive Next Counter Register
	AT91_REG	 DBGU_TNPR; 	// Transmit Next Pointer Register
	AT91_REG	 DBGU_TNCR; 	// Transmit Next Counter Register
	AT91_REG	 DBGU_PTCR; 	// PDC Transfer Control Register
	AT91_REG	 DBGU_PTSR; 	// PDC Transfer Status Register
	AT91_REG	 Reserved2[6]; 	// 
	AT91_REG	 DBGU_CIDR; 	// Chip ID Register
	AT91_REG	 DBGU_EXID; 	// Chip ID Extension Register
} AT91S_DBGU, *AT91PS_DBGU;
#line 1408 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- DBGU_CR : (DBGU Offset: 0x0) Debug Unit Control Register -------- 
#line 1416 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- DBGU_MR : (DBGU Offset: 0x4) Debug Unit Mode Register -------- 
#line 1428 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- DBGU_IER : (DBGU Offset: 0x8) Debug Unit Interrupt Enable Register -------- 
#line 1441 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- DBGU_IDR : (DBGU Offset: 0xc) Debug Unit Interrupt Disable Register -------- 
// -------- DBGU_IMR : (DBGU Offset: 0x10) Debug Unit Interrupt Mask Register -------- 
// -------- DBGU_CSR : (DBGU Offset: 0x14) Debug Unit Channel Status Register -------- 
// -------- DBGU_FNTR : (DBGU Offset: 0x48) Debug Unit FORCE_NTRST Register -------- 


// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Parallel Input Output Controler
// *****************************************************************************

typedef struct _AT91S_PIO {
	AT91_REG	 PIO_PER; 	// PIO Enable Register
	AT91_REG	 PIO_PDR; 	// PIO Disable Register
	AT91_REG	 PIO_PSR; 	// PIO Status Register
	AT91_REG	 Reserved0[1]; 	// 
	AT91_REG	 PIO_OER; 	// Output Enable Register
	AT91_REG	 PIO_ODR; 	// Output Disable Registerr
	AT91_REG	 PIO_OSR; 	// Output Status Register
	AT91_REG	 Reserved1[1]; 	// 
	AT91_REG	 PIO_IFER; 	// Input Filter Enable Register
	AT91_REG	 PIO_IFDR; 	// Input Filter Disable Register
	AT91_REG	 PIO_IFSR; 	// Input Filter Status Register
	AT91_REG	 Reserved2[1]; 	// 
	AT91_REG	 PIO_SODR; 	// Set Output Data Register
	AT91_REG	 PIO_CODR; 	// Clear Output Data Register
	AT91_REG	 PIO_ODSR; 	// Output Data Status Register
	AT91_REG	 PIO_PDSR; 	// Pin Data Status Register
	AT91_REG	 PIO_IER; 	// Interrupt Enable Register
	AT91_REG	 PIO_IDR; 	// Interrupt Disable Register
	AT91_REG	 PIO_IMR; 	// Interrupt Mask Register
	AT91_REG	 PIO_ISR; 	// Interrupt Status Register
	AT91_REG	 PIO_MDER; 	// Multi-driver Enable Register
	AT91_REG	 PIO_MDDR; 	// Multi-driver Disable Register
	AT91_REG	 PIO_MDSR; 	// Multi-driver Status Register
	AT91_REG	 Reserved3[1]; 	// 
	AT91_REG	 PIO_PPUDR; 	// Pull-up Disable Register
	AT91_REG	 PIO_PPUER; 	// Pull-up Enable Register
	AT91_REG	 PIO_PPUSR; 	// Pull-up Status Register
	AT91_REG	 Reserved4[1]; 	// 
	AT91_REG	 PIO_ABSR; 	// Peripheral AB Select Register
	AT91_REG	 Reserved5[3]; 	// 
	AT91_REG	 PIO_SCIFSR; 	// System Clock Glitch Input Filter Select Register
	AT91_REG	 PIO_DIFSR; 	// Debouncing Input Filter Select Register
	AT91_REG	 PIO_IFDGSR; 	// Glitch or Debouncing Input Filter Clock Selection Status Register
	AT91_REG	 PIO_SCDR; 	// Slow Clock Divider Debouncing Register
	AT91_REG	 Reserved6[4]; 	// 
	AT91_REG	 PIO_OWER; 	// Output Write Enable Register
	AT91_REG	 PIO_OWDR; 	// Output Write Disable Register
	AT91_REG	 PIO_OWSR; 	// Output Write Status Register
	AT91_REG	 Reserved7[1]; 	// 
	AT91_REG	 PIO_AIMER; 	// Additional Interrupt Modes Enable Register
	AT91_REG	 PIO_AIMDR; 	// Additional Interrupt Modes Disables Register
	AT91_REG	 PIO_AIMMR; 	// Additional Interrupt Modes Mask Register
	AT91_REG	 Reserved8[1]; 	// 
	AT91_REG	 PIO_ESR; 	// Edge Select Register
	AT91_REG	 PIO_LSR; 	// Level Select Register
	AT91_REG	 PIO_ELSR; 	// Edge/Level Status Register
	AT91_REG	 Reserved9[1]; 	// 
	AT91_REG	 PIO_FELLSR; 	// Falling Edge/Low Level Select Register
	AT91_REG	 PIO_REHLSR; 	// Rising Edge/ High Level Select Register
	AT91_REG	 PIO_FRLHSR; 	// Fall/Rise - Low/High Status Register
	AT91_REG	 Reserved10[1]; 	// 
	AT91_REG	 PIO_LOCKSR; 	// Lock Status Register
	AT91_REG	 Reserved11[6]; 	// 
	AT91_REG	 PIO_VER; 	// PIO VERSION REGISTER 
	AT91_REG	 Reserved12[8]; 	// 
	AT91_REG	 PIO_KER; 	// Keypad Controller Enable Register
	AT91_REG	 PIO_KRCR; 	// Keypad Controller Row Column Register
	AT91_REG	 PIO_KDR; 	// Keypad Controller Debouncing Register
	AT91_REG	 Reserved13[1]; 	// 
	AT91_REG	 PIO_KIER; 	// Keypad Controller Interrupt Enable Register
	AT91_REG	 PIO_KIDR; 	// Keypad Controller Interrupt Disable Register
	AT91_REG	 PIO_KIMR; 	// Keypad Controller Interrupt Mask Register
	AT91_REG	 PIO_KSR; 	// Keypad Controller Status Register
	AT91_REG	 PIO_KKPR; 	// Keypad Controller Key Press Register
	AT91_REG	 PIO_KKRR; 	// Keypad Controller Key Release Register
} AT91S_PIO, *AT91PS_PIO;
#line 1572 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PIO_KER : (PIO Offset: 0x120) Keypad Controller Enable Register -------- 

// -------- PIO_KRCR : (PIO Offset: 0x124) Keypad Controller Row Column Register -------- 


// -------- PIO_KDR : (PIO Offset: 0x128) Keypad Controller Debouncing Register -------- 

// -------- PIO_KIER : (PIO Offset: 0x130) Keypad Controller Interrupt Enable Register -------- 


// -------- PIO_KIDR : (PIO Offset: 0x134) Keypad Controller Interrupt Disable Register -------- 
// -------- PIO_KIMR : (PIO Offset: 0x138) Keypad Controller Interrupt Mask Register -------- 
// -------- PIO_KSR : (PIO Offset: 0x13c) Keypad Controller Status Register -------- 


// -------- PIO_KKPR : (PIO Offset: 0x140) Keypad Controller Key Press Register -------- 
#line 1596 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PIO_KKRR : (PIO Offset: 0x144) Keypad Controller Key Release Register -------- 

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Power Management Controler
// *****************************************************************************

typedef struct _AT91S_PMC {
	AT91_REG	 PMC_SCER; 	// System Clock Enable Register
	AT91_REG	 PMC_SCDR; 	// System Clock Disable Register
	AT91_REG	 PMC_SCSR; 	// System Clock Status Register
	AT91_REG	 Reserved0[1]; 	// 
	AT91_REG	 PMC_PCER; 	// Peripheral Clock Enable Register
	AT91_REG	 PMC_PCDR; 	// Peripheral Clock Disable Register
	AT91_REG	 PMC_PCSR; 	// Peripheral Clock Status Register
	AT91_REG	 PMC_UCKR; 	// UTMI Clock Configuration Register
	AT91_REG	 PMC_MOR; 	// Main Oscillator Register
	AT91_REG	 PMC_MCFR; 	// Main Clock  Frequency Register
	AT91_REG	 PMC_PLLAR; 	// PLL Register
	AT91_REG	 Reserved1[1]; 	// 
	AT91_REG	 PMC_MCKR; 	// Master Clock Register
	AT91_REG	 Reserved2[3]; 	// 
	AT91_REG	 PMC_PCKR[8]; 	// Programmable Clock Register
	AT91_REG	 PMC_IER; 	// Interrupt Enable Register
	AT91_REG	 PMC_IDR; 	// Interrupt Disable Register
	AT91_REG	 PMC_SR; 	// Status Register
	AT91_REG	 PMC_IMR; 	// Interrupt Mask Register
	AT91_REG	 PMC_FSMR; 	// Fast Startup Mode Register
	AT91_REG	 PMC_FSPR; 	// Fast Startup Polarity Register
	AT91_REG	 PMC_FOCR; 	// Fault Output Clear Register
	AT91_REG	 Reserved3[28]; 	// 
	AT91_REG	 PMC_ADDRSIZE; 	// PMC ADDRSIZE REGISTER 
	AT91_REG	 PMC_IPNAME1; 	// PMC IPNAME1 REGISTER 
	AT91_REG	 PMC_IPNAME2; 	// PMC IPNAME2 REGISTER 
	AT91_REG	 PMC_FEATURES; 	// PMC FEATURES REGISTER 
	AT91_REG	 PMC_VER; 	// APMC VERSION REGISTER
} AT91S_PMC, *AT91PS_PMC;
#line 1659 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PMC_SCER : (PMC Offset: 0x0) System Clock Enable Register -------- 




// -------- PMC_SCDR : (PMC Offset: 0x4) System Clock Disable Register -------- 
// -------- PMC_SCSR : (PMC Offset: 0x8) System Clock Status Register -------- 
// -------- CKGR_UCKR : (PMC Offset: 0x1c) UTMI Clock Configuration Register -------- 
#line 1675 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- CKGR_MOR : (PMC Offset: 0x20) Main Oscillator Register -------- 
#line 1685 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- CKGR_MCFR : (PMC Offset: 0x24) Main Clock Frequency Register -------- 


// -------- CKGR_PLLAR : (PMC Offset: 0x28) PLL A Register -------- 
#line 1700 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PMC_MCKR : (PMC Offset: 0x30) Master Clock Register -------- 
#line 1716 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PMC_PCKR : (PMC Offset: 0x40) Programmable Clock Register -------- 
// -------- PMC_IER : (PMC Offset: 0x60) PMC Interrupt Enable Register -------- 
#line 1728 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PMC_IDR : (PMC Offset: 0x64) PMC Interrupt Disable Register -------- 
// -------- PMC_SR : (PMC Offset: 0x68) PMC Status Register -------- 



// -------- PMC_IMR : (PMC Offset: 0x6c) PMC Interrupt Mask Register -------- 
// -------- PMC_FSMR : (PMC Offset: 0x70) Fast Startup Mode Register -------- 





// -------- PMC_FSPR : (PMC Offset: 0x74) Fast Startup Polarity Register -------- 

// -------- PMC_FOCR : (PMC Offset: 0x78) Fault Output Clear Register -------- 


// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Clock Generator Controler
// *****************************************************************************

typedef struct _AT91S_CKGR {
	AT91_REG	 CKGR_UCKR; 	// UTMI Clock Configuration Register
	AT91_REG	 CKGR_MOR; 	// Main Oscillator Register
	AT91_REG	 CKGR_MCFR; 	// Main Clock  Frequency Register
	AT91_REG	 CKGR_PLLAR; 	// PLL Register
} AT91S_CKGR, *AT91PS_CKGR;



// -------- CKGR_UCKR : (CKGR Offset: 0x0) UTMI Clock Configuration Register -------- 
// -------- CKGR_MOR : (CKGR Offset: 0x4) Main Oscillator Register -------- 
// -------- CKGR_MCFR : (CKGR Offset: 0x8) Main Clock Frequency Register -------- 
// -------- CKGR_PLLAR : (CKGR Offset: 0xc) PLL A Register -------- 

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Reset Controller Interface
// *****************************************************************************

typedef struct _AT91S_RSTC {
	AT91_REG	 RSTC_RCR; 	// Reset Control Register
	AT91_REG	 RSTC_RSR; 	// Reset Status Register
	AT91_REG	 RSTC_RMR; 	// Reset Mode Register
	AT91_REG	 Reserved0[60]; 	// 
	AT91_REG	 RSTC_VER; 	// Version Register
} AT91S_RSTC, *AT91PS_RSTC;
#line 1781 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- RSTC_RCR : (RSTC Offset: 0x0) Reset Control Register -------- 





// -------- RSTC_RSR : (RSTC Offset: 0x4) Reset Status Register -------- 
#line 1797 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- RSTC_RMR : (RSTC Offset: 0x8) Reset Mode Register -------- 




// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Supply Controller Interface
// *****************************************************************************

typedef struct _AT91S_SUPC {
  AT91_REG SUPC_CR;   // Supply Controller Control Register
  AT91_REG SUPC_SMMR; // Supply Controller Supply Monitor Mode Register
  AT91_REG SUPC_MR;   // Supply Controller Mode Register
  AT91_REG SUPC_WUMR; // Supply Controller Wake Up Mode Register
  AT91_REG SUPC_WUIR; // Supply Controller Wake Up Inputs Register
  AT91_REG SUPC_SR;   // Supply Controller Status Register
} AT91S_SUPC, *AT91PS_SUPC;
#line 1822 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SUPC_CR : (SUPC Offset: 0x00) Supply Controller Control Register --------
#line 1830 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SUPC_SMMR : (SUPC Offset: 0x04) Supply Controller Supply Monitor Mode Register --------
#line 1860 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SUPC_MR : (SUPC Offset: 0x08) Supply Controller Mode Register --------
#line 1874 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SUPC_WUMR : (SUPC Offset: 0x0C) Supply Controller Wake Up Mode Register --------
#line 1901 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SUPC_WUIR : (SUPC Offset: 0x10) Supply Controller Wake Up Inputs Register --------
#line 1998 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SUPC_SR : (SUPC Offset: 0x14) Supply Controller Status Register --------
#line 2074 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Real Time Timer Controller Interface
// *****************************************************************************

typedef struct _AT91S_RTTC {
	AT91_REG	 RTTC_RTMR; 	// Real-time Mode Register
	AT91_REG	 RTTC_RTAR; 	// Real-time Alarm Register
	AT91_REG	 RTTC_RTVR; 	// Real-time Value Register
	AT91_REG	 RTTC_RTSR; 	// Real-time Status Register
} AT91S_RTTC, *AT91PS_RTTC;
#line 2092 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- RTTC_RTMR : (RTTC Offset: 0x0) Real-time Mode Register -------- 




// -------- RTTC_RTAR : (RTTC Offset: 0x4) Real-time Alarm Register -------- 

// -------- RTTC_RTVR : (RTTC Offset: 0x8) Current Real-time Value Register -------- 

// -------- RTTC_RTSR : (RTTC Offset: 0xc) Real-time Status Register -------- 



// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Watchdog Timer Controller Interface
// *****************************************************************************

typedef struct _AT91S_WDTC {
	AT91_REG	 WDTC_WDCR; 	// Watchdog Control Register
	AT91_REG	 WDTC_WDMR; 	// Watchdog Mode Register
	AT91_REG	 WDTC_WDSR; 	// Watchdog Status Register
} AT91S_WDTC, *AT91PS_WDTC;
#line 2120 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- WDTC_WDCR : (WDTC Offset: 0x0) Periodic Interval Image Register -------- 


// -------- WDTC_WDMR : (WDTC Offset: 0x4) Watchdog Mode Register -------- 
#line 2132 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- WDTC_WDSR : (WDTC Offset: 0x8) Watchdog Status Register -------- 



// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Real-time Clock Alarm and Parallel Load Interface
// *****************************************************************************

typedef struct _AT91S_RTC {
	AT91_REG	 RTC_CR; 	// Control Register
	AT91_REG	 RTC_MR; 	// Mode Register
	AT91_REG	 RTC_TIMR; 	// Time Register
	AT91_REG	 RTC_CALR; 	// Calendar Register
	AT91_REG	 RTC_TIMALR; 	// Time Alarm Register
	AT91_REG	 RTC_CALALR; 	// Calendar Alarm Register
	AT91_REG	 RTC_SR; 	// Status Register
	AT91_REG	 RTC_SCCR; 	// Status Clear Command Register
	AT91_REG	 RTC_IER; 	// Interrupt Enable Register
	AT91_REG	 RTC_IDR; 	// Interrupt Disable Register
	AT91_REG	 RTC_IMR; 	// Interrupt Mask Register
	AT91_REG	 RTC_VER; 	// Valid Entry Register
} AT91S_RTC, *AT91PS_RTC;
#line 2169 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- RTC_CR : (RTC Offset: 0x0) RTC Control Register -------- 
#line 2181 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- RTC_MR : (RTC Offset: 0x4) RTC Mode Register -------- 

// -------- RTC_TIMR : (RTC Offset: 0x8) RTC Time Register -------- 




// -------- RTC_CALR : (RTC Offset: 0xc) RTC Calendar Register -------- 





// -------- RTC_TIMALR : (RTC Offset: 0x10) RTC Time Alarm Register -------- 



// -------- RTC_CALALR : (RTC Offset: 0x14) RTC Calendar Alarm Register -------- 


// -------- RTC_SR : (RTC Offset: 0x18) RTC Status Register -------- 





// -------- RTC_SCCR : (RTC Offset: 0x1c) RTC Status Clear Command Register -------- 
// -------- RTC_IER : (RTC Offset: 0x20) RTC Interrupt Enable Register -------- 
// -------- RTC_IDR : (RTC Offset: 0x24) RTC Interrupt Disable Register -------- 
// -------- RTC_IMR : (RTC Offset: 0x28) RTC Interrupt Mask Register -------- 
// -------- RTC_VER : (RTC Offset: 0x2c) RTC Valid Entry Register -------- 





// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Analog to Digital Convertor
// *****************************************************************************

typedef struct _AT91S_ADC {
	AT91_REG	 ADC_CR; 	// ADC Control Register
	AT91_REG	 ADC_MR; 	// ADC Mode Register
	AT91_REG	 Reserved0[2]; 	// 
	AT91_REG	 ADC_CHER; 	// ADC Channel Enable Register
	AT91_REG	 ADC_CHDR; 	// ADC Channel Disable Register
	AT91_REG	 ADC_CHSR; 	// ADC Channel Status Register
	AT91_REG	 ADC_SR; 	// ADC Status Register
	AT91_REG	 ADC_LCDR; 	// ADC Last Converted Data Register
	AT91_REG	 ADC_IER; 	// ADC Interrupt Enable Register
	AT91_REG	 ADC_IDR; 	// ADC Interrupt Disable Register
	AT91_REG	 ADC_IMR; 	// ADC Interrupt Mask Register
	AT91_REG	 ADC_CDR0; 	// ADC Channel Data Register 0
	AT91_REG	 ADC_CDR1; 	// ADC Channel Data Register 1
	AT91_REG	 ADC_CDR2; 	// ADC Channel Data Register 2
	AT91_REG	 ADC_CDR3; 	// ADC Channel Data Register 3
	AT91_REG	 ADC_CDR4; 	// ADC Channel Data Register 4
	AT91_REG	 ADC_CDR5; 	// ADC Channel Data Register 5
	AT91_REG	 ADC_CDR6; 	// ADC Channel Data Register 6
	AT91_REG	 ADC_CDR7; 	// ADC Channel Data Register 7
	AT91_REG	 Reserved1[5]; 	// 
	AT91_REG	 ADC_ACR; 	// Analog Control Register
	AT91_REG	 ADC_EMR; 	// Extended Mode Register
	AT91_REG	 Reserved2[32]; 	// 
	AT91_REG	 ADC_ADDRSIZE; 	// ADC ADDRSIZE REGISTER 
	AT91_REG	 ADC_IPNAME1; 	// ADC IPNAME1 REGISTER 
	AT91_REG	 ADC_IPNAME2; 	// ADC IPNAME2 REGISTER 
	AT91_REG	 ADC_FEATURES; 	// ADC FEATURES REGISTER 
	AT91_REG	 ADC_VER; 	// ADC VERSION REGISTER
	AT91_REG	 ADC_RPR; 	// Receive Pointer Register
	AT91_REG	 ADC_RCR; 	// Receive Counter Register
	AT91_REG	 ADC_TPR; 	// Transmit Pointer Register
	AT91_REG	 ADC_TCR; 	// Transmit Counter Register
	AT91_REG	 ADC_RNPR; 	// Receive Next Pointer Register
	AT91_REG	 ADC_RNCR; 	// Receive Next Counter Register
	AT91_REG	 ADC_TNPR; 	// Transmit Next Pointer Register
	AT91_REG	 ADC_TNCR; 	// Transmit Next Counter Register
	AT91_REG	 ADC_PTCR; 	// PDC Transfer Control Register
	AT91_REG	 ADC_PTSR; 	// PDC Transfer Status Register
} AT91S_ADC, *AT91PS_ADC;
#line 2289 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC_CR : (ADC Offset: 0x0) ADC Control Register -------- 


// -------- ADC_MR : (ADC Offset: 0x4) ADC Mode Register -------- 
#line 2313 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- 	ADC_CHER : (ADC Offset: 0x10) ADC Channel Enable Register -------- 
#line 2322 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- 	ADC_CHDR : (ADC Offset: 0x14) ADC Channel Disable Register -------- 
// -------- 	ADC_CHSR : (ADC Offset: 0x18) ADC Channel Status Register -------- 
// -------- ADC_SR : (ADC Offset: 0x1c) ADC Status Register -------- 
#line 2345 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC_LCDR : (ADC Offset: 0x20) ADC Last Converted Data Register -------- 

// -------- ADC_IER : (ADC Offset: 0x24) ADC Interrupt Enable Register -------- 
// -------- ADC_IDR : (ADC Offset: 0x28) ADC Interrupt Disable Register -------- 
// -------- ADC_IMR : (ADC Offset: 0x2c) ADC Interrupt Mask Register -------- 
// -------- ADC_CDR0 : (ADC Offset: 0x30) ADC Channel Data Register 0 -------- 

// -------- ADC_CDR1 : (ADC Offset: 0x34) ADC Channel Data Register 1 -------- 
// -------- ADC_CDR2 : (ADC Offset: 0x38) ADC Channel Data Register 2 -------- 
// -------- ADC_CDR3 : (ADC Offset: 0x3c) ADC Channel Data Register 3 -------- 
// -------- ADC_CDR4 : (ADC Offset: 0x40) ADC Channel Data Register 4 -------- 
// -------- ADC_CDR5 : (ADC Offset: 0x44) ADC Channel Data Register 5 -------- 
// -------- ADC_CDR6 : (ADC Offset: 0x48) ADC Channel Data Register 6 -------- 
// -------- ADC_CDR7 : (ADC Offset: 0x4c) ADC Channel Data Register 7 -------- 
// -------- ADC_ACR : (ADC Offset: 0x64) ADC Analog Controler Register -------- 
#line 2368 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC_EMR : (ADC Offset: 0x68) ADC Extended Mode Register -------- 


// -------- ADC_VER : (ADC Offset: 0xfc) ADC VER -------- 


// *****************************************************************************
//   SOFTWARE API DEFINITION FOR Analog-to Digital Converter
// *****************************************************************************


typedef struct _AT91S_ADC12B {
  AT91_REG ADC12B_CR;     // Control Register
  AT91_REG ADC12B_MR;     // Mode Register
  AT91_REG Reserved1[2]; 
  AT91_REG ADC12B_CHER;   // Channel Enable Register
  AT91_REG ADC12B_CHDR;   // Channel Disable Register
  AT91_REG ADC12B_CHSR;   // Channel Status Register
  AT91_REG ADC12B_SR;     // Status Register
  AT91_REG ADC12B_LCDR;   // Last Converted Data Register
  AT91_REG ADC12B_IER;    // Interrupt Enable Register
  AT91_REG ADC12B_IDR;    // Interrupt Disable Register
  AT91_REG ADC12B_IMR;    // Interrupt Mask Register
  AT91_REG ADC12B_CDR[8]; // Channel Data Register
  AT91_REG Reserved2[5]; 
  AT91_REG ADC12B_ACR;    // Analog Control Register
  AT91_REG ADC12B_EMR;    // Extended Mode Register
} AT91S_ADC12B, *AT91PS_ADC12B;
#line 2411 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_CR : (ADC12B Offset: 0x00) Control Register --------
#line 2418 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_MR : (ADC12B Offset: 0x04) Mode Register --------
#line 2438 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_CHER : (ADC12B Offset: 0x10) Channel Enable Register --------
#line 2463 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_CHDR : (ADC12B Offset: 0x14) Channel Disable Register --------
#line 2488 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_CHSR : (ADC12B Offset: 0x18) Channel Status Register --------
#line 2513 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_SR : (ADC12B Offset: 0x1C) Status Register --------
#line 2574 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_LCDR : (ADC12B Offset: 0x20) Last Converted Data Register --------

// -------- ADC12B_IER : (ADC12B Offset: 0x24) Interrupt Enable Register --------
#line 2637 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_IDR : (ADC12B Offset: 0x28) Interrupt Disable Register --------
#line 2698 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_IMR : (ADC12B Offset: 0x2C) Interrupt Mask Register --------
#line 2759 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_CDR[8] : (ADC12B Offset: 0x30) Channel Data Register --------

// -------- ADC12B_ACR : (ADC12B Offset: 0x64) Analog Control Register --------
#line 2772 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- ADC12B_EMR : (ADC12B Offset: 0x68) Extended Mode Register --------





// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Timer Counter Channel Interface
// *****************************************************************************

typedef struct _AT91S_TC {
	AT91_REG	 TC_CCR; 	// Channel Control Register
	AT91_REG	 TC_CMR; 	// Channel Mode Register (Capture Mode / Waveform Mode)
	AT91_REG	 Reserved0[2]; 	// 
	AT91_REG	 TC_CV; 	// Counter Value
	AT91_REG	 TC_RA; 	// Register A
	AT91_REG	 TC_RB; 	// Register B
	AT91_REG	 TC_RC; 	// Register C
	AT91_REG	 TC_SR; 	// Status Register
	AT91_REG	 TC_IER; 	// Interrupt Enable Register
	AT91_REG	 TC_IDR; 	// Interrupt Disable Register
	AT91_REG	 TC_IMR; 	// Interrupt Mask Register
} AT91S_TC, *AT91PS_TC;
#line 2808 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- TC_CCR : (TC Offset: 0x0) TC Channel Control Register -------- 



// -------- TC_CMR : (TC Offset: 0x4) TC Channel Mode Register: Capture Mode / Waveform Mode -------- 
#line 2906 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- TC_SR : (TC Offset: 0x20) TC Channel Status Register -------- 
#line 2918 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- TC_IER : (TC Offset: 0x24) TC Channel Interrupt Enable Register -------- 
// -------- TC_IDR : (TC Offset: 0x28) TC Channel Interrupt Disable Register -------- 
// -------- TC_IMR : (TC Offset: 0x2c) TC Channel Interrupt Mask Register -------- 

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Timer Counter Interface
// *****************************************************************************

typedef struct _AT91S_TCB {
	AT91S_TC	 TCB_TC0; 	// TC Channel 0
	AT91_REG	 Reserved0[4]; 	// 
	AT91S_TC	 TCB_TC1; 	// TC Channel 1
	AT91_REG	 Reserved1[4]; 	// 
	AT91S_TC	 TCB_TC2; 	// TC Channel 2
	AT91_REG	 Reserved2[4]; 	// 
	AT91_REG	 TCB_BCR; 	// TC Block Control Register
	AT91_REG	 TCB_BMR; 	// TC Block Mode Register
	AT91_REG	 Reserved3[9]; 	// 
	AT91_REG	 TCB_ADDRSIZE; 	// TC ADDRSIZE REGISTER 
	AT91_REG	 TCB_IPNAME1; 	// TC IPNAME1 REGISTER 
	AT91_REG	 TCB_IPNAME2; 	// TC IPNAME2 REGISTER 
	AT91_REG	 TCB_FEATURES; 	// TC FEATURES REGISTER 
	AT91_REG	 TCB_VER; 	//  Version Register
} AT91S_TCB, *AT91PS_TCB;
#line 2952 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- TCB_BCR : (TCB Offset: 0xc0) TC Block Control Register -------- 

// -------- TCB_BMR : (TCB Offset: 0xc4) TC Block Mode Register -------- 
#line 2970 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Embedded Flash Controller 2.0
// *****************************************************************************

typedef struct _AT91S_EFC {
	AT91_REG	 EFC_FMR; 	// EFC Flash Mode Register
	AT91_REG	 EFC_FCR; 	// EFC Flash Command Register
	AT91_REG	 EFC_FSR; 	// EFC Flash Status Register
	AT91_REG	 EFC_FRR; 	// EFC Flash Result Register
	AT91_REG	 Reserved0[1]; 	// 
	AT91_REG	 EFC_FVR; 	// EFC Flash Version Register
} AT91S_EFC, *AT91PS_EFC;
#line 2991 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- EFC_FMR : (EFC Offset: 0x0) EFC Flash Mode Register -------- 
#line 2998 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- EFC_FCR : (EFC Offset: 0x4) EFC Flash Command Register -------- 
#line 3018 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- EFC_FSR : (EFC Offset: 0x8) EFC Flash Status Register -------- 



// -------- EFC_FRR : (EFC Offset: 0xc) EFC Flash Result Register -------- 


// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Multimedia Card Interface
// *****************************************************************************

typedef struct _AT91S_MCI {
	AT91_REG	 MCI_CR; 	// MCI Control Register
	AT91_REG	 MCI_MR; 	// MCI Mode Register
	AT91_REG	 MCI_DTOR; 	// MCI Data Timeout Register
	AT91_REG	 MCI_SDCR; 	// MCI SD/SDIO Card Register
	AT91_REG	 MCI_ARGR; 	// MCI Argument Register
	AT91_REG	 MCI_CMDR; 	// MCI Command Register
	AT91_REG	 MCI_BLKR; 	// MCI Block Register
	AT91_REG	 MCI_CSTOR; 	// MCI Completion Signal Timeout Register
	AT91_REG	 MCI_RSPR[4]; 	// MCI Response Register
	AT91_REG	 MCI_RDR; 	// MCI Receive Data Register
	AT91_REG	 MCI_TDR; 	// MCI Transmit Data Register
	AT91_REG	 Reserved0[2]; 	// 
	AT91_REG	 MCI_SR; 	// MCI Status Register
	AT91_REG	 MCI_IER; 	// MCI Interrupt Enable Register
	AT91_REG	 MCI_IDR; 	// MCI Interrupt Disable Register
	AT91_REG	 MCI_IMR; 	// MCI Interrupt Mask Register
	AT91_REG	 MCI_DMA; 	// MCI DMA Configuration Register
	AT91_REG	 MCI_CFG; 	// MCI Configuration Register
	AT91_REG	 Reserved1[35]; 	// 
	AT91_REG	 MCI_WPCR; 	// MCI Write Protection Control Register
	AT91_REG	 MCI_WPSR; 	// MCI Write Protection Status Register
	AT91_REG	 MCI_ADDRSIZE; 	// MCI ADDRSIZE REGISTER 
	AT91_REG	 MCI_IPNAME1; 	// MCI IPNAME1 REGISTER 
	AT91_REG	 MCI_IPNAME2; 	// MCI IPNAME2 REGISTER 
	AT91_REG	 MCI_FEATURES; 	// MCI FEATURES REGISTER 
	AT91_REG	 MCI_VER; 	// MCI VERSION REGISTER 
	AT91_REG	 MCI_RPR; 	// Receive Pointer Register
	AT91_REG	 MCI_RCR; 	// Receive Counter Register
	AT91_REG	 MCI_TPR; 	// Transmit Pointer Register
	AT91_REG	 MCI_TCR; 	// Transmit Counter Register
	AT91_REG	 MCI_RNPR; 	// Receive Next Pointer Register
	AT91_REG	 MCI_RNCR; 	// Receive Next Counter Register
	AT91_REG	 MCI_TNPR; 	// Transmit Next Pointer Register
	AT91_REG	 MCI_TNCR; 	// Transmit Next Counter Register
	AT91_REG	 MCI_PTCR; 	// PDC Transfer Control Register
	AT91_REG	 MCI_PTSR; 	// PDC Transfer Status Register
	AT91_REG	 Reserved2[54]; 	// 
	AT91_REG	 MCI_FIFO; 	// MCI FIFO Aperture Register
} AT91S_MCI, *AT91PS_MCI;
#line 3097 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_CR : (MCI Offset: 0x0) MCI Control Register -------- 
#line 3119 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_MR : (MCI Offset: 0x4) MCI Mode Register -------- 
#line 3136 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_DTOR : (MCI Offset: 0x8) MCI Data Timeout Register -------- 
#line 3147 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_SDCR : (MCI Offset: 0xc) MCI SD Card Register -------- 
#line 3157 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_CMDR : (MCI Offset: 0x14) MCI Command Register -------- 
#line 3197 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_BLKR : (MCI Offset: 0x18) MCI Block Register -------- 

// -------- MCI_CSTOR : (MCI Offset: 0x1c) MCI Completion Signal Timeout Register -------- 
#line 3210 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_SR : (MCI Offset: 0x40) MCI Status Register -------- 
#line 3241 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_IER : (MCI Offset: 0x44) MCI Interrupt Enable Register -------- 
// -------- MCI_IDR : (MCI Offset: 0x48) MCI Interrupt Disable Register -------- 
// -------- MCI_IMR : (MCI Offset: 0x4c) MCI Interrupt Mask Register -------- 
// -------- MCI_DMA : (MCI Offset: 0x50) MCI DMA Configuration Register -------- 
#line 3255 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_CFG : (MCI Offset: 0x54) MCI Configuration Register -------- 
#line 3268 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_WPCR : (MCI Offset: 0xe4) Write Protection Control Register -------- 




// -------- MCI_WPSR : (MCI Offset: 0xe8) Write Protection Status Register -------- 
#line 3288 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- MCI_VER : (MCI Offset: 0xfc)  VERSION  Register -------- 


// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Two-wire Interface
// *****************************************************************************

typedef struct _AT91S_TWI {
	AT91_REG	 TWI_CR; 	// Control Register
	AT91_REG	 TWI_MMR; 	// Master Mode Register
	AT91_REG	 TWI_SMR; 	// Slave Mode Register
	AT91_REG	 TWI_IADR; 	// Internal Address Register
	AT91_REG	 TWI_CWGR; 	// Clock Waveform Generator Register
	AT91_REG	 Reserved0[3]; 	// 
	AT91_REG	 TWI_SR; 	// Status Register
	AT91_REG	 TWI_IER; 	// Interrupt Enable Register
	AT91_REG	 TWI_IDR; 	// Interrupt Disable Register
	AT91_REG	 TWI_IMR; 	// Interrupt Mask Register
	AT91_REG	 TWI_RHR; 	// Receive Holding Register
	AT91_REG	 TWI_THR; 	// Transmit Holding Register
	AT91_REG	 Reserved1[45]; 	// 
	AT91_REG	 TWI_ADDRSIZE; 	// TWI ADDRSIZE REGISTER 
	AT91_REG	 TWI_IPNAME1; 	// TWI IPNAME1 REGISTER 
	AT91_REG	 TWI_IPNAME2; 	// TWI IPNAME2 REGISTER 
	AT91_REG	 TWI_FEATURES; 	// TWI FEATURES REGISTER 
	AT91_REG	 TWI_VER; 	// Version Register
	AT91_REG	 TWI_RPR; 	// Receive Pointer Register
	AT91_REG	 TWI_RCR; 	// Receive Counter Register
	AT91_REG	 TWI_TPR; 	// Transmit Pointer Register
	AT91_REG	 TWI_TCR; 	// Transmit Counter Register
	AT91_REG	 TWI_RNPR; 	// Receive Next Pointer Register
	AT91_REG	 TWI_RNCR; 	// Receive Next Counter Register
	AT91_REG	 TWI_TNPR; 	// Transmit Next Pointer Register
	AT91_REG	 TWI_TNCR; 	// Transmit Next Counter Register
	AT91_REG	 TWI_PTCR; 	// PDC Transfer Control Register
	AT91_REG	 TWI_PTSR; 	// PDC Transfer Status Register
} AT91S_TWI, *AT91PS_TWI;
#line 3344 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- TWI_CR : (TWI Offset: 0x0) TWI Control Register -------- 
#line 3352 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- TWI_MMR : (TWI Offset: 0x4) TWI Master Mode Register -------- 
#line 3360 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- TWI_SMR : (TWI Offset: 0x8) TWI Slave Mode Register -------- 

// -------- TWI_CWGR : (TWI Offset: 0x10) TWI Clock Waveform Generator Register -------- 



// -------- TWI_SR : (TWI Offset: 0x20) TWI Status Register -------- 
#line 3385 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- TWI_IER : (TWI Offset: 0x24) TWI Interrupt Enable Register -------- 
// -------- TWI_IDR : (TWI Offset: 0x28) TWI Interrupt Disable Register -------- 
// -------- TWI_IMR : (TWI Offset: 0x2c) TWI Interrupt Mask Register -------- 

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Usart
// *****************************************************************************



typedef struct _AT91S_USART {
	AT91_REG	 US_CR; 	// Control Register
	AT91_REG	 US_MR; 	// Mode Register
	AT91_REG	 US_IER; 	// Interrupt Enable Register
	AT91_REG	 US_IDR; 	// Interrupt Disable Register
	AT91_REG	 US_IMR; 	// Interrupt Mask Register
	AT91_REG	 US_CSR; 	// Channel Status Register
	AT91_REG	 US_RHR; 	// Receiver Holding Register
	AT91_REG	 US_THR; 	// Transmitter Holding Register
	AT91_REG	 US_BRGR; 	// Baud Rate Generator Register
	AT91_REG	 US_RTOR; 	// Receiver Time-out Register
	AT91_REG	 US_TTGR; 	// Transmitter Time-guard Register
	AT91_REG	 Reserved0[5]; 	// 
	AT91_REG	 US_FIDI; 	// FI_DI_Ratio Register
	AT91_REG	 US_NER; 	// Nb Errors Register
	AT91_REG	 Reserved1[1]; 	// 
	AT91_REG	 US_IF; 	// IRDA_FILTER Register
	AT91_REG	 US_MAN; 	// Manchester Encoder Decoder Register
	AT91_REG	 Reserved2[38]; 	// 
	AT91_REG	 US_ADDRSIZE; 	// US ADDRSIZE REGISTER 
	AT91_REG	 US_IPNAME1; 	// US IPNAME1 REGISTER 
	AT91_REG	 US_IPNAME2; 	// US IPNAME2 REGISTER 
	AT91_REG	 US_FEATURES; 	// US FEATURES REGISTER 
	AT91_REG	 US_VER; 	// VERSION Register
	AT91_REG	 US_RPR; 	// Receive Pointer Register
	AT91_REG	 US_RCR; 	// Receive Counter Register
	AT91_REG	 US_TPR; 	// Transmit Pointer Register
	AT91_REG	 US_TCR; 	// Transmit Counter Register
	AT91_REG	 US_RNPR; 	// Receive Next Pointer Register
	AT91_REG	 US_RNCR; 	// Receive Next Counter Register
	AT91_REG	 US_TNPR; 	// Transmit Next Pointer Register
	AT91_REG	 US_TNCR; 	// Transmit Next Counter Register
	AT91_REG	 US_PTCR; 	// PDC Transfer Control Register
	AT91_REG	 US_PTSR; 	// PDC Transfer Status Register
} AT91S_USART, *AT91PS_USART;
#line 3453 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- US_CR : (USART Offset: 0x0)  Control Register -------- 
#line 3472 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- US_MR : (USART Offset: 0x4)  Mode Register -------- 
#line 3522 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- US_IER : (USART Offset: 0x8)  Interrupt Enable Register -------- 
#line 3542 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- US_IDR : (USART Offset: 0xc)  Interrupt Disable Register -------- 
// -------- US_IMR : (USART Offset: 0x10)  Interrupt Mask Register -------- 
// -------- US_CSR : (USART Offset: 0x14)  Channel Status Register -------- 





// -------- US_MAN : (USART Offset: 0x50) Manchester Encoder Decoder Register -------- 
#line 3566 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Synchronous Serial Controller Interface
// *****************************************************************************

typedef struct _AT91S_SSC {
	AT91_REG	 SSC_CR; 	// Control Register
	AT91_REG	 SSC_CMR; 	// Clock Mode Register
	AT91_REG	 Reserved0[2]; 	// 
	AT91_REG	 SSC_RCMR; 	// Receive Clock ModeRegister
	AT91_REG	 SSC_RFMR; 	// Receive Frame Mode Register
	AT91_REG	 SSC_TCMR; 	// Transmit Clock Mode Register
	AT91_REG	 SSC_TFMR; 	// Transmit Frame Mode Register
	AT91_REG	 SSC_RHR; 	// Receive Holding Register
	AT91_REG	 SSC_THR; 	// Transmit Holding Register
	AT91_REG	 Reserved1[2]; 	// 
	AT91_REG	 SSC_RSHR; 	// Receive Sync Holding Register
	AT91_REG	 SSC_TSHR; 	// Transmit Sync Holding Register
	AT91_REG	 SSC_RC0R; 	// Receive Compare 0 Register
	AT91_REG	 SSC_RC1R; 	// Receive Compare 1 Register
	AT91_REG	 SSC_SR; 	// Status Register
	AT91_REG	 SSC_IER; 	// Interrupt Enable Register
	AT91_REG	 SSC_IDR; 	// Interrupt Disable Register
	AT91_REG	 SSC_IMR; 	// Interrupt Mask Register
} AT91S_SSC, *AT91PS_SSC;
#line 3610 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SSC_CR : (SSC Offset: 0x0) SSC Control Register -------- 





// -------- SSC_RCMR : (SSC Offset: 0x10) SSC Receive Clock Mode Register -------- 
#line 3644 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SSC_RFMR : (SSC Offset: 0x14) SSC Receive Frame Mode Register -------- 
#line 3658 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SSC_TCMR : (SSC Offset: 0x18) SSC Transmit Clock Mode Register -------- 
// -------- SSC_TFMR : (SSC Offset: 0x1c) SSC Transmit Frame Mode Register -------- 


// -------- SSC_SR : (SSC Offset: 0x40) SSC Status Register -------- 
#line 3677 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SSC_IER : (SSC Offset: 0x44) SSC Interrupt Enable Register -------- 
// -------- SSC_IDR : (SSC Offset: 0x48) SSC Interrupt Disable Register -------- 
// -------- SSC_IMR : (SSC Offset: 0x4c) SSC Interrupt Mask Register -------- 

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR PWMC Channel Interface
// *****************************************************************************

typedef struct _AT91S_PWMC_CH {
	AT91_REG	 PWMC_CMR; 	// Channel Mode Register
	AT91_REG	 PWMC_CDTYR; 	// Channel Duty Cycle Register
	AT91_REG	 PWMC_CDTYUPDR; 	// Channel Duty Cycle Update Register
	AT91_REG	 PWMC_CPRDR; 	// Channel Period Register
	AT91_REG	 PWMC_CPRDUPDR; 	// Channel Period Update Register
	AT91_REG	 PWMC_CCNTR; 	// Channel Counter Register
	AT91_REG	 PWMC_DTR; 	// Channel Dead Time Value Register
	AT91_REG	 PWMC_DTUPDR; 	// Channel Dead Time Update Value Register
} AT91S_PWMC_CH, *AT91PS_PWMC_CH;
#line 3706 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_CMR : (PWMC_CH Offset: 0x0) PWMC Channel Mode Register -------- 
#line 3727 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_CDTYR : (PWMC_CH Offset: 0x4) PWMC Channel Duty Cycle Register -------- 

// -------- PWMC_CDTYUPDR : (PWMC_CH Offset: 0x8) PWMC Channel Duty Cycle Update Register -------- 

// -------- PWMC_CPRDR : (PWMC_CH Offset: 0xc) PWMC Channel Period Register -------- 

// -------- PWMC_CPRDUPDR : (PWMC_CH Offset: 0x10) PWMC Channel Period Update Register -------- 

// -------- PWMC_CCNTR : (PWMC_CH Offset: 0x14) PWMC Channel Counter Register -------- 

// -------- PWMC_DTR : (PWMC_CH Offset: 0x18) Channel Dead Time Value Register -------- 


// -------- PWMC_DTUPDR : (PWMC_CH Offset: 0x1c) Channel Dead Time Value Register -------- 



// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Pulse Width Modulation Controller Interface
// *****************************************************************************

typedef struct _AT91S_PWMC {
	AT91_REG	 PWMC_CLK; 	// PWMC Mode Register
	AT91_REG	 PWMC_ENA; 	// PWMC Enable Register
	AT91_REG	 PWMC_DIS; 	// PWMC Disable Register
	AT91_REG	 PWMC_SR; 	// PWMC Status Register
	AT91_REG	 PWMC_IER1; 	// PWMC Interrupt Enable Register 1
	AT91_REG	 PWMC_IDR1; 	// PWMC Interrupt Disable Register 1
	AT91_REG	 PWMC_IMR1; 	// PWMC Interrupt Mask Register 1
	AT91_REG	 PWMC_ISR1; 	// PWMC Interrupt Status Register 1
	AT91_REG	 PWMC_SCM;  	// PWM Synchronized Channels Register
	AT91_REG	 Reserved0[1]; 	// 
	AT91_REG	 PWMC_UPCR; 	// PWM Update Control Register
	AT91_REG	 PWMC_SCUP; 	// PWM Update Period Register
	AT91_REG	 PWMC_SCUPUPD; 	// PWM Update Period Update Register
	AT91_REG	 PWMC_IER2; 	// PWMC Interrupt Enable Register 2
	AT91_REG	 PWMC_IDR2; 	// PWMC Interrupt Disable Register 2
	AT91_REG	 PWMC_IMR2; 	// PWMC Interrupt Mask Register 2
	AT91_REG	 PWMC_ISR2; 	// PWMC Interrupt Status Register 2
	AT91_REG	 PWMC_OOV; 	// PWM Output Override Value Register
	AT91_REG	 PWMC_OS; 	// PWM Output Selection Register
	AT91_REG	 PWMC_OSS; 	// PWM Output Selection Set Register
	AT91_REG	 PWMC_OSC; 	// PWM Output Selection Clear Register
	AT91_REG	 PWMC_OSSUPD; 	// PWM Output Selection Set Update Register
	AT91_REG	 PWMC_OSCUPD; 	// PWM Output Selection Clear Update Register
	AT91_REG	 PWMC_FMR; 	// PWM Fault Mode Register
	AT91_REG	 PWMC_FSR; 	// PWM Fault Mode Status Register
	AT91_REG	 PWMC_FCR; 	// PWM Fault Mode Clear Register
	AT91_REG	 PWMC_FPV; 	// PWM Fault Protection Value Register
	AT91_REG	 PWMC_FPER1; 	// PWM Fault Protection Enable Register 1
	AT91_REG	 PWMC_FPER2; 	// PWM Fault Protection Enable Register 2
	AT91_REG	 PWMC_FPER3; 	// PWM Fault Protection Enable Register 3
	AT91_REG	 PWMC_FPER4; 	// PWM Fault Protection Enable Register 4
	AT91_REG	 PWMC_EL0MR; 	// PWM Event Line 0 Mode Register
	AT91_REG	 PWMC_EL1MR; 	// PWM Event Line 1 Mode Register
	AT91_REG	 PWMC_EL2MR; 	// PWM Event Line 2 Mode Register
	AT91_REG	 PWMC_EL3MR; 	// PWM Event Line 3 Mode Register
	AT91_REG	 PWMC_EL4MR; 	// PWM Event Line 4 Mode Register
	AT91_REG	 PWMC_EL5MR; 	// PWM Event Line 5 Mode Register
	AT91_REG	 PWMC_EL6MR; 	// PWM Event Line 6 Mode Register
	AT91_REG	 PWMC_EL7MR; 	// PWM Event Line 7 Mode Register
	AT91_REG	 Reserved1[18]; 	// 
	AT91_REG	 PWMC_WPCR; 	// PWM Write Protection Enable Register
	AT91_REG	 PWMC_WPSR; 	// PWM Write Protection Status Register
	AT91_REG	 PWMC_ADDRSIZE; 	// PWMC ADDRSIZE REGISTER 
	AT91_REG	 PWMC_IPNAME1; 	// PWMC IPNAME1 REGISTER 
	AT91_REG	 PWMC_IPNAME2; 	// PWMC IPNAME2 REGISTER 
	AT91_REG	 PWMC_FEATURES; 	// PWMC FEATURES REGISTER 
	AT91_REG	 PWMC_VER; 	// PWMC Version Register
	AT91_REG	 PWMC_RPR; 	// Receive Pointer Register
	AT91_REG	 PWMC_RCR; 	// Receive Counter Register
	AT91_REG	 PWMC_TPR; 	// Transmit Pointer Register
	AT91_REG	 PWMC_TCR; 	// Transmit Counter Register
	AT91_REG	 PWMC_RNPR; 	// Receive Next Pointer Register
	AT91_REG	 PWMC_RNCR; 	// Receive Next Counter Register
	AT91_REG	 PWMC_TNPR; 	// Transmit Next Pointer Register
	AT91_REG	 PWMC_TNCR; 	// Transmit Next Counter Register
	AT91_REG	 PWMC_PTCR; 	// PDC Transfer Control Register
	AT91_REG	 PWMC_PTSR; 	// PDC Transfer Status Register
	AT91_REG	 Reserved2[2]; 	// 
	AT91_REG	 PWMC_CMP0V; 	// PWM Comparison Value 0 Register
	AT91_REG	 PWMC_CMP0VUPD; 	// PWM Comparison Value 0 Update Register
	AT91_REG	 PWMC_CMP0M; 	// PWM Comparison Mode 0 Register
	AT91_REG	 PWMC_CMP0MUPD; 	// PWM Comparison Mode 0 Update Register
	AT91_REG	 PWMC_CMP1V; 	// PWM Comparison Value 1 Register
	AT91_REG	 PWMC_CMP1VUPD; 	// PWM Comparison Value 1 Update Register
	AT91_REG	 PWMC_CMP1M; 	// PWM Comparison Mode 1 Register
	AT91_REG	 PWMC_CMP1MUPD; 	// PWM Comparison Mode 1 Update Register
	AT91_REG	 PWMC_CMP2V; 	// PWM Comparison Value 2 Register
	AT91_REG	 PWMC_CMP2VUPD; 	// PWM Comparison Value 2 Update Register
	AT91_REG	 PWMC_CMP2M; 	// PWM Comparison Mode 2 Register
	AT91_REG	 PWMC_CMP2MUPD; 	// PWM Comparison Mode 2 Update Register
	AT91_REG	 PWMC_CMP3V; 	// PWM Comparison Value 3 Register
	AT91_REG	 PWMC_CMP3VUPD; 	// PWM Comparison Value 3 Update Register
	AT91_REG	 PWMC_CMP3M; 	// PWM Comparison Mode 3 Register
	AT91_REG	 PWMC_CMP3MUPD; 	// PWM Comparison Mode 3 Update Register
	AT91_REG	 PWMC_CMP4V; 	// PWM Comparison Value 4 Register
	AT91_REG	 PWMC_CMP4VUPD; 	// PWM Comparison Value 4 Update Register
	AT91_REG	 PWMC_CMP4M; 	// PWM Comparison Mode 4 Register
	AT91_REG	 PWMC_CMP4MUPD; 	// PWM Comparison Mode 4 Update Register
	AT91_REG	 PWMC_CMP5V; 	// PWM Comparison Value 5 Register
	AT91_REG	 PWMC_CMP5VUPD; 	// PWM Comparison Value 5 Update Register
	AT91_REG	 PWMC_CMP5M; 	// PWM Comparison Mode 5 Register
	AT91_REG	 PWMC_CMP5MUPD; 	// PWM Comparison Mode 5 Update Register
	AT91_REG	 PWMC_CMP6V; 	// PWM Comparison Value 6 Register
	AT91_REG	 PWMC_CMP6VUPD; 	// PWM Comparison Value 6 Update Register
	AT91_REG	 PWMC_CMP6M; 	// PWM Comparison Mode 6 Register
	AT91_REG	 PWMC_CMP6MUPD; 	// PWM Comparison Mode 6 Update Register
	AT91_REG	 PWMC_CMP7V; 	// PWM Comparison Value 7 Register
	AT91_REG	 PWMC_CMP7VUPD; 	// PWM Comparison Value 7 Update Register
	AT91_REG	 PWMC_CMP7M; 	// PWM Comparison Mode 7 Register
	AT91_REG	 PWMC_CMP7MUPD; 	// PWM Comparison Mode 7 Update Register
	AT91_REG	 Reserved3[20]; 	// 
	AT91S_PWMC_CH	 PWMC_CH[8]; 	// PWMC Channel 0
} AT91S_PWMC, *AT91PS_PWMC;
#line 3922 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_MR : (PWMC Offset: 0x0) PWMC Mode Register -------- 
#line 3946 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_ENA : (PWMC Offset: 0x4) PWMC Enable Register -------- 
#line 3963 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_DIS : (PWMC Offset: 0x8) PWMC Disable Register -------- 
// -------- PWMC_SR : (PWMC Offset: 0xc) PWMC Status Register -------- 
// -------- PWMC_IER1 : (PWMC Offset: 0x10) PWMC Interrupt Enable Register -------- 
#line 3982 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_IDR1 : (PWMC Offset: 0x14) PWMC Interrupt Disable Register -------- 
// -------- PWMC_IMR1 : (PWMC Offset: 0x18) PWMC Interrupt Mask Register -------- 
// -------- PWMC_ISR1 : (PWMC Offset: 0x1c) PWMC Interrupt Status Register -------- 
// -------- PWMC_SYNC : (PWMC Offset: 0x20) PWMC Synchronous Channels Register -------- 
#line 4006 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_UPCR : (PWMC Offset: 0x28) PWMC Update Control Register -------- 

// -------- PWMC_SCUP : (PWMC Offset: 0x2c) PWM Update Period Register -------- 


// -------- PWMC_SCUPUPD : (PWMC Offset: 0x30) PWM Update Period Update Register -------- 

// -------- PWMC_IER2 : (PWMC Offset: 0x34) PWMC Interrupt Enable Register -------- 




// -------- PWMC_IDR2 : (PWMC Offset: 0x38) PWMC Interrupt Disable Register -------- 
// -------- PWMC_IMR2 : (PWMC Offset: 0x3c) PWMC Interrupt Mask Register -------- 
// -------- PWMC_ISR2 : (PWMC Offset: 0x40) PWMC Interrupt Status Register -------- 
#line 4037 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_OOV : (PWMC Offset: 0x44) PWM Output Override Value Register -------- 
#line 4070 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_OS : (PWMC Offset: 0x48) PWM Output Selection Register -------- 
#line 4103 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_OSS : (PWMC Offset: 0x4c) PWM Output Selection Set Register -------- 
#line 4136 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_OSC : (PWMC Offset: 0x50) PWM Output Selection Clear Register -------- 
#line 4169 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_OSSUPD : (PWMC Offset: 0x54) Output Selection Set for PWMH / PWML output of the channel x -------- 
#line 4202 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_OSCUPD : (PWMC Offset: 0x58) Output Selection Clear for PWMH / PWML output of the channel x -------- 
#line 4235 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_FMR : (PWMC Offset: 0x5c) PWM Fault Mode Register -------- 
#line 4260 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_FSR : (PWMC Offset: 0x60) Fault Input x Value -------- 
#line 4277 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_FCR : (PWMC Offset: 0x64) Fault y Clear -------- 
#line 4286 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_FPV : (PWMC Offset: 0x68) PWM Fault Protection Value -------- 
#line 4303 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_FPER1 : (PWMC Offset: 0x6c) PWM Fault Protection Enable Register 1 -------- 




// -------- PWMC_FPER2 : (PWMC Offset: 0x70) PWM Fault Protection Enable Register 2 -------- 




// -------- PWMC_FPER3 : (PWMC Offset: 0x74) PWM Fault Protection Enable Register 3 -------- 




// -------- PWMC_FPER4 : (PWMC Offset: 0x78) PWM Fault Protection Enable Register 4 -------- 




// -------- PWMC_EL0MR : (PWMC Offset: 0x7c) PWM Event Line 0 Mode Register -------- 
#line 4332 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_EL1MR : (PWMC Offset: 0x80) PWM Event Line 1 Mode Register -------- 
#line 4341 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_EL2MR : (PWMC Offset: 0x84) PWM Event line 2 Mode Register -------- 
#line 4350 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_EL3MR : (PWMC Offset: 0x88) PWM Event line 3 Mode Register -------- 
#line 4359 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_EL4MR : (PWMC Offset: 0x8c) PWM Event line 4 Mode Register -------- 
#line 4368 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_EL5MR : (PWMC Offset: 0x90) PWM Event line 5 Mode Register -------- 
#line 4377 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_EL6MR : (PWMC Offset: 0x94) PWM Event line 6 Mode Register -------- 
#line 4386 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_EL7MR : (PWMC Offset: 0x98) PWM Event line 7 Mode Register -------- 
#line 4395 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_WPCR : (PWMC Offset: 0xe4) PWM Write Protection Control Register -------- 
#line 4404 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_WPVS : (PWMC Offset: 0xe8) Write Protection Status Register -------- 
#line 4419 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_CMP0V : (PWMC Offset: 0x130) PWM Comparison Value 0 Register -------- 


// -------- PWMC_CMP0VUPD : (PWMC Offset: 0x134) PWM Comparison Value 0 Update Register -------- 


// -------- PWMC_CMP0M : (PWMC Offset: 0x138) PWM Comparison 0 Mode Register -------- 
#line 4432 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- PWMC_CMP0MUPD : (PWMC Offset: 0x13c) PWM Comparison 0 Mode Update Register -------- 




// -------- PWMC_CMP1V : (PWMC Offset: 0x140) PWM Comparison Value 1 Register -------- 
// -------- PWMC_CMP1VUPD : (PWMC Offset: 0x144) PWM Comparison Value 1 Update Register -------- 
// -------- PWMC_CMP1M : (PWMC Offset: 0x148) PWM Comparison 1 Mode Register -------- 
// -------- PWMC_CMP1MUPD : (PWMC Offset: 0x14c) PWM Comparison 1 Mode Update Register -------- 
// -------- PWMC_CMP2V : (PWMC Offset: 0x150) PWM Comparison Value 2 Register -------- 
// -------- PWMC_CMP2VUPD : (PWMC Offset: 0x154) PWM Comparison Value 2 Update Register -------- 
// -------- PWMC_CMP2M : (PWMC Offset: 0x158) PWM Comparison 2 Mode Register -------- 
// -------- PWMC_CMP2MUPD : (PWMC Offset: 0x15c) PWM Comparison 2 Mode Update Register -------- 
// -------- PWMC_CMP3V : (PWMC Offset: 0x160) PWM Comparison Value 3 Register -------- 
// -------- PWMC_CMP3VUPD : (PWMC Offset: 0x164) PWM Comparison Value 3 Update Register -------- 
// -------- PWMC_CMP3M : (PWMC Offset: 0x168) PWM Comparison 3 Mode Register -------- 
// -------- PWMC_CMP3MUPD : (PWMC Offset: 0x16c) PWM Comparison 3 Mode Update Register -------- 
// -------- PWMC_CMP4V : (PWMC Offset: 0x170) PWM Comparison Value 4 Register -------- 
// -------- PWMC_CMP4VUPD : (PWMC Offset: 0x174) PWM Comparison Value 4 Update Register -------- 
// -------- PWMC_CMP4M : (PWMC Offset: 0x178) PWM Comparison 4 Mode Register -------- 
// -------- PWMC_CMP4MUPD : (PWMC Offset: 0x17c) PWM Comparison 4 Mode Update Register -------- 
// -------- PWMC_CMP5V : (PWMC Offset: 0x180) PWM Comparison Value 5 Register -------- 
// -------- PWMC_CMP5VUPD : (PWMC Offset: 0x184) PWM Comparison Value 5 Update Register -------- 
// -------- PWMC_CMP5M : (PWMC Offset: 0x188) PWM Comparison 5 Mode Register -------- 
// -------- PWMC_CMP5MUPD : (PWMC Offset: 0x18c) PWM Comparison 5 Mode Update Register -------- 
// -------- PWMC_CMP6V : (PWMC Offset: 0x190) PWM Comparison Value 6 Register -------- 
// -------- PWMC_CMP6VUPD : (PWMC Offset: 0x194) PWM Comparison Value 6 Update Register -------- 
// -------- PWMC_CMP6M : (PWMC Offset: 0x198) PWM Comparison 6 Mode Register -------- 
// -------- PWMC_CMP6MUPD : (PWMC Offset: 0x19c) PWM Comparison 6 Mode Update Register -------- 
// -------- PWMC_CMP7V : (PWMC Offset: 0x1a0) PWM Comparison Value 7 Register -------- 
// -------- PWMC_CMP7VUPD : (PWMC Offset: 0x1a4) PWM Comparison Value 7 Update Register -------- 
// -------- PWMC_CMP7M : (PWMC Offset: 0x1a8) PWM Comparison 7 Mode Register -------- 
// -------- PWMC_CMP7MUPD : (PWMC Offset: 0x1ac) PWM Comparison 7 Mode Update Register -------- 

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR Serial Parallel Interface
// *****************************************************************************

typedef struct _AT91S_SPI {
	AT91_REG	 SPI_CR; 	// Control Register
	AT91_REG	 SPI_MR; 	// Mode Register
	AT91_REG	 SPI_RDR; 	// Receive Data Register
	AT91_REG	 SPI_TDR; 	// Transmit Data Register
	AT91_REG	 SPI_SR; 	// Status Register
	AT91_REG	 SPI_IER; 	// Interrupt Enable Register
	AT91_REG	 SPI_IDR; 	// Interrupt Disable Register
	AT91_REG	 SPI_IMR; 	// Interrupt Mask Register
	AT91_REG	 Reserved0[4]; 	// 
	AT91_REG	 SPI_CSR[4]; 	// Chip Select Register
	AT91_REG	 Reserved1[43]; 	// 
	AT91_REG	 SPI_ADDRSIZE; 	// SPI ADDRSIZE REGISTER 
	AT91_REG	 SPI_IPNAME1; 	// SPI IPNAME1 REGISTER 
	AT91_REG	 SPI_IPNAME2; 	// SPI IPNAME2 REGISTER 
	AT91_REG	 SPI_FEATURES; 	// SPI FEATURES REGISTER 
	AT91_REG	 SPI_VER; 	// Version Register
} AT91S_SPI, *AT91PS_SPI;
#line 4505 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SPI_CR : (SPI Offset: 0x0) SPI Control Register -------- 




// -------- SPI_MR : (SPI Offset: 0x4) SPI Mode Register -------- 
#line 4521 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SPI_RDR : (SPI Offset: 0x8) Receive Data Register -------- 


// -------- SPI_TDR : (SPI Offset: 0xc) Transmit Data Register -------- 


// -------- SPI_SR : (SPI Offset: 0x10) Status Register -------- 
#line 4539 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- SPI_IER : (SPI Offset: 0x14) Interrupt Enable Register -------- 
// -------- SPI_IDR : (SPI Offset: 0x18) Interrupt Disable Register -------- 
// -------- SPI_IMR : (SPI Offset: 0x1c) Interrupt Mask Register -------- 
// -------- SPI_CSR : (SPI Offset: 0x30) Chip Select Register -------- 
#line 4560 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR UDPHS Enpoint FIFO data register
// *****************************************************************************

typedef struct _AT91S_UDPHS_EPTFIFO {
	AT91_REG	 UDPHS_READEPT0[16384]; 	// FIFO Endpoint Data Register 0
	AT91_REG	 UDPHS_READEPT1[16384]; 	// FIFO Endpoint Data Register 1
	AT91_REG	 UDPHS_READEPT2[16384]; 	// FIFO Endpoint Data Register 2
	AT91_REG	 UDPHS_READEPT3[16384]; 	// FIFO Endpoint Data Register 3
	AT91_REG	 UDPHS_READEPT4[16384]; 	// FIFO Endpoint Data Register 4
	AT91_REG	 UDPHS_READEPT5[16384]; 	// FIFO Endpoint Data Register 5
	AT91_REG	 UDPHS_READEPT6[16384]; 	// FIFO Endpoint Data Register 6
} AT91S_UDPHS_EPTFIFO, *AT91PS_UDPHS_EPTFIFO;
#line 4584 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR UDPHS Endpoint struct
// *****************************************************************************

typedef struct _AT91S_UDPHS_EPT {
	AT91_REG	 UDPHS_EPTCFG; 	// UDPHS Endpoint Config Register
	AT91_REG	 UDPHS_EPTCTLENB; 	// UDPHS Endpoint Control Enable Register
	AT91_REG	 UDPHS_EPTCTLDIS; 	// UDPHS Endpoint Control Disable Register
	AT91_REG	 UDPHS_EPTCTL; 	// UDPHS Endpoint Control Register
	AT91_REG	 Reserved0[1]; 	// 
	AT91_REG	 UDPHS_EPTSETSTA; 	// UDPHS Endpoint Set Status Register
	AT91_REG	 UDPHS_EPTCLRSTA; 	// UDPHS Endpoint Clear Status Register
	AT91_REG	 UDPHS_EPTSTA; 	// UDPHS Endpoint Status Register
} AT91S_UDPHS_EPT, *AT91PS_UDPHS_EPT;
#line 4609 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_EPTCFG : (UDPHS_EPT Offset: 0x0) UDPHS Endpoint Config Register -------- 
#line 4634 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_EPTCTLENB : (UDPHS_EPT Offset: 0x4) UDPHS Endpoint Control Enable Register -------- 
#line 4654 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_EPTCTLDIS : (UDPHS_EPT Offset: 0x8) UDPHS Endpoint Control Disable Register -------- 

// -------- UDPHS_EPTCTL : (UDPHS_EPT Offset: 0xc) UDPHS Endpoint Control Register -------- 
// -------- UDPHS_EPTSETSTA : (UDPHS_EPT Offset: 0x14) UDPHS Endpoint Set Status Register -------- 


// -------- UDPHS_EPTCLRSTA : (UDPHS_EPT Offset: 0x18) UDPHS Endpoint Clear Status Register -------- 

// -------- UDPHS_EPTSTA : (UDPHS_EPT Offset: 0x1c) UDPHS Endpoint Status Register -------- 
#line 4684 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR UDPHS DMA struct
// *****************************************************************************

typedef struct _AT91S_UDPHS_DMA {
	AT91_REG	 UDPHS_DMANXTDSC; 	// UDPHS DMA Channel Next Descriptor Address
	AT91_REG	 UDPHS_DMAADDRESS; 	// UDPHS DMA Channel Address Register
	AT91_REG	 UDPHS_DMACONTROL; 	// UDPHS DMA Channel Control Register
	AT91_REG	 UDPHS_DMASTATUS; 	// UDPHS DMA Channel Status Register
} AT91S_UDPHS_DMA, *AT91PS_UDPHS_DMA;
#line 4702 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_DMANXTDSC : (UDPHS_DMA Offset: 0x0) UDPHS DMA Next Descriptor Address Register -------- 

// -------- UDPHS_DMAADDRESS : (UDPHS_DMA Offset: 0x4) UDPHS DMA Channel Address Register -------- 

// -------- UDPHS_DMACONTROL : (UDPHS_DMA Offset: 0x8) UDPHS DMA Channel Control Register -------- 
#line 4716 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_DMASTATUS : (UDPHS_DMA Offset: 0xc) UDPHS DMA Channelx Status Register -------- 






// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR UDPHS High Speed Device Interface
// *****************************************************************************

typedef struct _AT91S_UDPHS {
	AT91_REG	 UDPHS_CTRL; 	// UDPHS Control Register
	AT91_REG	 UDPHS_FNUM; 	// UDPHS Frame Number Register
	AT91_REG	 Reserved0[2]; 	// 
	AT91_REG	 UDPHS_IEN; 	// UDPHS Interrupt Enable Register
	AT91_REG	 UDPHS_INTSTA; 	// UDPHS Interrupt Status Register
	AT91_REG	 UDPHS_CLRINT; 	// UDPHS Clear Interrupt Register
	AT91_REG	 UDPHS_EPTRST; 	// UDPHS Endpoints Reset Register
	AT91_REG	 Reserved1[44]; 	// 
	AT91_REG	 UDPHS_TSTSOFCNT; 	// UDPHS Test SOF Counter Register
	AT91_REG	 UDPHS_TSTCNTA; 	// UDPHS Test A Counter Register
	AT91_REG	 UDPHS_TSTCNTB; 	// UDPHS Test B Counter Register
	AT91_REG	 UDPHS_TSTMODREG; 	// UDPHS Test Mode Register
	AT91_REG	 UDPHS_TST; 	// UDPHS Test Register
	AT91_REG	 Reserved2[2]; 	// 
	AT91_REG	 UDPHS_RIPPADDRSIZE; 	// UDPHS PADDRSIZE Register
	AT91_REG	 UDPHS_RIPNAME1; 	// UDPHS Name1 Register
	AT91_REG	 UDPHS_RIPNAME2; 	// UDPHS Name2 Register
	AT91_REG	 UDPHS_IPFEATURES; 	// UDPHS Features Register
	AT91_REG	 UDPHS_IPVERSION; 	// UDPHS Version Register
	AT91S_UDPHS_EPT	 UDPHS_EPT[7]; 	// UDPHS Endpoint struct
	AT91_REG	 Reserved3[72]; 	// 
	AT91S_UDPHS_DMA	 UDPHS_DMA[6]; 	// UDPHS DMA channel struct (not use [0])
} AT91S_UDPHS, *AT91PS_UDPHS;
#line 4770 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_CTRL : (UDPHS Offset: 0x0) UDPHS Control Register -------- 
#line 4777 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_FNUM : (UDPHS Offset: 0x4) UDPHS Frame Number Register -------- 



// -------- UDPHS_IEN : (UDPHS Offset: 0x10) UDPHS Interrupt Enable Register -------- 
#line 4802 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_INTSTA : (UDPHS Offset: 0x14) UDPHS Interrupt Status Register -------- 

// -------- UDPHS_CLRINT : (UDPHS Offset: 0x18) UDPHS Clear Interrupt Register -------- 
// -------- UDPHS_EPTRST : (UDPHS Offset: 0x1c) UDPHS Endpoints Reset Register -------- 
#line 4813 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_TSTSOFCNT : (UDPHS Offset: 0xd0) UDPHS Test SOF Counter Register -------- 


// -------- UDPHS_TSTCNTA : (UDPHS Offset: 0xd4) UDPHS Test A Counter Register -------- 


// -------- UDPHS_TSTCNTB : (UDPHS Offset: 0xd8) UDPHS Test B Counter Register -------- 


// -------- UDPHS_TSTMODREG : (UDPHS Offset: 0xdc) UDPHS Test Mode Register -------- 

// -------- UDPHS_TST : (UDPHS Offset: 0xe0) UDPHS Test Register -------- 
#line 4834 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_RIPPADDRSIZE : (UDPHS Offset: 0xec) UDPHS PADDRSIZE Register -------- 

// -------- UDPHS_RIPNAME1 : (UDPHS Offset: 0xf0) UDPHS Name Register -------- 

// -------- UDPHS_RIPNAME2 : (UDPHS Offset: 0xf4) UDPHS Name Register -------- 

// -------- UDPHS_IPFEATURES : (UDPHS Offset: 0xf8) UDPHS Features Register -------- 
#line 4852 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- UDPHS_IPVERSION : (UDPHS Offset: 0xfc) UDPHS Version Register -------- 



// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR HDMA Channel structure
// *****************************************************************************

typedef struct _AT91S_HDMA_CH {
	AT91_REG	 HDMA_SADDR; 	// HDMA Channel Source Address Register
	AT91_REG	 HDMA_DADDR; 	// HDMA Channel Destination Address Register
	AT91_REG	 HDMA_DSCR; 	// HDMA Channel Descriptor Address Register
	AT91_REG	 HDMA_CTRLA; 	// HDMA Channel Control A Register
	AT91_REG	 HDMA_CTRLB; 	// HDMA Channel Control B Register
	AT91_REG	 HDMA_CFG; 	// HDMA Channel Configuration Register
} AT91S_HDMA_CH, *AT91PS_HDMA_CH;
#line 4877 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_SADDR : (HDMA_CH Offset: 0x0)  -------- 

// -------- HDMA_DADDR : (HDMA_CH Offset: 0x4)  -------- 

// -------- HDMA_DSCR : (HDMA_CH Offset: 0x8)  -------- 

// -------- HDMA_CTRLA : (HDMA_CH Offset: 0xc)  -------- 
#line 4900 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_CTRLB : (HDMA_CH Offset: 0x10)  -------- 
#line 4921 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_CFG : (HDMA_CH Offset: 0x14)  -------- 
#line 4963 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//              SOFTWARE API DEFINITION  FOR HDMA controller
// *****************************************************************************

typedef struct _AT91S_HDMA {
	AT91_REG	 HDMA_GCFG; 	// HDMA Global Configuration Register
	AT91_REG	 HDMA_EN; 	// HDMA Controller Enable Register
	AT91_REG	 HDMA_SREQ; 	// HDMA Software Single Request Register
	AT91_REG	 HDMA_CREQ; 	// HDMA Software Chunk Transfer Request Register
	AT91_REG	 HDMA_LAST; 	// HDMA Software Last Transfer Flag Register
	AT91_REG	 Reserved0[1]; 	// 
	AT91_REG	 HDMA_EBCIER; 	// HDMA Error, Chained Buffer transfer completed and Buffer transfer completed Interrupt Enable register
	AT91_REG	 HDMA_EBCIDR; 	// HDMA Error, Chained Buffer transfer completed and Buffer transfer completed Interrupt Disable register
	AT91_REG	 HDMA_EBCIMR; 	// HDMA Error, Chained Buffer transfer completed and Buffer transfer completed Mask Register
	AT91_REG	 HDMA_EBCISR; 	// HDMA Error, Chained Buffer transfer completed and Buffer transfer completed Status Register
	AT91_REG	 HDMA_CHER; 	// HDMA Channel Handler Enable Register
	AT91_REG	 HDMA_CHDR; 	// HDMA Channel Handler Disable Register
	AT91_REG	 HDMA_CHSR; 	// HDMA Channel Handler Status Register
	AT91_REG	 Reserved1[2]; 	// 
	AT91S_HDMA_CH	 HDMA_CH[4]; 	// HDMA Channel structure
	AT91_REG	 Reserved2[84]; 	// 
	AT91_REG	 HDMA_ADDRSIZE; 	// HDMA ADDRSIZE REGISTER 
	AT91_REG	 HDMA_IPNAME1; 	// HDMA IPNAME1 REGISTER 
	AT91_REG	 HDMA_IPNAME2; 	// HDMA IPNAME2 REGISTER 
	AT91_REG	 HDMA_FEATURES; 	// HDMA FEATURES REGISTER 
	AT91_REG	 HDMA_VER; 	// HDMA VERSION REGISTER 
} AT91S_HDMA, *AT91PS_HDMA;
#line 5011 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_GCFG : (HDMA Offset: 0x0)  -------- 



// -------- HDMA_EN : (HDMA Offset: 0x4)  -------- 



// -------- HDMA_SREQ : (HDMA Offset: 0x8)  -------- 
#line 5044 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_CREQ : (HDMA Offset: 0xc)  -------- 
#line 5069 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_LAST : (HDMA Offset: 0x10)  -------- 
#line 5094 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_EBCIER : (HDMA Offset: 0x18) Buffer Transfer Completed/Chained Buffer Transfer Completed/Access Error Interrupt Enable Register -------- 
#line 5119 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_EBCIDR : (HDMA Offset: 0x1c)  -------- 
// -------- HDMA_EBCIMR : (HDMA Offset: 0x20)  -------- 
// -------- HDMA_EBCISR : (HDMA Offset: 0x24)  -------- 
// -------- HDMA_CHER : (HDMA Offset: 0x28)  -------- 
#line 5195 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_CHDR : (HDMA Offset: 0x2c)  -------- 
#line 5244 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_CHSR : (HDMA Offset: 0x30)  -------- 
#line 5293 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// -------- HDMA_VER : (HDMA Offset: 0x1fc)  -------- 

// *****************************************************************************
//               REGISTER ADDRESS DEFINITION FOR AT91SAM3U4
// *****************************************************************************
// ========== Register definition for SYS peripheral ========== 

// ========== Register definition for HSMC4_CS0 peripheral ========== 





// ========== Register definition for HSMC4_CS1 peripheral ========== 





// ========== Register definition for HSMC4_CS2 peripheral ========== 





// ========== Register definition for HSMC4_CS3 peripheral ========== 





// ========== Register definition for HSMC4_NFC peripheral ========== 





// ========== Register definition for HSMC4 peripheral ========== 
#line 5370 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for MATRIX peripheral ========== 
#line 5410 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for NVIC peripheral ========== 
#line 5464 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for MPU peripheral ========== 
#line 5476 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for CM3 peripheral ========== 
#line 5485 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PDC_DBGU peripheral ========== 
#line 5496 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for DBGU peripheral ========== 
#line 5514 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PIOA peripheral ========== 
#line 5566 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PIOB peripheral ========== 
#line 5618 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PIOC peripheral ========== 
#line 5670 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PMC peripheral ========== 
#line 5695 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for CKGR peripheral ========== 




// ========== Register definition for RSTC peripheral ========== 




// ========== Register definition for SUPC peripheral ========== 
#line 5712 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for RTTC peripheral ========== 




// ========== Register definition for WDTC peripheral ========== 



// ========== Register definition for RTC peripheral ========== 
#line 5734 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for ADC0 peripheral ========== 
#line 5760 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for ADC12B peripheral ==========
#line 5774 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for TC0 peripheral ========== 
#line 5785 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for TC1 peripheral ========== 
#line 5796 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for TC2 peripheral ========== 
#line 5807 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for TCB0 peripheral ========== 
#line 5815 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for TCB1 peripheral ========== 
#line 5823 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for TCB2 peripheral ========== 
#line 5831 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for EFC0 peripheral ========== 





// ========== Register definition for EFC1 peripheral ========== 





// ========== Register definition for MCI0 peripheral ========== 
#line 5869 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PDC_TWI0 peripheral ========== 
#line 5880 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PDC_TWI1 peripheral ========== 
#line 5891 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for TWI0 peripheral ========== 
#line 5908 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for TWI1 peripheral ========== 
#line 5925 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PDC_US0 peripheral ========== 
#line 5936 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for US0 peripheral ========== 
#line 5957 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PDC_US1 peripheral ========== 
#line 5968 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for US1 peripheral ========== 
#line 5989 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PDC_US2 peripheral ========== 
#line 6000 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for US2 peripheral ========== 
#line 6021 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PDC_US3 peripheral ========== 
#line 6032 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for US3 peripheral ========== 
#line 6053 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PDC_SSC0 peripheral ========== 
#line 6064 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for SSC0 peripheral ========== 
#line 6081 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PDC_PWMC peripheral ========== 
#line 6092 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PWMC_CH0 peripheral ========== 
#line 6101 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PWMC_CH1 peripheral ========== 
#line 6110 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PWMC_CH2 peripheral ========== 
#line 6119 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PWMC_CH3 peripheral ========== 
#line 6128 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for PWMC peripheral ========== 
#line 6206 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for SPI0 peripheral ========== 
#line 6221 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for UDPHS_EPTFIFO peripheral ========== 
#line 6229 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for UDPHS_EPT_0 peripheral ========== 
#line 6237 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for UDPHS_EPT_1 peripheral ========== 
#line 6245 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for UDPHS_EPT_2 peripheral ========== 
#line 6253 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for UDPHS_EPT_3 peripheral ========== 
#line 6261 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for UDPHS_EPT_4 peripheral ========== 
#line 6269 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for UDPHS_EPT_5 peripheral ========== 
#line 6277 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for UDPHS_EPT_6 peripheral ========== 
#line 6285 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for UDPHS_DMA_1 peripheral ========== 




// ========== Register definition for UDPHS_DMA_2 peripheral ========== 




// ========== Register definition for UDPHS_DMA_3 peripheral ========== 




// ========== Register definition for UDPHS_DMA_4 peripheral ========== 




// ========== Register definition for UDPHS_DMA_5 peripheral ========== 




// ========== Register definition for UDPHS_DMA_6 peripheral ========== 




// ========== Register definition for UDPHS peripheral ========== 
#line 6332 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for HDMA_CH_0 peripheral ========== 
#line 6339 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for HDMA_CH_1 peripheral ========== 
#line 6346 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for HDMA_CH_2 peripheral ========== 
#line 6353 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for HDMA_CH_3 peripheral ========== 
#line 6360 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// ========== Register definition for HDMA peripheral ========== 
#line 6378 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//               PIO DEFINITIONS FOR AT91SAM3U4
// *****************************************************************************
#line 6652 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//               PERIPHERAL ID DEFINITIONS FOR AT91SAM3U4
// *****************************************************************************
#line 6687 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//               BASE ADDRESS DEFINITIONS FOR AT91SAM3U4
// How do these casts work?
// AT91_CAST does nothing for C code, so essentially the type cast is just the generic peripheral struct AT91PS_x
// So AT91C_BASE_X should just be an address to the starting peripheral register address 
// *****************************************************************************
#line 6769 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"

// *****************************************************************************
//               MEMORY MAPPING DEFINITIONS FOR AT91SAM3U4
// *****************************************************************************
// ITCM


// DTCM


// IRAM


// IRAM_MIN


// IROM


// IFLASH0
#line 6795 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// IFLASH1
#line 6802 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\AT91SAM3U4.h"
// EBI_CS0


// EBI_CS1


// EBI_SDRAM


// EBI_SDRAM_16BIT


// EBI_SDRAM_32BIT


// EBI_CS2


// EBI_CS3


// EBI_SM


// EBI_CS4


// EBI_CF0


// EBI_CS5


// EBI_CF1



#line 46 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\exceptions.h"
/* ----------------------------------------------------------------------------
 *         ATMEL Microcontroller Software Support 
 * ----------------------------------------------------------------------------
 * Copyright (c) 2008, Atmel Corporation
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the disclaimer below.
 *
 * Atmel's name may not be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * ----------------------------------------------------------------------------
 */

/*
** This file contains the default exception handlers
** and exception table.
*/

//------------------------------------------------------------------------------
//         Types
//------------------------------------------------------------------------------

/// Function prototype for exception table items - interrupt handler.
//typedef void( *IrqHandler )( void );
//typedef void( *IntFunc )( void );

/// Weak attribute


//------------------------------------------------------------------------------
//         Global functions
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//         Exception Handlers
//------------------------------------------------------------------------------

extern __weak void NMI_Handler( void );
extern __weak void HardFault_Handler( void );
extern __weak void MemManage_Handler( void );
extern __weak void BusFault_Handler( void );
extern __weak void UsageFault_Handler( void );
extern __weak void SVC_Handler( void );
extern __weak void DebugMon_Handler( void );
extern __weak void PendSV_Handler( void );
extern __weak void SysTick_Handler( void );
void IrqHandlerNotUsed(void);


// System Controller
extern void SYS_IrqHandler(void);
// SUPPLY CONTROLLER
extern __weak void SUPC_IrqHandler(void);
// RESET CONTROLLER
extern __weak void RSTC_IrqHandler(void);
// REAL TIME CLOCK
extern __weak void RTC_IrqHandler(void);
// REAL TIME TIMER
extern __weak void RTT_IrqHandler(void);
// WATCHDOG TIMER
extern __weak void WDT_IrqHandler(void);
// PMC
extern __weak void PMC_IrqHandler(void);
// EFC0
extern __weak void EFC0_IrqHandler(void);
// EFC1
extern __weak void EFC1_IrqHandler(void);
// DBGU
extern __weak void DBGU_IrqHandler(void);
// HSMC4
extern __weak void HSMC4_IrqHandler(void);
// Parallel IO Controller A
extern __weak void PIOA_IrqHandler(void);
// Parallel IO Controller B
extern __weak void PIOB_IrqHandler(void);
// Parallel IO Controller C
extern __weak void PIOC_IrqHandler(void);
// USART 0
extern __weak void USART0_IrqHandler(void);
// USART 1
extern __weak void USART1_IrqHandler(void);
// USART 2
extern __weak void USART2_IrqHandler(void);
// USART 3
extern __weak void USART3_IrqHandler(void);
// Multimedia Card Interface
extern __weak void MCI0_IrqHandler(void);
// TWI 0
extern __weak void TWI0_IrqHandler(void);
// TWI 1
extern __weak void TWI1_IrqHandler(void);
// Serial Peripheral Interface 0
extern __weak void SPI0_IrqHandler(void);
// Serial Synchronous Controller 0
extern __weak void SSC0_IrqHandler(void);
// Timer Counter 0
extern __weak void TC0_IrqHandler(void);
// Timer Counter 1
extern __weak void TC1_IrqHandler(void);
// Timer Counter 2
extern __weak void TC2_IrqHandler(void);
// PWM Controller
extern __weak void PWM_IrqHandler(void);
// ADC controller0
extern __weak void ADCC0_IrqHandler(void);
// ADC controller1
extern __weak void ADCC1_IrqHandler(void);
// HDMA
extern __weak void HDMA_IrqHandler(void);
// USB Device High Speed UDP_HS
extern __weak void UDPD_IrqHandler(void);

#line 47 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\interrupts.h"
/**********************************************************************************************************************
File: interrupts.h                                                               

Description:
Interrupt declarations for use with EIE development board firmware.
***********************************************************************************************************************/




/***********************************************************************************************************************
Type Definitions
***********************************************************************************************************************/
/// Function prototype for exception table items - interrupt handler.
//typedef void( *IrqHandler )( void );
typedef void( *IntFunc )( void );

typedef enum IRQn
{
/******  Cortex-M3 Processor Exceptions Numbers ***************************************************/
  NonMaskableInt_IRQn         = -14,    /*!< 2 Non Maskable Interrupt                             */
  MemoryManagement_IRQn       = -12,    /*!< 4 Cortex-M3 Memory Management Interrupt              */
  BusFault_IRQn               = -11,    /*!< 5 Cortex-M3 Bus Fault Interrupt                      */
  UsageFault_IRQn             = -10,    /*!< 6 Cortex-M3 Usage Fault Interrupt                    */
  SVCall_IRQn                 = -5,     /*!< 11 Cortex-M3 SV Call Interrupt                       */
  DebugMonitor_IRQn           = -4,     /*!< 12 Cortex-M3 Debug Monitor Interrupt                 */
  PendSV_IRQn                 = -2,     /*!< 14 Cortex-M3 Pend SV Interrupt                       */
  SysTick_IRQn                = -1,     /*!< 15 Cortex-M3 System Tick Interrupt                   */

/******  AT91SAM3U4 specific Interrupt Numbers *********************************************************/
 IRQn_SUPC                = ( 0) , // SUPPLY CONTROLLER
 IRQn_RSTC                = ( 1) , // RESET CONTROLLER
 IRQn_RTC                 = ( 2)  , // REAL TIME CLOCK
 IRQn_RTT                 = ( 3)  , // REAL TIME TIMER
 IRQn_WDG                 = ( 4)  , // WATCHDOG TIMER
 IRQn_PMC                 = ( 5)  , // PMC
 IRQn_EFC0                = ( 6) , // EFC0
 IRQn_EFC1                = ( 7) , // EFC1
 IRQn_DBGU                = ( 8) , // DBGU (UART)
 IRQn_HSMC4               = ( 9), // HSMC4
 IRQn_PIOA                = (10) , // Parallel IO Controller A
 IRQn_PIOB                = (11) , // Parallel IO Controller B
 IRQn_PIOC                = (12) , // Parallel IO Controller C
 IRQn_US0                 = (13)  , // USART 0
 IRQn_US1                 = (14)  , // USART 1
 IRQn_US2                 = (15)  , // USART 2
 IRQn_US3                 = (16)  , // USART 3
 IRQn_MCI0                = (17) , // Multimedia Card Interface
 IRQn_TWI0                = (18) , // TWI 0
 IRQn_TWI1                = (19) , // TWI 1
 IRQn_SPI0                = (20) , // Serial Peripheral Interface
 IRQn_SSC0                = (21) , // Serial Synchronous Controller 0
 IRQn_TC0                 = (22)  , // Timer Counter 0
 IRQn_TC1                 = (23)  , // Timer Counter 1
 IRQn_TC2                 = (24)  , // Timer Counter 2
 IRQn_PWMC                = (25) , // Pulse Width Modulation Controller
 IRQn_ADCC0               = (26), // ADC controller0
 IRQn_ADCC1               = (27)  , // ADC controller1
 IRQn_HDMA                = (28) , // HDMA
 IRQn_UDPHS               = (29)  // USB Device High Speed
} IRQn_Type;


/***********************************************************************************************************************
Constants / Definitions
***********************************************************************************************************************/
/* IRQ Channels -> listed in AT91SAM3U4.h around line 6686 */



/**********************************************************************************************************************
Interrupt Premption Priorities (Highest -> Lowest)

Interrupt priorities start at 0 (highest priority) and go to
15 (lowest priority).  However, these correspond to Exception priorities 16 
through 31 since there are Core exceptions that are always of higher priority.
The interrupt number is processor specific and can be found around line 6650 in 
the AT91SAM3U4 header file and as "Peripheral Identifiers" on page 42 of the 10-Feb-12 datasheet.
Interrupt number / peripheral identifier has nothing to do with the corresponding interrupt priority.
Interrupt priorities are set by loading a priority slot with an interrupt number.

Priority -1 (core exception)
SysTick

Priority 0
AT91C_ID_TC0    (22) // Timer Counter 0
AT91C_ID_WDG    ( 4) // WATCHDOG TIMER

Priority 1
AT91C_ID_US2    (15) // USART 2

Priority 2
AT91C_ID_TWI0   (18) // TWI 0
AT91C_ID_SPI0   (20) // Serial Peripheral Interface

Priority 3
AT91C_ID_US0    (13) // USART 0
AT91C_ID_US1    (14) // USART 1

Priority 4
AT91C_ID_TC1    (23) // Timer Counter 1
AT91C_ID_TC2    (24) // Timer Counter 2

Priority 5
AT91C_ID_PIOA   (10) // Parallel IO Controller A
AT91C_ID_PIOB   (11) // Parallel IO Controller B
AT91C_ID_PIOC   (12) // Parallel IO Controller C

All unused interrupt sources will be set to priority 31.
*/




/* Bit Set Description
    31 [1] ( 3) // REAL TIME TIMER priority 15
    30 [1] "
    29 [1] "
    28 [1] "

    27 [0] Unimplemented
    26 [0] "
    25 [0] "
    24 [0] "

    23 [1] ( 2) // REAL TIME CLOCK priority 15
    22 [1] "
    21 [1] "
    20 [1] "

    19 [0] Unimplemented
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] ( 1) // RESET CONTROLLER priority 0
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] Unimplemented
    10 [0] "
    09 [0] "
    08 [0] "

    07 [1] ( 0) // SUPPLY CONTROLLER priority 15
    06 [1] "
    05 [1] "
    04 [1] "

    03 [0] Unimplemented
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* Bit Set Description
    31 [1] ( 7) // EFC1 priority 15
    30 [1] "
    29 [1] "
    28 [1] "

    27 [0] Unimplemented
    26 [0] "
    25 [0] "
    24 [0] "

    23 [1] ( 6) // EFC0 priority 15
    22 [1] "
    21 [1] "
    20 [1] "

    19 [0] Unimplemented
    18 [0] "
    17 [0] "
    16 [0] "

    15 [1] ( 5) // PMC priority 15
    14 [1] "
    13 [1] "
    12 [1] "

    11 [0] Unimplemented
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] ( 4) // WATCHDOG TIMER priority 0
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] Unimplemented
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* Bit Set Description
    31 [0] (11) // Parallel IO Controller B priority 5
    30 [1] "
    29 [0] "
    28 [1] "

    27 [0] Unimplemented
    26 [0] "
    25 [0] "
    24 [0] "

    23 [0] (10) // Parallel IO Controller A priority 5
    22 [1] "
    21 [0] "
    20 [1] "

    19 [0] Unimplemented
    18 [0] "
    17 [0] "
    16 [0] "

    15 [1] ( 9) // HSMC4 priority 15
    14 [1] "
    13 [1] "
    12 [1] "

    11 [0] Unimplemented
    10 [0] "
    09 [0] "
    08 [0] "

    07 [1] ( 8) // DBGU priority 15
    06 [1] "
    05 [1] "
    04 [1] "

    03 [0] Unimplemented
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* Bit Set Description
    31 [1] (15) // USART 2 priority 15
    30 [1] "
    29 [1] "
    28 [1] "

    27 [0] Unimplemented
    26 [0] "
    25 [0] "
    24 [0] "

    23 [0] (14) // USART 1 priority 3
    22 [0] "
    21 [1] "
    20 [1] "

    19 [0] Unimplemented
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] (13) // USART 0 priority 3
    14 [0] "
    13 [1] "
    12 [1] "

    11 [0] Unimplemented
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] (12) // Parallel IO Controller C priority 5
    06 [1] "
    05 [0] "
    04 [1] "

    03 [0] Unimplemented
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* Bit Set Description
    31 [1] (19) // TWI 1 priority 15
    30 [1] "
    29 [1] "
    28 [1] "

    27 [0] Unimplemented
    26 [0] "
    25 [0] "
    24 [0] "

    23 [0] (18) // TWI 0 priority 2
    22 [0] "
    21 [1] "
    20 [0] "

    19 [0] Unimplemented
    18 [0] "
    17 [0] "
    16 [0] "

    15 [1] (17) // Multimedia Card Interface priority 15
    14 [1] "
    13 [1] "
    12 [1] "

    11 [0] Unimplemented
    10 [0] "
    09 [0] "
    08 [0] "

    07 [1] (16) // USART 3 priority 15
    06 [1] "
    05 [1] "
    04 [1] "

    03 [0] Unimplemented
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* Bit Set Description
    31 [0] (23) // Timer Counter 1 priority 4
    30 [1] "
    29 [0] "
    28 [0] "

    27 [0] Unimplemented
    26 [0] "
    25 [0] "
    24 [0] "

    23 [0] (22) // Timer Counter 0 priority 0
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] Unimplemented
    18 [0] "
    17 [0] "
    16 [0] "

    15 [1] (21) // Serial Synchronous Controller 0 priority 15
    14 [1] "
    13 [1] "
    12 [1] "

    11 [0] Unimplemented
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] (20) // Serial Peripheral Interface priority 2
    06 [0] "
    05 [1] "
    04 [0] "

    03 [0] Unimplemented
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* Bit Set Description
    31 [1] (27) // 10-bit ADC Controller (ADC) priority 15
    30 [1] "
    29 [1] "
    28 [1] "

    27 [0] Unimplemented
    26 [0] "
    25 [0] "
    24 [0] "

    23 [1] (26) // 12-bit ADC Controller (ADC12B) priority 15
    22 [1] "
    21 [1] "
    20 [1] "

    19 [0] Unimplemented
    18 [0] "
    17 [0] "
    16 [0] "

    15 [1] (25) // Pulse Width Modulation Controller priority 15
    14 [1] "
    13 [1] "
    12 [1] "

    11 [0] Unimplemented
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] (24) // Timer Counter 2 priority 4
    06 [1] "
    05 [0] "
    04 [0] "

    03 [0] Unimplemented
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* Bit Set Description
    31 - 16 [0] Unimplemented

    15 [0] (29) // USB Device High Speed priority 1
    14 [0] "
    13 [0] "
    12 [1] "

    11 [0] Unimplemented
    10 [0] "
    09 [0] "
    08 [0] "

    07 [1] (28) // HDMA priority 15
    06 [1] "
    05 [1] "
    04 [1] "

    03 [0] Unimplemented
    02 [0] "
    01 [0] "
    00 [0] "
*/




/**********************************************************************************************************************
Function Prototypes
***********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions */
/*--------------------------------------------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions */
/*--------------------------------------------------------------------------------------------------------------------*/
void InterruptSetup(void);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions */
/*--------------------------------------------------------------------------------------------------------------------*/





/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 48 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"
/******************************************************************************
 * @file:    core_cm3.h
 * @purpose: CMSIS Cortex-M3 Core Peripheral Access Layer Header File
 * @version: V1.10
 * @date:    24. Feb. 2009
 *----------------------------------------------------------------------------
 *
 * Copyright (C) 2009 ARM Limited. All rights reserved.
 *
 * ARM Limited (ARM) is supplying this software for use with Cortex-Mx 
 * processor based microcontrollers.  This file can be freely distributed 
 * within development tools that are supporting such ARM based processors. 
 *
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 ******************************************************************************/














/**
 *  Lint configuration \n
 *  ----------------------- \n
 *
 *  The following Lint messages will be suppressed and not shown: \n
 *  \n
 *    --- Error 10: --- \n
 *    register uint32_t __regBasePri         __asm("basepri"); \n
 *    Error 10: Expecting ';' \n
 *     \n
 *    --- Error 530: --- \n
 *    return(__regBasePri); \n
 *    Warning 530: Symbol '__regBasePri' (line 264) not initialized \n
 *     \n
 *    --- Error 550: --- \n
 *      __regBasePri = (basePri & 0x1ff); \n
 *    } \n
 *    Warning 550: Symbol '__regBasePri' (line 271) not accessed \n
 *     \n
 *    --- Error 754: --- \n
 *    uint32_t RESERVED0[24]; \n
 *    Info 754: local structure member '<some, not used in the HAL>' (line 109, file ./cm3_core.h) not referenced \n
 *     \n
 *    --- Error 750: --- \n
 *    #define __CM3_CORE_H__ \n
 *    Info 750: local macro '__CM3_CORE_H__' (line 43, file./cm3_core.h) not referenced \n
 *     \n
 *    --- Error 528: --- \n
 *    static __INLINE void NVIC_DisableIRQ(uint32_t IRQn) \n
 *    Warning 528: Symbol 'NVIC_DisableIRQ(unsigned int)' (line 419, file ./cm3_core.h) not referenced \n
 *     \n
 *    --- Error 751: --- \n
 *    } InterruptType_Type; \n
 *    Info 751: local typedef 'InterruptType_Type' (line 170, file ./cm3_core.h) not referenced \n
 * \n
 * \n
 *    Note:  To re-enable a Message, insert a space before 'lint' * \n
 *
 */

/*lint -save */
/*lint -e10  */
/*lint -e530 */
/*lint -e550 */
/*lint -e754 */
/*lint -e750 */
/*lint -e528 */
/*lint -e751 */


#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdint.h"
/* stdint.h standard header */
/* Copyright 2003-2010 IAR Systems AB.  */




  #pragma system_include


#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"
/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */


  #pragma system_include


/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */










/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */






#line 67 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"

#line 11 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdint.h"



/* Fixed size types. These are all optional. */

  typedef signed char   int8_t;
  typedef unsigned char uint8_t;



  typedef signed short int   int16_t;
  typedef unsigned short int uint16_t;



  typedef signed int   int32_t;
  typedef unsigned int uint32_t;



  #pragma language=save
  #pragma language=extended
  typedef signed long long int   int64_t;
  typedef unsigned long long int uint64_t;
  #pragma language=restore


/* Types capable of holding at least a certain number of bits.
   These are not optional for the sizes 8, 16, 32, 64. */
typedef signed char   int_least8_t;
typedef unsigned char uint_least8_t;

typedef signed short int   int_least16_t;
typedef unsigned short int uint_least16_t;

typedef signed int   int_least32_t;
typedef unsigned int uint_least32_t;

/* This isn't really optional, but make it so for now. */

  #pragma language=save
  #pragma language=extended
  typedef signed long long int int_least64_t;
  #pragma language=restore


  #pragma language=save
  #pragma language=extended
  typedef unsigned long long int uint_least64_t;
  #pragma language=restore


/* The fastest type holding at least a certain number of bits.
   These are not optional for the size 8, 16, 32, 64.
   For now, the 64 bit size is optional in IAR compilers. */
typedef signed int   int_fast8_t;
typedef unsigned int uint_fast8_t;

typedef signed int   int_fast16_t;
typedef unsigned int uint_fast16_t;

typedef signed int   int_fast32_t;
typedef unsigned int uint_fast32_t;


  #pragma language=save
  #pragma language=extended
  typedef signed long long int int_fast64_t;
  #pragma language=restore


  #pragma language=save
  #pragma language=extended
  typedef unsigned long long int uint_fast64_t;
  #pragma language=restore


/* The integer type capable of holding the largest number of bits. */
#pragma language=save
#pragma language=extended
typedef signed long long int   intmax_t;
typedef unsigned long long int uintmax_t;
#pragma language=restore

/* An integer type large enough to be able to hold a pointer.
   This is optional, but always supported in IAR compilers. */
typedef signed long int   intptr_t;
typedef unsigned long int uintptr_t;

/* An integer capable of holding a pointer to a specific memory type. */



typedef int __data_intptr_t; typedef unsigned int __data_uintptr_t;


/* Minimum and maximum limits. */






























































































/* Macros expanding to integer constants. */

































#line 258 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdint.h"

/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */
#line 86 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"

#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\intrinsics.h"
/**************************************************
 *
 * This file declares the ARM intrinsic inline functions.
 *
 * Copyright 1999-2006 IAR Systems. All rights reserved.
 *
 * $Revision: 99951 $
 *
 **************************************************/




#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"
/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */


  #pragma system_include


/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */










/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */






#line 67 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\ycheck.h"

#line 15 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\intrinsics.h"


  #pragma system_include


/*
 * Check that the correct C compiler is used.
 */





/* Define function effects for intrinsics */









#pragma language=save
#pragma language=extended

__intrinsic __nounwind void    __no_operation(void);

__intrinsic __nounwind void    __disable_interrupt(void);
__intrinsic __nounwind void    __enable_interrupt(void);

typedef unsigned long __istate_t;

__intrinsic __nounwind __istate_t __get_interrupt_state(void);
__intrinsic __nounwind void __set_interrupt_state(__istate_t);



/* System control access for Cortex-M cores */
__intrinsic __nounwind unsigned long __get_PSR( void );
__intrinsic __nounwind unsigned long __get_IPSR( void );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_MSP( void );
__intrinsic __nounwind void          __set_MSP( unsigned long );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_PSP( void );
__intrinsic __nounwind void          __set_PSP( unsigned long );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_PRIMASK( void );
__intrinsic __nounwind void          __set_PRIMASK( unsigned long );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_CONTROL( void );
__intrinsic __nounwind void          __set_CONTROL( unsigned long );



/* These are only available for v7M */
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_FAULTMASK( void );
__intrinsic __nounwind void          __set_FAULTMASK(unsigned long);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_BASEPRI( void );
__intrinsic __nounwind void          __set_BASEPRI( unsigned long );

#line 80 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\intrinsics.h"

__intrinsic __nounwind void __disable_fiq(void);
__intrinsic __nounwind void __enable_fiq(void);


/* ARM-mode intrinsics */

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned long __SWP( unsigned long, volatile unsigned long * );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned char __SWPB( unsigned char, volatile unsigned char * );

typedef unsigned long __ul;





/*  Co-processor access */
__intrinsic __nounwind void          __MCR( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1, __ul src,
                                 unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind unsigned long __MRC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1,
                                 unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind void          __MCR2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1, __ul src,
                                  unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind unsigned long __MRC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1,
                                  unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );

/* Load coprocessor register. */
__intrinsic __nounwind void __LDC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);
__intrinsic __nounwind void __LDCL( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);
__intrinsic __nounwind void __LDC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);
__intrinsic __nounwind void __LDC2L( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);

/* Store coprocessor register. */
__intrinsic __nounwind void __STC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);
__intrinsic __nounwind void __STCL( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);
__intrinsic __nounwind void __STC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);
__intrinsic __nounwind void __STC2L( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);

/* Load coprocessor register (noindexed version with coprocessor option). */
__intrinsic __nounwind void __LDC_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                              unsigned __constrange(0,255) option);

__intrinsic __nounwind void __LDCL_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __LDC2_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __LDC2L_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                                unsigned __constrange(0,255) option);

/* Store coprocessor register (version with coprocessor option). */
__intrinsic __nounwind void __STC_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                              unsigned __constrange(0,255) option);

__intrinsic __nounwind void __STCL_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __STC2_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __STC2L_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                                unsigned __constrange(0,255) option);


/* Status register access, v7M: */
__intrinsic __nounwind unsigned long __get_APSR( void );
__intrinsic __nounwind void          __set_APSR( unsigned long );






/* Floating-point status and control register access */
__intrinsic __nounwind unsigned long __get_FPSCR( void );
__intrinsic __nounwind void __set_FPSCR( unsigned long );

/* Architecture v5T, CLZ is also available in Thumb mode for Thumb2 cores */
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned char __CLZ( unsigned long );

/* Architecture v5TE */
#line 173 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\intrinsics.h"

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int         __QCFlag( void );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void __reset_QC_flag( void );

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind signed long __SMUL( signed short, signed short );

/* Architecture v6, REV and REVSH are also available in thumb mode */
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned long __REV( unsigned long );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind signed long __REVSH( short );

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned long __REV16( unsigned long );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned long __RBIT( unsigned long );

_Pragma("function_effects = no_state, no_write(1), always_returns") __intrinsic __nounwind unsigned char  __LDREXB( volatile unsigned char const * );
_Pragma("function_effects = no_state, no_write(1), always_returns") __intrinsic __nounwind unsigned short __LDREXH( volatile unsigned short const * );
_Pragma("function_effects = no_state, no_write(1), always_returns") __intrinsic __nounwind unsigned long  __LDREX ( volatile unsigned long const * );
_Pragma("function_effects = no_state, no_write(1), always_returns") __intrinsic __nounwind unsigned long long __LDREXD( volatile unsigned long long const * );

_Pragma("function_effects = no_state, no_read(2), always_returns") __intrinsic __nounwind unsigned long  __STREXB( unsigned char, volatile unsigned char * );
_Pragma("function_effects = no_state, no_read(2), always_returns") __intrinsic __nounwind unsigned long  __STREXH( unsigned short, volatile unsigned short * );
_Pragma("function_effects = no_state, no_read(2), always_returns") __intrinsic __nounwind unsigned long  __STREX ( unsigned long, volatile unsigned long * );
_Pragma("function_effects = no_state, no_read(2), always_returns") __intrinsic __nounwind unsigned long  __STREXD( unsigned long long, volatile unsigned long long * );

__intrinsic __nounwind void __CLREX( void );

__intrinsic __nounwind void __SEV( void );
__intrinsic __nounwind void __WFE( void );
__intrinsic __nounwind void __WFI( void );
__intrinsic __nounwind void __YIELD( void );

__intrinsic __nounwind void __PLI( volatile void const * );
__intrinsic __nounwind void __PLD( volatile void const * );
__intrinsic __nounwind void __PLDW( volatile void const * );

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind   signed long __SSAT     (unsigned long val,
                                      unsigned int __constrange( 1, 32 ) sat );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __USAT     (unsigned long val,
                                      unsigned int __constrange( 0, 31 ) sat );


#line 372 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\intrinsics.h"

/* Architecture v7 instructions */
__intrinsic __nounwind void __DMB(void);
__intrinsic __nounwind void __DSB(void);
__intrinsic __nounwind void __ISB(void);

/* Architecture v8-M instructions */
__intrinsic __nounwind unsigned long __TT(unsigned long);
__intrinsic __nounwind unsigned long __TTT(unsigned long);
__intrinsic __nounwind unsigned long __TTA(unsigned long);
__intrinsic __nounwind unsigned long __TTAT(unsigned long);




__intrinsic __nounwind unsigned long __get_LR(void);
__intrinsic __nounwind void __set_LR(unsigned long);

__intrinsic __nounwind unsigned long __get_SP(void);
__intrinsic __nounwind void __set_SP(unsigned long);

#pragma language=restore










#line 89 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"










/**
 * IO definitions
 *
 * define access restrictions to peripheral registers
 */







/*******************************************************************************
 *                 Register Abstraction
 ******************************************************************************/


/* System Reset */





/* Core Debug */






/* memory mapping struct for Nested Vectored Interrupt Controller (NVIC) */
typedef struct
{
  volatile uint32_t ISER[8];                      /*!< Interrupt Set Enable Register            */
       uint32_t RESERVED0[24];
  volatile uint32_t ICER[8];                      /*!< Interrupt Clear Enable Register          */
       uint32_t RSERVED1[24];
  volatile uint32_t ISPR[8];                      /*!< Interrupt Set Pending Register           */
       uint32_t RESERVED2[24];
  volatile uint32_t ICPR[8];                      /*!< Interrupt Clear Pending Register         */
       uint32_t RESERVED3[24];
  volatile uint32_t IABR[8];                      /*!< Interrupt Active bit Register            */
       uint32_t RESERVED4[56];
  volatile uint8_t  IP[240];                      /*!< Interrupt Priority Register, 8Bit wide   */
       uint32_t RESERVED5[644];
  volatile  uint32_t STIR;                         /*!< Software Trigger Interrupt Register      */
}  NVIC_Type;


/* memory mapping struct for System Control Block */
typedef struct
{
  volatile const  uint32_t CPUID;                        /*!< CPU ID Base Register                                     */
  volatile uint32_t ICSR;                         /*!< Interrupt Control State Register                         */
  volatile uint32_t VTOR;                         /*!< Vector Table Offset Register                             */
  volatile uint32_t AIRCR;                        /*!< Application Interrupt / Reset Control Register           */
  volatile uint32_t SCR;                          /*!< System Control Register                                  */
  volatile uint32_t CCR;                          /*!< Configuration Control Register                           */
  volatile uint8_t  SHP[12];                      /*!< System Handlers Priority Registers (4-7, 8-11, 12-15)    */
  volatile uint32_t SHCSR;                        /*!< System Handler Control and State Register                */
  volatile uint32_t CFSR;                         /*!< Configurable Fault Status Register                       */
  volatile uint32_t HFSR;                         /*!< Hard Fault Status Register                               */
  volatile uint32_t DFSR;                         /*!< Debug Fault Status Register                              */
  volatile uint32_t MMFAR;                        /*!< Mem Manage Address Register                              */
  volatile uint32_t BFAR;                         /*!< Bus Fault Address Register                               */
  volatile uint32_t AFSR;                         /*!< Auxiliary Fault Status Register                          */
  volatile const  uint32_t PFR[2];                       /*!< Processor Feature Register                               */
  volatile const  uint32_t DFR;                          /*!< Debug Feature Register                                   */
  volatile const  uint32_t ADR;                          /*!< Auxiliary Feature Register                               */
  volatile const  uint32_t MMFR[4];                      /*!< Memory Model Feature Register                            */
  volatile const  uint32_t ISAR[5];                      /*!< ISA Feature Register                                     */
} SCB_Type;


/* memory mapping struct for SysTick */
typedef struct
{
  volatile uint32_t CTRL;                         /*!< SysTick Control and Status Register */
  volatile uint32_t LOAD;                         /*!< SysTick Reload Value Register       */
  volatile uint32_t VAL;                          /*!< SysTick Current Value Register      */
  volatile const  uint32_t CALIB;                        /*!< SysTick Calibration Register        */
} SysTick_Type;


/* memory mapping structur for ITM */
typedef struct
{
  volatile  union  
  {
    volatile  uint8_t    u8;                       /*!< ITM Stimulus Port 8-bit               */
    volatile  uint16_t   u16;                      /*!< ITM Stimulus Port 16-bit              */
    volatile  uint32_t   u32;                      /*!< ITM Stimulus Port 32-bit              */
  }  PORT [32];                               /*!< ITM Stimulus Port Registers           */
       uint32_t RESERVED0[864];
  volatile uint32_t TER;                          /*!< ITM Trace Enable Register             */
       uint32_t RESERVED1[15];
  volatile uint32_t TPR;                          /*!< ITM Trace Privilege Register          */
       uint32_t RESERVED2[15];
  volatile uint32_t TCR;                          /*!< ITM Trace Control Register            */
       uint32_t RESERVED3[29];
  volatile uint32_t IWR;                          /*!< ITM Integration Write Register        */
  volatile uint32_t IRR;                          /*!< ITM Integration Read Register         */
  volatile uint32_t IMCR;                         /*!< ITM Integration Mode Control Register */
       uint32_t RESERVED4[43];
  volatile uint32_t LAR;                          /*!< ITM Lock Access Register              */
  volatile uint32_t LSR;                          /*!< ITM Lock Status Register              */
       uint32_t RESERVED5[6];
  volatile const  uint32_t PID4;                         /*!< ITM Product ID Registers              */
  volatile const  uint32_t PID5;
  volatile const  uint32_t PID6;
  volatile const  uint32_t PID7;
  volatile const  uint32_t PID0;
  volatile const  uint32_t PID1;
  volatile const  uint32_t PID2;
  volatile const  uint32_t PID3;
  volatile const  uint32_t CID0;
  volatile const  uint32_t CID1;
  volatile const  uint32_t CID2;
  volatile const  uint32_t CID3;
} ITM_Type;


/* memory mapped struct for Interrupt Type */
typedef struct
{
       uint32_t RESERVED0;
  volatile const  uint32_t ICTR;                         /*!< Interrupt Control Type Register  */



       uint32_t RESERVED1;

} InterruptType_Type;


/* Memory Protection Unit */
#line 251 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"


/* Core Debug Register */
typedef struct
{
  volatile uint32_t DHCSR;                        /*!< Debug Halting Control and Status Register       */
  volatile  uint32_t DCRSR;                        /*!< Debug Core Register Selector Register           */
  volatile uint32_t DCRDR;                        /*!< Debug Core Register Data Register               */
  volatile uint32_t DEMCR;                        /*!< Debug Exception and Monitor Control Register    */
} CoreDebug_Type;


/* Memory mapping of Cortex-M3 Hardware */
#line 270 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"

#line 277 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"








/*******************************************************************************
 *                Hardware Abstraction Layer
 ******************************************************************************/


#line 298 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"








/* ###################  Compiler specific Intrinsics  ########################### */

#line 623 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"
/* IAR iccarm specific functions */



#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\cmsis_iar.h"
/**************************************************
 *
 * This file shall be included in appropriate CMSIS header
 * files, to provide required functions and intrinsics when
 * building with the IAR C/C++ Compiler for ARM (iccarm).
 *
 * Copyright 2011 IAR Systems. All rights reserved.
 *
 * $Revision: 78346 $
 *
 **************************************************/








#pragma system_include









#pragma diag_suppress=Pe940
#pragma diag_suppress=Pe177











#line 110 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\cmsis_iar.h"

static uint32_t __get_xPSR(void)
{
  return __get_PSR();   /* __get_PSR() intrinsic introduced in iccarm 6.20 */
}





#line 173 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\cmsis_iar.h"










#line 206 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\cmsis_iar.h"





static inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;
  __asm("RRX %0, %1" : "=r"(result) : "r" (value) );
  return(result);
}

static inline uint8_t __LDRBT(volatile uint8_t *addr)
{
  uint32_t result;
  __asm("LDRBT %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
  return ((uint8_t) result);
}

static inline uint16_t __LDRHT(volatile uint16_t *addr)
{
  uint32_t result;
  __asm("LDRHT %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
  return ((uint16_t) result);
}

static inline uint32_t __LDRT(volatile uint32_t *addr)
{
  uint32_t result;
  __asm("LDRT %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
  return(result);
}

static inline void __STRBT(uint8_t value, volatile uint8_t *addr)
{
  __asm("STRBT %1, [%0]" : : "r" (addr), "r" ((uint32_t)value) : "memory" );
}

static inline void __STRHT(uint16_t value, volatile uint16_t *addr)
{
  __asm("STRHT %1, [%0]" : : "r" (addr), "r" ((uint32_t)value) : "memory" );
}

static inline void __STRT(uint32_t value, volatile uint32_t *addr)
{
  __asm("STRT %1, [%0]" : : "r" (addr), "r" (value) : "memory" );
}





static inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  return (op1 >> op2) | (op1 << ((sizeof(op1)*8)-op2));
}

#pragma diag_default=Pe940
#pragma diag_default=Pe177

#line 628 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"

#line 799 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"

#line 1048 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\cmsis\\core_cm3.h"



/* ##########################   NVIC functions  #################################### */

/**
 * @brief  Set the Priority Grouping in NVIC Interrupt Controller
 *
 * @param  uint32_t priority_grouping is priority grouping field
 * @return  
 *
 * Set the priority grouping field using the required unlock sequence.
 * The parameter priority_grouping is assigned to the field 
 * SCB->AIRCR [10:8] PRIGROUP field.
 */
static inline void NVIC_SetPriorityGrouping(uint32_t priority_grouping)
{
  uint32_t reg_value=0;
  
  reg_value  = ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR;                                                                            /* read old register configuration    */
  reg_value &= ~((0xFFFFU << 16) | (0x0F << 8));                                                      /* clear bits to change               */
  reg_value  = ((reg_value | (0x5FA << 16) | (priority_grouping << 8)));                         /* Insert write key and priorty group */
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR = reg_value;
}

/**
 * @brief  Enable Interrupt in NVIC Interrupt Controller
 *
 * @param  IRQn_Type IRQn specifies the interrupt number
 * @return none 
 *
 * Enable a device specific interupt in the NVIC interrupt controller.
 * The interrupt number cannot be a negative value.
 */
static inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));                             /* enable interrupt */
}

/**
 * @brief  Disable the interrupt line for external interrupt specified
 * 
 * @param  IRQn_Type IRQn is the positive number of the external interrupt
 * @return  none
 * 
 * Disable a device specific interupt in the NVIC interrupt controller.
 * The interrupt number cannot be a negative value.
 */
static inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));                             /* disable interrupt */
}

/**
 * @brief  Read the interrupt pending bit for a device specific interrupt source
 * 
 * @param  IRQn_Type IRQn is the number of the device specifc interrupt
 * @return IRQn_Type Number of pending interrupt or zero
 *
 * Read the pending register in NVIC and return the number of the
 * specified interrupt if its status is pending, otherwise it returns 
 * zero. The interrupt number cannot be a negative value.
 */
static inline IRQn_Type NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((IRQn_Type) (((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F))));         /* Return Interrupt bit or 'zero' */
}

/**
 * @brief  Set the pending bit for an external interrupt
 * 
 * @param  IRQn_Type IRQn is the Number of the interrupt
 * @return  none
 *
 * Set the pending bit for the specified interrupt.
 * The interrupt number cannot be a negative value.
 */
static inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));                             /* set interrupt pending */
}

/**
 * @brief  Clear the pending bit for an external interrupt
 *
 * @param  IRQn_Type IRQn is the Number of the interrupt
 * @return  none
 *
 * Clear the pending bit for the specified interrupt. 
 * The interrupt number cannot be a negative value.
 */
static inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));                             /* Clear pending interrupt */
}

/**
 * @brief  Read the active bit for an external interrupt
 *
 * @param  IRQn_Type IRQn is the Number of the interrupt
 * @return IRQn_Type Number of pending interrupt or zero
 *
 * Read the active register in NVIC and returns the number of the
 * specified interrupt if its status is active, otherwise it 
 * returns zero. The interrupt number cannot be a negative value.
 */
static inline IRQn_Type NVIC_GetActive(IRQn_Type IRQn)
{
  return((IRQn_Type)(((NVIC_Type *) ((0xE000E000) + 0x0100))->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F))));                        /* Return Interruptnumber or 'zero' */
}

/**
 * @brief  Set the priority for an interrupt
 *
 * @param  IRQn_Type IRQn is the Number of the interrupt
 * @param  priority is the priority for the interrupt
 * @return  none
 *
 * Set the priority for the specified interrupt. The interrupt 
 * number can be positive to specify an external (device specific) 
 * interrupt, or negative to specify an internal (core) interrupt. \n
 *
 * Note: The priority cannot be set for every core interrupt.
 */
static inline void NVIC_SetPriority(IRQn_Type IRQn, int32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - 4)) & 0xff); }  /* set Priority for Cortex-M3 System Interrupts */
  else {
    //NVIC->IP[(uint32_t)(IRQn)] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff);    }         /* set Priority for device specific Interrupts      */
    ((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[(uint32_t)(IRQn)] = (priority & 0xff);    }         /* set Priority for device specific Interrupts      */
}

/**
 * @brief  Read the priority for an interrupt
 *
 * @param  IRQn_Type IRQn is the Number of the interrupt
 * @return priority is the priority for the interrupt
 *
 * Read the priority for the specified interrupt. The interrupt 
 * number can be positive to specify an external (device specific) 
 * interrupt, or negative to specify an internal (core) interrupt.
 *
 * The returned priority value is automatically aligned to the implemented
 * priority bits of the microcontroller.
 *
 * Note: The priority cannot be set for every core interrupt.
 */
static inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - 4)));  }              /* get priority for Cortex-M3 system interrupts   */
  else {
    return((uint32_t)(((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[(uint32_t)(IRQn)]           >> (8 - 4)));  }              /* get priority for device specific interrupts    */
}



/* ##################################    SysTick function  ############################################ */



/* SysTick constants */





/**
 * @brief  Initialize and start the SysTick counter and its interrupt.
 *
 * @param  uint32_t ticks is the number of ticks between two interrupts
 * @return  none
 *
 * Initialise the system tick timer and its interrupt and start the
 * system tick timer / counter in free running mode to generate 
 * periodical interrupts.
 */
static inline uint32_t SysTick_Config(uint32_t ticks)
{ 
  if (ticks > ((1<<24) -1))  return (1);                                                /* Reload value impossible */

  ((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD  =  (ticks & ((1<<24) -1)) - 1;                                         /* set reload register */
  NVIC_SetPriority (SysTick_IRQn, (1<<4) - 1);                               /* set Priority for Cortex-M0 System Interrupts */
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->VAL   =  (0x00);                                                                 /* Load the SysTick Counter Value */
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL = (1 << 2) | (1<<0) | (1<<1);    /* Enable SysTick IRQ and SysTick Timer */
  return (0);                                                                               /* Function successful */
}







/* ##################################    Reset function  ############################################ */

/**
 * @brief  Initiate a system reset request.
 *
 * @param   none
 * @return  none
 *
 * Initialize a system reset request to reset the MCU
 */
static inline void NVIC_SystemReset(void)
{
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR  = ((0x5FA << 16) | (((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR & (0x700)) | (1<<2));      /* Keep priority group unchanged */
}


/* ##################################    Debug Output  function  ############################################ */


/**
 * @brief  Outputs a character via the ITM channel 0
 *
 * @param   uint32_t character to output
 * @return  uint32_t input character
 *
 * The function outputs a character via the ITM channel 0. 
 * The function returns when no debugger is connected that has booked the output.  
 * It is blocking when a debugger is connected, but the previous character send is not transmitted. 
 */
static inline uint32_t ITM_SendChar (uint32_t ch)
{
  if(ch == '\n') ITM_SendChar('\r');
  
  if ((((CoreDebug_Type *) (0xE000EDF0))->DEMCR & (1 << 24))  &&
      (((ITM_Type *) (0xE0000000))->TCR & 1)                  &&
      (((ITM_Type *) (0xE0000000))->TER & (1UL << 0))  ) 
  {
    while (((ITM_Type *) (0xE0000000))->PORT[0].u32 == 0);
    ((ITM_Type *) (0xE0000000))->PORT[0].u8 = (uint8_t) ch;
  }  
  return (ch);
}



/*lint -restore */
#line 49 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\application\\main.h"
/***********************************************************************************************************************
File: main.h

Description:
Header file for main.c.
*******************************************************************************/




/***********************************************************************************************************************
* Firmware Version - Printed FIRMWARE_MAIN_REV.FIRMWARE_SUB_REV1 FIRMWARE_SUB_REV2
* See releasenotes.txt for firmware details.
***********************************************************************************************************************/





/***********************************************************************************************************************
* Constant Definitions
***********************************************************************************************************************/
/* G_u32ApplicationFlags definitions are in configuration.h */

/* G_u32SystemFlags */
#line 32 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\application\\main.h"









#line 50 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\typedefs.h"
/*******************************************************************************
* File: typedefs.h                                                               
* Description:
* Type definitions for use with the system.
*******************************************************************************/





/* CHAR/SHORT/LONG types here for legacy code compatibility */
typedef char CHAR;              /* Signed 8-bits */
typedef unsigned char UCHAR;    /* Unsigned 8-bits */
typedef short SHORT;            /* Signed 16-bits */
typedef unsigned short USHORT;  /* Unsigned 16-bits */
typedef long LONG;              /* Signed 32-bits */
typedef unsigned long ULONG;    /* Unsigned 32-bits */
typedef unsigned char BOOL;     /* Boolean */


/* Standard Peripheral Library old types (maintained for legacy purpose) */
typedef long s32;
typedef short s16;
typedef signed char  s8;

typedef const long sc32;  /*!< Read Only */
typedef const short sc16;  /*!< Read Only */
typedef const char sc8;   /*!< Read Only */

typedef ULONG  u32;
typedef USHORT u16;
typedef UCHAR  u8;

typedef const ULONG uc32;  /*!< Read Only */
typedef const USHORT uc16;  /*!< Read Only */
typedef const USHORT uc8;   /*!< Read Only */

typedef void(*fnCode_type)(void);
typedef void(*fnCode_u16_type)(u16 x);



typedef enum {FALSE = 0, TRUE = !FALSE} bool;


typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus;

typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;


typedef enum {ERROR = 0, SUCCESS = !ERROR} ErrorStatus;

#line 85 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\typedefs.h"




#line 51 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\utilities.h"
/***********************************************************************************************************************
File: utilities.h                                                                
***********************************************************************************************************************/




/***********************************************************************************************************************
Type Definitions
***********************************************************************************************************************/


/***********************************************************************************************************************
Constants / Definitions
***********************************************************************************************************************/



























/***********************************************************************************************************************
* Function Declarations
***********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions */
/*--------------------------------------------------------------------------------------------------------------------*/
bool IsTimeUp(u32 *pu32SavedTick_, u32 u32Period_);
u8 ASCIIHexCharToChar(u8);
u8 HexToASCIICharUpper(u8 u8Char_);
u8 HexToASCIICharLower(u8 u8Char_);
u8 NumberToAscii(u32 u32Number_, u8* pu8AsciiString_);
bool SearchString(u8* pu8TargetString_, u8* pu8MatchString_);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions */
/*--------------------------------------------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions */
/*--------------------------------------------------------------------------------------------------------------------*/





/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 52 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"

/* Common driver header files */
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antmessage.h"
/** \file antmessage.h
*
*  Contains ANT message IDs and other definiations useful for ANT messaging
*
* $Name:  $
*/
/*
 * Copyright (C) 2006 Dynastream Innovations Inc. All rights reserved. 
 *
 * The intellectual property contained within this file is sole property of Dynastream Innovations Inc. 
 * Any distribution without the prior written consent of Dynastream Innovations Inc. is strictly prohibited.
 *
 * Dynastream Innovations Inc. does not guarantee error free operation of the intellectual property contained 
 * herein. 
 * 
 * Please forward all questions regarding this code to ANT Technical Support.
 * 
 * Dynastream Innovations Inc.
 * 228 River Avenue
 * Cochrane, Alberta, Canada
 * T4C 2C1
 * 
 * (P) (403) 932-9292
 * (F) (403) 932-6521
 * (TF) 1-866-932-9292 in North America
 * (E) support@thisisant.com
 * 
 * www.thisisant.com
 */ 




/////////////////////////////////////////////////////////////////////////////
// Message Format
// Messages are in the format:
//
// AX XX YY -------- CK
//
// where: AX    is the 1 byte sync byte either transmit or recieve
//        XX    is the 1 byte size of the message (0-249) NOTE: THIS WILL BE LIMITED BY THE EMBEDDED RECEIVE BUFFER SIZE
//        YY    is the 1 byte ID of the message (1-255, 0 is invalid)
//        ----- is the data of the message (0-249 bytes of data)
//        CK    is the 1 byte Checksum of the message
/////////////////////////////////////////////////////////////////////////////
#line 64 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antmessage.h"

//////////////////////////////////////////////
// Buffer Indices - use these indexes when the buffer does NOT include the SYNC byte
//////////////////////////////////////////////
#line 80 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antmessage.h"

   
//////////////////////////////////////////////
// Message ID's
//////////////////////////////////////////////



#line 98 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antmessage.h"
   
#line 108 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antmessage.h"

















//////////////////////////////////////////////
// Message Sizes
//////////////////////////////////////////////








#line 147 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antmessage.h"











   
   
#line 55 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antdefines.h"
/** \file antdefines.h
*
* Conatins definitions for ANT config parameters and ANT event codes
*
* $Name:  $
*/
/*
 * Copyright (C) 2006 Dynastream Innovations Inc. All rights reserved. 
 *
 * The intellectual property contained within this file is sole property of Dynastream Innovations Inc. 
 * Any distribution without the prior written consent of Dynastream Innovations Inc. is strictly prohibited.
 *
 * Dynastream Innovations Inc. does not guarantee error free operation of the intellectual property contained 
 * herein. 
 * 
 * Please forward all questions regarding this code to ANT Technical Support.
 * 
 * Dynastream Innovations Inc.
 * 228 River Avenue
 * Cochrane, Alberta, Canada
 * T4C 2C1
 * 
 * (P) (403) 932-9292
 * (F) (403) 932-6521
 * (TF) 1-866-932-9292 in North America
 * (E) support@thisisant.com
 * 
 * www.thisisant.com
 */ 




//////////////////////////////////////////////
// ANT Clock Definition
//////////////////////////////////////////////


//////////////////////////////////////////////
// Radio TX Power Definitions
//////////////////////////////////////////////
#line 48 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antdefines.h"

//////////////////////////////////////////////
// Default System Definitions
//////////////////////////////////////////////






//////////////////////////////////////////////
// ID Definitions
//////////////////////////////////////////////






//////////////////////////////////////////////
// Assign Channel Parameters
//////////////////////////////////////////////





//////////////////////////////////////////////
// Assign Channel Types
//////////////////////////////////////////////






//////////////////////////////////////////////
// Channel Status
//////////////////////////////////////////////
#line 93 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antdefines.h"

//////////////////////////////////////////////
// Standard capabilities defines
//////////////////////////////////////////////
#line 103 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antdefines.h"

//////////////////////////////////////////////
// Advanced capabilities defines
//////////////////////////////////////////////



//////////////////////////////////////////////
// Burst Message Sequence 
//////////////////////////////////////////////






//////////////////////////////////////////////
// Shared Channel Commands / Datatypes
//////////////////////////////////////////////





//...






///////////////////////////////////////////////////////////////////////
// AtoD SubTypes
///////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////
// Response / Event Codes
//////////////////////////////////////////////


#line 153 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\antdefines.h"














#line 56 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\ant.h"
/**********************************************************************************************************************
File: ant.h                                                                

Description:
ANT implementation for Cortex-M3 / AP2 SPI

Search "####" for ANT Channel ID defaults

**********************************************************************************************************************/





/*******************************************************************************
* Constants
*******************************************************************************/
/* Configuration */



#line 28 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\ant.h"





/* Network number */
#line 44 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\ant.h"

/* Symbols for bytes in messages to help readability */
#line 56 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\ant.h"


/*******************************************************************************
* Type definitions
*******************************************************************************/
typedef enum {ANT_UNCONFIGURED = 0, ANT_CONFIGURED = 1, ANT_OPENING = 2, 
              ANT_OPEN = 3, ANT_CLOSING = 4, ANT_CLOSED = 1} AntChannelStatusType;
typedef enum {ANT_EMPTY, ANT_DATA, ANT_TICK} AntApplicationMessageType;
typedef enum {ANT_GENERIC_MSG_READY, ANT_GENERIC_MSG_BUSY, ANT_GENERIC_MSG_OK, ANT_GENERIC_MSG_FAIL} AntApplicationGenericMsgStatus;
typedef enum {ANT_CHANNEL_0 = 0, ANT_CHANNEL_1, ANT_CHANNEL_2, ANT_CHANNEL_3,
              ANT_CHANNEL_4, ANT_CHANNEL_5, ANT_CHANNEL_6, ANT_CHANNEL_7,
              ANT_CHANNEL_SCANNING = 0} AntChannelNumberType;

/* Data struct for extended data information */
typedef struct
{
  u8 u8Channel;                            /* Channel number */
  u8 u8Flags;                              /* Extended data flags from the received message */
  u16 u16DeviceID;                         /* Device ID from the received message */
  u8 u8DeviceType;                         /* Device Type from the received message */
  u8 u8TransType;                          /* Transmission Type from the received message */
  s8 s8RSSI;                               /* RSSI from the received message */
  u8 u8Dummy;                              /* Pad for 4-byte alignment */
} AntExtendedDataType;

typedef struct
{
  u32 u32TimeStamp;                                  /* Current G_u32SystemTime1s */
  AntApplicationMessageType eMessageType;            /* Type of data */
  u8 u8Channel;                                      /* Channel to which the data applies */
  u8 au8MessageData[(u8)8];  /* Array for message data */
  AntExtendedDataType sExtendedData;                 /* Struct of extended message data */
  void *psNextMessage;                               /* Pointer to AntDataMessageStructType */
} AntApplicationMsgListType;

#line 107 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\ant.h"

typedef struct 
{
  AntChannelNumberType AntChannel;         /* The ANT channel number */
  u8 AntChannelType;                       /* ANT channel type from antdefines.h line 75 */
  u8 AntNetwork;                           /* Network number */
  u8 AntNetworkKey[8];                     /* Network key assigned to AntNetwork number */
  u8 AntDeviceIdLo;                        /* Device ID low byte */
  u8 AntDeviceIdHi;                        /* Device ID high byte */
  u8 AntDeviceType;                        /* Device type byte */
  u8 AntTransmissionType;                  /* Transmission type byte */
  u8 AntChannelPeriodLo;                   /* Low byte of Channel Period */
  u8 AntChannelPeriodHi;                   /* High byte of Channel Period */
  u8 AntFrequency;                         /* RF frequency value */
  u8 AntTxPower;                           /* RF power level from antdefines.h line 40 */
  u8 AntFlags;                             /* Flag byte for tracking status */
} AntAssignChannelInfoType;

typedef struct
{
  u8 u8Channel;
  u8 u8MessageNumber;
  u8 u8ResponseCode;
} AntMessageResponseType;

/* Message struct for outgoing data messages */
typedef struct
{
  u32 u32TimeStamp;                        /* Current G_u32SystemTime1s */
  u8 au8MessageData[(((UCHAR)13) + ((((UCHAR)1) + ((UCHAR)1) + ((UCHAR)1)) + ((UCHAR)1)))];        /* Array for message data */
  void *psNextMessage;                     /* Pointer to AntDataMessageStructType */
} AntOutgoingMessageListType;   


/*******************************************************************************
* Macros 
*******************************************************************************/














/*******************************************************************************
* Application Values
*******************************************************************************/

/* G_u32AntFlags */
/* Error / event flags */








/* Status flags */


/* Control flags */




/* end G_u32AntFlags */


/* Channel flags used for AntFlags in AntAssignChannelInfoType */








/* Default Channel ID parameters */
//#define	ANT_SERIAL_LO_DEFAULT			        (u8)0x00
//#define ANT_SERIAL_HI_DEFAULT			        (u8)0x20





/* #### Default channel configuration parameters #### */











/* #### end of default channel configuration parameters ####*/















/*******************************************************************************
* Function prototypes
*******************************************************************************/

/* ANT Private Serial-layer Functions */
static void AntSyncSerialInitialize(void);
static void AntSrdyPulse(void);
static void AntRxMessage(void);
static void AntAbortMessage(void);
static void AdvanceAntRxBufferCurrentChar(void);
static void AdvanceAntRxBufferUnreadMsgPointer(void);
static bool AntParseExtendedData(u8* pu8SourceMessage, AntExtendedDataType* psExtDataTarget_);


/* ANT Protected Interface-layer Functions */
void AntInitialize(void);
void AntRunActiveState(void);
bool AntTxMessage(u8 *pu8AntTxMessage_);
u8 AntExpectResponse(u8 u8ExpectedMessageID_, u32 u32TimeoutMS_);
void AntTxFlowControlCallback(void);
void AntRxFlowControlCallback(void);
u8 AntCalculateTxChecksum(u8* pu8Message_);
bool AntQueueOutgoingMessage(u8 *pu8Message_);
void AntDeQueueApplicationMessage(void);


/* ANT private Interface-layer Functions */
static u8 AntProcessMessage(void);
static void AntTick(u8 u8Code_);
static bool AntQueueApplicationMessage(AntApplicationMessageType eMessageType_, u8 *pu8DataSource_);

static void AntTickExtended(u8* pu8AntMessage_);
static bool AntQueueExtendedApplicationMessage(AntApplicationMessageType eMessageType_, u8* pu8DataSource_, AntExtendedDataType* psExtData_);
static void AntDeQueueOutgoingMessage(void);


/* ANT State Machine Definition */
void AntSM_Idle(void);
void AntSM_ReceiveMessage(void);
void AntSM_TransmitMessage(void);
void AntSM_NoResponse(void);

#line 57 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\ant_api.h"
/**********************************************************************************************************************
* File: ant_api.h      
*
* Description:
* ANT implementation for Cortex-M3 / AP2 SPI
**********************************************************************************************************************/





/**********************************************************************************************************************
Constants
**********************************************************************************************************************/







/**********************************************************************************************************************
Type definitions
**********************************************************************************************************************/


/**********************************************************************************************************************
Application messages
**********************************************************************************************************************/

/*----------------------------------------------------------------------------------------------------------------------
ANT_TICK communicates the message period to the application.  

If ANT is running as a master, ANT_TICK occurs every time a broadcast or acknowledged
data message is sent. 

If ANT is running as a slave, ANT_TICK occurs when ever a message is received from the
master or if ANT misses a message that it was expecting based on the established timing 
of a paired channel (EVENT_RX_FAIL event is generated).  This should be communicated 
in case a missed message is important to any application using ANT.  

MSG_NAME  MSG_ID     D_0      D_1      D_2     D_3     D_4     D_5     D_6
ANT_TICK   0xFF    CHANNEL  RESPONSE  EVENT   0xFF   MISSED  MISSED  MISSED
                             TYPE     CODE            MSG #   MSG #   MSG #
                                                      HIGH    MID     LOW
---------------------------------------------------------------------------------------------------------------------*/


#line 61 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\ant_api.h"


/**********************************************************************************************************************
Function prototypes
**********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions                                                                                                   */
/*--------------------------------------------------------------------------------------------------------------------*/
AntChannelStatusType AntRadioStatusChannel(AntChannelNumberType eChannel_);

bool AntAssignChannel(AntAssignChannelInfoType* psAntSetupInfo_);
bool AntUnassignChannelNumber(AntChannelNumberType eChannel_);

bool AntOpenChannelNumber(AntChannelNumberType eChannel_);
bool AntOpenScanningChannel(void);
bool AntCloseChannelNumber(AntChannelNumberType eChannel_);

bool AntQueueBroadcastMessage(AntChannelNumberType eChannel_, u8 *pu8Data_);
bool AntQueueAcknowledgedMessage(AntChannelNumberType eChannel_, u8 *pu8Data_);

bool AntReadAppMessageBuffer(void);

/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions                                                                                                */
/*--------------------------------------------------------------------------------------------------------------------*/
void AntApiInitialize(void);
void AntApiRunActiveState(void);

/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions                                                                                                  */
/*--------------------------------------------------------------------------------------------------------------------*/



/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
static void AntApiSM_Idle(void);    
static void  AntApiSM_AssignChannel(void);       

static void AntApiSM_Error(void);         
static void AntApiSM_FailedInit(void);        

#line 58 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\buttons.h"
/***********************************************************************************************************************
File: buttons.h                                                                
***********************************************************************************************************************/




#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"
/**********************************************************************************************************************
File: configuration.h      

Description:
Main configuration header file for project.  This file bridges many of the generic features of the 
firmware to the specific features of the design. The definitions should be updated
to match the target hardware.  
 
Bookmarks:
!!!!! External module peripheral assignments
@@@@@ GPIO board-specific parameters
##### Communication peripheral board-specific parameters

Quick references:
DEBUG UART IS 115200-8-N-1
ANT BOARDTEST CHANNEL CONFIG: 4660 (0x1234), 96(0x60), 1

***********************************************************************************************************************/

#line 272 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"


/*----------------------------------------------------------------------------------------------------------------------
%BUZZER% Buzzer Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
EIE1 has two buzzers, MPG2 only has one */








/*----------------------------------------------------------------------------------------------------------------------
%ADC% Analog input channel Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Available analog channels are defined here.  The names in the arrays come from
the board-specific definition header file in section !!!!! GPIO pin names
*/








/*----------------------------------------------------------------------------------------------------------------------
%ANT% Interface Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Board-specific ANT definitions are kept here
*/
















/***********************************************************************************************************************
##### Communication peripheral board-specific parameters
***********************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------------
%UART%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
Blade UART Setup

The Blade UART is used for the daughter board interface (serial: 115.2k, 8-N-1) .
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
Debug UART Setup

Debug is used for the terminal (serial: 115.2k, 8-N-1) debugging interface.
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [1] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 38400 bps
=> CD = 78.125 - (FP / 8)
Set FP = 1, CD = 78 = 0x4E

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26 = 0x1A

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
%SSP%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
LCD USART Setup in SSP mode

SPI mode to communicate with an SPI LCD screen. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [1] RXDIS receiver disabled
    04 [0] RXEN receiver not enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
ANT USART Setup in SSP
SPI slave mode to communicate with an ANT device. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK (delicious!) NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as soon as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [1] USCLKS SCK
    04 [1] "

    03 [1] USART_MODE SPI Slave
    02 [1] "
    01 [1] "
    00 [1] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [1] CTSIC Clear to Send Change interrupt enabled 
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled 

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled 

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled YET
    00 [0] RXRDY Receiver Ready interrupt enabled 
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
!!!!! Not applicable for slave (note that incoming clock cannot 
exceed MCLK/6 = 8MHz.  To date, ANT devices communicate at 500kHz
or 2MHz, so no issues.
*/



/*----------------------------------------------------------------------------------------------------------------------
SD USART Setup in SSP mode

SPI mode to communicate with an SPI SD card. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled for now
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*--------------------------------------------------------------------------------------------------------------------
Two Wire Interface setup

I�C Master mode for ASCII LCD communication
*/

/*-------------------- TWI0 ---------------------*/
/*Control Register*/

/*
    31-8 [0] Reserved

    07 [0] SWRST - Software reset
    06 [0] QUICK - SMBUS Quick Command
    05 [1] SVDIS - Slave mode disable - disabled
    04 [0] SVEN - Slave mode enable

    03 [0] MSDIS - Master mode disable
    02 [1] MSEN - Master mode enable
    01 [0] STOP - Stop a transfer
    00 [0] START - Start a transfer
*/

/*Master Mode Register*/

/*
    31-24 [0] Reserved
    
    23 [0] Reserved
    22 [0] DADR - device slave address - start with zero
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] MREAD - Master Read Direction - 0 -> Write, 1 -> Read

    11 [0] Reserved
    10 [0] "
    09 [0] IADRSZ - Internal device address - 0 = no internal device address
    08 [0] "

    07-0 [0] Reserved
*/

/* Clock Wave Generator Register */
/* 
    Calculation:
        T_low = ((CLDIV * (2^CKDIV))+4) * T_MCK
        T_high = ((CHDIV * (2^CKDIV))+4) * T_MCK

        T_MCK - period of master clock = 1/(48 MHz)
        T_low/T_high - period of the low and high signals
        
        CKDIV = 2, CHDIV and CLDIV = 59
        T_low/T_high = 2.5 microseconds

        Data frequency - 
        f = ((T_low + T_high)^-1)
        f = 200000 Hz 0r 200 kHz

    Additional Rates:
        50 kHz - 0x00027777
       100 kHz - 0x00023B3B
       200 kHz - 0x00021D1D
       400 kHz - 0x00030707  *Maximum rate*
*/

/*
    31-20 [0] Reserved
    
    19 [0] Reserved
    18 [0] CKDIV
    17 [1] "
    16 [0] "

    15 [0] CHDIV
    14 [0] "
    13 [0] "
    12 [1] "

    11 [1] "
    10 [1] "
    09 [0] "
    08 [1] "

    07 [0] CLDIV - Clock Low Divider
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [1] "
    01 [0] "
    00 [1] "
*/

/*Interrupt Enable Register*/

/*
    31-16 [0] Reserved

    15 [0] TXBUFE - Transmit Buffer Empty
    14 [0] RXBUFF - Receive Buffer Full
    13 [0] ENDTX - End of Transmit Buffer
    12 [0] ENDRX - End of Receive Buffer

    11 [0] EOSACC - End of Slave Address
    10 [0] SCL_WS - Clock Wait State
    09 [0] ARBLST - Arbitration Lost
    08 [1] NACK - Not Acknowledge

    07 [0] Reserved
    06 [1] OVRE - Overrun Error
    05 [0] GACC - General Call Access
    04 [0] SVACC - Slave Access

    03 [0] Reserved
    02 [0] TXRDY - Transmit Holding Register Ready
    01 [1] RXRDY - Receive Holding Register Ready
    00 [0] TXCOMP - Transmission Completed
*/

/*Interrupt Disable Register*/

/*
    31-16 [0] Reserved

    15 [1] TXBUFE - Transmit Buffer Empty
    14 [1] RXBUFF - Receive Buffer Full
    13 [1] ENDTX - End of Transmit Buffer
    12 [1] ENDRX - End of Receive Buffer

    11 [1] EOSACC - End of Slave Address
    10 [1] SCL_WS - Clock Wait State
    09 [1] ARBLST - Arbitration Lost
    08 [0] NACK - Not Acknowledge

    07 [0] Reserved
    06 [0] OVRE - Overrun Error
    05 [1] GACC - General Call Access
    04 [1] SVACC - Slave Access

    03 [0] Reserved
    02 [1] TXRDY - Transmit Holding Register Ready
    01 [0] RXRDY - Receive Holding Register Ready
    00 [1] TXCOMP - Transmission Completed
*/



/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/

#line 9 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\buttons.h"

/***********************************************************************************************************************
Type Definitions
***********************************************************************************************************************/
typedef enum {RELEASED, PRESSED} ButtonStateType; 
typedef enum {BUTTON_PORTA = 0, BUTTON_PORTB = 0x80} ButtonPortType;  /* Offset between port registers (in 32 bit words) */
typedef enum {BUTTON_ACTIVE_LOW = 0, BUTTON_ACTIVE_HIGH = 1} ButtonActiveType;

typedef struct 
{
  ButtonActiveType eActiveState;
  ButtonPortType ePort;
}ButtonConfigType;


/***********************************************************************************************************************
Constants / Definitions
***********************************************************************************************************************/




/***********************************************************************************************************************
Function Declarations
***********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions                                                                                                   */
/*--------------------------------------------------------------------------------------------------------------------*/
bool IsButtonPressed(u32 u32Button_);
bool WasButtonPressed(u32 u32Button_);
void ButtonAcknowledge(u32 u32Button_);
bool IsButtonHeld(u32 u32Button_, u32 u32ButtonHeldTime_);

/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions                                                                                                */
/*--------------------------------------------------------------------------------------------------------------------*/
void ButtonInitialize(void);                        
void ButtonRunActiveState(void);

u32 GetButtonBitLocation(u8 u8Button_, ButtonPortType ePort_);

/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions                                                                                                  */
/*--------------------------------------------------------------------------------------------------------------------*/


/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
static void ButtonSM_Idle(void);                
static void ButtonSM_ButtonActive(void);        




/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File                                                                                                        */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 59 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\leds.h"
/******************************************************************************
File: leds.h                                                               

Description:
Header file for leds.c

DISCLAIMER: THIS CODE IS PROVIDED WITHOUT ANY WARRANTY OR GUARANTEES.  USERS MAY
USE THIS CODE FOR DEVELOPMENT AND EXAMPLE PURPOSES ONLY.  ENGENUICS TECHNOLOGIES
INCORPORATED IS NOT RESPONSIBLE FOR ANY ERRORS, OMISSIONS, OR DAMAGES THAT COULD
RESULT FROM USING THIS FIRMWARE IN WHOLE OR IN PART.

******************************************************************************/




#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"
/**********************************************************************************************************************
File: configuration.h      

Description:
Main configuration header file for project.  This file bridges many of the generic features of the 
firmware to the specific features of the design. The definitions should be updated
to match the target hardware.  
 
Bookmarks:
!!!!! External module peripheral assignments
@@@@@ GPIO board-specific parameters
##### Communication peripheral board-specific parameters

Quick references:
DEBUG UART IS 115200-8-N-1
ANT BOARDTEST CHANNEL CONFIG: 4660 (0x1234), 96(0x60), 1

***********************************************************************************************************************/

#line 272 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"


/*----------------------------------------------------------------------------------------------------------------------
%BUZZER% Buzzer Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
EIE1 has two buzzers, MPG2 only has one */








/*----------------------------------------------------------------------------------------------------------------------
%ADC% Analog input channel Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Available analog channels are defined here.  The names in the arrays come from
the board-specific definition header file in section !!!!! GPIO pin names
*/








/*----------------------------------------------------------------------------------------------------------------------
%ANT% Interface Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Board-specific ANT definitions are kept here
*/
















/***********************************************************************************************************************
##### Communication peripheral board-specific parameters
***********************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------------
%UART%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
Blade UART Setup

The Blade UART is used for the daughter board interface (serial: 115.2k, 8-N-1) .
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
Debug UART Setup

Debug is used for the terminal (serial: 115.2k, 8-N-1) debugging interface.
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [1] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 38400 bps
=> CD = 78.125 - (FP / 8)
Set FP = 1, CD = 78 = 0x4E

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26 = 0x1A

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
%SSP%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
LCD USART Setup in SSP mode

SPI mode to communicate with an SPI LCD screen. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [1] RXDIS receiver disabled
    04 [0] RXEN receiver not enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
ANT USART Setup in SSP
SPI slave mode to communicate with an ANT device. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK (delicious!) NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as soon as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [1] USCLKS SCK
    04 [1] "

    03 [1] USART_MODE SPI Slave
    02 [1] "
    01 [1] "
    00 [1] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [1] CTSIC Clear to Send Change interrupt enabled 
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled 

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled 

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled YET
    00 [0] RXRDY Receiver Ready interrupt enabled 
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
!!!!! Not applicable for slave (note that incoming clock cannot 
exceed MCLK/6 = 8MHz.  To date, ANT devices communicate at 500kHz
or 2MHz, so no issues.
*/



/*----------------------------------------------------------------------------------------------------------------------
SD USART Setup in SSP mode

SPI mode to communicate with an SPI SD card. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled for now
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*--------------------------------------------------------------------------------------------------------------------
Two Wire Interface setup

I�C Master mode for ASCII LCD communication
*/

/*-------------------- TWI0 ---------------------*/
/*Control Register*/

/*
    31-8 [0] Reserved

    07 [0] SWRST - Software reset
    06 [0] QUICK - SMBUS Quick Command
    05 [1] SVDIS - Slave mode disable - disabled
    04 [0] SVEN - Slave mode enable

    03 [0] MSDIS - Master mode disable
    02 [1] MSEN - Master mode enable
    01 [0] STOP - Stop a transfer
    00 [0] START - Start a transfer
*/

/*Master Mode Register*/

/*
    31-24 [0] Reserved
    
    23 [0] Reserved
    22 [0] DADR - device slave address - start with zero
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] MREAD - Master Read Direction - 0 -> Write, 1 -> Read

    11 [0] Reserved
    10 [0] "
    09 [0] IADRSZ - Internal device address - 0 = no internal device address
    08 [0] "

    07-0 [0] Reserved
*/

/* Clock Wave Generator Register */
/* 
    Calculation:
        T_low = ((CLDIV * (2^CKDIV))+4) * T_MCK
        T_high = ((CHDIV * (2^CKDIV))+4) * T_MCK

        T_MCK - period of master clock = 1/(48 MHz)
        T_low/T_high - period of the low and high signals
        
        CKDIV = 2, CHDIV and CLDIV = 59
        T_low/T_high = 2.5 microseconds

        Data frequency - 
        f = ((T_low + T_high)^-1)
        f = 200000 Hz 0r 200 kHz

    Additional Rates:
        50 kHz - 0x00027777
       100 kHz - 0x00023B3B
       200 kHz - 0x00021D1D
       400 kHz - 0x00030707  *Maximum rate*
*/

/*
    31-20 [0] Reserved
    
    19 [0] Reserved
    18 [0] CKDIV
    17 [1] "
    16 [0] "

    15 [0] CHDIV
    14 [0] "
    13 [0] "
    12 [1] "

    11 [1] "
    10 [1] "
    09 [0] "
    08 [1] "

    07 [0] CLDIV - Clock Low Divider
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [1] "
    01 [0] "
    00 [1] "
*/

/*Interrupt Enable Register*/

/*
    31-16 [0] Reserved

    15 [0] TXBUFE - Transmit Buffer Empty
    14 [0] RXBUFF - Receive Buffer Full
    13 [0] ENDTX - End of Transmit Buffer
    12 [0] ENDRX - End of Receive Buffer

    11 [0] EOSACC - End of Slave Address
    10 [0] SCL_WS - Clock Wait State
    09 [0] ARBLST - Arbitration Lost
    08 [1] NACK - Not Acknowledge

    07 [0] Reserved
    06 [1] OVRE - Overrun Error
    05 [0] GACC - General Call Access
    04 [0] SVACC - Slave Access

    03 [0] Reserved
    02 [0] TXRDY - Transmit Holding Register Ready
    01 [1] RXRDY - Receive Holding Register Ready
    00 [0] TXCOMP - Transmission Completed
*/

/*Interrupt Disable Register*/

/*
    31-16 [0] Reserved

    15 [1] TXBUFE - Transmit Buffer Empty
    14 [1] RXBUFF - Receive Buffer Full
    13 [1] ENDTX - End of Transmit Buffer
    12 [1] ENDRX - End of Receive Buffer

    11 [1] EOSACC - End of Slave Address
    10 [1] SCL_WS - Clock Wait State
    09 [1] ARBLST - Arbitration Lost
    08 [0] NACK - Not Acknowledge

    07 [0] Reserved
    06 [0] OVRE - Overrun Error
    05 [1] GACC - General Call Access
    04 [1] SVACC - Slave Access

    03 [0] Reserved
    02 [1] TXRDY - Transmit Holding Register Ready
    01 [0] RXRDY - Receive Holding Register Ready
    00 [1] TXCOMP - Transmission Completed
*/



/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/

#line 18 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\leds.h"

/******************************************************************************
Type Definitions
******************************************************************************/

/* %LED% The order of the LEDs in LedNumberType below must match the order of the definitions provided in leds_x.c */









typedef enum {RED0 = 0, RED1, RED2, RED3, GREEN0, GREEN1, GREEN2, GREEN3, BLUE0, BLUE1, BLUE2, BLUE3, LCD_BL} LedNumberType;




typedef enum {LED_NORMAL_MODE, LED_PWM_MODE, LED_BLINK_MODE} LedModeType;
typedef enum {LED_PORTA = 0, LED_PORTB = 0x80} LedPortType;  /* Offset between port registers (in 32 bit words) */
typedef enum {LED_ACTIVE_LOW = 0, LED_ACTIVE_HIGH = 1} LedActiveType;
typedef enum {LED_PWM_DUTY_LOW = 0, LED_PWM_DUTY_HIGH = 1} LedPWMDutyType;



/* Standard blinky values.  If other values are needed, add them at the end of the enum */
typedef enum {LED_0_5HZ = 1000, LED_1HZ = 500, LED_2HZ = 250, LED_4HZ = 125, LED_8HZ = 63,
              LED_PWM_0 = 0, LED_PWM_5 = 1, LED_PWM_10 = 2, LED_PWM_15 = 3, LED_PWM_20 = 4, 
              LED_PWM_25 = 5, LED_PWM_30 = 6, LED_PWM_35 = 7, LED_PWM_40 = 8, LED_PWM_45 = 9, 
              LED_PWM_50 = 10, LED_PWM_55 = 11, LED_PWM_60 = 12, LED_PWM_65 = 13, LED_PWM_70 = 14, 
              LED_PWM_75 = 15, LED_PWM_80 = 16, LED_PWM_85 = 17, LED_PWM_90 = 18, LED_PWM_95 = 19, 
              LED_PWM_100 = (u8)20
             } LedRateType;

typedef struct 
{
  LedModeType eMode;
  LedRateType eRate;
  u16 u16Count;
  LedPWMDutyType eCurrentDuty;
  LedActiveType eActiveState;
  LedPortType ePort;
}LedConfigType;


/******************************************************************************
* Constants
******************************************************************************/



/******************************************************************************
* Function Declarations
******************************************************************************/
/* Public Functions */
void LedOn(LedNumberType eLED_);
void LedOff(LedNumberType eLED_);
void LedToggle(LedNumberType eLED_);
void LedPWM(LedNumberType eLED_, LedRateType ePwmRate_);
void LedBlink(LedNumberType eLED_, LedRateType ePwmRate_);

/* Protected Functions */
void LedInitialize(void);

/* Private Functions */
void LedUpdate(void);


/******************************************************************************
* State Machine Function Prototypes
******************************************************************************/
void LedSM_Idle(void);       /* No blinking LEDs */
void LedSM_Blinky(void);     /* At least one blinky LED so values need checking */


#line 60 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\messaging.h"
/**********************************************************************************************************************
File: messaging.h                                                                

Description:
This is a messaging .h file new source code header file.
**********************************************************************************************************************/





/**********************************************************************************************************************
Constants / Definitions
**********************************************************************************************************************/
/* G_u32MessagingFlags */




  
/* Tx buffer allocation: be aware of RAM usage when selecting the parameters below.
Queue size in bytes is TX_QUEUE_SIZE x MAX_TX_MESSAGE_LENGTH */












/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/
typedef enum {EMPTY = 0, WAITING, SENDING, RECEIVING, COMPLETE, TIMEOUT, ABANDONED, NOT_FOUND = 0xff} MessageStateType;

/* Message struct for data messages */
typedef struct
{
  u32 u32Token;                         /* Unigue token for this message */
  u32 u32Size;                          /* Size of the data payload in bytes */
  u8 pu8Message[(u16)128]; /* Data payload array */
  void* psNextMessage;                  /* Pointer to next message */
} MessageType;

typedef struct
{
  bool bFree;                           /* TRUE if message slot is available */
  MessageType Message;                  /* The slot's message */
} MessageSlot;

typedef struct
{
  u32 u32Token;                         /* Unigue token for this message; a token is never 0 */
  MessageStateType eState;              /* State of the message */
  u32 u32Timestamp;                     /* Time the message status was posted */          
} MessageStatus;


/**********************************************************************************************************************
* Function Declarations
**********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions */
/*--------------------------------------------------------------------------------------------------------------------*/
MessageStateType QueryMessageStatus(u32 u32Token_);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions */
/*--------------------------------------------------------------------------------------------------------------------*/
void MessagingInitialize(void);
void MessagingRunActiveState(void);

u32 QueueMessage(MessageType** eTargetTxBuffer_, u32 u32MessageSize_, u8* pu8MessageData_);
void DeQueueMessage(MessageType** pTargetQueue_);

void UpdateMessageStatus(u32 u32Token_, MessageStateType eNewState_);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions */
/*--------------------------------------------------------------------------------------------------------------------*/
static void AddNewMessageStatus(u32 u32Token_);


/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
void MessagingIdle(void);             
void MessagingError(void);         





/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 61 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\timer.h"
/**********************************************************************************************************************
File: timer.h                                                                

Description:
Header file for timer.c

**********************************************************************************************************************/




/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/
typedef enum {TIMER_CHANNEL0 = 0, TIMER_CHANNEL1 = 0x40, TIMER_CHANNEL2 = 0x80} TimerChannelType;


/**********************************************************************************************************************
Constants / Definitions
**********************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------------
Generic Timer Setup
Internal timer clocks sources are based on MCK (48MHz)
TIMER_CLOCK1 = MCK/2 (41.7ns / tick)
TIMER_CLOCK2 = MCK/8 (167ns / tick)
TIMER_CLOCK3 = MCK/32 (667ns / tick)
TIMER_CLOCK4 = MCK/128 (2.67us / tick)
TIMER_CLOCK5(1) SLCK
*/

/* TC Block Mode Register */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] MAXFILT Filter period is 1 (not used)
    24 [0] "

    23 [0] "
    22 [0] "
    21 [0] "
    20 [1] "

    19 [0] FILTER IDX, PHA, PHB not filtered
    18 [0] Reserved
    17 [0] IDXPHB IDX pin drives TIOA1
    16 [0] SWAP No swap between PHA and PHB

    15 [0] INVIDX IDX directly drives quadrature logic
    14 [0] INVB PHB directly drive quadrature decoder logic
    13 [0] INVA PHA directly drive quadrature decoder logic
    12 [0] EDGPHA Edges detected on PHA and PHB

    11 [1] QDTRANS Quadrature decoding logic is inactive
    10 [0] SPEEDEN Speed measure disabled
    09 [0] POSEN Position measure disabled
    08 [0] QDEN Quadrature decoder logic disabled

    07 [0] Reserved
    06 [0] "
    05 [0] TC2XC2S TCLK2 connected to XC2
    04 [0] "

    03 [0] TC1XC1S TCLK1 connected to XC1
    02 [0] "
    01 [0] TC0XC0S TCLK0 connected to XC0
    00 [0] "
*/
      

/* Timer Channel 1 Setup
Note:
PA26 is an open pin avaialble as external clock input TCLK2 if set for Peripheral B function 
PB5 is an open pin available for TIOA1 I/O function if set for Peripheral A 
PB6 is an open pin available for TIOB1 I/O function if set for Peripheral A 
*/

/* Default Timer 1 interrupt period of just about 100us (1 tick = 2.67us); max 65535 */



/*
    31-04 [0] Reserved

    03 [0] Reserved
    02 [0] SWTRG no software trigger
    01 [1] CLKDIS Clock disabled to start
    00 [0] CLKEN Clock not enabled 
*/


/*
    31 [0] BSWTRG no software trigger effect on TIOB
    30 [0] "
    29 [0] BEEVT no external event effect on TIOB
    28 [0] "

    27 [0] BCPC no RC compare effect on TIOB
    26 [0] "
    25 [0] BCPB no RB compare effect on TIOB
    24 [0] "

    23 [0] ASWTRG no TIOA software trigger effect
    22 [0] "
    21 [0] AEEVT no TIOA effect on external compare
    20 [0] "

    19 [1] ACPC Toggle TIOA on RC compare
    18 [1] "
    17 [0] ACPA No RA compare effect on TIOA
    16 [0] "

    15 [1] WAVE Waveform Mode is enabled
    14 [1] WAVSEL Up to RC mode
    13 [0] "
    12 [0] ENETRG external event has no effect

    11 [0] EEVT external event assigned to XC0
    10 [1] "
    09 [0] EEVTEDG no external event trigger
    08 [0] "

    07 [0] CPCDIS clock is NOT disabled when reaches RC
    06 [0] CPCSTOP clock is NOT stopped when reaches RC
    05 [0] BURST not gated
    04 [0] "

    03 [0] CLKI Counter incremented on rising edge
    02 [0] TCCLKS TIMER_CLOCK4 (MCK/128 = 2.67us / tick)
    01 [1] "
    00 [1] "
*/


/*
    31 -08 [0] Reserved 

    07 [0] ETRGS RC Load interrupt not enabled
    06 [0] LDRBS RB Load interrupt not enabled
    05 [0] LDRAS RA Load interrupt not enabled
    04 [1] CPCS RC compare interrupt is enabled

    03 [0] CPBS RB compare interrupt not enabled
    02 [0] CPAS RA Compare Interrupt enabled
    01 [0] LOVRS Lover's bit? Load Overrun interrupt not enabled 
    00 [0] COVFS Counter Overflow interrupt not enabled
*/


/*
    31-08 [0] Reserved 

    07 [1] ETRGS RC Load interrupt disabled
    06 [1] LDRBS RB Load interrupt disabled
    05 [1] LDRAS RA Load interrupt disabled
    04 [0] CPCS RC compare interrupt not disabled

    03 [1] CPBS RB compare interrupt disabled
    02 [1] CPAS RA Compare Interrupt not disabled
    01 [1] LOVRS Lover's bit?!? Load Overrun interrupt disabled 
    00 [1] COVFS Counter Overflow interrupt disabled
*/


/**********************************************************************************************************************
Function Declarations
**********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions                                                                                                   */
/*--------------------------------------------------------------------------------------------------------------------*/
void TimerSet(TimerChannelType eTimerChannel_, u16 u16TimerValue_);
void TimerStart(TimerChannelType eTimerChannel_);
void TimerStop(TimerChannelType eTimerChannel_);
u16 TimerGetTime(TimerChannelType eTimerChannel_);
void TimerAssignCallback(TimerChannelType eTimerChannel_, fnCode_type fpUserCallBack_);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions                                                                                                */
/*--------------------------------------------------------------------------------------------------------------------*/
void TimerInitialize(void);
void TimerRunActiveState(void);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions                                                                                                  */
/*--------------------------------------------------------------------------------------------------------------------*/
inline void TimerDefaultCallback(void);


/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
static void TimerSM_Idle(void);    

static void TimerSM_Error(void);         
static void TimerSM_FailedInit(void);        





/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File                                                                                                        */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 62 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"

#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\sam3u_i2c.h"
/**********************************************************************************************************************
File: sam3u_TWI.h                                                                

Description:
Header file for sam3u_TWI.c
**********************************************************************************************************************/




#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"
/**********************************************************************************************************************
File: configuration.h      

Description:
Main configuration header file for project.  This file bridges many of the generic features of the 
firmware to the specific features of the design. The definitions should be updated
to match the target hardware.  
 
Bookmarks:
!!!!! External module peripheral assignments
@@@@@ GPIO board-specific parameters
##### Communication peripheral board-specific parameters

Quick references:
DEBUG UART IS 115200-8-N-1
ANT BOARDTEST CHANNEL CONFIG: 4660 (0x1234), 96(0x60), 1

***********************************************************************************************************************/

#line 272 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"


/*----------------------------------------------------------------------------------------------------------------------
%BUZZER% Buzzer Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
EIE1 has two buzzers, MPG2 only has one */








/*----------------------------------------------------------------------------------------------------------------------
%ADC% Analog input channel Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Available analog channels are defined here.  The names in the arrays come from
the board-specific definition header file in section !!!!! GPIO pin names
*/








/*----------------------------------------------------------------------------------------------------------------------
%ANT% Interface Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Board-specific ANT definitions are kept here
*/
















/***********************************************************************************************************************
##### Communication peripheral board-specific parameters
***********************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------------
%UART%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
Blade UART Setup

The Blade UART is used for the daughter board interface (serial: 115.2k, 8-N-1) .
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
Debug UART Setup

Debug is used for the terminal (serial: 115.2k, 8-N-1) debugging interface.
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [1] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 38400 bps
=> CD = 78.125 - (FP / 8)
Set FP = 1, CD = 78 = 0x4E

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26 = 0x1A

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
%SSP%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
LCD USART Setup in SSP mode

SPI mode to communicate with an SPI LCD screen. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [1] RXDIS receiver disabled
    04 [0] RXEN receiver not enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
ANT USART Setup in SSP
SPI slave mode to communicate with an ANT device. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK (delicious!) NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as soon as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [1] USCLKS SCK
    04 [1] "

    03 [1] USART_MODE SPI Slave
    02 [1] "
    01 [1] "
    00 [1] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [1] CTSIC Clear to Send Change interrupt enabled 
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled 

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled 

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled YET
    00 [0] RXRDY Receiver Ready interrupt enabled 
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
!!!!! Not applicable for slave (note that incoming clock cannot 
exceed MCLK/6 = 8MHz.  To date, ANT devices communicate at 500kHz
or 2MHz, so no issues.
*/



/*----------------------------------------------------------------------------------------------------------------------
SD USART Setup in SSP mode

SPI mode to communicate with an SPI SD card. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled for now
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*--------------------------------------------------------------------------------------------------------------------
Two Wire Interface setup

I�C Master mode for ASCII LCD communication
*/

/*-------------------- TWI0 ---------------------*/
/*Control Register*/

/*
    31-8 [0] Reserved

    07 [0] SWRST - Software reset
    06 [0] QUICK - SMBUS Quick Command
    05 [1] SVDIS - Slave mode disable - disabled
    04 [0] SVEN - Slave mode enable

    03 [0] MSDIS - Master mode disable
    02 [1] MSEN - Master mode enable
    01 [0] STOP - Stop a transfer
    00 [0] START - Start a transfer
*/

/*Master Mode Register*/

/*
    31-24 [0] Reserved
    
    23 [0] Reserved
    22 [0] DADR - device slave address - start with zero
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] MREAD - Master Read Direction - 0 -> Write, 1 -> Read

    11 [0] Reserved
    10 [0] "
    09 [0] IADRSZ - Internal device address - 0 = no internal device address
    08 [0] "

    07-0 [0] Reserved
*/

/* Clock Wave Generator Register */
/* 
    Calculation:
        T_low = ((CLDIV * (2^CKDIV))+4) * T_MCK
        T_high = ((CHDIV * (2^CKDIV))+4) * T_MCK

        T_MCK - period of master clock = 1/(48 MHz)
        T_low/T_high - period of the low and high signals
        
        CKDIV = 2, CHDIV and CLDIV = 59
        T_low/T_high = 2.5 microseconds

        Data frequency - 
        f = ((T_low + T_high)^-1)
        f = 200000 Hz 0r 200 kHz

    Additional Rates:
        50 kHz - 0x00027777
       100 kHz - 0x00023B3B
       200 kHz - 0x00021D1D
       400 kHz - 0x00030707  *Maximum rate*
*/

/*
    31-20 [0] Reserved
    
    19 [0] Reserved
    18 [0] CKDIV
    17 [1] "
    16 [0] "

    15 [0] CHDIV
    14 [0] "
    13 [0] "
    12 [1] "

    11 [1] "
    10 [1] "
    09 [0] "
    08 [1] "

    07 [0] CLDIV - Clock Low Divider
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [1] "
    01 [0] "
    00 [1] "
*/

/*Interrupt Enable Register*/

/*
    31-16 [0] Reserved

    15 [0] TXBUFE - Transmit Buffer Empty
    14 [0] RXBUFF - Receive Buffer Full
    13 [0] ENDTX - End of Transmit Buffer
    12 [0] ENDRX - End of Receive Buffer

    11 [0] EOSACC - End of Slave Address
    10 [0] SCL_WS - Clock Wait State
    09 [0] ARBLST - Arbitration Lost
    08 [1] NACK - Not Acknowledge

    07 [0] Reserved
    06 [1] OVRE - Overrun Error
    05 [0] GACC - General Call Access
    04 [0] SVACC - Slave Access

    03 [0] Reserved
    02 [0] TXRDY - Transmit Holding Register Ready
    01 [1] RXRDY - Receive Holding Register Ready
    00 [0] TXCOMP - Transmission Completed
*/

/*Interrupt Disable Register*/

/*
    31-16 [0] Reserved

    15 [1] TXBUFE - Transmit Buffer Empty
    14 [1] RXBUFF - Receive Buffer Full
    13 [1] ENDTX - End of Transmit Buffer
    12 [1] ENDRX - End of Receive Buffer

    11 [1] EOSACC - End of Slave Address
    10 [1] SCL_WS - Clock Wait State
    09 [1] ARBLST - Arbitration Lost
    08 [0] NACK - Not Acknowledge

    07 [0] Reserved
    06 [0] OVRE - Overrun Error
    05 [1] GACC - General Call Access
    04 [1] SVACC - Slave Access

    03 [0] Reserved
    02 [1] TXRDY - Transmit Holding Register Ready
    01 [0] RXRDY - Receive Holding Register Ready
    00 [1] TXCOMP - Transmission Completed
*/



/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/

#line 12 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\sam3u_i2c.h"

/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/
typedef enum {STOP, NO_STOP, NA} TWIStopType;
typedef enum {WRITE, READ} TWIMessageType;

typedef struct 
{
  AT91PS_TWI pBaseAddress;            /* Base address of the associated peripheral */
  MessageType* pTransmitBuffer;       /* Pointer to the transmit message linked list */
  u8* pu8RxBuffer;                    /* Pointer to receive buffer in user application */
  u32 u32Flags;                       /* Flags for peripheral */
} TWIPeripheralType;

typedef struct
{
  TWIMessageType Direction;           /* Tx/Rx Message Type */
  u32 u32Size;                        /* Size of the transfer */
  u8 u8Address;                       /* Slave address */
  u8 u8Attempts;                      /* Number of attempts taken to send msg */
  
  /* Only Applicable to Write Operations */
  TWIStopType Stop;                   
  
  /* Only Applicable to Read Operations */
  u8* pu8RxBuffer;                    /* Pointer to receive buffer in user application */
}TWIMessageQueueType;

/* TWIx_u32Flags definitions in TWIPeripheralType*/






/**********************************************************************************************************************
Constants / Definitions
**********************************************************************************************************************/
/* TWI_u32Flags (TWI application flags) */





/* end of TWI_u32Flags */



























/**********************************************************************************************************************
* Function Declarations
**********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions */
/*--------------------------------------------------------------------------------------------------------------------*/
bool TWI0ReadByte(u8 u8SlaveAddress_, u8* pu8RxBuffer_);
bool TWI0ReadData(u8 u8SlaveAddress_, u8* pu8RxBuffer_, u32 u32Size_);
u32 TWI0WriteByte(u8 u8SlaveAddress_, u8 u8Byte_, TWIStopType Send_);
u32 TWI0WriteData(u8 u8SlaveAddress_, u32 u32Size_, u8* u8Data_, TWIStopType Send_);

/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions */
/*--------------------------------------------------------------------------------------------------------------------*/
void TWIInitialize(void);
void TWIRunActiveState(void);

/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions */
/*--------------------------------------------------------------------------------------------------------------------*/
static void TWI0FillTxBuffer(void);
static void TWIManualMode(void);
void TWI0_IRQHandler(void);
void TWI1_IRQHandler(void);

/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
void TWISM_Idle(void);
void TWISM_Transmitting(void);
void TWISM_Receiving(void);
void TWISM_Error(void);         




/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 64 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\sam3u_ssp.h"
/**********************************************************************************************************************
File: sam3u_ssp.h                                                                

Description:
Header file for sam3u_ssp.c
**********************************************************************************************************************/




#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"
/**********************************************************************************************************************
File: configuration.h      

Description:
Main configuration header file for project.  This file bridges many of the generic features of the 
firmware to the specific features of the design. The definitions should be updated
to match the target hardware.  
 
Bookmarks:
!!!!! External module peripheral assignments
@@@@@ GPIO board-specific parameters
##### Communication peripheral board-specific parameters

Quick references:
DEBUG UART IS 115200-8-N-1
ANT BOARDTEST CHANNEL CONFIG: 4660 (0x1234), 96(0x60), 1

***********************************************************************************************************************/

#line 272 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"


/*----------------------------------------------------------------------------------------------------------------------
%BUZZER% Buzzer Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
EIE1 has two buzzers, MPG2 only has one */








/*----------------------------------------------------------------------------------------------------------------------
%ADC% Analog input channel Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Available analog channels are defined here.  The names in the arrays come from
the board-specific definition header file in section !!!!! GPIO pin names
*/








/*----------------------------------------------------------------------------------------------------------------------
%ANT% Interface Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Board-specific ANT definitions are kept here
*/
















/***********************************************************************************************************************
##### Communication peripheral board-specific parameters
***********************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------------
%UART%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
Blade UART Setup

The Blade UART is used for the daughter board interface (serial: 115.2k, 8-N-1) .
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
Debug UART Setup

Debug is used for the terminal (serial: 115.2k, 8-N-1) debugging interface.
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [1] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 38400 bps
=> CD = 78.125 - (FP / 8)
Set FP = 1, CD = 78 = 0x4E

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26 = 0x1A

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
%SSP%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
LCD USART Setup in SSP mode

SPI mode to communicate with an SPI LCD screen. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [1] RXDIS receiver disabled
    04 [0] RXEN receiver not enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
ANT USART Setup in SSP
SPI slave mode to communicate with an ANT device. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK (delicious!) NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as soon as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [1] USCLKS SCK
    04 [1] "

    03 [1] USART_MODE SPI Slave
    02 [1] "
    01 [1] "
    00 [1] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [1] CTSIC Clear to Send Change interrupt enabled 
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled 

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled 

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled YET
    00 [0] RXRDY Receiver Ready interrupt enabled 
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
!!!!! Not applicable for slave (note that incoming clock cannot 
exceed MCLK/6 = 8MHz.  To date, ANT devices communicate at 500kHz
or 2MHz, so no issues.
*/



/*----------------------------------------------------------------------------------------------------------------------
SD USART Setup in SSP mode

SPI mode to communicate with an SPI SD card. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled for now
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*--------------------------------------------------------------------------------------------------------------------
Two Wire Interface setup

I�C Master mode for ASCII LCD communication
*/

/*-------------------- TWI0 ---------------------*/
/*Control Register*/

/*
    31-8 [0] Reserved

    07 [0] SWRST - Software reset
    06 [0] QUICK - SMBUS Quick Command
    05 [1] SVDIS - Slave mode disable - disabled
    04 [0] SVEN - Slave mode enable

    03 [0] MSDIS - Master mode disable
    02 [1] MSEN - Master mode enable
    01 [0] STOP - Stop a transfer
    00 [0] START - Start a transfer
*/

/*Master Mode Register*/

/*
    31-24 [0] Reserved
    
    23 [0] Reserved
    22 [0] DADR - device slave address - start with zero
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] MREAD - Master Read Direction - 0 -> Write, 1 -> Read

    11 [0] Reserved
    10 [0] "
    09 [0] IADRSZ - Internal device address - 0 = no internal device address
    08 [0] "

    07-0 [0] Reserved
*/

/* Clock Wave Generator Register */
/* 
    Calculation:
        T_low = ((CLDIV * (2^CKDIV))+4) * T_MCK
        T_high = ((CHDIV * (2^CKDIV))+4) * T_MCK

        T_MCK - period of master clock = 1/(48 MHz)
        T_low/T_high - period of the low and high signals
        
        CKDIV = 2, CHDIV and CLDIV = 59
        T_low/T_high = 2.5 microseconds

        Data frequency - 
        f = ((T_low + T_high)^-1)
        f = 200000 Hz 0r 200 kHz

    Additional Rates:
        50 kHz - 0x00027777
       100 kHz - 0x00023B3B
       200 kHz - 0x00021D1D
       400 kHz - 0x00030707  *Maximum rate*
*/

/*
    31-20 [0] Reserved
    
    19 [0] Reserved
    18 [0] CKDIV
    17 [1] "
    16 [0] "

    15 [0] CHDIV
    14 [0] "
    13 [0] "
    12 [1] "

    11 [1] "
    10 [1] "
    09 [0] "
    08 [1] "

    07 [0] CLDIV - Clock Low Divider
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [1] "
    01 [0] "
    00 [1] "
*/

/*Interrupt Enable Register*/

/*
    31-16 [0] Reserved

    15 [0] TXBUFE - Transmit Buffer Empty
    14 [0] RXBUFF - Receive Buffer Full
    13 [0] ENDTX - End of Transmit Buffer
    12 [0] ENDRX - End of Receive Buffer

    11 [0] EOSACC - End of Slave Address
    10 [0] SCL_WS - Clock Wait State
    09 [0] ARBLST - Arbitration Lost
    08 [1] NACK - Not Acknowledge

    07 [0] Reserved
    06 [1] OVRE - Overrun Error
    05 [0] GACC - General Call Access
    04 [0] SVACC - Slave Access

    03 [0] Reserved
    02 [0] TXRDY - Transmit Holding Register Ready
    01 [1] RXRDY - Receive Holding Register Ready
    00 [0] TXCOMP - Transmission Completed
*/

/*Interrupt Disable Register*/

/*
    31-16 [0] Reserved

    15 [1] TXBUFE - Transmit Buffer Empty
    14 [1] RXBUFF - Receive Buffer Full
    13 [1] ENDTX - End of Transmit Buffer
    12 [1] ENDRX - End of Receive Buffer

    11 [1] EOSACC - End of Slave Address
    10 [1] SCL_WS - Clock Wait State
    09 [1] ARBLST - Arbitration Lost
    08 [0] NACK - Not Acknowledge

    07 [0] Reserved
    06 [0] OVRE - Overrun Error
    05 [1] GACC - General Call Access
    04 [1] SVACC - Slave Access

    03 [0] Reserved
    02 [1] TXRDY - Transmit Holding Register Ready
    01 [0] RXRDY - Receive Holding Register Ready
    00 [1] TXCOMP - Transmission Completed
*/



/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/

#line 12 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\sam3u_ssp.h"

/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/
typedef enum {MSB_FIRST, LSB_FIRST} SspeBitOrderType;
typedef enum {SSP_FULL_DUPLEX, SSP_HALF_DUPLEX} SspDuplexModeType;
typedef enum {SPI_MASTER_AUTO_CS, SPI_MASTER_MANUAL_CS, SPI_SLAVE, SPI_SLAVE_FLOW_CONTROL} SspModeType;
typedef enum {SSP_RX_EMPTY = 0, SSP_RX_WAITING, SSP_RX_RECEIVING, SSP_RX_COMPLETE, SSP_RX_TIMEOUT} SspRxStatusType;

typedef struct 
{
  PeripheralType SspPeripheral;       /* Easy name of peripheral */
  AT91PS_PIO pCsGpioAddress;          /* Base address for GPIO port for chip select line */
  u32 u32CsPin;                       /* Pin location for SSEL line */
  SspeBitOrderType eBitOrder;         /* MSB_FIRST or LSB_FIRST: this is only available in SPI_SLAVE_FLOW_CONTROL mode */
  SspModeType eSspMode;               /* Type of SPI configured */
  fnCode_type fnSlaveTxFlowCallback;  /* Callback function for SPI_SLAVE_FLOW_CONTROL transmit */
  fnCode_type fnSlaveRxFlowCallback;  /* Callback function for SPI_SLAVE_FLOW_CONTROL receive */
  u8* pu8RxBufferAddress;             /* Address to circular receive buffer */
  u8** ppu8RxNextByte;                /* Location of pointer to next byte to write in buffer for SPI_SLAVE_FLOW_CONTROL only */
  u16 u16RxBufferSize;                /* Size of receive buffer in bytes */
} SspConfigurationType;

typedef struct 
{
  AT91PS_USART pBaseAddress;          /* Base address of the associated peripheral */
  AT91PS_PIO pCsGpioAddress;          /* Base address for GPIO port for chip select line */
  u32 u32CsPin;                       /* Pin location for SSEL line */
  SspeBitOrderType eBitOrder;         /* MSB_FIRST or LSB_FIRST: this is only available in SPI_SLAVE_FLOW_CONTROL mode */
  SspModeType eSspMode;               /* Type of SPI configured */
  u16 u16Pad;                         /* Preserve 4-byte alignment */
  u32 u32PrivateFlags;                /* Private peripheral flags */
  fnCode_type fnSlaveTxFlowCallback;  /* Callback function for SPI SLAVE transmit that uses flow control */
  fnCode_type fnSlaveRxFlowCallback;  /* Callback function for SPI SLAVE receive that uses flow control */
  u8* pu8RxBuffer;                    /* Pointer to receive buffer in user application */
  u8** ppu8RxNextByte;                /* Pointer to buffer location where next received byte will be placed (SPI_SLAVE_FLOW_CONTROL only) */
  u16 u16RxBufferSize;                /* Size of receive buffer in bytes */
  u16 u16RxBytes;                     /* Number of bytes to receive (DMA transfers) */
  u8 u8PeripheralId;                  /* Simple peripheral ID number */
//  u8 u8Pad;                           /* Preserve 4-byte alignment */
  MessageType* psTransmitBuffer;      /* Pointer to the transmit message struct linked list */
//  MessageType* psReceiveBuffer;       /* Pointer to the transmit message struct linked list */
  u32 u32CurrentTxBytesRemaining;     /* Counter for bytes remaining in current transfer */
  u8* pu8CurrentTxData;               /* Pointer to current location in the Tx buffer */
} SspPeripheralType;

/* u32PrivateFlags */






/**********************************************************************************************************************
Constants / Definitions
**********************************************************************************************************************/
/* G_u32SspxApplicationFlags */




/* end G_u32SspxApplicationFlags */

/* SSP_u32Flags (local SSP application flags) */





/* end of SSP_u32Flags flags */






/**********************************************************************************************************************
* Function Declarations
**********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions */
/*--------------------------------------------------------------------------------------------------------------------*/
SspPeripheralType* SspRequest(SspConfigurationType* psSspConfig_);
void SspRelease(SspPeripheralType* psSspPeripheral_);

void SspAssertCS(SspPeripheralType* psSspPeripheral_);
void SspDeAssertCS(SspPeripheralType* psSspPeripheral_);

u32 SspWriteByte(SspPeripheralType* psSspPeripheral_, u8 u8Byte_);
u32 SspWriteData(SspPeripheralType* psSspPeripheral_, u32 u32Size_, u8* u8Data_);

bool SspReadData(SspPeripheralType* psSspPeripheral_, u16 u16Size_);
bool SspReadByte(SspPeripheralType* psSspPeripheral_);
SspRxStatusType SspQueryReceiveStatus(SspPeripheralType* psSspPeripheral_);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions */
/*--------------------------------------------------------------------------------------------------------------------*/
void SspInitialize(void);
void SspRunActiveState(void);

void SspManualMode(void);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions */
/*--------------------------------------------------------------------------------------------------------------------*/
void SSP0_IRQHandler(void);
void SSP1_IRQHandler(void);
void SSP2_IRQHandler(void);
void SspGenericHandler(void);


/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
void SspSM_Idle(void);
void SspSM_Error(void);         





/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 65 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\sam3u_uart.h"
/**********************************************************************************************************************
File: sam3u_uart.h                                                                

Description:
Header file for sam3u_uart.c
**********************************************************************************************************************/




#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"
/**********************************************************************************************************************
File: configuration.h      

Description:
Main configuration header file for project.  This file bridges many of the generic features of the 
firmware to the specific features of the design. The definitions should be updated
to match the target hardware.  
 
Bookmarks:
!!!!! External module peripheral assignments
@@@@@ GPIO board-specific parameters
##### Communication peripheral board-specific parameters

Quick references:
DEBUG UART IS 115200-8-N-1
ANT BOARDTEST CHANNEL CONFIG: 4660 (0x1234), 96(0x60), 1

***********************************************************************************************************************/

#line 272 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"


/*----------------------------------------------------------------------------------------------------------------------
%BUZZER% Buzzer Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
EIE1 has two buzzers, MPG2 only has one */








/*----------------------------------------------------------------------------------------------------------------------
%ADC% Analog input channel Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Available analog channels are defined here.  The names in the arrays come from
the board-specific definition header file in section !!!!! GPIO pin names
*/








/*----------------------------------------------------------------------------------------------------------------------
%ANT% Interface Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Board-specific ANT definitions are kept here
*/
















/***********************************************************************************************************************
##### Communication peripheral board-specific parameters
***********************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------------
%UART%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
Blade UART Setup

The Blade UART is used for the daughter board interface (serial: 115.2k, 8-N-1) .
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
Debug UART Setup

Debug is used for the terminal (serial: 115.2k, 8-N-1) debugging interface.
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [1] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 38400 bps
=> CD = 78.125 - (FP / 8)
Set FP = 1, CD = 78 = 0x4E

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26 = 0x1A

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
%SSP%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
LCD USART Setup in SSP mode

SPI mode to communicate with an SPI LCD screen. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [1] RXDIS receiver disabled
    04 [0] RXEN receiver not enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
ANT USART Setup in SSP
SPI slave mode to communicate with an ANT device. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK (delicious!) NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as soon as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [1] USCLKS SCK
    04 [1] "

    03 [1] USART_MODE SPI Slave
    02 [1] "
    01 [1] "
    00 [1] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [1] CTSIC Clear to Send Change interrupt enabled 
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled 

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled 

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled YET
    00 [0] RXRDY Receiver Ready interrupt enabled 
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
!!!!! Not applicable for slave (note that incoming clock cannot 
exceed MCLK/6 = 8MHz.  To date, ANT devices communicate at 500kHz
or 2MHz, so no issues.
*/



/*----------------------------------------------------------------------------------------------------------------------
SD USART Setup in SSP mode

SPI mode to communicate with an SPI SD card. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled for now
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*--------------------------------------------------------------------------------------------------------------------
Two Wire Interface setup

I�C Master mode for ASCII LCD communication
*/

/*-------------------- TWI0 ---------------------*/
/*Control Register*/

/*
    31-8 [0] Reserved

    07 [0] SWRST - Software reset
    06 [0] QUICK - SMBUS Quick Command
    05 [1] SVDIS - Slave mode disable - disabled
    04 [0] SVEN - Slave mode enable

    03 [0] MSDIS - Master mode disable
    02 [1] MSEN - Master mode enable
    01 [0] STOP - Stop a transfer
    00 [0] START - Start a transfer
*/

/*Master Mode Register*/

/*
    31-24 [0] Reserved
    
    23 [0] Reserved
    22 [0] DADR - device slave address - start with zero
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] MREAD - Master Read Direction - 0 -> Write, 1 -> Read

    11 [0] Reserved
    10 [0] "
    09 [0] IADRSZ - Internal device address - 0 = no internal device address
    08 [0] "

    07-0 [0] Reserved
*/

/* Clock Wave Generator Register */
/* 
    Calculation:
        T_low = ((CLDIV * (2^CKDIV))+4) * T_MCK
        T_high = ((CHDIV * (2^CKDIV))+4) * T_MCK

        T_MCK - period of master clock = 1/(48 MHz)
        T_low/T_high - period of the low and high signals
        
        CKDIV = 2, CHDIV and CLDIV = 59
        T_low/T_high = 2.5 microseconds

        Data frequency - 
        f = ((T_low + T_high)^-1)
        f = 200000 Hz 0r 200 kHz

    Additional Rates:
        50 kHz - 0x00027777
       100 kHz - 0x00023B3B
       200 kHz - 0x00021D1D
       400 kHz - 0x00030707  *Maximum rate*
*/

/*
    31-20 [0] Reserved
    
    19 [0] Reserved
    18 [0] CKDIV
    17 [1] "
    16 [0] "

    15 [0] CHDIV
    14 [0] "
    13 [0] "
    12 [1] "

    11 [1] "
    10 [1] "
    09 [0] "
    08 [1] "

    07 [0] CLDIV - Clock Low Divider
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [1] "
    01 [0] "
    00 [1] "
*/

/*Interrupt Enable Register*/

/*
    31-16 [0] Reserved

    15 [0] TXBUFE - Transmit Buffer Empty
    14 [0] RXBUFF - Receive Buffer Full
    13 [0] ENDTX - End of Transmit Buffer
    12 [0] ENDRX - End of Receive Buffer

    11 [0] EOSACC - End of Slave Address
    10 [0] SCL_WS - Clock Wait State
    09 [0] ARBLST - Arbitration Lost
    08 [1] NACK - Not Acknowledge

    07 [0] Reserved
    06 [1] OVRE - Overrun Error
    05 [0] GACC - General Call Access
    04 [0] SVACC - Slave Access

    03 [0] Reserved
    02 [0] TXRDY - Transmit Holding Register Ready
    01 [1] RXRDY - Receive Holding Register Ready
    00 [0] TXCOMP - Transmission Completed
*/

/*Interrupt Disable Register*/

/*
    31-16 [0] Reserved

    15 [1] TXBUFE - Transmit Buffer Empty
    14 [1] RXBUFF - Receive Buffer Full
    13 [1] ENDTX - End of Transmit Buffer
    12 [1] ENDRX - End of Receive Buffer

    11 [1] EOSACC - End of Slave Address
    10 [1] SCL_WS - Clock Wait State
    09 [1] ARBLST - Arbitration Lost
    08 [0] NACK - Not Acknowledge

    07 [0] Reserved
    06 [0] OVRE - Overrun Error
    05 [1] GACC - General Call Access
    04 [1] SVACC - Slave Access

    03 [0] Reserved
    02 [1] TXRDY - Transmit Holding Register Ready
    01 [0] RXRDY - Receive Holding Register Ready
    00 [1] TXCOMP - Transmission Completed
*/



/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/

#line 12 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\sam3u_uart.h"

/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/
typedef struct 
{
  PeripheralType UartPeripheral;      /* Easy name of peripheral */
  u16 u16RxBufferSize;                /* Size of receive buffer in bytes */
  u8* pu8RxBufferAddress;             /* Address to circular receive buffer */
  u8** pu8RxNextByte;                 /* Pointer to buffer location where next received byte will be placed */
  fnCode_type fnRxCallback;           /* Callback function for receiving data */
} UartConfigurationType;

typedef struct 
{
  AT91PS_USART pBaseAddress;          /* Base address of the associated peripheral */
  u32 u32PrivateFlags;            /* Flags for peripheral */
  MessageType* psTransmitBuffer;      /* Pointer to the transmit message linked list */
  u32 u32CurrentTxBytesRemaining;     /* Counter for bytes remaining in current transfer */
  u8* pu8CurrentTxData;               /* Pointer to current location in the Tx buffer */
  u8* pu8RxBuffer;                    /* Pointer to circular receive buffer in user application */
  u8** pu8RxNextByte;                 /* Pointer to buffer location where next received byte will be placed */
  fnCode_type fnRxCallback;           /* Callback function for receiving data */
  u16 u16RxBufferSize;                /* Size of receive buffer in bytes */
  u8 u8PeripheralId;                  /* Simple peripheral ID number */
  u8 u8Pad;
} UartPeripheralType;

/* u32PrivateFlags */



/**********************************************************************************************************************
Constants / Definitions
**********************************************************************************************************************/
/* G_u32UartxApplicationFlags */




/* end G_u32UartxApplicationFlags */

/* UART_u32Flags (UART application flags) */




/* end of UART_u32Flags */









/* The UART peripheral base addresses are essentially re-defined here because the defs in AT91SAM3U4.h can't be
casted back to integers for comparisons as far as we could tell! */









/***********************************************************************************************************************
Constants / Definitions
***********************************************************************************************************************/


/**********************************************************************************************************************
* Function Declarations
**********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions */
/*--------------------------------------------------------------------------------------------------------------------*/
bool Uart_putc(u8 u8Char_);
bool Uart_getc(u8* pu8Byte_);
bool UartCheckForNewChar(void);

UartPeripheralType* UartRequest(UartConfigurationType* psUartConfig_);
void UartRelease(UartPeripheralType* psUartPeripheral_);

u32 UartWriteByte(UartPeripheralType* psUartPeripheral_, u8 u8Byte_);
u32 UartWriteData(UartPeripheralType* psUartPeripheral_, u32 u32Size_, u8* u8Data_);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions */
/*--------------------------------------------------------------------------------------------------------------------*/
void UartInitialize(void);
void UartRunActiveState(void);

void UartManualMode(void);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions */
/*--------------------------------------------------------------------------------------------------------------------*/
//static void UartFillTxBuffer(UartPeripheralType* UartPeripheral_);
//static void UartReadRxBuffer(UartPeripheralType* psTargetUart_);

void UART_IRQHandler(void);
void UART0_IRQHandler(void);
void UART1_IRQHandler(void);
void UART2_IRQHandler(void);
void UartGenericHandler(void);


/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
void UartSM_Idle(void);
void UartSM_Transmitting(void);
void UartSM_Error(void);         





/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 66 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\drivers\\adc12.h"
/**********************************************************************************************************************
File: adc12.h                                                                

Description:
Header file for adc12.c

**********************************************************************************************************************/




/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/
typedef enum {ADC12_CH0 = 0, ADC12_CH1 = 1, ADC12_CH2 = 2, ADC12_CH3 = 3, 
              ADC12_CH4 = 4, ADC12_CH5 = 5, ADC12_CH6 = 6, ADC12_CH7 = 7} Adc12ChannelType;


/**********************************************************************************************************************
Constants / Definitions
**********************************************************************************************************************/

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [1] SHTIM set for maximum time to allow for maximum source impedance
    26 [1] "
    25 [1] "
    24 [1] "

    23 [0] STARTUP set for maximum startup time at 1MHz ADC clock
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] "
    18 [1] "
    17 [0] "
    16 [0] "

    15 [0] PRESCAL is 23 (gives 1MHz ADC clock)
    14 [0] "
    13 [0] "
    12 [1] "

    11 [0] "
    10 [1] "
    09 [1] "
    08 [1] "

    07 [0] Reserved
    06 [0] "
    05 [0] SLEEP Normal mode
    04 [0] LOWRES 12-bit resolution

    03 [0] TRGSEL not applicable
    02 [0] "
    01 [0] "
    00 [0] TRGEN Hardware triggers disabled
*/


/*
    31-08 [0] Reserved

    07 [1] CH7 disabled
    06 [1] CH6 disabled
    05 [1] CH5 disabled
    04 [1] CH4 disabled

    03 [1] CH3 disabled
    02 [1] CH2 disabled
    01 [1] CH1 disabled
    00 [1] CH0 disabled
*/


/*
    31 [0] Reserved 
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] "

    23 [0] "
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] OFFSET Vrefin/2G
    16 [0] DIFF Single ended mode

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] IBCTL Bias current control typical
    08 [1] 

    07 [0] Reserved
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] "
    02 [0] "
    01 [0] GAIN 1
    00 [1] "
*/



/*
    31-24 [0] Reserved

    23 [0] OFF_MODE_STARTUP_TIME target 40us
    22 [0] (4 + 1)*8/1MHz = 40us
    21 [0] "
    20 [0] "

    19 [0] "
    18 [1] "
    17 [0] "
    16 [0] "

    15-4 [0] Reserved

    03 [0] Reserved
    02 [0] "
    01 [0] "
    00 [1] OFFMODES Use off mode
*/


/*
    31 - 20 [0] Reserved

    19 [1] RXBUFF: Receive Buffer Full Interrupt Disabled
    18 [1] ENDRX: End of Receive Buffer Interrupt Disabled
    17 [1] GOVRE: General Overrun Error Interrupt Disabled
    16 [1] DRDY: Data Ready Interrupt Disabled

    15 [1] OVRE7: Overrun Error Interrupt Disabled
    14 [1] OVRE6: Overrun Error Interrupt Disabled
    13 [1] OVRE5: Overrun Error Interrupt Disabled
    12 [1] OVRE4: Overrun Error Interrupt Disabled

    11 [1] OVRE3: Overrun Error Interrupt Disabled
    10 [1] OVRE2: Overrun Error Interrupt Disabled
    09 [1] OVRE1: Overrun Error Interrupt Disabled
    08 [1] OVRE0: Overrun Error Interrupt Disabled

    07 [1] EOC7: End of Conversion Interrupt Disabled
    06 [1] EOC6: End of Conversion Interrupt Disabled
    05 [1] EOC5: End of Conversion Interrupt Disabled
    04 [1] EOC4: End of Conversion Interrupt Disabled

    03 [1] EOC3: End of Conversion Interrupt Disabled
    02 [1] EOC2: End of Conversion Interrupt Disabled
    01 [1] EOC1: End of Conversion Interrupt Disabled
    00 [1] EOC0: End of Conversion Interrupt Disabled
*/

/**********************************************************************************************************************
Function Declarations
**********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions                                                                                                   */
/*--------------------------------------------------------------------------------------------------------------------*/





bool Adc12StartConversion(Adc12ChannelType eAdcChannel_);
void Adc12AssignCallback(Adc12ChannelType eAdcChannel_, fnCode_u16_type fpUserCallback_);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions                                                                                                */
/*--------------------------------------------------------------------------------------------------------------------*/
void Adc12Initialize(void);
void Adc12RunActiveState(void);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions                                                                                                  */
/*--------------------------------------------------------------------------------------------------------------------*/
void Adc12DefaultCallback(u16 u16Result_);


/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
static void Adc12SM_Idle(void);    

static void Adc12SM_Error(void);         
static void Adc12SM_FailedInit(void);        





/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File                                                                                                        */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 67 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"

/* EIEF1-PCB-01 specific header files */







/* MPGL2-specific header files */
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\bsp\\mpgl2-ehdw-02.h"
/***********************************************************************************************************************
* File: mpgl2-ehdw-02.h                                                                
* 
* Description:
* This file provides header information for the mpgl2-ehdw-02 board.
***********************************************************************************************************************/




/***********************************************************************************************************************
Type Definitions
***********************************************************************************************************************/

/***********************************************************************************************************************
* Constants
***********************************************************************************************************************/
#line 27 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\bsp\\mpgl2-ehdw-02.h"



//#define SYSTICK_COUNT             (u32)6000
/* To get 1 ms tick, need SYSTICK_COUNT to be 0.001 * SysTick Clock.  
Should be 6000 for 48MHz CCLK. */








/***********************************************************************************************************************
* Macros
***********************************************************************************************************************/





/***********************************************************************************************************************
* Function Declarations
***********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public Functions */
/*--------------------------------------------------------------------------------------------------------------------*/
void SystemStatusReport(void);

void PWMSetupAudio(void);
void PWMAudioSetFrequency(u32 u32Channel_, u16 u16Frequency_);
void PWMAudioOn(u32 u32Channel_);
void PWMAudioOff(u32 u32Channel_);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected Functions */
/*--------------------------------------------------------------------------------------------------------------------*/
void ClockSetup(void);
void SysTickSetup(void);
void SystemSleep(void);
void WatchDogSetup(void);
void GpioSetup(void);


/***********************************************************************************************************************
Perihperal Setup Initializations

Bookmarks:
@@@@@ Clock, Power Control, Systick and Watchdog setup values
!!!!! GPIO pin names
##### GPIO initial setup values
$$$$$ PWM setup values

***********************************************************************************************************************/

/***********************************************************************************************************************
@@@@@ Clock, Systick and Power Control setup values
***********************************************************************************************************************/

/*
    31 [0] Reserved
    30 [0] "
    29 [1] AT91C_ID_UDPHS  USB Device High Speed clock enabled
    28 [0] AT91C_ID_HDMA   HDMA

    27 [0] AT91C_ID_ADC    10-bit ADC Controller (ADC)
    26 [1] AT91C_ID_ADC12B 12-bit ADC Controller (ADC12B) clock enabled
    25 [1] AT91C_ID_PWMC   Pulse Width Modulation Controller clock enabled
    24 [1] AT91C_ID_TC2    Timer Counter 2 clock enabled

    23 [1] AT91C_ID_TC1    Timer Counter 1 clock enabled
    22 [1] AT91C_ID_TC0    Timer Counter 0 clock enabled
    21 [1] AT91C_ID_SSC0   Serial Synchronous Controller 0 clock enabled
    20 [1] AT91C_ID_SPI0   Serial Peripheral Interface clock enabled

    19 [1] AT91C_ID_TWI1   TWI 1 clock enabled
    18 [1] AT91C_ID_TWI0   TWI 0 clock enabled
    17 [0] AT91C_ID_MCI0   Multimedia Card Interface
    16 [0] AT91C_ID_US3    USART 3

    15 [1] AT91C_ID_US2    USART 2 clock enabled
    14 [1] AT91C_ID_US1    USART 1 clock enabled
    13 [1] AT91C_ID_US0    USART 0 clock enabled
    12 [0] AT91C_ID_PIOC   Parallel IO Controller C 

    11 [1] AT91C_ID_PIOB   Parallel IO Controller B clock enabled
    10 [1] AT91C_ID_PIOA   Parallel IO Controller A clock enabled
    09 [0] AT91C_ID_HSMC4  HSMC4
    08 [1] AT91C_ID_DBGU   DBGU (standalone UART) clock enabled

    07 [0] AT91C_ID_EFC1   EFC1
    06 [1] AT91C_ID_EFC0   EFC0 clock enabled
    05 [1] AT91C_ID_PMC    PMC clock enabled
    04 [1] AT91C_ID_WDG    WATCHDOG TIMER clock enabled

    03 [0] AT91C_ID_RTT    REAL TIME TIMER
    02 [0] AT91C_ID_RTC    REAL TIME CLOCK
    01 [1] AT91C_ID_RSTC   RESET CONTROLLER clock enabled
    00 [1] AT91C_ID_SUPC   SUPPLY CONTROLLER clock enabled
*/



/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] CFDEN clock failure detector disabled
    24 [0] MOSCSEL internal main oscillator selected for now

    23 [0] KEY 0x37
    22 [0] "
    21 [1] "
    20 [1] "

    19 [0] "
    18 [1] "
    17 [1] "
    16 [1] "

    15 [1] MOSCXTST main crystal start-up time (based on 8 x the slow clock frequency)
    14 [1] "
    13 [1] "
    12 [1] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] Reserved
    06 [0] MOSCRCF 4MHz
    05 [0] "
    04 [0] "

    03 [1] MOSCRCEN main on-chip RC osc is on for now
    02 [0] WAITMODE disabled
    01 [0] MOSCXTBY main crystal osc is not bypassed
    00 [1] MOSCXTEN main crystal osc is enabled
*/



/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] "

    23 [0] "
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] "
    14 [0] "
    13 [1] UPLLDIV UPLL divided by 2 
    12 [0] Reserved 

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] PRES processor clock prescaler selected clock divided by 2
    05 [0] 
    04 [1] 

    03 [0] 
    02 [0] 
    01 [0] CSS Master clock selection MAIN_CLK for now
    00 [1] 
*/




/* The PLL DIVA and MULA coefficients set the PLLA output frequency.
The PLLA input frequency must be between 8 and 16 MHz so with 12MHz clock, DIVA must be 1.
Since we want PLLACK at 96 MHz:
(96 MHZ * DIVA / 12 MHz) - 1 = MULA = 7
*/


/* Bit Set Description
    31 [0] Reserved
    30 [0] "
    29 [1] Always 1
    28 [0] "

    27 [0] "
    26 [0] MULA
    25 [0] "
    24 [0] "


    23 [0] "
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] "
    18 [1] "
    17 [1] "
    16 [1] "

    15 [0] Reserved
    14 [0] "
    13 [1] PLLACOUNT
    12 [1] "

    11 [1] "
    10 [1] "
    09 [1] "
    08 [1] "

    07 [0] DIVA
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [1] "
*/






/* Bit Set Description
    31:20 Reserved 

    19 [0] Reserved
    18 [0] "
    17 [0] "
    16 [0] Countflag (read only)

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] "
    02 [0] Clock source is CPU clock / 8
    01 [1] System tick interrupt on 
    00 [1] System tick is enabled 
*/


/* Watch Dog Values
The watchdog oscillator is on the internal 32k RC with a 128 prescaler = 3.9ms / tick.  For a minimum 5 second watchdog timeout, the watchdog
counter must be set at 1280. */


/*
    31 [1] Key
    30 [0] " 
    29 [1] "
    28 [0] "

    27 [0] "
    26 [1] "
    25 [0] "
    24 [1] "

    23 - 04 [0] Reserved

    03 [0] Reserved
    02 [0] "
    01 [0] "
    00 [1] WDRSTT Restart watchdog
*/



/*
    31 [0] Reserved
    30 [0] "
    29 [0] WDIDLEHLT Watchdog runs when system is idle
    28 [1] WDDBGHLT Watchdog stops in debug state

    27 [0] WDD Watchdog delta value
    26 [0] "
    25 [0] "
    24 [0] "

    23 [0] "
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [1] "

    15 [1] WDDIS Watchdog is disabled for now
    14 [0] WDRPROC watchdog reset processor off
    13 [0] WDRSTEN Watchdog reset enable off
    12 [0] WDFIEN Watchdog fault interrupt enable off

    11 [0] WDV Watchdog counter value
    10 [1] "
    09 [0] "
    08 [1] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/***********************************************************************************************************************
!!!!! GPIO pin names
***********************************************************************************************************************/
/* Hardware Definition for PCB MPGL1-EHDW-01 */

/* Port A bit positions */
#line 414 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\bsp\\mpgl2-ehdw-02.h"


/* Port B bit positions */
#line 449 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\bsp\\mpgl2-ehdw-02.h"


/***********************************************************************************************************************
##### GPIO setup values
***********************************************************************************************************************/

/* PIO Enable Register: 
0: No effect
1: Pin is controlled by PIO
*/

/* 
    31 [1] PA_31_HEARTBEAT PIO control enabled
    30 [1] PA_30_TP44 PIO control enabled
    29 [1] PA_29_LED0_GRN PIO control enabled
    28 [0] PA_28_BUZZER PIO control not enabled

    27 [0] PA_27_CLOCK_OUT PIO control not enabled
    26 [1] PA_26_LED2_GRN PIO control enabled
    25 [0] PA_25_ANT_USPI2_SCK PIO control not enabled
    24 [0] PA_24_LCD_USPI1_SCK PIO control not enabled

    23 [0] PA_23_ANT_USPI2_MOSI PIO control not enabled
    22 [0] PA_22_ANT_USPI2_MISO PIO control not enabled
    21 [1] PA_21_TP57 PIO control enabled
    20 [0] PA_20_LCD_USPI1_MOSI PIO control not enabled

    19 [0] PA_19_DEBUG_U0_PIMO PIO control not enabled
    18 [0] PA_18_DEBUG_U0_POMI PIO control not enabled
    17 [1] PA_17_BUTTON0 PIO control enabled
    16 [1] PA_16_BLADE_CS PIO control enabled

    15 [0] PA_15_BLADE_SCK PIO control not enabled
    14 [0] PA_14_BLADE_MOSI PIO control not enabled
    13 [0] PA_13_BLADE_MISO PIO control not enabled
    12 [0] PA_12_BLADE_UPOMI PIO control not enabled

    11 [0] PA_11_BLADE_UPIMO PIO control not enabled
    10 [0] PA_10_I2C_SCL PIO control not enabled
    09 [0] PA_09_I2C_SDA PIO control not enabled
    08 [1] PA_08_LED3_BLU PIO control enabled

    07 [1] PA_07_LED3_GRN PIO control enabled
    06 [1] PA_06_LED2_BLU PIO control enabled
    05 [1] PA_05_HSLIDE_CH2_Y PIO control enabled
    04 [1] PA_04_HSLIDE_CH2_X PIO control enabled

    03 [1] PA_03_HSLIDE_CH1_Y PIO control enabled
    02 [1] PA_02_HSLIDE_CH1_X PIO control enabled
    01 [1] PA_01_HSLIDE_CH0_Y PIO control enabled
    00 [1] PA_00_HSLIDE_CH0_X PIO control enabled
*/


/*
    31 [0] PB_31_ PIO control not enabled
    30 [0] PB_30_ PIO control not enabled
    29 [0] PB_29_ PIO control not enabled
    28 [0] PB_28_ PIO control not enabled

    27 [0] PB_27_ PIO control not enabled
    26 [0] PB_26_ PIO control not enabled
    25 [0] PB_25_ PIO control not enabled
    24 [1] PB_24_ANT_SRDY PIO control enabled

    23 [1] PB_23_ANT_MRDY PIO control enabled
    22 [0] PB_22_ANT_USPI2_CS PIO control not enabled
    21 [1] PB_21_ANT_RESET PIO control enabled
    20 [1] PB_20_LED0_RED PIO control enabled

    19 [1] PB_19_LED2_RED PIO control enabled
    18 [1] PB_18_LED3_RED PIO control enabled
    17 [1] PB_17_LED1_RED PIO control enabled
    16 [1] PB_16_LCD_RD PIO control enabled

    15 [1] PB_15_LCD_A0 PIO control enabled
    14 [1] PB_14_LCD_RST PIO control enabled
    13 [1] PB_13_LED1_BLU PIO control enabled
    12 [1] PB_12_LCD_CS PIO control enabled

    11 [1] PB_11_VSLIDE_CH2_Y PIO control enabled
    10 [1] PB_10_VSLIDE_CH2_X PIO control enabled
    09 [1] PB_09_VSLIDE_CH1_Y PIO control enabled
    08 [1] PB_08_VSLIDE_CH1_X PIO control enabled

    07 [1] PB_07_VSLIDE_CH0_Y PIO control enabled
    06 [1] PB_06_VSLIDE_CH0_X PIO control enabled
    05 [1] PB_05_LCD_BL PIO control enabled
    04 [0] PB_04_BLADE_AN1 PIO control not enabled

    03 [0] PB_03_BLADE_AN0 PIO control not enabled
    02 [1] PB_02_LED1_GRN PIO control enabled
    01 [1] PB_01_LED0_BLU PIO control enabled
    00 [1] PB_00_BUTTON1 PIO control enabled
*/


/* PIO Disable Register: 
0: No effect
1: Pin is controlled by corresponding peripheral
*/

/* 
    31 [0] PA_31_HEARTBEAT not controlled by peripheral
    30 [0] PA_30_TP44 not controlled by peripheral
    29 [0] PA_29_LED0_GRN not controlled by peripheral
    28 [1] PA_28_BUZZER controlled by peripheral

    27 [1] PA_27_CLOCK_OUT controlled by peripheral
    26 [0] PA_26_LED2_GRN not controlled by peripheral
    25 [1] PA_25_ANT_USPI2_SCK controlled by peripheral
    24 [1] PA_24_LCD_USPI1_SCK controlled by peripheral

    23 [1] PA_23_ANT_USPI2_MOSI controlled by peripheral
    22 [1] PA_22_ANT_USPI2_MISO controlled by peripheral
    21 [0] PA_21_TP57 not controlled by peripheral
    20 [1] PA_20_LCD_USPI1_MOSI controlled by peripheral

    19 [1] PA_19_DEBUG_U0_PIMO controlled by peripheral
    18 [1] PA_18_DEBUG_U0_POMI controlled by peripheral
    17 [0] PA_17_BUTTON0 not controlled by peripheral
    16 [0] PA_16_BLADE_CS not controlled by peripheral

    15 [1] PA_15_BLADE_SCK controlled by peripheral
    14 [1] PA_14_BLADE_MOSI controlled by peripheral
    13 [1] PA_13_BLADE_MISO controlled by peripheral
    12 [1] PA_12_BLADE_UPOMI controlled by peripheral

    11 [1] PA_11_BLADE_UPIMO controlled by peripheral
    10 [1] PA_10_I2C_SCL controlled by peripheral
    09 [1] PA_09_I2C_SDA controlled by peripheral
    08 [0] PA_08_LED3_BLU not controlled by peripheral

    07 [0] PA_07_LED3_GRN not controlled by peripheral
    06 [0] PA_06_LED2_BLU not controlled by peripheral
    05 [0] *PA_05_HSLIDE_CH2_Y not controlled by peripheral
    04 [0] *PA_04_HSLIDE_CH2_X not controlled by peripheral

    03 [0] *PA_03_HSLIDE_CH1_Y not controlled by peripheral
    02 [0] *PA_02_HSLIDE_CH1_X not controlled by peripheral
    01 [0] *PA_01_HSLIDE_CH0_Y not controlled by peripheral
    00 [0] *PA_00_HSLIDE_CH0_X not controlled by peripheral
*/


/*
    31 [0] PB_31_ 
    30 [0] PB_30_ 
    29 [0] PB_29_ 
    28 [0] PB_28_ 

    27 [0] PB_27_ 
    26 [0] PB_26_ 
    25 [0] PB_25_ 
    24 [0] PB_24_ANT_SRDY not controlled by peripheral

    23 [0] PB_23_ANT_MRDY not controlled by peripheral
    22 [1] PB_22_ANT_USPI2_CS controlled by peripheral
    21 [0] PB_21_ANT_RESET not controlled by peripheral
    20 [0] PB_20_LED0_RED not controlled by peripheral

    19 [0] PB_19_LED2_RED not controlled by peripheral
    18 [0] PB_18_LED3_RED not controlled by peripheral
    17 [0] PB_17_LED1_RED not controlled by peripheral
    16 [0] PB_16_LCD_RD not controlled by peripheral

    15 [0] PB_15_LCD_A0 not controlled by peripheral
    14 [0] PB_14_LCD_RST not controlled by peripheral
    13 [0] PB_13_LED1_BLU not controlled by peripheral
    12 [0] PB_12_LCD_CS not controlled by peripheral

    11 [0] PB_11_VSLIDE_CH2_Y not controlled by peripheral
    10 [0] PB_10_VSLIDE_CH2_X not controlled by peripheral
    09 [0] PB_09_VSLIDE_CH1_Y not controlled by peripheral
    08 [0] PB_08_VSLIDE_CH1_X not controlled by peripheral

    07 [0] PB_07_VSLIDE_CH0_Y not controlled by peripheral
    06 [0] PB_06_VSLIDE_CH0_X not controlled by peripheral
    05 [0] PB_05_LCD_BL not controlled by peripheral
    04 [1] PB_04_BLADE_AN1 controlled by peripheral

    03 [1] PB_03_BLADE_AN0 controlled by peripheral
    02 [0] PB_02_LED1_GRN not controlled by peripheral
    01 [0] PB_01_LED0_BLU not controlled by peripheral
    00 [0] PB_00_BUTTON1 not controlled by peripheral
*/

/* PIO Controller Output Enable Register
Configures the pin as an output or input.
0: No effect
1: Enables the output on the I/O line
*/

/* 
    31 [1] PA_31_HEARTBEAT output enabled
    30 [0] PA_30_TP44 input
    29 [1] PA_29_LED0_GRN output enabled
    28 [1] PA_28_BUZZER output enabled

    27 [1] PA_27_CLOCK_OUT output enabled
    26 [1] PA_26_LED2_GRN output enabled
    25 [1] PA_25_ANT_USPI2_SCK output enabled
    24 [1] PA_24_LCD_USPI1_SCK output enabled

    23 [0] PA_23_ANT_USPI2_MOSI input
    22 [1] PA_22_ANT_USPI2_MISO output enabled
    21 [0] PA_21_TP57 input
    20 [1] PA_20_LCD_USPI1_MOSI output enabled

    19 [0] PA_19_DEBUG_U0_PIMO input
    18 [1] PA_18_DEBUG_U0_POMI output enabled
    17 [0] PA_17_BUTTON0 input
    16 [1] PA_16_BLADE_CS output enabled

    15 [1] PA_15_BLADE_SCK output enabled
    14 [1] PA_14_BLADE_MOSI output enabled
    13 [0] PA_13_BLADE_MISO input
    12 [1] PA_12_BLADE_UPOMI output enabled

    11 [0] PA_11_BLADE_UPIMO  input
    10 [1] PA_10_I2C_SCL output enabled
    09 [1] PA_09_I2C_SDA output enabled
    08 [1] PA_08_LED3_BLU output enabled

    07 [1] PA_07_LED3_GRN output enabled
    06 [1] PA_06_LED2_BLU output enabled
    05 [0] PA_05_HSLIDE_CH2_Y input
    04 [1] PA_04_HSLIDE_CH2_X output enabled

    03 [0] PA_03_HSLIDE_CH1_Y input
    02 [1] PA_02_HSLIDE_CH1_X output enabled
    01 [0] PA_01_HSLIDE_CH0_Y input
    00 [1] PA_00_HSLIDE_CH0_X output enabled
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [1] PB_24_ANT_SRDY output enabled

    23 [1] PB_23_ANT_MRDY output enabled
    22 [0] PB_22_ANT_USPI2_CS input
    21 [0] PB_21_ANT_RESET output NOT enabled yet
    20 [1] PB_20_LED0_RED output enabled

    19 [1] PB_19_LED2_RED output enabled
    18 [1] PB_18_LED3_RED output enabled
    17 [1] PB_17_LED1_RED output enabled
    16 [1] PB_16_LCD_RD output enabled

    15 [1] PB_15_LCD_A0 output enabled
    14 [1] PB_14_LCD_RST output enabled
    13 [1] PB_13_LED1_BLU output enabled
    12 [1] PB_12_LCD_CS output enabled

    11 [0] PB_11_VSLIDE_CH2_Y input
    10 [1] PB_10_VSLIDE_CH2_X output enabled
    09 [0] PB_09_VSLIDE_CH1_Y input
    08 [1] PB_08_VSLIDE_CH1_X output enabled

    07 [0] PB_07_VSLIDE_CH0_Y input
    06 [1] PB_06_VSLIDE_CH0_X output enabled
    05 [1] PB_05_LCD_BL output enabled
    04 [0] PB_04_BLADE_AN1 input

    03 [0] PB_03_BLADE_AN0 input
    02 [1] PB_02_LED1_GRN output enabled
    01 [1] PB_01_LED0_BLU output enabled
    00 [0] PB_00_BUTTON1 input
*/

/* PIO Controller Output Disable Register
0: No effect
1: Disables the output on the I/O line.
*/

/* 
    31 [0] PA_31_HEARTBEAT output 
    30 [1] PA_30_TP44 input
    29 [0] PA_29_LED0_GRN output 
    28 [0] PA_28_BUZZER output 

    27 [0] PA_27_CLOCK_OUT output 
    26 [0] PA_26_LED2_GRN output 
    25 [0] PA_25_ANT_USPI2_SCK output 
    24 [0] PA_24_LCD_USPI1_SCK output 

    23 [1] PA_23_ANT_USPI2_MOSI input
    22 [0] PA_22_ANT_USPI2_MISO output 
    21 [1] PA_21_TP57 input 
    20 [0] PA_20_LCD_USPI1_MOSI output 

    19 [1] PA_19_DEBUG_U0_PIMO input
    18 [0] PA_18_DEBUG_U0_POMI output 
    17 [1] PA_17_BUTTON0 input
    16 [0] PA_16_BLADE_CS output 

    15 [0] PA_15_BLADE_SCK output 
    14 [0] PA_14_BLADE_MOSI output 
    13 [1] PA_13_BLADE_MISO input
    12 [0] PA_12_BLADE_UPOMI output 

    11 [1] PA_11_BLADE_UPIMO input
    10 [0] PA_10_I2C_SCL output 
    09 [0] PA_09_I2C_SDA output 
    08 [0] PA_08_LED3_BLU output 

    07 [0] PA_07_LED3_GRN output 
    06 [0] PA_06_LED2_BLU output 
    05 [1] PA_05_HSLIDE_CH2_Y input 
    04 [0] PA_04_HSLIDE_CH2_X output 

    03 [1] PA_03_HSLIDE_CH1_Y input 
    02 [0] PA_02_HSLIDE_CH1_X output
    01 [1] PA_01_HSLIDE_CH0_Y input
    00 [0] PA_00_HSLIDE_CH0_X output 
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [0] PB_24_ANT_SRDY output

    23 [0] PB_23_ANT_MRDY output
    22 [1] PB_22_ANT_USPI2_CS input
    21 [0] PB_21_ANT_RESET output 
    20 [0] PB_20_LED0_RED output 

    19 [0] PB_19_LED2_RED output 
    18 [0] PB_18_LED3_RED output 
    17 [0] PB_17_LED1_RED output 
    16 [0] PB_16_LCD_RD output 

    15 [0] PB_15_LCD_A0 output 
    14 [0] PB_14_LCD_RST output 
    13 [0] PB_13_LED1_BLU output 
    12 [0] PB_12_LCD_CS output 

    11 [1] PB_11_VSLIDE_CH2_Y input 
    10 [0] PB_10_VSLIDE_CH2_X output 
    09 [1] PB_09_VSLIDE_CH1_Y input 
    08 [0] PB_08_VSLIDE_CH1_X output 

    07 [1] PB_07_VSLIDE_CH0_Y input 
    06 [0] PB_06_VSLIDE_CH0_X output 
    05 [0] PB_05_LCD_BL output 
    04 [1] PB_04_BLADE_AN1 input

    03 [1] PB_03_BLADE_AN0 input
    02 [0] PB_02_LED1_GRN output
    01 [0] PB_01_LED0_BLU output
    00 [1] PB_00_BUTTON1 input
*/

/* PIO Controller Input Filter Enable Register
0: No effect
1: Enables the input glitch filter on the I/O line.
*/

/* 
    31 [0] PA_31_HEARTBEAT no glitch filter
    30 [0] PA_30_TP44 no glitch filter
    29 [0] PA_29_LED0_GRN no glitch filter
    28 [0] PA_28_BUZZER no glitch filter

    27 [0] PA_27_CLOCK_OUT no glitch filter
    26 [0] PA_26_LED2_GRN no glitch filter
    25 [0] PA_25_ANT_USPI2_SCK no glitch filter
    24 [0] PA_24_LCD_USPI1_SCK no glitch filter

    23 [0] PA_23_ANT_USPI2_MOSI no glitch filter
    22 [0] PA_22_ANT_USPI2_MISO no glitch filter
    21 [0] PA_21_TP57 no glitch filter
    20 [0] PA_20_LCD_USPI1_MOSI no glitch filter

    19 [0] PA_19_DEBUG_U0_PIMO no glitch filter
    18 [0] PA_18_DEBUG_U0_POMI no glitch filter
    17 [0] PA_17_BUTTON0 no glitch filter
    16 [0] PA_16_BLADE_CS no glitch filter

    15 [0] PA_15_BLADE_SCK no glitch filter
    14 [0] PA_14_BLADE_MOSI no glitch filter
    13 [0] PA_13_BLADE_MISO no glitch filter
    12 [0] PA_12_BLADE_UPOMI no glitch filter

    11 [0] PA_11_BLADE_UPIMO no glitch filter
    10 [0] PA_10_I2C_SCL no glitch filter
    09 [0] PA_09_I2C_SDA no glitch filter
    08 [0] PA_08_LED3_BLU no glitch filter

    07 [0] PA_07_LED3_GRN no glitch filter
    06 [0] PA_06_LED2_BLU no glitch filter
    05 [0] PA_05_HSLIDE_CH2_Y no glitch filter
    04 [0] PA_04_HSLIDE_CH2_X no glitch filter

    03 [0] PA_03_HSLIDE_CH1_Y no glitch filter
    02 [0] PA_02_HSLIDE_CH1_X no glitch filter
    01 [0] PA_01_HSLIDE_CH0_Y no glitch filter
    00 [0] PA_00_HSLIDE_CH0_X no glitch filter
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [0] PB_24_ANT_SRDY no glitch filter

    23 [0] PB_23_ANT_MRDY no glitch filter
    22 [0] PB_22_ANT_USPI2_CS no glitch filter
    21 [0] PB_21_ANT_RESET no glitch filter
    20 [0] PB_20_LED0_RED no glitch filter

    19 [0] PB_19_LED2_RED no glitch filter
    18 [0] PB_18_LED3_RED no glitch filter
    17 [0] PB_17_LED1_RED no glitch filter
    16 [0] PB_16_LCD_RD no glitch filter

    15 [0] PB_15_LCD_A0 no glitch filter
    14 [0] PB_14_LCD_RST no glitch filter
    13 [0] PB_13_LED1_BLU no glitch filter
    12 [0] PB_12_LCD_CS no glitch filter

    11 [0] PB_11_VSLIDE_CH2_Y no glitch filter
    10 [0] PB_10_VSLIDE_CH2_X no glitch filter
    09 [0] PB_09_VSLIDE_CH1_Y no glitch filter
    08 [0] PB_08_VSLIDE_CH1_X no glitch filter

    07 [0] PB_07_VSLIDE_CH0_Y no glitch filter
    06 [0] PB_06_VSLIDE_CH0_X no glitch filter
    05 [0] PB_05_LCD_BL no glitch filter
    04 [0] PB_04_BLADE_AN1 no glitch filter

    03 [0] PB_03_BLADE_AN0 no glitch filter
    02 [0] PB_02_LED1_GRN no glitch filter
    01 [0] PB_01_LED0_BLU no glitch filter
    00 [0] PB_00_BUTTON1 no glitch filter
*/

/* PIO Controller Input Filter Disable Register
0: No effect
1: Disables the input glitch filter on the I/O line.
*/

/* 
    31 [0] PA_31_HEARTBEAT no input filter
    30 [0] PA_30_TP44 no input filter
    29 [0] PA_29_LED0_GRN no input filter
    28 [0] PA_28_BUZZER no input filter

    27 [0] PA_27_CLOCK_OUT no input filter
    26 [0] PA_26_LED2_GRN no input filter
    25 [0] PA_25_ANT_USPI2_SCK no input filter
    24 [0] PA_24_LCD_USPI1_SCK no input filter

    23 [0] PA_23_ANT_USPI2_MOSI no input filter
    22 [0] PA_22_ANT_USPI2_MISO no input filter
    21 [0] PA_21_TP57 no input filter
    20 [0] PA_20_LCD_USPI1_MOSI no input filter

    19 [0] PA_19_DEBUG_U0_PIMO no input filter
    18 [0] PA_18_DEBUG_U0_POMI no input filter
    17 [0] PA_17_BUTTON0 no input filter
    16 [0] PA_16_BLADE_CS no input filter

    15 [0] PA_15_BLADE_SCK no input filter
    14 [0] PA_14_BLADE_MOSI no input filter
    13 [0] PA_13_BLADE_MISO no input filter
    12 [0] PA_12_BLADE_UPOMI no input filter

    11 [0] PA_11_BLADE_UPIMO no input filter
    10 [0] PA_10_I2C_SCL no input filter
    09 [0] PA_09_I2C_SDA no input filter
    08 [0] PA_08_LED3_BLU no input filter

    07 [0] PA_07_LED3_GRN no input filter
    06 [0] PA_06_LED2_BLU no input filter
    05 [0] PA_05_HSLIDE_CH2_Y no input filter
    04 [0] PA_04_HSLIDE_CH2_X no input filter

    03 [0] PA_03_HSLIDE_CH1_Y no input filter
    02 [0] PA_02_HSLIDE_CH1_X no input filter
    01 [0] PA_01_HSLIDE_CH0_Y no input filter
    00 [0] PA_00_HSLIDE_CH0_X no input filter
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [0] PB_24_ANT_SRDY no input filter

    23 [0] PB_23_ANT_MRDY no input filter
    22 [0] PB_22_ANT_USPI2_CS no input filter
    21 [0] PB_21_ANT_RESET no input filter
    20 [0] PB_20_LED0_RED no input filter

    19 [0] PB_19_LED2_RED no input filter
    18 [0] PB_18_LED3_RED no input filter
    17 [0] PB_17_LED1_RED no input filter
    16 [0] PB_16_LCD_RD no input filter

    15 [0] PB_15_LCD_A0 no input filter
    14 [0] PB_14_LCD_RST no input filter
    13 [0] PB_13_LED1_BLU no input filter
    12 [0] PB_12_LCD_CS no input filter

    11 [0] PB_11_VSLIDE_CH2_Y no input filter
    10 [0] PB_10_VSLIDE_CH2_X no input filter
    09 [0] PB_09_VSLIDE_CH1_Y no input filter
    08 [0] PB_08_VSLIDE_CH1_X no input filter

    07 [0] PB_07_VSLIDE_CH0_Y no input filter
    06 [0] PB_06_VSLIDE_CH0_X no input filter
    05 [0] PB_05_LCD_BL no input filter
    04 [0] PB_04_BLADE_AN1 no input filter

    03 [0] PB_03_BLADE_AN0 no input filter
    02 [0] PB_02_LED1_GRN no input filter
    01 [0] PB_01_LED0_BLU no input filter
    00 [0] PB_00_BUTTON1 no input filter
*/

/* PIO Controller Set Output Data Register
Default start-up IO values are held here.
0: No effect
1: Sets the data to be driven on the I/O line.
*/

/* 
    31 [1] PA_31_HEARTBEAT output high 
    30 [0] PA_30_TP44 N/A
    29 [0] PA_29_LED0_GRN output low
    28 [0] PA_28_BUZZER output low

    27 [1] PA_27_CLOCK_OUT output high
    26 [0] PA_26_LED2_GRN output low
    25 [0] PA_25_ANT_USPI2_SCK N/A
    24 [0] PA_24_LCD_USPI1_SCK N/A

    23 [0] PA_23_ANT_USPI2_MOSI N/A
    22 [0] PA_22_ANT_USPI2_MISO N/A
    21 [0] PA_21_TP57 N/A
    20 [0] PA_20_LCD_USPI1_MOSI N/A

    19 [0] PA_19_DEBUG_U0_PIMO N/A
    18 [0] PA_18_DEBUG_U0_POMI N/A
    17 [0] PA_17_BUTTON0 N/A
    16 [1] PA_16_BLADE_CS output high

    15 [0] PA_15_BLADE_SCK N/A
    14 [0] PA_14_BLADE_MOSI N/A
    13 [0] PA_13_BLADE_MISO N/A
    12 [0] PA_12_BLADE_UPOMI N/A

    11 [0] PA_11_BLADE_UPIMO N/A
    10 [0] PA_10_I2C_SCL N/A
    09 [0] PA_09_I2C_SDA N/A
    08 [0] PA_08_LED3_BLU output low

    07 [0] PA_07_LED3_GRN output low
    06 [0] PA_06_LED2_BLU output low
    05 [0] PA_05_HSLIDE_CH2_Y N/A
    04 [0] PA_04_HSLIDE_CH2_X output low

    03 [0] PA_03_HSLIDE_CH1_Y N/A
    02 [0] PA_02_HSLIDE_CH1_X output low
    01 [0] PA_01_HSLIDE_CH0_Y N/A
    00 [0] PA_00_HSLIDE_CH0_X output low
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [1] PB_24_ANT_SRDY output high

    23 [1] PB_23_ANT_MRDY output high
    22 [0] PB_22_ANT_USPI2_CS N/A
    21 [1] PB_21_ANT_RESET output high
    20 [0] PB_20_LED0_RED output low

    19 [0] PB_19_LED2_RED output low
    18 [0] PB_18_LED3_RED output low
    17 [0] PB_17_LED1_RED output low
    16 [1] PB_16_LCD_RD output high

    15 [1] PB_15_LCD_A0 output high
    14 [1] PB_14_LCD_RST output high
    13 [0] PB_13_LED1_BLU output low
    12 [1] PB_12_LCD_CS output high

    11 [0] PB_11_VSLIDE_CH2_Y N/A
    10 [0] PB_10_VSLIDE_CH2_X output low
    09 [0] PB_09_VSLIDE_CH1_Y N/A
    08 [0] PB_08_VSLIDE_CH1_X output low

    07 [0] PB_07_VSLIDE_CH0_Y N/A
    06 [0] PB_06_VSLIDE_CH0_X output low
    05 [0] PB_05_LCD_BL output low
    04 [0] PB_04_BLADE_AN1 N/A

    03 [0] PB_03_BLADE_AN0 N/A
    02 [0] PB_02_LED1_GRN output low
    01 [0] PB_01_LED0_BLU output low
    00 [0] PB_00_BUTTON1 N/A
*/

/* PIO Controller Clear Output Data Register
Initial output values are stored here.
0: No effect
1: Clears the data to be driven on the I/O line.
*/

/* 
    31 [0] PA_31_HEARTBEAT output high 
    30 [0] PA_30_TP44 N/A
    29 [1] PA_29_LED0_GRN output low
    28 [1] PA_28_BUZZER output low

    27 [0] PA_27_CLOCK_OUT output high
    26 [1] PA_26_LED2_GRN output low
    25 [0] PA_25_ANT_USPI2_SCK N/A
    24 [0] PA_24_LCD_USPI1_SCK N/A

    23 [0] PA_23_ANT_USPI2_MOSI N/A
    22 [0] PA_22_ANT_USPI2_MISO N/A
    21 [0] PA_21_TP57 N/A
    20 [0] PA_20_LCD_USPI1_MOSI N/A

    19 [0] PA_19_DEBUG_U0_PIMO N/A
    18 [0] PA_18_DEBUG_U0_POMI N/A
    17 [0] PA_17_BUTTON0 N/A
    16 [0] PA_16_BLADE_CS output high

    15 [0] PA_15_BLADE_SCK N/A
    14 [0] PA_14_BLADE_MOSI N/A
    13 [0] PA_13_BLADE_MISO N/A
    12 [0] PA_12_BLADE_UPOMI N/A

    11 [0] PA_11_BLADE_UPIMO N/A
    10 [0] PA_10_I2C_SCL N/A
    09 [0] PA_09_I2C_SDA N/A
    08 [1] PA_08_LED3_BLU output low

    07 [1] PA_07_LED3_GRN output low
    06 [1] PA_06_LED2_BLU output low
    05 [0] PA_05_HSLIDE_CH2_Y N/A
    04 [1] PA_04_HSLIDE_CH2_X output low

    03 [0] PA_03_HSLIDE_CH1_Y N/A
    02 [1] PA_02_HSLIDE_CH1_X output low
    01 [0] PA_01_HSLIDE_CH0_Y N/A
    00 [1] PA_00_HSLIDE_CH0_X output low
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [0] PB_24_ANT_SRDY output high

    23 [0] PB_23_ANT_MRDY output high
    22 [0] PB_22_ANT_USPI2_CS N/A
    21 [0] PB_21_ANT_RESET output high
    20 [1] PB_20_LED0_RED output low

    19 [1] PB_19_LED2_RED output low
    18 [1] PB_18_LED3_RED output low
    17 [1] PB_17_LED1_RED output low
    16 [0] PB_16_LCD_RD output high

    15 [0] PB_15_LCD_A0 output high
    14 [0] PB_14_LCD_RST output high
    13 [1] PB_13_LED1_BLU output low
    12 [0] PB_12_LCD_CS output high

    11 [0] PB_11_VSLIDE_CH2_Y N/A
    10 [1] PB_10_VSLIDE_CH2_X output low
    09 [0] PB_09_VSLIDE_CH1_Y N/A
    08 [1] PB_08_VSLIDE_CH1_X output low

    07 [0] PB_07_VSLIDE_CH0_Y N/A
    06 [1] PB_06_VSLIDE_CH0_X output low
    05 [1] PB_05_LCD_BL output low
    04 [0] PB_04_BLADE_AN1 N/A

    03 [0] PB_03_BLADE_AN0 N/A
    02 [1] PB_02_LED1_GRN output low
    01 [1] PB_01_LED0_BLU output low
    00 [0] PB_00_BUTTON1 N/A
*/

/* PIO Multi-driver (open drain) Enable Register
0: No effect
1: Enables Multi Drive on the I/O line.
*/

/* 
    31 [0] PA_31_HEARTBEAT
    30 [0] PA_30_TP44
    29 [0] PA_29_LED0_GRN
    28 [0] PA_28_BUZZER

    27 [0] PA_27_CLOCK_OUT
    26 [0] PA_26_LED2_GRN 
    25 [0] PA_25_ANT_USPI2_SCK
    24 [0] PA_24_LCD_USPI1_SCK

    23 [0] PA_23_ANT_USPI2_MOSI
    22 [0] PA_22_ANT_USPI2_MISO
    21 [0] PA_21_TP57
    20 [0] PA_20_LCD_USPI1_MOSI

    19 [0] PA_19_DEBUG_U0_PIMO
    18 [0] PA_18_DEBUG_U0_POMI
    17 [0] PA_17_BUTTON0
    16 [0] PA_16_BLADE_CS

    15 [0] PA_15_BLADE_SCK
    14 [0] PA_14_BLADE_MOSI
    13 [0] PA_13_BLADE_MISO
    12 [0] PA_12_BLADE_UPOMI

    11 [0] PA_11_BLADE_UPIMO
    10 [1] PA_10_I2C_SCL open drain
    09 [1] PA_09_I2C_SDA open drain
    08 [0] PA_08_LED3_BLU

    07 [0] PA_07_LED3_GRN
    06 [0] PA_06_LED2_BLU
    05 [0] PA_05_HSLIDE_CH2_Y
    04 [0] PA_04_HSLIDE_CH2_X

    03 [0] PA_03_HSLIDE_CH1_Y
    02 [0] PA_02_HSLIDE_CH1_X
    01 [0] PA_01_HSLIDE_CH0_Y
    00 [0] PA_00_HSLIDE_CH0_X
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [0] PB_24_ANT_SRDY

    23 [0] PB_23_ANT_MRDY
    22 [0] PB_22_ANT_USPI2_CS
    21 [0] PB_21_ANT_RESET
    20 [0] PB_20_LED0_RED

    19 [0] PB_19_LED2_RED
    18 [0] PB_18_LED3_RED
    17 [0] PB_17_LED1_RED
    16 [0] PB_16_LCD_RD

    15 [0] PB_15_LCD_A0
    14 [0] PB_14_LCD_RST
    13 [0] PB_13_LED1_BLU
    12 [0] PB_12_LCD_CS

    11 [0] PB_11_VSLIDE_CH2_Y
    10 [0] PB_10_VSLIDE_CH2_X
    09 [0] PB_09_VSLIDE_CH1_Y
    08 [0] PB_08_VSLIDE_CH1_X

    07 [0] PB_07_VSLIDE_CH0_Y
    06 [0] PB_06_VSLIDE_CH0_X
    05 [0] PB_05_LCD_BL
    04 [0] PB_04_BLADE_AN1

    03 [0] PB_03_BLADE_AN0
    02 [0] PB_02_LED1_GRN
    01 [0] PB_01_LED0_BLU
    00 [0] PB_00_BUTTON1
*/

/* PIO Multi-driver Disable Register
0: No effect
1: Disables Multi Drive on the I/O line.
*/

/* 
    31 [1] PA_31_HEARTBEAT not open drain
    30 [1] PA_30_TP44 not open drain
    29 [1] PA_29_LED0_GRN not open drain
    28 [1] PA_28_BUZZER not open drain

    27 [1] PA_27_CLOCK_OUT not open drain
    26 [1] PA_26_LED2_GRN not open drain
    25 [1] PA_25_ANT_USPI2_SCK not open drain
    24 [1] *PA_24_LCD_USPI1_SCK not open drain

    23 [1] PA_23_ANT_USPI2_MOSI not open drain
    22 [1] PA_22_ANT_USPI2_MISO not open drain
    21 [1] *PA_21_TP57 not open drain
    20 [1] *PA_20_LCD_USPI1_MOSI not open drain

    19 [1] PA_19_DEBUG_U0_PIMO not open drain
    18 [1] PA_18_DEBUG_U0_POMI not open drain
    17 [1] PA_17_BUTTON0 not open drain
    16 [1] PA_16_BLADE_CS not open drain

    15 [1] PA_15_BLADE_SCK not open drain
    14 [1] PA_14_BLADE_MOSI not open drain
    13 [1] PA_13_BLADE_MISO not open drain
    12 [1] PA_12_BLADE_UPOMI not open drain

    11 [1] PA_11_BLADE_UPIMO not open drain
    10 [0] PA_10_I2C_SCL
    09 [0] PA_09_I2C_SDA
    08 [1] PA_08_LED3_BLU not open drain

    07 [1] PA_07_LED3_GRN not open drain
    06 [1] PA_06_LED2_BLU not open drain
    05 [1] PA_05_HSLIDE_CH2_Y not open drain
    04 [1] PA_04_HSLIDE_CH2_X not open drain

    03 [1] PA_03_HSLIDE_CH1_Y not open drain
    02 [1] PA_02_HSLIDE_CH1_X not open drain
    01 [1] PA_01_HSLIDE_CH0_Y not open drain
    00 [1] PA_00_HSLIDE_CH0_X not open drain
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [1] PB_24_ANT_SRDY not open drain

    23 [1] PB_23_ANT_MRDY not open drain
    22 [1] PB_22_ANT_USPI2_CS not open drain
    21 [0] PB_21_ANT_RESET open drain
    20 [1] PB_20_LED0_RED not open drain

    19 [1] PB_19_LED2_RED not open drain
    18 [1] PB_18_LED3_RED not open drain
    17 [1] PB_17_LED1_RED not open drain
    16 [1] PB_16_LCD_RD not open drain

    15 [1] PB_15_LCD_A0 not open drain
    14 [1] PB_14_LCD_RST not open drain
    13 [1] PB_13_LED1_BLU not open drain
    12 [1] PB_12_LCD_CS not open drain

    11 [1] PB_11_VSLIDE_CH2_Y not open drain
    10 [1] PB_10_VSLIDE_CH2_X not open drain
    09 [1] PB_09_VSLIDE_CH1_Y not open drain
    08 [1] PB_08_VSLIDE_CH1_X not open drain

    07 [1] PB_07_VSLIDE_CH0_Y not open drain
    06 [1] PB_06_VSLIDE_CH0_X not open drain
    05 [1] PB_05_LCD_BL not open drain
    04 [1] PB_04_BLADE_AN1 not open drain

    03 [1] PB_03_BLADE_AN0 not open drain
    02 [1] PB_02_LED1_GRN not open drain
    01 [1] PB_01_LED0_BLU not open drain
    00 [1] PB_00_BUTTON1 not open drain
*/

/* PIO Pull Up Disable Register
0: No effect
1: Disables the pull up resistor on the I/O line.
*/

/* 
    31 [1] PA_31_HEARTBEAT no pull-up
    30 [1] PA_30_TP44 no pull-up
    29 [1] PA_29_LED0_GRN no pull-up
    28 [1] PA_28_BUZZER no pull-up

    27 [1] PA_27_CLOCK_OUT no pull-up
    26 [1] PA_26_LED2_GRN no pull-up
    25 [1] PA_25_ANT_USPI2_SCK no pull-up
    24 [1] PA_24_LCD_USPI1_SCK no pull-up

    23 [1] PA_23_ANT_USPI2_MOSI no pull-up
    22 [1] PA_22_ANT_USPI2_MISO no pull-up
    21 [1] PA_21_TP57 no pull-up
    20 [1] PA_20_LCD_USPI1_MOSI no pull-up

    19 [1] PA_19_DEBUG_U0_PIMO no pull-up
    18 [1] PA_18_DEBUG_U0_POMI no pull-up
    17 [1] PA_17_BUTTON0 no pull-up
    16 [1] PA_16_BLADE_CS no pull-up

    15 [1] PA_15_BLADE_SCK no pull-up
    14 [1] PA_14_BLADE_MOSI no pull-up
    13 [1] PA_13_BLADE_MISO no pull-up
    12 [1] PA_12_BLADE_UPOMI no pull-up

    11 [1] PA_11_BLADE_UPIMO no pull-up
    10 [1] PA_10_I2C_SCL no pull-up
    09 [1] PA_09_I2C_SDA no pull-up
    08 [1] PA_08_LED3_BLU no pull-up

    07 [1] PA_07_LED3_GRN no pull-up
    06 [1] PA_06_LED2_BLU no pull-up
    05 [1] PA_05_HSLIDE_CH2_Y no pull-up
    04 [1] PA_04_HSLIDE_CH2_X no pull-up

    03 [1] PA_03_HSLIDE_CH1_Y no pull-up
    02 [1] PA_02_HSLIDE_CH1_X no pull-up
    01 [1] PA_01_HSLIDE_CH0_Y no pull-up
    00 [1] PA_00_HSLIDE_CH0_X no pull-up
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [1] PB_24_ANT_SRDY no pull-up

    23 [1] PB_23_ANT_MRDY no pull-up
    22 [1] PB_22_ANT_USPI2_CS no pull-up
    21 [0] PB_21_ANT_RESET pull-up
    20 [1] PB_20_LED0_RED no pull-up

    19 [1] PB_19_LED2_RED no pull-up
    18 [1] PB_18_LED3_RED no pull-up
    17 [1] PB_17_LED1_RED no pull-up
    16 [1] PB_16_LCD_RD no pull-up

    15 [1] PB_15_LCD_A0 no pull-up
    14 [1] PB_14_LCD_RST no pull-up
    13 [1] PB_13_LED1_BLU no pull-up
    12 [1] PB_12_LCD_CS no pull-up

    11 [1] PB_11_VSLIDE_CH2_Y no pull-up
    10 [1] PB_10_VSLIDE_CH2_X no pull-up
    09 [1] PB_09_VSLIDE_CH1_Y no pull-up
    08 [1] PB_08_VSLIDE_CH1_X no pull-up 

    07 [1] PB_07_VSLIDE_CH0_Y no pull-up
    06 [1] PB_06_VSLIDE_CH0_X no pull-up
    05 [1] PB_05_LCD_BL no pull-up
    04 [1] PB_04_BLADE_AN1 no pull-up

    03 [1] PB_03_BLADE_AN0 no pull-up
    02 [1] *PB_02_LED1_GRN no pull-up
    01 [1] *PB_01_LED0_BLU no pull-up
    00 [1] PB_00_BUTTON1 no pull-up
*/

/* PIO Pull Up Enable Register
0: No effect
1: Enables the pull-up resistor on the selected pin
*/

/*
    31 [0] PA_31_HEARTBEAT no pull-up
    30 [0] PA_30_TP44 no pull-up
    29 [0] PA_29_LED0_GRN no pull-up
    28 [0] PA_28_BUZZER no pull-up

    27 [0] PA_27_CLOCK_OUT no pull-up
    26 [0] PA_26_LED2_GRN no pull-up
    25 [0] PA_25_ANT_USPI2_SCK no pull-up
    24 [0] PA_24_LCD_USPI1_SCK no pull-up

    23 [0] PA_23_ANT_USPI2_MOSI no pull-up
    22 [0] PA_22_ANT_USPI2_MISO no pull-up
    21 [0] PA_21_TP57 no pull-up
    20 [0] PA_20_LCD_USPI1_MOSI no pull-up

    19 [0] PA_19_DEBUG_U0_PIMO no pull-up
    18 [0] PA_18_DEBUG_U0_POMI no pull-up
    17 [0] PA_17_BUTTON0 no pull-up
    16 [0] PA_16_BLADE_CS no pull-up

    15 [0] PA_15_BLADE_SCK no pull-up
    14 [0] PA_14_BLADE_MOSI no pull-up
    13 [0] PA_13_BLADE_MISO no pull-up
    12 [0] PA_12_BLADE_UPOMI no pull-up

    11 [0] PA_11_BLADE_UPIMO no pull-up
    10 [0] PA_10_I2C_SCL no pull-up
    09 [0] PA_09_I2C_SDA no pull-up
    08 [0] PA_08_LED3_BLU no pull-up

    07 [0] PA_07_LED3_GRN no pull-up
    06 [0] PA_06_LED2_BLU no pull-up
    05 [0] PA_05_HSLIDE_CH2_Y no pull-up
    04 [0] PA_04_HSLIDE_CH2_X no pull-up

    03 [0] PA_03_HSLIDE_CH1_Y no pull-up
    02 [0] PA_02_HSLIDE_CH1_X no pull-up
    01 [0] PA_01_HSLIDE_CH0_Y no pull-up
    00 [0] PA_00_HSLIDE_CH0_X no pull-up
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [0] PB_24_ANT_SRDY no pull-up

    23 [0] PB_23_ANT_MRDY no pull-up
    22 [0] PB_22_ANT_USPI2_CS no pull-up
    21 [1] PB_21_ANT_RESET pull-up
    20 [0] PB_20_LED0_RED no pull-up

    19 [0] PB_19_LED2_RED no pull-up
    18 [0] PB_18_LED3_RED no pull-up
    17 [0] PB_17_LED1_RED no pull-up
    16 [0] PB_16_LCD_RD no pull-up

    15 [0] PB_15_LCD_A0 no pull-up
    14 [0] PB_14_LCD_RST no pull-up
    13 [0] PB_13_LED1_BLU no pull-up
    12 [0] PB_12_LCD_CS no pull-up

    11 [0] PB_11_VSLIDE_CH2_Y no pull-up
    10 [0] PB_10_VSLIDE_CH2_X no pull-up
    09 [0] PB_09_VSLIDE_CH1_Y no pull-up
    08 [0] PB_08_VSLIDE_CH1_X no pull-up 

    07 [0] PB_07_VSLIDE_CH0_Y no pull-up
    06 [0] PB_06_VSLIDE_CH0_X no pull-up
    05 [0] PB_05_LCD_BL no pull-up
    04 [0] PB_04_BLADE_AN1 no pull-up

    03 [0] PB_03_BLADE_AN0 no pull-up
    02 [0] PB_02_LED1_GRN no pull-up
    01 [0] PB_01_LED0_BLU no pull-up
    00 [0] PB_00_BUTTON1 no pull-up
*/


/* PIO Peripheral AB Select Register
0: Assigns the I/O line to the Peripheral A function.
1: Assigns the I/O line to the Peripheral B function.
*/

/* 
    31 [0] PA_31_HEARTBEAT N/A
    30 [0] PA_30_TP44 N/A
    29 [0] PA_29_LED0_GRN N/A
    28 [1] PA_28_BUZZER PERIPHERAL B

    27 [1] PA_27_CLOCK_OUT PERIPHERAL B
    26 [0] PA_26_LED2_GRN N/A
    25 [1] PA_25_ANT_USPI2_SCK PERIPHERAL B
    24 [1] PA_24_LCD_USPI1_SCK PERIPHERAL B

    23 [0] PA_23_ANT_USPI2_MOSI PERIPHERAL A
    22 [0] PA_22_ANT_USPI2_MISO PERIPHERAL A
    21 [0] PA_21_TP57 N/A
    20 [0] PA_20_LCD_USPI1_MOSI PERIPHERAL A

    19 [0] PA_19_DEBUG_U0_PIMO PERIPHERAL A
    18 [0] PA_18_DEBUG_U0_POMI PERIPHERAL A
    17 [0] PA_17_BUTTON0 N/A
    16 [0] PA_16_BLADE_CS PERIPHERAL A

    15 [0] PA_15_BLADE_SCK PERIPHERAL A
    14 [0] PA_14_BLADE_MOSI PERIPHERAL A
    13 [0] PA_13_BLADE_MISO PERIPHERAL A
    12 [0] PA_12_BLADE_UPOMI PERIPHERAL A

    11 [0] PA_11_BLADE_UPIMO PERIPHERAL A
    10 [0] PA_10_I2C_SCL PERIPHERAL A
    09 [0] PA_09_I2C_SDA PERIPHERAL A
    08 [0] PA_08_LED3_BLU N/A

    07 [0] PA_07_LED3_GRN N/A
    06 [0] PA_06_LED2_BLU N/A
    05 [0] PA_05_HSLIDE_CH2_Y N/A
    04 [0] PA_04_HSLIDE_CH2_X N/A

    03 [0] PA_03_HSLIDE_CH1_Y N/A
    02 [0] PA_02_HSLIDE_CH1_X N/A
    01 [0] PA_01_HSLIDE_CH0_Y N/A
    00 [0] PA_00_HSLIDE_CH0_X N/A
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [0] PB_24_ANT_SRDY N/A

    23 [0] PB_23_ANT_MRDY N/A
    22 [1] PB_22_ANT_USPI2_CS PERIPHERAL B
    21 [0] PB_21_ANT_RESET N/A
    20 [0] PB_20_LED0_RED N/A

    19 [0] PB_19_LED2_RED N/A
    18 [0] PB_18_LED3_RED N/A
    17 [0] PB_17_LED1_RED N/A
    16 [0] PB_16_LCD_RD N/A

    15 [0] PB_15_LCD_A0 N/A
    14 [0] PB_14_LCD_RST N/A
    13 [0] PB_13_LED1_BLU N/A
    12 [0] PB_12_LCD_CS N/A

    11 [0] PB_11_VSLIDE_CH2_Y N/A
    10 [0] PB_10_VSLIDE_CH2_X N/A
    09 [0] PB_09_VSLIDE_CH1_Y N/A
    08 [0] PB_08_VSLIDE_CH1_X N/A

    07 [0] PB_07_VSLIDE_CH0_Y N/A
    06 [0] PB_06_VSLIDE_CH0_X N/A
    05 [0] PB_05_LCD_BL N/A
    04 [1] PB_04_BLADE_AN1 PERIPHERAL B

    03 [1] PB_03_BLADE_AN0 PERIPHERAL B
    02 [0] PB_02_LED1_GRN N/A
    01 [0] PB_01_LED0_BLU N/A
    00 [0] PB_00_BUTTON1 N/A
*/

/* PIO System Clock Glitch Input Filtering Select Register
0: No effect
1: The Glitch Filter is able to filter glitches with a duration < Tmck/2.
*/

/* 
    31 [0] PA_31_HEARTBEAT
    30 [0] PA_30_TP44
    29 [0] PA_29_LED0_GRN
    28 [0] PA_28_BUZZER

    27 [0] PA_27_CLOCK_OUT
    26 [0] PA_26_LED2_GRN
    25 [0] PA_25_ANT_USPI2_SCK
    24 [0] PA_24_LCD_USPI1_SCK

    23 [0] PA_23_ANT_USPI2_MOSI
    22 [0] PA_22_ANT_USPI2_MISO
    21 [0] PA_21_TP57
    20 [0] PA_20_LCD_USPI1_MOSI

    19 [0] PA_19_DEBUG_U0_PIMO
    18 [0] PA_18_DEBUG_U0_POMI
    17 [0] PA_17_BUTTON0
    16 [0] PA_16_BLADE_CS

    15 [0] PA_15_BLADE_SCK
    14 [0] PA_14_BLADE_MOSI
    13 [0] PA_13_BLADE_MISO
    12 [0] PA_12_BLADE_UPOMI

    11 [0] PA_11_BLADE_UPIMO
    10 [0] PA_10_I2C_SCL
    09 [0] PA_09_I2C_SDA
    08 [0] PA_08_LED3_BLU

    07 [0] PA_07_LED3_GRN
    06 [0] PA_06_LED2_BLU
    05 [0] PA_05_HSLIDE_CH2_Y
    04 [0] PA_04_HSLIDE_CH2_X

    03 [0] PA_03_HSLIDE_CH1_Y
    02 [0] PA_02_HSLIDE_CH1_X
    01 [0] PA_01_HSLIDE_CH0_Y
    00 [0] PA_00_HSLIDE_CH0_X
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [0] PB_24_ANT_SRDY

    23 [0] PB_23_ANT_MRDY
    22 [0] PB_22_ANT_USPI2_CS
    21 [0] PB_21_ANT_RESET
    20 [0] PB_20_LED0_RED

    19 [0] PB_19_LED2_RED
    18 [0] PB_18_LED3_RED
    17 [0] PB_17_LED1_RED
    16 [0] PB_16_LCD_RD

    15 [0] PB_15_LCD_A0
    14 [0] PB_14_LCD_RST
    13 [0] PB_13_LED1_BLU
    12 [0] PB_12_LCD_CS

    11 [0] PB_11_VSLIDE_CH2_Y
    10 [0] PB_10_VSLIDE_CH2_X
    09 [0] PB_09_VSLIDE_CH1_Y
    08 [0] PB_08_VSLIDE_CH1_X

    07 [0] PB_07_VSLIDE_CH0_Y
    06 [0] PB_06_VSLIDE_CH0_X
    05 [0] PB_05_LCD_BL
    04 [0] PB_04_BLADE_AN1

    03 [0] PB_03_BLADE_AN0
    02 [0] PB_02_LED1_GRN
    01 [0] PB_01_LED0_BLU
    00 [0] PB_00_BUTTON1
*/

/* PIO Debouncing Input Filtering Select Register
0: No effect
1: The Debouncing Filter is able to filter pulses with a duration < Tdiv_slclk/2.
*/

/* 
    31 [0] PA_31_HEARTBEAT
    30 [0] PA_30_TP44
    29 [0] PA_29_LED0_GRN
    28 [0] PA_28_BUZZER

    27 [0] PA_27_CLOCK_OUT
    26 [0] PA_26_LED2_GRN
    25 [0] PA_25_ANT_USPI2_SCK
    24 [0] PA_24_LCD_USPI1_SCK

    23 [0] PA_23_ANT_USPI2_MOSI
    22 [0] PA_22_ANT_USPI2_MISO
    21 [0] PA_21_TP57
    20 [0] PA_20_LCD_USPI1_MOSI

    19 [0] PA_19_DEBUG_U0_PIMO
    18 [0] PA_18_DEBUG_U0_POMI
    17 [0] PA_17_BUTTON0
    16 [0] PA_16_BLADE_CS

    15 [0] PA_15_BLADE_SCK
    14 [0] PA_14_BLADE_MOSI
    13 [0] PA_13_BLADE_MISO
    12 [0] PA_12_BLADE_UPOMI

    11 [0] PA_11_BLADE_UPIMO
    10 [0] PA_10_I2C_SCL
    09 [0] PA_09_I2C_SDA
    08 [0] PA_08_LED3_BLU

    07 [0] PA_07_LED3_GRN
    06 [0] PA_06_LED2_BLU
    05 [0] PA_05_HSLIDE_CH2_Y
    04 [0] PA_04_HSLIDE_CH2_X

    03 [0] PA_03_HSLIDE_CH1_Y
    02 [0] PA_02_HSLIDE_CH1_X
    01 [0] PA_01_HSLIDE_CH0_Y
    00 [0] PA_00_HSLIDE_CH0_X
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [0] PB_24_ANT_SRDY

    23 [0] PB_23_ANT_MRDY
    22 [0] PB_22_ANT_USPI2_CS
    21 [0] PB_21_ANT_RESET
    20 [0] PB_20_LED0_RED

    19 [0] PB_19_LED2_RED
    18 [0] PB_18_LED3_RED
    17 [0] PB_17_LED1_RED
    16 [0] PB_16_LCD_RD

    15 [0] PB_15_LCD_A0
    14 [0] PB_14_LCD_RST
    13 [0] PB_13_LED1_BLU
    12 [0] PB_12_LCD_CS

    11 [0] PB_11_VSLIDE_CH2_Y
    10 [0] PB_10_VSLIDE_CH2_X
    09 [0] PB_09_VSLIDE_CH1_Y
    08 [0] PB_08_VSLIDE_CH1_X

    07 [0] PB_07_VSLIDE_CH0_Y
    06 [0] PB_06_VSLIDE_CH0_X
    05 [0] PB_05_LCD_BL
    04 [0] PB_04_BLADE_AN1

    03 [0] PB_03_BLADE_AN0
    02 [0] PB_02_LED1_GRN
    01 [0] PB_01_LED0_BLU
    00 [0] PB_00_BUTTON1
*/

/* PIO Slow Clock Divider Debouncing Register
Tdiv_slclk = 2*(DIV+1)*Tslow_clock. 
*/

/*
    31 - 16 [0] Reserved

    15 [0] Reserved
    14 [0] "
    13 [0] DIV
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*
    31 - 16 [0] Reserved

    15 [0] Reserved
    14 [0] "
    13 [0] DIV
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/

/* PIO Output Write Enable Register
0: No effect
1: Enables writing PIO_ODSR for the I/O line.
*/

/* 
    31 [1] PA_31_HEARTBEAT write enabled
    30 [0] PA_30_TP44
    29 [1] PA_29_LED0_GRN write enabled
    28 [1] PA_28_BUZZER write enabled

    27 [0] PA_27_CLOCK_OUT
    26 [0] PA_26_LED2_GRN 
    25 [0] PA_25_ANT_USPI2_SCK
    24 [0] PA_24_LCD_USPI1_SCK

    23 [0] PA_23_ANT_USPI2_MOSI
    22 [0] PA_22_ANT_USPI2_MISO
    21 [0] PA_21_TP57
    20 [0] PA_20_LCD_USPI1_MOSI

    19 [0] PA_19_DEBUG_U0_PIMO
    18 [0] PA_18_DEBUG_U0_POMI
    17 [0] PA_17_BUTTON0
    16 [1] PA_16_BLADE_CSC

    15 [0] PA_15_BLADE_SCK
    14 [0] PA_14_BLADE_MOSI
    13 [0] PA_13_BLADE_MISO
    12 [0] PA_12_BLADE_UPOMI

    11 [0] PA_11_BLADE_UPIMO
    10 [0] PA_10_I2C_SCL
    09 [0] PA_09_I2C_SDA
    08 [1] PA_08_LED3_BLU write enabled

    07 [1] PA_07_LED3_GRN write enabled
    06 [1] PA_06_LED2_BLU write enabled
    05 [1] PA_05_HSLIDE_CH2_Y write enabled
    04 [1] PA_04_HSLIDE_CH2_X write enabled

    03 [1] PA_03_HSLIDE_CH1_Y write enabled
    02 [1] PA_02_HSLIDE_CH1_X write enabled
    01 [1] PA_01_HSLIDE_CH0_Y write enabled
    00 [1] PA_00_HSLIDE_CH0_X write enabled
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [1] PB_24_ANT_SRDY write enabled

    23 [1] PB_23_ANT_MRDY write enabled
    22 [1] PB_22_ANT_USPI2_CS write enabled
    21 [1] PB_21_ANT_RESET write enabled
    20 [1] PB_20_LED0_RED write enabled

    19 [1] PB_19_LED2_RED write enabled
    18 [1] PB_18_LED3_RED write enabled
    17 [1] PB_17_LED1_RED write enabled
    16 [1] PB_16_LCD_RD write enabled

    15 [1] PB_15_LCD_A0 write enabled
    14 [1] PB_14_LCD_RST write enabled
    13 [1] PB_13_LED1_BLU write enabled 
    12 [1] PB_12_LCD_CS write enabled

    11 [1] PB_11_VSLIDE_CH2_Y write enabled
    10 [1] PB_10_VSLIDE_CH2_X write enabled
    09 [1] PB_09_VSLIDE_CH1_Y write enabled
    08 [1] PB_08_VSLIDE_CH1_X write enabled

    07 [1] PB_07_VSLIDE_CH0_Y write enabled
    06 [1] PB_06_VSLIDE_CH0_X write enabled
    05 [1] PB_05_LCD_BL write enabled
    04 [0] PB_04_BLADE_AN1

    03 [0] PB_03_BLADE_AN0
    02 [1] PB_02_LED1_GRN write enabled
    01 [1] PB_01_LED0_BLU write enabled
    00 [0] PB_00_BUTTON1
*/

/* PIO Output Write Disable Register
0: No effect
1: Disables writing PIO_ODSR for the I/O line.
For now, don't worry about explictly disabling any write capability.
*/

/* 
    31 [0] PA_31_HEARTBEAT
    30 [0] PA_30_TP44
    29 [0] PA_29_LED0_GRN
    28 [0] PA_28_BUZZER

    27 [0] PA_27_CLOCK_OUT
    26 [0] PA_26_LED2_GRN
    25 [0] PA_25_ANT_USPI2_SCK
    24 [0] PA_24_LCD_USPI1_SCK

    23 [0] PA_23_ANT_USPI2_MOSI
    22 [0] PA_22_ANT_USPI2_MISO
    21 [0] PA_21_TP57
    20 [0] PA_20_LCD_USPI1_MOSI

    19 [0] PA_19_DEBUG_U0_PIMO
    18 [0] PA_18_DEBUG_U0_POMI
    17 [0] PA_17_BUTTON0
    16 [0] PA_16_BLADE_CS

    15 [0] PA_15_BLADE_SCK
    14 [0] PA_14_BLADE_MOSI
    13 [0] PA_13_BLADE_MISO
    12 [0] PA_12_BLADE_UPOMI

    11 [0] PA_11_BLADE_UPIMO
    10 [0] PA_10_I2C_SCL
    09 [0] PA_09_I2C_SDA
    08 [0] PA_08_LED3_BLU

    07 [0] PA_07_LED3_GRN
    06 [0] PA_06_LED2_BLU
    05 [0] PA_05_HSLIDE_CH2_Y
    04 [0] PA_04_HSLIDE_CH2_X

    03 [0] PA_03_HSLIDE_CH1_Y
    02 [0] PA_02_HSLIDE_CH1_X
    01 [0] PA_01_HSLIDE_CH0_Y
    00 [0] PA_00_HSLIDE_CH0_X
*/


/*
    31 [0] PB_31_
    30 [0] PB_30_
    29 [0] PB_29_
    28 [0] PB_28_

    27 [0] PB_27_
    26 [0] PB_26_
    25 [0] PB_25_
    24 [0] PB_24_ANT_SRDY

    23 [0] PB_23_ANT_MRDY
    22 [0] PB_22_ANT_USPI2_CS
    21 [0] PB_21_ANT_RESET
    20 [0] PB_20_LED0_RED

    19 [0] PB_19_LED2_RED
    18 [0] PB_18_LED3_RED
    17 [0] PB_17_LED1_RED
    16 [0] PB_16_LCD_RD

    15 [0] PB_15_LCD_A0
    14 [0] PB_14_LCD_RST
    13 [0] PB_13_LED1_BLU
    12 [0] PB_12_LCD_CS

    11 [0] PB_11_VSLIDE_CH2_Y
    10 [0] PB_10_VSLIDE_CH2_X
    09 [0] PB_09_VSLIDE_CH1_Y
    08 [0] PB_08_VSLIDE_CH1_X

    07 [0] PB_07_VSLIDE_CH0_Y
    06 [0] PB_06_VSLIDE_CH0_X
    05 [0] PB_05_LCD_BL
    04 [0] PB_04_BLADE_AN1

    03 [0] PB_03_BLADE_AN0
    02 [0] PB_02_LED1_GRN
    01 [0] PB_01_LED0_BLU
    00 [0] PB_00_BUTTON1
*/

/* PIO Write Protect Mode Register PIO_WPMR
Enables the Write Protect if WPKEY corresponds to 0x50494F (�PIO� in ASCII).
Though this is defined in the user guide, there is no definition in the processor header file.
We don't want to lock access to the GPIO registers anyway, so we won't use this for now.
*/

/*
    31 -08 [0] WPKEY

    07 [0] Reserved
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] WPEN
*/

/***********************************************************************************************************************
$$$$$ PWM setup values
***********************************************************************************************************************/

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] PREB MCK
    26 [0] "
    25 [0] "
    24 [0] "

    23 [0] DIVB = 1 => CLKB is on, no DIVB factor
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [1] "

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] PREA MCK
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] DIVA = 1 => CLKA is on, no DIVA factor
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [1] "
*/



/*
    31 - 4 [0] Reserved

    03 [0] Channel 3 not enabled
    02 [0] Channel 2 not enabled
    01 [0] Channel 1 not enabled
    00 [1] Channel 0 enabled
*/


/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] "

    23 [0] PTRCS
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] Reserved
    18 [0] "
    17 [0] UPDM
    16 [0] "

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] SYNC3 not synchronous
    02 [0] SYNC2 not synchronous
    01 [0] SYNC1 not synchronous
    00 [0] SYNC0 not synchronous
*/



/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] "

    23 [0] "
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] DTLI dead-time low channel output is not inverted
    17 [0] DTHI dead-time high channel output is not inverted
    16 [0] DTE dead-time generator disabled

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] CES channel event at end of PWM period
    09 [0] CPOL channel starts low
    08 [0] CALG period is left aligned

    07 [0] Reserved
    06 [0] "
    05 [0] "
    04 [0] "

    03 [0] CPRE clock is MCK/8
    02 [0] "
    01 [1] "
    00 [1] "
*/



/* To achieve the full range of audio we want from 100Hz to 20kHz, we must be able to set periods
of 10ms to 50us.
10ms at 48MHz clock is 480,000 ticks
50us at 48MHz clock is 2400 ticks
Only 16 bits are available to set the PWM period, so scale the clock by 8:
10ms at 6MHz clock is 60,000 ticks
50us at 6MHz clock is 300 ticks

Set the default period for audio on channel 0 as 1/1kHz
1ms at 6MHz = 6000 (duty = 3000)
Set the default period for audio on channel 1 as 1/4kHz
0.25ms at 6MHz = 1500 (duty = 750)

In general, the period is 6000000 / frequency and duty is always period / 2. 
*/







/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/


/*
    31 [0] 
    30 [0] 
    29 [0] 
    28 [0] 

    27 [0] 
    26 [0] 
    25 [0] 
    24 [0] 

    23 [0] 
    22 [0] 
    21 [0] 
    20 [0] 

    19 [0] 
    18 [0] 
    17 [0] 
    16 [0] 

    15 [0] 
    14 [0] 
    13 [0] 
    12 [0] 

    11 [0] 
    10 [0] 
    09 [0] 
    08 [0] 

    07 [0] 
    06 [0] 
    05 [0] 
    04 [0] 

    03 [0] 
    02 [0] 
    01 [0] 
    00 [0] 
*/








/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 81 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"


#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\captouch.h"
/***********************************************************************************************************************
File: captouch.h                                                               

Description:
Header file for captouch.c

DISCLAIMER: THIS CODE IS PROVIDED WITHOUT ANY WARRANTY OR GUARANTEES.  USERS MAY
USE THIS CODE FOR DEVELOPMENT AND EXAMPLE PURPOSES ONLY.  ENGENUICS TECHNOLOGIES
INCORPORATED IS NOT RESPONSIBLE FOR ANY ERRORS, OMISSIONS, OR DAMAGES THAT COULD
RESULT FROM USING THIS FIRMWARE IN WHOLE OR IN PART.

***********************************************************************************************************************/




#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"
/**********************************************************************************************************************
File: configuration.h      

Description:
Main configuration header file for project.  This file bridges many of the generic features of the 
firmware to the specific features of the design. The definitions should be updated
to match the target hardware.  
 
Bookmarks:
!!!!! External module peripheral assignments
@@@@@ GPIO board-specific parameters
##### Communication peripheral board-specific parameters

Quick references:
DEBUG UART IS 115200-8-N-1
ANT BOARDTEST CHANNEL CONFIG: 4660 (0x1234), 96(0x60), 1

***********************************************************************************************************************/

#line 272 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"


/*----------------------------------------------------------------------------------------------------------------------
%BUZZER% Buzzer Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
EIE1 has two buzzers, MPG2 only has one */








/*----------------------------------------------------------------------------------------------------------------------
%ADC% Analog input channel Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Available analog channels are defined here.  The names in the arrays come from
the board-specific definition header file in section !!!!! GPIO pin names
*/








/*----------------------------------------------------------------------------------------------------------------------
%ANT% Interface Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Board-specific ANT definitions are kept here
*/
















/***********************************************************************************************************************
##### Communication peripheral board-specific parameters
***********************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------------
%UART%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
Blade UART Setup

The Blade UART is used for the daughter board interface (serial: 115.2k, 8-N-1) .
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
Debug UART Setup

Debug is used for the terminal (serial: 115.2k, 8-N-1) debugging interface.
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [1] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 38400 bps
=> CD = 78.125 - (FP / 8)
Set FP = 1, CD = 78 = 0x4E

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26 = 0x1A

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
%SSP%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
LCD USART Setup in SSP mode

SPI mode to communicate with an SPI LCD screen. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [1] RXDIS receiver disabled
    04 [0] RXEN receiver not enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
ANT USART Setup in SSP
SPI slave mode to communicate with an ANT device. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK (delicious!) NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as soon as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [1] USCLKS SCK
    04 [1] "

    03 [1] USART_MODE SPI Slave
    02 [1] "
    01 [1] "
    00 [1] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [1] CTSIC Clear to Send Change interrupt enabled 
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled 

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled 

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled YET
    00 [0] RXRDY Receiver Ready interrupt enabled 
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
!!!!! Not applicable for slave (note that incoming clock cannot 
exceed MCLK/6 = 8MHz.  To date, ANT devices communicate at 500kHz
or 2MHz, so no issues.
*/



/*----------------------------------------------------------------------------------------------------------------------
SD USART Setup in SSP mode

SPI mode to communicate with an SPI SD card. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled for now
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*--------------------------------------------------------------------------------------------------------------------
Two Wire Interface setup

I�C Master mode for ASCII LCD communication
*/

/*-------------------- TWI0 ---------------------*/
/*Control Register*/

/*
    31-8 [0] Reserved

    07 [0] SWRST - Software reset
    06 [0] QUICK - SMBUS Quick Command
    05 [1] SVDIS - Slave mode disable - disabled
    04 [0] SVEN - Slave mode enable

    03 [0] MSDIS - Master mode disable
    02 [1] MSEN - Master mode enable
    01 [0] STOP - Stop a transfer
    00 [0] START - Start a transfer
*/

/*Master Mode Register*/

/*
    31-24 [0] Reserved
    
    23 [0] Reserved
    22 [0] DADR - device slave address - start with zero
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] MREAD - Master Read Direction - 0 -> Write, 1 -> Read

    11 [0] Reserved
    10 [0] "
    09 [0] IADRSZ - Internal device address - 0 = no internal device address
    08 [0] "

    07-0 [0] Reserved
*/

/* Clock Wave Generator Register */
/* 
    Calculation:
        T_low = ((CLDIV * (2^CKDIV))+4) * T_MCK
        T_high = ((CHDIV * (2^CKDIV))+4) * T_MCK

        T_MCK - period of master clock = 1/(48 MHz)
        T_low/T_high - period of the low and high signals
        
        CKDIV = 2, CHDIV and CLDIV = 59
        T_low/T_high = 2.5 microseconds

        Data frequency - 
        f = ((T_low + T_high)^-1)
        f = 200000 Hz 0r 200 kHz

    Additional Rates:
        50 kHz - 0x00027777
       100 kHz - 0x00023B3B
       200 kHz - 0x00021D1D
       400 kHz - 0x00030707  *Maximum rate*
*/

/*
    31-20 [0] Reserved
    
    19 [0] Reserved
    18 [0] CKDIV
    17 [1] "
    16 [0] "

    15 [0] CHDIV
    14 [0] "
    13 [0] "
    12 [1] "

    11 [1] "
    10 [1] "
    09 [0] "
    08 [1] "

    07 [0] CLDIV - Clock Low Divider
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [1] "
    01 [0] "
    00 [1] "
*/

/*Interrupt Enable Register*/

/*
    31-16 [0] Reserved

    15 [0] TXBUFE - Transmit Buffer Empty
    14 [0] RXBUFF - Receive Buffer Full
    13 [0] ENDTX - End of Transmit Buffer
    12 [0] ENDRX - End of Receive Buffer

    11 [0] EOSACC - End of Slave Address
    10 [0] SCL_WS - Clock Wait State
    09 [0] ARBLST - Arbitration Lost
    08 [1] NACK - Not Acknowledge

    07 [0] Reserved
    06 [1] OVRE - Overrun Error
    05 [0] GACC - General Call Access
    04 [0] SVACC - Slave Access

    03 [0] Reserved
    02 [0] TXRDY - Transmit Holding Register Ready
    01 [1] RXRDY - Receive Holding Register Ready
    00 [0] TXCOMP - Transmission Completed
*/

/*Interrupt Disable Register*/

/*
    31-16 [0] Reserved

    15 [1] TXBUFE - Transmit Buffer Empty
    14 [1] RXBUFF - Receive Buffer Full
    13 [1] ENDTX - End of Transmit Buffer
    12 [1] ENDRX - End of Receive Buffer

    11 [1] EOSACC - End of Slave Address
    10 [1] SCL_WS - Clock Wait State
    09 [1] ARBLST - Arbitration Lost
    08 [0] NACK - Not Acknowledge

    07 [0] Reserved
    06 [0] OVRE - Overrun Error
    05 [1] GACC - General Call Access
    04 [1] SVACC - Slave Access

    03 [0] Reserved
    02 [1] TXRDY - Transmit Holding Register Ready
    01 [0] RXRDY - Receive Holding Register Ready
    00 [1] TXCOMP - Transmission Completed
*/



/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/

#line 18 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\captouch.h"


/***********************************************************************************************************************
Type Definitions
***********************************************************************************************************************/
typedef enum {SLIDER0, SLIDER1} SliderNumberType;


/***********************************************************************************************************************
Constants / Definitions
***********************************************************************************************************************/




/***********************************************************************************************************************
* Function Declarations
***********************************************************************************************************************/
/* Public Functions */
void CapTouchOn(void);
void CapTouchOff(void);
u8 CaptouchCurrentHSlidePosition(void);
u8 CaptouchCurrentVSlidePosition(void);


BOOL CapTouchUpdateSensorReadings(u16 u16CurrentTimeMs_);
//u8 u8CapTouchGetButtonValue(ButtonNumberType eButtonNumber_);
u8 u8CapTouchGetSliderValue(SliderNumberType eSliderNumber_);

// For debug use only
void CapTouchGetDebugValues(u8 u8Channel_, u16* pu16Measure_, u16* pu16Reference_);

/* Protected Functions */
ErrorStatus CapTouchInitialize(void);
void CapTouchRunActiveState(void);

/* Private Functions */
static ErrorStatus CapTouchVerify(void);
static void CapTouchSetParameters(void);


/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
void CapTouchSM_Idle(void);             
void CapTouchSM_Measure(void);

void CapTouchSM_Error(void);         



#line 84 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_bitmaps.h"
/*******************************************************************************
* File: lcd_bitmaps.h                                                                
* Description:
* Bitmap data for 1-bit black & white dot matrix LCD
*******************************************************************************/




#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_NHD-C12864LZ.h"
/*******************************************************************************
File: lcd_NHD-C12864LZ.h                                                                

Description:
LCD implementation for Newhaven NHD-C12864LZ
*******************************************************************************/





/*******************************************************************************
* Typedefs
*******************************************************************************/
typedef enum {LCD_FONT_SMALL, LCD_FONT_BIG} LcdFontType;

typedef enum {LCD_SHIFT_UP, LCD_SHIFT_DOWN, LCD_SHIFT_RIGHT, LCD_SHIFT_LEFT} LcdShiftType;

typedef enum {LCD_CONTROL_MESSAGE, LCD_DATA_MESSAGE} LcdMessageType;

/* Absolute address of one LCD pixel */
typedef struct
{
  u16 u16PixelRowAddress;
  u16 u16PixelColumnAddress;
} PixelAddressType;


/* Address structure of a rectangular group of pixels */
typedef struct
{
  u16 u16RowStart;             /* Address of top left pixel row */
  u16 u16ColumnStart;          /* Address of top left pixel column */
  u16 u16RowSize;              /* Number of rows in block */
  u16 u16ColumnSize;           /* Number of columns in block */
} PixelBlockType;


/* LCD message struct used to queue LCD data */
typedef struct
{
  LcdMessageType eMessageType; /* Command or data */ 
  u16 u16Length;               /* Number of bytes in the message */
  u8* pu8Data;                 /* Address of first data byte of the message */
} LcdQueueMessageType;


/*******************************************************************************
* Macros (board-specific: need to be adjusted to target PCB)
*******************************************************************************/
/* Public */



/* Private */
#line 62 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_NHD-C12864LZ.h"



/*******************************************************************************
* Application Values
*******************************************************************************/
/* Lcd_u32Flags */




/* end Lcd_u32Flags */

/* LCD hardware definitions */






#line 89 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_NHD-C12864LZ.h"








/* Bitmap sizes (x = # of column pixels, y = # of row pixels) */
#line 104 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_NHD-C12864LZ.h"






#line 118 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_NHD-C12864LZ.h"

#line 128 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_NHD-C12864LZ.h"











/*******************************************************************************
* ST7565P Controller Values
*******************************************************************************/
/* The LCD is a write-only device.  Communication with LCD begins by setting the Register Select 
bit (A0 in the datasheet) to specify instruction (0)or data(1).
Next the chip select line is asserted to indicate SPI communication is starting.
A stream of bytes is sent which will be commands or data depending on the state of A0.

An 'x' at the end of a command indicates bits need to be added into the byte to complete it.
A '_' at the end of a command means it is a two-part command and must be immediately followed by the 2nd byte.
*/

/* Commands with A0 = 0 */
#line 158 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_NHD-C12864LZ.h"

#line 168 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_NHD-C12864LZ.h"




/* OR the follow options in with this command */





/* OR the follow options in with this command */
















/*******************************************************************************
* Function prototypes
*******************************************************************************/
/* LCD Public API Functions */
void LcdSetPixel(PixelAddressType* sPixelAddress_);
void LcdClearPixel(PixelAddressType* sPixelAddress_);
void LcdLoadString(const unsigned char* pu8String_, LcdFontType eFont_, PixelAddressType* sStartPixel_);
void LcdLoadBitmap(u8 const* pu8Image_, PixelBlockType* sImageSize_);
void LcdClearPixels(PixelBlockType* sPixelsToClear_);
void LcdClearScreen(void);
void LcdShift(PixelBlockType eShiftArea_, u16 u16PixelsToShift_, LcdShiftType eDirection_);
bool LcdCommand(u8 u8Command_);         

/* LCD Protected Functions */
void LcdInitialize(void);
void LcdRunActiveState(void);
void LcdManualMode(void);

/* LCD Private Driver Functions */
static bool LcdSetStartAddressForDataTransfer(u8 u8Page_);         
static void LcdLoadPageToBuffer(u8 u8LocalRamPage_); 
void LcdUpdateScreenRefreshArea(PixelBlockType* sPixelsToClear_);

/* State machine declarations */
static void LcdSM_Idle(void);
static void LcdSM_WaitTransfer(void);
static void BoardTestSM_WaitPixelTestOn(void);          
static void BoardTestSM_WaitPixelTestOff(void);          



#line 11 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_bitmaps.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"
/**********************************************************************************************************************
File: configuration.h      

Description:
Main configuration header file for project.  This file bridges many of the generic features of the 
firmware to the specific features of the design. The definitions should be updated
to match the target hardware.  
 
Bookmarks:
!!!!! External module peripheral assignments
@@@@@ GPIO board-specific parameters
##### Communication peripheral board-specific parameters

Quick references:
DEBUG UART IS 115200-8-N-1
ANT BOARDTEST CHANNEL CONFIG: 4660 (0x1234), 96(0x60), 1

***********************************************************************************************************************/

#line 272 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_common\\configuration.h"


/*----------------------------------------------------------------------------------------------------------------------
%BUZZER% Buzzer Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
EIE1 has two buzzers, MPG2 only has one */








/*----------------------------------------------------------------------------------------------------------------------
%ADC% Analog input channel Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Available analog channels are defined here.  The names in the arrays come from
the board-specific definition header file in section !!!!! GPIO pin names
*/








/*----------------------------------------------------------------------------------------------------------------------
%ANT% Interface Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Board-specific ANT definitions are kept here
*/
















/***********************************************************************************************************************
##### Communication peripheral board-specific parameters
***********************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------------
%UART%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
Blade UART Setup

The Blade UART is used for the daughter board interface (serial: 115.2k, 8-N-1) .
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
Debug UART Setup

Debug is used for the terminal (serial: 115.2k, 8-N-1) debugging interface.
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [1] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 38400 bps
=> CD = 78.125 - (FP / 8)
Set FP = 1, CD = 78 = 0x4E

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26 = 0x1A

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
%SSP%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
LCD USART Setup in SSP mode

SPI mode to communicate with an SPI LCD screen. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [1] RXDIS receiver disabled
    04 [0] RXEN receiver not enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
ANT USART Setup in SSP
SPI slave mode to communicate with an ANT device. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK (delicious!) NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as soon as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [1] USCLKS SCK
    04 [1] "

    03 [1] USART_MODE SPI Slave
    02 [1] "
    01 [1] "
    00 [1] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [1] CTSIC Clear to Send Change interrupt enabled 
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled 

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled 

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled YET
    00 [0] RXRDY Receiver Ready interrupt enabled 
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
!!!!! Not applicable for slave (note that incoming clock cannot 
exceed MCLK/6 = 8MHz.  To date, ANT devices communicate at 500kHz
or 2MHz, so no issues.
*/



/*----------------------------------------------------------------------------------------------------------------------
SD USART Setup in SSP mode

SPI mode to communicate with an SPI SD card. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled for now
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*--------------------------------------------------------------------------------------------------------------------
Two Wire Interface setup

I�C Master mode for ASCII LCD communication
*/

/*-------------------- TWI0 ---------------------*/
/*Control Register*/

/*
    31-8 [0] Reserved

    07 [0] SWRST - Software reset
    06 [0] QUICK - SMBUS Quick Command
    05 [1] SVDIS - Slave mode disable - disabled
    04 [0] SVEN - Slave mode enable

    03 [0] MSDIS - Master mode disable
    02 [1] MSEN - Master mode enable
    01 [0] STOP - Stop a transfer
    00 [0] START - Start a transfer
*/

/*Master Mode Register*/

/*
    31-24 [0] Reserved
    
    23 [0] Reserved
    22 [0] DADR - device slave address - start with zero
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] MREAD - Master Read Direction - 0 -> Write, 1 -> Read

    11 [0] Reserved
    10 [0] "
    09 [0] IADRSZ - Internal device address - 0 = no internal device address
    08 [0] "

    07-0 [0] Reserved
*/

/* Clock Wave Generator Register */
/* 
    Calculation:
        T_low = ((CLDIV * (2^CKDIV))+4) * T_MCK
        T_high = ((CHDIV * (2^CKDIV))+4) * T_MCK

        T_MCK - period of master clock = 1/(48 MHz)
        T_low/T_high - period of the low and high signals
        
        CKDIV = 2, CHDIV and CLDIV = 59
        T_low/T_high = 2.5 microseconds

        Data frequency - 
        f = ((T_low + T_high)^-1)
        f = 200000 Hz 0r 200 kHz

    Additional Rates:
        50 kHz - 0x00027777
       100 kHz - 0x00023B3B
       200 kHz - 0x00021D1D
       400 kHz - 0x00030707  *Maximum rate*
*/

/*
    31-20 [0] Reserved
    
    19 [0] Reserved
    18 [0] CKDIV
    17 [1] "
    16 [0] "

    15 [0] CHDIV
    14 [0] "
    13 [0] "
    12 [1] "

    11 [1] "
    10 [1] "
    09 [0] "
    08 [1] "

    07 [0] CLDIV - Clock Low Divider
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [1] "
    01 [0] "
    00 [1] "
*/

/*Interrupt Enable Register*/

/*
    31-16 [0] Reserved

    15 [0] TXBUFE - Transmit Buffer Empty
    14 [0] RXBUFF - Receive Buffer Full
    13 [0] ENDTX - End of Transmit Buffer
    12 [0] ENDRX - End of Receive Buffer

    11 [0] EOSACC - End of Slave Address
    10 [0] SCL_WS - Clock Wait State
    09 [0] ARBLST - Arbitration Lost
    08 [1] NACK - Not Acknowledge

    07 [0] Reserved
    06 [1] OVRE - Overrun Error
    05 [0] GACC - General Call Access
    04 [0] SVACC - Slave Access

    03 [0] Reserved
    02 [0] TXRDY - Transmit Holding Register Ready
    01 [1] RXRDY - Receive Holding Register Ready
    00 [0] TXCOMP - Transmission Completed
*/

/*Interrupt Disable Register*/

/*
    31-16 [0] Reserved

    15 [1] TXBUFE - Transmit Buffer Empty
    14 [1] RXBUFF - Receive Buffer Full
    13 [1] ENDTX - End of Transmit Buffer
    12 [1] ENDRX - End of Receive Buffer

    11 [1] EOSACC - End of Slave Address
    10 [1] SCL_WS - Clock Wait State
    09 [1] ARBLST - Arbitration Lost
    08 [0] NACK - Not Acknowledge

    07 [0] Reserved
    06 [0] OVRE - Overrun Error
    05 [1] GACC - General Call Access
    04 [1] SVACC - Slave Access

    03 [0] Reserved
    02 [1] TXRDY - Transmit Holding Register Ready
    01 [0] RXRDY - Receive Holding Register Ready
    00 [1] TXCOMP - Transmission Completed
*/



/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/

#line 12 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\lcd_bitmaps.h"


/*******************************************************************************
* Constants / Definitions
*******************************************************************************/















/*******************************************************************************
* Bookmarks
********************************************************************************
$$$$$ Small Font Character Bitmaps
%%%%% Big Font Character Bitmaps
^^^^^ Image Bitmaps
*******************************************************************************/


/*******************************************************************************
* Single Color Small Font Character Set                                    $$$$$
*******************************************************************************/





#line 85 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"



/* Common application header files */
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\application\\debug.h"
/***********************************************************************************************************************
File: debug.h                                                                
***********************************************************************************************************************/





/***********************************************************************************************************************
* Constants / Definitions
***********************************************************************************************************************/




/* G_u32DebugFlags */




/* end of G_u32DebugFlags */









/* end of G_u32DebugFlags */



/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/
typedef struct
{
  u8 *pu8CommandName;
  fnCode_type DebugFunction;
} DebugCommandType;


/***********************************************************************************************************************
* Command-Specific Definitions
***********************************************************************************************************************/




/* New commands must update the definitions below. Valid commands are in the range
00 - 99.  Command name string is a maximum of DEBUG_CMD_NAME_LENGTH characters. */

#line 67 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\application\\debug.h"



/*                              "0123456789ABCDEF0123456789ABCDEF"  Character position reference */
#line 80 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\application\\debug.h"




/* Error codes */




/***********************************************************************************************************************
* Function Declarations
***********************************************************************************************************************/


/*--------------------------------------------------------------------------------------------------------------------*/
/* Public Functions */
/*--------------------------------------------------------------------------------------------------------------------*/
u32 DebugPrintf(u8* u8String_);
void DebugLineFeed(void);       
void DebugPrintNumber(u32 u32Number_);

u8 DebugScanf(u8* au8Buffer_);

void DebugSetPassthrough(void);
void DebugClearPassthrough(void);

void SystemStatusReport(void);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions */
/*--------------------------------------------------------------------------------------------------------------------*/
void DebugInitialize(void);                   
void DebugRunActiveState(void);
void DebugRxCallback(void);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions */
/*--------------------------------------------------------------------------------------------------------------------*/
static void DebugCommandPrepareList(void);           
static void DebugCommandDummy(void);

static void DebugCommandLedTestToggle(void);
static void DebugLedTestCharacter(u8 u8Char_);
static void DebugCommandSysTimeToggle(void);





static void DebugCommandCaptouchValuesToggle(void);


/***********************************************************************************************************************
* State Machine Declarations
***********************************************************************************************************************/
static void DebugSM_Idle(void);                       
static void DebugSM_CheckCmd(void);                   
static void DebugSM_ProcessCmd(void);                 

static void DebugSM_Error(void);







/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 90 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\application\\music.h"
/**********************************************************************************************************************
File: music.h      

Description:
Definitions for musical notes

***********************************************************************************************************************/


/* Note lengths */
#line 17 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\application\\music.h"







/* Note length adjustments */








/* Musical note definitions */
#line 86 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\application\\music.h"

/* Musical note definitions - short hand */
#line 91 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\application\\user_app1.h"
/**********************************************************************************************************************
File: user_app1.h                                                                

----------------------------------------------------------------------------------------------------------------------
To start a new task using this user_app1 as a template:
1. Follow the instructions at the top of user_app1.c
2. Use ctrl-h to find and replace all instances of "user_app1" with "yournewtaskname"
3. Use ctrl-h to find and replace all instances of "UserApp1" with "YourNewTaskName"
4. Use ctrl-h to find and replace all instances of "USER_APP1" with "YOUR_NEW_TASK_NAME"
5. Add #include yournewtaskname.h" to configuration.h
6. Add/update any special configurations required in configuration.h (e.g. peripheral assignment and setup values)
7. Delete this text (between the dashed lines)
----------------------------------------------------------------------------------------------------------------------

Description:
Header file for user_app1.c

**********************************************************************************************************************/




/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/


/**********************************************************************************************************************
Constants / Definitions
**********************************************************************************************************************/


/**********************************************************************************************************************
Function Declarations
**********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions                                                                                                   */
/*--------------------------------------------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions                                                                                                */
/*--------------------------------------------------------------------------------------------------------------------*/
void UserApp1Initialize(void);
void UserApp1RunActiveState(void);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions                                                                                                  */
/*--------------------------------------------------------------------------------------------------------------------*/


/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
static void UserApp1SM_Idle(void);    

static void UserApp1SM_Error(void);         





/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File                                                                                                        */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 92 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\application\\user_app2.h"
/**********************************************************************************************************************
File: user_app2.h                                                                

Description:
Header file for user_app2.c

**********************************************************************************************************************/




/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/


/**********************************************************************************************************************
Constants / Definitions
**********************************************************************************************************************/


/**********************************************************************************************************************
Function Declarations
**********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions                                                                                                   */
/*--------------------------------------------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions                                                                                                */
/*--------------------------------------------------------------------------------------------------------------------*/
void UserApp2Initialize(void);
void UserApp2RunActiveState(void);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions                                                                                                  */
/*--------------------------------------------------------------------------------------------------------------------*/


/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
static void UserApp2SM_Idle(void);    

static void UserApp2SM_Error(void);         
static void UserApp2SM_FailedInit(void);        





/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File                                                                                                        */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 93 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\application\\user_app3.h"
/**********************************************************************************************************************
File: user_app3.h                                                                

Description:
Header file for user_app3.c

**********************************************************************************************************************/




/**********************************************************************************************************************
Type Definitions
**********************************************************************************************************************/


/**********************************************************************************************************************
Constants / Definitions
**********************************************************************************************************************/


/**********************************************************************************************************************
Function Declarations
**********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions                                                                                                   */
/*--------------------------------------------------------------------------------------------------------------------*/


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions                                                                                                */
/*--------------------------------------------------------------------------------------------------------------------*/
void UserApp3Initialize(void);
void UserApp3RunActiveState(void);


/*--------------------------------------------------------------------------------------------------------------------*/
/* Private functions                                                                                                  */
/*--------------------------------------------------------------------------------------------------------------------*/


/***********************************************************************************************************************
State Machine Declarations
***********************************************************************************************************************/
static void UserApp3SM_Idle(void);    

static void UserApp3SM_Error(void);         
static void UserApp3SM_FailedInit(void);        





/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File                                                                                                        */
/*--------------------------------------------------------------------------------------------------------------------*/
#line 94 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"


/**********************************************************************************************************************
!!!!! External peripheral assignments
***********************************************************************************************************************/
/* G_u32ApplicationFlags */
/* The order of these flags corresponds to the order of applications in SystemStatusReport() (debug.c) */
#line 108 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"

#line 115 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"


/* MPGL2 specific application flags */






/**********************************************************************************************************************
!!!!! External device peripheral assignments
***********************************************************************************************************************/
/* %UART% Configuration */
/* Blade UART Peripheral Allocation (UART) */
#line 135 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"





/* Debug UART Peripheral Allocation (USART0) */
#line 147 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"




#line 164 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"

#line 179 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"



/* %SSP% Configuration */
/* LCD SPI Peripheral Allocation (USART1) */
#line 192 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"




/* ANT SPI Peripheral Allocation (USART2) */
#line 203 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"






/* Blade I�C (TWI0) / Accelerometer (MPGL2_R01 only) */
/* Currently configured directly in sam3u_i2c.c */


/***********************************************************************************************************************
@@@@@ GPIO board-specific parameters
***********************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------------
%LED% LED Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Update the values below for the LEDs on the board.  Any name can be used for the LED definitions.
Open the LED source.c and edit Led_au32BitPositions and Leds_asLedArray with the correct values for the LEDs in the system.  
*/

















/*----------------------------------------------------------------------------------------------------------------------
%BUTTON% Button Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Update the values below for the buttons on the board.  Any name can be used for the BUTTON definitions.
Open buttons.c and edit the GPIO definitions sections with the bit numbers for the buttons.
The order of the definitions below must match the order of the definitions provided in buttons.c. 
*/

#line 259 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\..\\firmware_common\\configuration.h"







/* All buttons on each port must be ORed together here: set to 0 if no buttons on the port */







/*----------------------------------------------------------------------------------------------------------------------
%BUZZER% Buzzer Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
EIE1 has two buzzers, MPG2 only has one */








/*----------------------------------------------------------------------------------------------------------------------
%ADC% Analog input channel Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Available analog channels are defined here.  The names in the arrays come from
the board-specific definition header file in section !!!!! GPIO pin names
*/








/*----------------------------------------------------------------------------------------------------------------------
%ANT% Interface Configuration                                                                                                  
------------------------------------------------------------------------------------------------------------------------
Board-specific ANT definitions are kept here
*/
















/***********************************************************************************************************************
##### Communication peripheral board-specific parameters
***********************************************************************************************************************/
/*----------------------------------------------------------------------------------------------------------------------
%UART%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
Blade UART Setup

The Blade UART is used for the daughter board interface (serial: 115.2k, 8-N-1) .
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
Debug UART Setup

Debug is used for the terminal (serial: 115.2k, 8-N-1) debugging interface.
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK NACK generated (N/A for async)

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [0] MSBF/CPOL LSB first

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP 1 stop bit
    12 [0] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] SYNC/CPHA asynchronous

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [0] USART_MODE normal
    02 [0] "
    01 [0] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt enabled

    03 [1] ENDRX End of Receiver Transfer (PDC) interrupt enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / (8(2-OVER)(CD + FP / 8))
=> CD = (MCK / (8(2-OVER)BAUD)) - (FP / 8)
MCK = 48MHz
OVER = 0 (16-bit oversampling)

BAUD desired = 38400 bps
=> CD = 78.125 - (FP / 8)
Set FP = 1, CD = 78 = 0x4E

BAUD desired = 115200 bps
=> CD = 26.042 - (FP / 8)
Set FP = 0, CD = 26 = 0x1A

*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP = 0
    17 [0] "
    16 [0] "

    15 [0] CD = 26 = 0x1A
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [0] "
    01 [1] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
%SSP%  Configuration                                                                                                  
----------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
LCD USART Setup in SSP mode

SPI mode to communicate with an SPI LCD screen. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [1] RXDIS receiver disabled
    04 [0] RXEN receiver not enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*----------------------------------------------------------------------------------------------------------------------
ANT USART Setup in SSP
SPI slave mode to communicate with an ANT device. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK (delicious!) NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as soon as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [0] CLKO USART does not drive the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [1] USCLKS SCK
    04 [1] "

    03 [1] USART_MODE SPI Slave
    02 [1] "
    01 [1] "
    00 [1] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [1] CTSIC Clear to Send Change interrupt enabled 
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled 

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled 

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled YET
    00 [0] RXRDY Receiver Ready interrupt enabled 
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
!!!!! Not applicable for slave (note that incoming clock cannot 
exceed MCLK/6 = 8MHz.  To date, ANT devices communicate at 500kHz
or 2MHz, so no issues.
*/



/*----------------------------------------------------------------------------------------------------------------------
SD USART Setup in SSP mode

SPI mode to communicate with an SPI SD card. 
*/
/* USART Control Register - Page 734 */

/*
    31 - 20 [0] Reserved

    19 [0] RTSDIS/RCS no release/force RTS to 1
    18 [0] RTSEN/FCS no drive/force RTS to 0
    17 [0] DTRDIS no drive DTR to 1
    16 [0] DTREN no drive DTR to 0

    15 [0] RETTO no restart timeout
    14 [0] RSTNACK N/A
    13 [0] RSTIT N/A
    12 [0] SENDA N/A

    11 [0] STTTO no start time-out
    10 [0] STPBRK no stop break
    09 [0] STTBRK no transmit break
    08 [0] RSTSTA status bits not reset

    07 [0] TXDIS transmitter not disabled
    06 [1] TXEN transmitter enabled
    05 [0] RXDIS receiver not disabled
    04 [1] RXEN receiver enabled

    03 [0] RSTTX not reset
    02 [0] RSTRX not reset
    01 [0] Reserved
    00 [0] "
*/

/* USART Mode Register - page 737 */

/*
    31 [0] ONEBIT start frame delimiter is COMMAND or DATA SYNC
    30 [0] MODSYNC Manchester start bit N/A
    29 [0] MAN Machester encoding disabled
    28 [0] FILTER no filter on Rx line

    27 [0] Reserved
    26 [0] MAX_ITERATION (ISO7816 mode only)
    25 [0] "
    24 [0] "

    23 [0] INVDATA data is not inverted
    22 [1] VAR_SYNC sync field is updated on char to US_THR
    21 [0] DSNACK delicious! NACK is sent on ISO line immeidately on parity error
    20 [0] INACK transmission starts as oons as byte is written to US_THR

    19 [0] OVER 16x oversampling
    18 [1] CLKO USART drives the SCK pin
    17 [0] MODE9 CHRL defines char length
    16 [1] CPOL clock is high when inactive

    15 [0] CHMODE normal mode
    14 [0] "
    13 [0] NBSTOP N/A
    12 [1] "

    11 [1] PAR no parity
    10 [0] "
    09 [0] "
    08 [0] CPHA data captured on leading edge of SPCK (first high to low transition does not count)

    07 [1] CHRL 8 bits
    06 [1] "
    05 [0] USCLKS MCK
    04 [0] "

    03 [1] USART_MODE SPI Master
    02 [1] "
    01 [1] "
    00 [0] "
*/


/* USART Interrupt Enable Register - Page 741 */

/*
    31 [0] Reserved
    30 [0] "
    29 [0] "
    28 [0] "

    27 [0] "
    26 [0] "
    25 [0] "
    24 [0] MANE Manchester Error interrupt not enabled

    23 [0] Reserved
    22 [0] "
    21 [0] "
    20 [0] "

    19 [0] CTSIC Clear to Send Change interrupt not enabled
    18 [0] DCDIC Data Carrier Detect Change interrupt not enabled
    17 [0] DSRIC Data Set Ready Change interrupt not enabled
    16 [0] RIIC Ring Inidicator Change interrupt not enabled

    15 [0] Reserved
    14 [0] "
    13 [0] NACK Non Ack interrupt not enabled
    12 [0] RXBUFF Reception Buffer Full (PDC) interrupt not enabled

    11 [0] TXBUFE Transmission Buffer Empty (PDC) interrupt not enabled
    10 [0] ITER/UNRE Max number of Repetitions Reached interrupt not enabled
    09 [0] TXEMPTY Transmitter Empty interrupt not enabled (yet)
    08 [0] TIMEOUT Receiver Time-out interrupt not enabled

    07 [0] PARE Parity Error interrupt not enabled
    06 [0] FRAME Framing Error interrupt not enabled
    05 [0] OVRE Overrun Error interrupt not enabled
    04 [0] ENDTX End of Transmitter Transfer (PDC) interrupt not enabled for now

    03 [0] ENDRX End of Receiver Transfer (PDC) interrupt not enabled for now
    02 [0] RXBRK Break Received interrupt not enabled
    01 [0] TXRDY Transmitter Ready interrupt not enabled
    00 [0] RXRDY Receiver Ready interrupt not enabled
*/

/* USART Interrupt Disable Register - Page 743 */


/* USART Baud Rate Generator Register - Page 752
BAUD = MCK / CD 
=> CD = MCK / BAUD
BAUD desired = 1 Mbps
=> CD = 48
*/

/*
    31-20 [0] Reserved

    19 [0] Reserved
    18 [0] FP baud disabled
    17 [0] "
    16 [0] "

    15 [0] CD = 48 = 0x30
    14 [0] "
    13 [0] "
    12 [0] "

    11 [0] "
    10 [0] "
    09 [0] "
    08 [0] "

    07 [0] "
    06 [0] "
    05 [1] "
    04 [1] "

    03 [0] "
    02 [0] "
    01 [0] "
    00 [0] "
*/


/*--------------------------------------------------------------------------------------------------------------------
Two Wire Interface setup

I�C Master mode for ASCII LCD communication
*/

/*-------------------- TWI0 ---------------------*/
/*Control Register*/

/*
    31-8 [0] Reserved

    07 [0] SWRST - Software reset
    06 [0] QUICK - SMBUS Quick Command
    05 [1] SVDIS - Slave mode disable - disabled
    04 [0] SVEN - Slave mode enable

    03 [0] MSDIS - Master mode disable
    02 [1] MSEN - Master mode enable
    01 [0] STOP - Stop a transfer
    00 [0] START - Start a transfer
*/

/*Master Mode Register*/

/*
    31-24 [0] Reserved
    
    23 [0] Reserved
    22 [0] DADR - device slave address - start with zero
    21 [0] "
    20 [0] "

    19 [0] "
    18 [0] "
    17 [0] "
    16 [0] "

    15 [0] Reserved
    14 [0] "
    13 [0] "
    12 [0] MREAD - Master Read Direction - 0 -> Write, 1 -> Read

    11 [0] Reserved
    10 [0] "
    09 [0] IADRSZ - Internal device address - 0 = no internal device address
    08 [0] "

    07-0 [0] Reserved
*/

/* Clock Wave Generator Register */
/* 
    Calculation:
        T_low = ((CLDIV * (2^CKDIV))+4) * T_MCK
        T_high = ((CHDIV * (2^CKDIV))+4) * T_MCK

        T_MCK - period of master clock = 1/(48 MHz)
        T_low/T_high - period of the low and high signals
        
        CKDIV = 2, CHDIV and CLDIV = 59
        T_low/T_high = 2.5 microseconds

        Data frequency - 
        f = ((T_low + T_high)^-1)
        f = 200000 Hz 0r 200 kHz

    Additional Rates:
        50 kHz - 0x00027777
       100 kHz - 0x00023B3B
       200 kHz - 0x00021D1D
       400 kHz - 0x00030707  *Maximum rate*
*/

/*
    31-20 [0] Reserved
    
    19 [0] Reserved
    18 [0] CKDIV
    17 [1] "
    16 [0] "

    15 [0] CHDIV
    14 [0] "
    13 [0] "
    12 [1] "

    11 [1] "
    10 [1] "
    09 [0] "
    08 [1] "

    07 [0] CLDIV - Clock Low Divider
    06 [0] "
    05 [0] "
    04 [1] "

    03 [1] "
    02 [1] "
    01 [0] "
    00 [1] "
*/

/*Interrupt Enable Register*/

/*
    31-16 [0] Reserved

    15 [0] TXBUFE - Transmit Buffer Empty
    14 [0] RXBUFF - Receive Buffer Full
    13 [0] ENDTX - End of Transmit Buffer
    12 [0] ENDRX - End of Receive Buffer

    11 [0] EOSACC - End of Slave Address
    10 [0] SCL_WS - Clock Wait State
    09 [0] ARBLST - Arbitration Lost
    08 [1] NACK - Not Acknowledge

    07 [0] Reserved
    06 [1] OVRE - Overrun Error
    05 [0] GACC - General Call Access
    04 [0] SVACC - Slave Access

    03 [0] Reserved
    02 [0] TXRDY - Transmit Holding Register Ready
    01 [1] RXRDY - Receive Holding Register Ready
    00 [0] TXCOMP - Transmission Completed
*/

/*Interrupt Disable Register*/

/*
    31-16 [0] Reserved

    15 [1] TXBUFE - Transmit Buffer Empty
    14 [1] RXBUFF - Receive Buffer Full
    13 [1] ENDTX - End of Transmit Buffer
    12 [1] ENDRX - End of Receive Buffer

    11 [1] EOSACC - End of Slave Address
    10 [1] SCL_WS - Clock Wait State
    09 [1] ARBLST - Arbitration Lost
    08 [0] NACK - Not Acknowledge

    07 [0] Reserved
    06 [0] OVRE - Overrun Error
    05 [1] GACC - General Call Access
    04 [1] SVACC - Slave Access

    03 [0] Reserved
    02 [1] TXRDY - Transmit Holding Register Ready
    01 [0] RXRDY - Receive Holding Register Ready
    00 [1] TXCOMP - Transmission Completed
*/



/*--------------------------------------------------------------------------------------------------------------------*/
/* End of File */
/*--------------------------------------------------------------------------------------------------------------------*/

#line 31 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\captouch.c"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\libraries\\captouch\\libqtouch.h"
/* ----------------------------------------------------------------------------
 *         ATMEL Microcontroller Software Support
 * ----------------------------------------------------------------------------
 * Copyright (c) 2010, Atmel Corporation
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the disclaimer below.
 *
 * Atmel's name may not be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * ----------------------------------------------------------------------------
 */





#line 41 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\libraries\\captouch\\libqtouch.h"



#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"
/*******************************************************************************
*   Atmel Corporation:  http://www.atmel.com
*   Support email:  touch@atmel.com
******************************************************************************/
/*  License
*   Copyright (c) 2010, Atmel Corporation All rights reserved.
*
*   Redistribution and use in source and binary forms, with or without
*   modification, are permitted provided that the following conditions are met:
*
*   1. Redistributions of source code must retain the above copyright notice,
*   this list of conditions and the following disclaimer.
*
*   2. Redistributions in binary form must reproduce the above copyright notice,
*   this list of conditions and the following disclaimer in the documentation
*   and/or other materials provided with the distribution.
*
*   3. The name of ATMEL may not be used to endorse or promote products derived
*   from this software without specific prior written permission.
*
*   THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR IMPLIED
*   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
*   MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE EXPRESSLY AND
*   SPECIFICALLY DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT,
*   INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
*   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
*   ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
*   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
*   THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/





/*----------------------------------------------------------------------------
                            nested include files
----------------------------------------------------------------------------*/
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdint.h"
/* stdint.h standard header */
/* Copyright 2003-2010 IAR Systems AB.  */
#line 235 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdint.h"

#line 258 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdint.h"

/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */
#line 42 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"


#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdbool.h"
/* stdbool.h header */
/* Copyright 2003-2010 IAR Systems AB.  */

/* NOTE: IAR Extensions must be enabled in order to use the bool type! */





  #pragma system_include















/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */
#line 46 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"
#line 1 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"
/* stdlib.h standard header */
/* Copyright 2005-2010 IAR Systems AB. */

#line 468 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"

#line 494 "E:\\Software\\IAR Systems\\Embedded Workbench 7.5\\arm\\inc\\c\\stdlib.h"

/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */
#line 48 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"
#line 1 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include\\touch_qt_config.h"
/* ----------------------------------------------------------------------------
 *         ATMEL Microcontroller Software Support
 * ----------------------------------------------------------------------------
 * Copyright (c) 2010, Atmel Corporation
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the disclaimer below.
 *
 * Atmel's name may not be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * ----------------------------------------------------------------------------
 */




/*
 * Configuration for MPGL2-02 board
 */



/*
* Number of Channels(dependent on the library used).Please refer to the user guide
* more information on selecting the number of channels.
*
* Possible values: 32.
*/




/*
* Delay cycles that determine the capacitance charge pulse width.
*
* Possible values: 3,4,5,10,25,50
*/




/*
* Enabling the _ROTOR_SLIDER_ constant will link the library need for using rotors
* and sliders.
*
* Possible values: comment/uncomment the define
*/




/*
* Define the ports to be used for SNS1 and SNSK1 pins. SNS1 and SNSK1 port pins
* can be available on the same port or on different ports
*
* Possible values: refer to the device data sheet and QTouch libraries user guide.
*/
#line 80 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include\\touch_qt_config.h"

/*
* Define the ports to be used for SNS2 and SNSK2 pins. SNS2 and SNSK2 port pins
* can be available on the same port or on different ports
*
* Possible values: refer to the device data sheet and QTouch libraries user guide.
*/
#line 93 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include\\touch_qt_config.h"

/**************************************************************/
/* Please do not change any part of the code below this line. */
/**************************************************************/


























    //#define _DEBUG_INTERFACE_





#line 54 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"











/*----------------------------------------------------------------------------
                        Note: choice of library version
------------------------------------------------------------------------------
QTouch libraries are supplied built with a range of charge times.
Charge time is the duration in which charge is transferred from the AVR onto
the measurement capacitor. Shorter charge times result in faster measurements,
but may be too fast to completely transfer charge onto the measurement
capacitor.

The range of charge times lets the user choose a suitable version for the clock
rate their chip is running at.

To make capacitive measurements, a charge time on the order of 0.25us to 2.5us
is typically required. The following table shows the charge times corresponding
to a range of clock speeds.

Clock speed (MHz) Cycle time (us) Suitable charge times
----------------- --------------- ---------------------
      1              1            1~2 cycles (1us to 2us)
      2              0.5          1~5 cycles (0.5us to 2.5us)
      4              0.25         1~10 cycles (0.25us to 2.5us)
      8              0.125        2~10 cycles (0.25us to 1.25us)
      10             0.1          3~25 cycles (0.3us to 2.5us)
      16             0.0625       4~25 cycles (0.25us to 1.5625s)
      20             0.05         5~50 cycles (0.25us to 2.5us)

----------------------------------------------------------------------------*/

/* *********Error Checking For the User Configuration Options Start********** */
#line 167 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"
/* ******************************Error Checking For the User Configuration Options End ***************** */

/*  Total ticks per msec.  */
/*
*  TICKS_PER_MS = (CLK_FREQ/TIMER_PRESCALER)*(1/1000)
*
*/


/* Initialization values for the Qtouch library parameters. */
/*
* Sensor detect integration (DI) limit.
* Default value: 4.
*/


/*
* Sensor negative drift rate.
*
* Units: 200ms
* Default value: 20 (4 seconds per LSB).
*/


/*
* Sensor positive drift rate.
*
* Units: 200ms
* Default value: 5 (1 second per LSB).
*/


/*
* Sensor drift hold time.
*
* Units: 200ms
* Default value: 20 (hold off drifting for 4 seconds after leaving detect).
*/


/*
* Sensor maximum on duration.
*
* Units: 200ms (e.g., 150 = recalibrate after 30s). 0 = no recalibration.
* Default value: 0 (recalibration disabled).
*/


/*
* Sensor recalibration threshold.
*
* Default: RECAL_50 (recalibration threshold = 50% of detection threshold).
*/


/*
* Positive recalibration delay.
*
* Default: 3
*/


/*--------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
                    WARNING! Do not edit below this line.
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
                                    macros
----------------------------------------------------------------------------*/
/* utility macro for expanding port registers   */



/* Macro to build register writes for controlling ports. The intermediate
*  JOIN macro is required for correct expansion of the args.   */



/* The number of bytes required to report the maximum possible number of
*  sensors. */


/* Status flags used with debug  */
/* indicating no activity */

/* indicating that at least one sensor is in detect   */

/* indicating that at least one sensor haschanged ON/OFF state since last call to measure_sensors */

/* indicating that at least one rotor slider has changed position since last call to measure_sensors  */

/* indicating that at least one reference value has changed since last call to measure_sensors  */

/* indicating that reburst is needed to resolve in FILTERIN or FILTEROUT or RECALIBRATE state.  */

/* indicating that reburst is needed to resolve in CALIBRATION  */

/* indicating that reburst is needed to resolve in FILTERING  */

/* indicating that reburst is needed to resolve in RECAL */

/* indicating that reburst is needed to resolve in RECAL */


/*----------------------------------------------------------------------------
                                type definitions
----------------------------------------------------------------------------*/
#line 290 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"

/*	This part of the code below is used for library selection. This code will not be documented.	*/
/****************************************************************************************************/











#line 316 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"

#line 366 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"

#line 403 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"

            /* static port pin configurability declarations */


                /*  first SNS - SNSK port pin pairing.  */
















                /* second SNS - SNSK port pin pairing. */









#line 446 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"
                /*  Macros for string concatenation. */



                /*  Build pointer to correct burst function   */
#line 457 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"



        /* Burst function prototype. The code itself is stored in the touch library   */
        extern void burst_10_AA_BB( uint32_t mask_index );

        /* Function pointer used for bursting  */
        extern void (*burst_proc)( uint32_t mask_index);




/****************************************************************************************************/

/********************************************QMATRIX Start*************************************************/

#line 553 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"

/********************************************QMATRIX End **************************************************/

/* An unsigned 8-bit number setting a sensor detection threshold. */
typedef uint8_t threshold_t;

/* Options for the sensor types available.   */
typedef enum tag_sensor_type_t
{
    SENSOR_TYPE_UNASSIGNED,
    SENSOR_TYPE_KEY,
    SENSOR_TYPE_ROTOR,
    SENSOR_TYPE_SLIDER
} sensor_type_t;

/* Which AKS group, if any, a sensor is in.
*
*  NO_AKS_GROUP = sensor is not in an AKS group, and cannot be suppressed.
*  AKS_GROUP_x  = sensor is in AKS group x.  */
typedef enum tag_aks_group_t
{
    NO_AKS_GROUP,
    AKS_GROUP_1,
    AKS_GROUP_2,
    AKS_GROUP_3,
    AKS_GROUP_4,
    AKS_GROUP_5,
    AKS_GROUP_6,
    AKS_GROUP_7
} aks_group_t;

/* The channel(s) in a sensor.   */
typedef enum tag_channel_t
{

    CHANNEL_0,
    CHANNEL_1,
    CHANNEL_2,
    CHANNEL_3


   ,CHANNEL_4,
    CHANNEL_5,
    CHANNEL_6,
    CHANNEL_7


   ,CHANNEL_8,
    CHANNEL_9,
    CHANNEL_10,
    CHANNEL_11


   ,CHANNEL_12,
    CHANNEL_13,
    CHANNEL_14,
    CHANNEL_15


   ,CHANNEL_16,
    CHANNEL_17,
    CHANNEL_18,
    CHANNEL_19,
    CHANNEL_20,
    CHANNEL_21,
    CHANNEL_22,
    CHANNEL_23


   ,CHANNEL_24,
    CHANNEL_25,
    CHANNEL_26,
    CHANNEL_27,
    CHANNEL_28,
    CHANNEL_29,
    CHANNEL_30,
    CHANNEL_31
#line 667 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"
} channel_t;

/* A sensor detection hysteresis value.  This is expressed as a percentage of
*  the sensor detection threshold.
*
*  HYST_x = hysteresis value is x% of detection threshold value (rounded down).
*  NB: a minimum value of 2 is used.
*
*  Example: if detection threshold = 20, then:
*     HYST_50   = 10 (50% of 20)
*     HYST_25   = 5  (25% of 20)
*     HYST_12_5 = 2  (12.5% of 20)
*     HYST_6_25 = 2  (6.25% of 20 = 1, but value is hardlimited to 2)   */
typedef enum tag_hysteresis_t
{
    HYST_50,
    HYST_25,
    HYST_12_5,
    HYST_6_25
} hysteresis_t;

/* For rotors and sliders, the resolution of the reported angle or position.
*
*  RES_x_BIT = rotor/slider reports x-bit values.
*
*  Example: if slider resolution is RES_7_BIT, then reported positions are in
*  the range 0..127. */
typedef enum tag_resolution_t
{
    RES_1_BIT,
    RES_2_BIT,
    RES_3_BIT,
    RES_4_BIT,
    RES_5_BIT,
    RES_6_BIT,
    RES_7_BIT,
    RES_8_BIT
} resolution_t;

/* A sensor recalibration threshold.  This is expressed as a percentage of the
*  sensor detection threshold.
*
*  RECAL_x = recalibration threshold is x% of detection threshold value
*           (rounded down).
*  NB:   a minimum value of 4 is used.
*
*  Example: if detection threshold = 40, then:
*     RECAL_100  = 40 (100% of 40)
*     RECAL_50   = 20 (50% of 40)
*     RECAL_25   = 10 (25% of 40)
*     RECAL_12_5 = 5  (12.5% of 40)
*  RECAL_6_25 = 4  (6.25% of 40 = 2, but value is hardlimited to 4)  */
typedef enum tag_recal_threshold_t
{
    RECAL_100,
    RECAL_50,
    RECAL_25,
    RECAL_12_5,
    RECAL_6_25
} recal_threshold_t;

/* The state of the library sensors. */
typedef struct tag_qt_touch_status_t
{
    /* The state (on/off) of the library sensors.
    *  Bit 'n' = state of sensor 'n'.
    *  Bit 0 = sensor_states[0] bit 0
    *  Bit 1 = sensor_states[0] bit 1
    *  ...
    *  Bit 7 = sensor_states[0] bit 7
    *  Bit 8 = sensor_states[1] bit 0
    *  Bit 9 = sensor_states[1] bit 1
    *  ... etc
    *  0 = not in detect, 1 = in detect.*/
    uint8_t sensor_states[( ( 32 + 7u ) / 8u )];
    /* Rotor angles or slider positions.
    *  These values are valid when sensor_states shows that the corresponding
    *  rotor or slider sensor is in detect.*/
    uint8_t rotor_slider_values[8];
} qt_touch_status_t;


/* post processing configuration data that is received from the debug interface. */
typedef struct tag_qt_touch_lib_config_data_t
{
    /*   Sensor recalibration threshold.  */
    recal_threshold_t qt_recal_threshold;
    /*   Sensor detect integration (DI) limit.  */
    uint8_t qt_di;
    /*   Sensor drift hold time. */
    uint8_t qt_drift_hold_time;
    /*   Sensor maximum on duration.   */
    uint8_t qt_max_on_duration;
    /*   Sensor negative drift rate.   */
    uint8_t qt_neg_drift_rate;
    /*   Sensor positive drift rate.   */
    uint8_t qt_pos_drift_rate;
    /*   Positive recalibration delay. */
    uint8_t qt_pos_recal_delay;
} qt_touch_lib_config_data_t;

/* measured touch data that is sent for the debugging and fine tunning. */
typedef struct tag_qt_touch_lib_measure_data_t
{
    /*   measured signal on each channel  */
    uint16_t channel_signals[32];
    /*   reference signal for each channel   */
    uint16_t channel_references[32];
    /*   state of sensors  */
    qt_touch_status_t qt_touch_status;
} qt_touch_lib_measure_data_t;

/* This will be used to get the library information from the library */
typedef struct qt_lib_sig_info_t
{
    uint16_t lib_sig_lword;
    uint16_t lib_sig_hword;
    uint16_t library_version;
}qt_lib_siginfo_t;


typedef struct tag_sensor_t
{
    /* sensor state (calibrating, on, ...) */
    uint8_t state;

    /* general purpose ctr: used for calibration, drifting, etc */
    uint8_t general_counter;

    /* DI ctr */
    uint8_t ndil_counter;

    /* sensor detection threshold */
    uint8_t threshold;

    /*
    * sensor type, AKS group, positive recal flag, and hysteresis value
    * bits 7..6: sensor type: 00: key
    *                         01: rotor
    *                         10: slider
    *                         11: reserved
    * bits 5..3: AKS group (0..7): 0 = no AKS group
    * bit 2    : positive recal flag
    * bits 1..0: hysteresis
    */
    uint8_t type_aks_pos_hyst;

    /*
    * sensor from and to channels
    * keys: from channel = to channel
    * rotors/sliders run between the from and to channels
    * NB: only need to_channel for keys in rotors/sliders build
    */
    uint8_t from_channel;


    uint8_t to_channel;

    /* index into array of rotor/slider values */
    uint8_t index;


} sensor_t;

/*----------------------------------------------------------------------------
                                extern variables
----------------------------------------------------------------------------*/
/* This configuration data structure parameters if needs to be changed will be
   changed in the qt_set_parameters function */
extern qt_touch_lib_config_data_t qt_config_data;
/* variable holding the status flags */
extern uint16_t lib_status_flags;
/* the library sensors */
extern sensor_t sensors[32];
/* timer period in msec */
extern uint16_t qt_measurement_period_msec;


/*This function is called after the library has made capacitive measurements,
* but before it has processed them. The user can use this hook to apply filter
* functions to the measured signal values. */
extern void (*qt_filter_callback)( void );

/*============================================================================
Name     :  qt_get_library_sig
------------------------------------------------------------------------------
Purpose  :  Get the library signature
Input    :  qt_lib_siginfo_t * lib_sig_ptr=Pointer to the library signature structure
Output   :  n/a
Notes    :  This API would provide the information of the
            library and fill into the structure
============================================================================*/

extern void  qt_get_library_sig(qt_lib_siginfo_t * lib_sig_ptr);

/*============================================================================
Name     :  qt_enable_key
------------------------------------------------------------------------------
Purpose  :  enable a key sensor
Input    :  channel = which touch channel the key sensor uses
            aks_group = which AKS group (if any) the sensor is in
            detect_threshold = the sensor detection threshold
            detect_hysteresis = the sensor detection hysteresis value
Output   :  n/a
Notes    :  The sensor number corresponding to the key depends on the order in
            which sensors are enabled. The first sensor enabled is sensor 0, the
            second is sensor 1, and so on.

            The current state of the key (on or off) can be checked in
            qt_touch_status.sensor_states.
============================================================================*/
extern void qt_enable_key(    channel_t channel,
                     aks_group_t aks_group,
                     threshold_t detect_threshold,
                    hysteresis_t detect_hysteresis );

/*============================================================================
Name     :  qt_init_sensing
------------------------------------------------------------------------------
Purpose  :  initialise touch sensing
Input    :  n/a
Output   :  n/a
Notes    :  Any sensors required must be enabled (using qt_enable_xxx()) before
            calling this function.

            This function calculates internal library variables and configures
            the touch channels, and must be called before qt_measure_sensors().
============================================================================*/



    extern void qt_init_sensing_with_burst(void (*burst_function)(uint32_t mask_index), void (*calculate_masks)(void));
	extern void calc_masks(void);
#line 906 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\libraries\\captouch\\include/touch_api.h"


/*============================================================================
Name     :  qt_measure_sensors
------------------------------------------------------------------------------
Purpose  :  measure touch sensors
Input    :  current_time_ms = the current time, in ms
Output   :  outputs the library status bits
Notes    :  This function performs a capacitive measurement on all enabled
            sensors. The measured signals for each sensor are then processed to
            check for user touches, releases, changes in rotor angle, changes in
            slider position, etc.

            The current state of all enabled sensors is reported in the
            qt_touch_status struct.

            Before calling this function, one or more sensors must have been
            enabled (using qt_enable_xxx()), and qt_init_sensing() must
            have been called.
============================================================================*/
extern uint16_t qt_measure_sensors( uint16_t current_time_ms );


/*============================================================================
Name     :  qt_calibrate_sensing
------------------------------------------------------------------------------
Purpose  :  calibrate touch sensing
Input    :  n/a
Output   :  n/a
Notes    :  This function forces a calibration of all enabled sensors.

            This may be useful if, for instance, it is desired to globally
            recalibrate all sensors on a change in application operating mode.
============================================================================*/
extern void qt_calibrate_sensing( void );


/*============================================================================
Name     :  qt_reset_sensing
------------------------------------------------------------------------------
Purpose  :  reset touch sensing
Input    :  n/a
Output   :  n/a
Notes    :  This function disables all enabled sensors, and returns all library
            variables (e.g., qt_di) to their default values.

            This may be useful if it is desired to dynamically reconfigure
            sensing. After calling this function, any required sensors must be
            re-enabled, and qt_init_sensing() must be called before
            qt_measure_channels() is called again.
============================================================================*/
extern void qt_reset_sensing( void );

/*============================================================================
Name     :  qt_get_sensor_delta
------------------------------------------------------------------------------
Purpose  :  get the current delta on the specified sensor
Input    :  sensor = sensor number for which to get the delta
Output   :  returns the delta on the specified sensor
Notes    :  This function is supplied as a functional replacement for the
            sensor_deltas[] array provided in earlier library versions.
============================================================================*/
extern int16_t qt_get_sensor_delta( uint8_t sensor );



/*============================================================================
Name     :  qt_enable_rotor
------------------------------------------------------------------------------
Purpose  :  enable a rotor sensor
Input    :  from_channel = the first channel in the rotor sensor
            to_channel = the last channel in the rotor sensor
            aks_group = which AKS group (if any) the sensor is in
            detect_threshold = the sensor detection threshold
            detect_hysteresis = the sensor detection hysteresis value
            angle_resolution = the resolution of the reported angle value
            angle_hysteresis = the hysteresis of the reported angle value
Output   :  n/a
Notes    :  The sensor number corresponding to the rotor depends on the order in
            which sensors are enabled. The first sensor enabled is sensor 0, the
            second is sensor 1, and so on.

            The current state of the rotor (on or off) can be checked in
            qt_touch_status.sensor_states.

            The rotor value is in qt_touch_status.rotor_slider_values[]. Which
            array element is used depends on the order in which sensors are
            enabled. The first rotor or slider enabled will use
            rotor_slider_values[0], the second will use rotor_slider_values[1],
            and so on.

            The reported rotor value is valid when the rotor is on.
============================================================================*/
extern void qt_enable_rotor(    channel_t from_channel,
                         channel_t to_channel,
                       aks_group_t aks_group,
                       threshold_t detect_threshold,
                      hysteresis_t detect_hysteresis,
                      resolution_t angle_resolution,
                           uint8_t angle_hysteresis );

/*============================================================================
Name     :  qt_enable_slider
------------------------------------------------------------------------------
Purpose  :  enable a slider sensor
Input    :  from_channel = the first channel in the slider sensor
            to_channel = the last channel in the slider sensor
            aks_group = which AKS group (if any) the sensor is in
            detect_threshold = the sensor detection threshold
            detect_hysteresis = the sensor detection hysteresis value
            position_resolution = the resolution of the reported position value
            position_hysteresis = the hysteresis of the reported position value
Output   :  n/a
Notes    :  The sensor number corresponding to the slider depends on the order in
            which sensors are enabled. The first sensor enabled is sensor 0, the
            second is sensor 1, and so on.

            The current state of the slider (on or off) can be checked in
            qt_touch_status.sensor_states.

            The slider value is in qt_touch_status.rotor_slider_values[]. Which
            array element is used depends on the order in which sensors are
            enabled. The first rotor or slider enabled will use
            rotor_slider_values[0], the second will use rotor_slider_values[1],
            and so on.

            The reported slider value is valid when the rotor is on.
============================================================================*/
extern void qt_enable_slider(    channel_t from_channel,
                          channel_t to_channel,
                        aks_group_t aks_group,
                        threshold_t detect_threshold,
                       hysteresis_t detect_hysteresis,
                       resolution_t position_resolution,
                            uint8_t position_hysteresis );






#line 45 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\iar_7_20_1\\..\\libraries\\captouch\\libqtouch.h"

#line 32 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\captouch.c"






/***********************************************************************************************************************
Global variable definitions with scope across entire project.
All Global variable names shall start with "G_CapTouch"
***********************************************************************************************************************/


/*--------------------------------------------------------------------------------------------------------------------*/
/* Existing variables (defined in other files -- should all contain the "extern" keyword) */
extern volatile u32 G_u32SystemFlags;                  /* From main.c */
extern volatile u32 G_u32ApplicationFlags;             /* From main.c */

extern volatile u32 G_u32SystemTime1ms;                /* From board-specific source file */
extern volatile u32 G_u32SystemTime1s;                 /* From board-specific source file */

/* measurement data */
extern qt_touch_lib_measure_data_t qt_measure_data;

extern u32 G_u32DebugFlags;                            /* From debug.c */


/***********************************************************************************************************************
Global variable definitions with scope limited to this local application.
Variable names shall start with "CapTouch_" and be declared as static.
***********************************************************************************************************************/
/* New variables */
fnCode_type CapTouch_pfnStateMachine;                  /* The state machine function pointer */

u32 CapTouch_u32Timer;                                 /* Measurement timer */        
u8 CapTouch_u8CurrentHSliderValue;                     /* Current horizontal slider value */
u8 CapTouch_u8CurrentVSliderValue;                     /* Current vertical slider value */


/***********************************************************************************************************************
Function Definitions
***********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
/* Public functions                                                                                                   */
/*--------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
Function: CapTouchOn

Description:
Sets the state machine to "Measuring" so that the captouch functionality is active.  This is fairly processor intensive.

Requires:

Promises:
  - Horizontal CapTouch sensor is active

*/
void CapTouchOn(void)
{
  CapTouch_pfnStateMachine = CapTouchSM_Measure;
  
} /* end CapTouchOn() */


/*----------------------------------------------------------------------------------------------------------------------
Function: CapTouchOff

Description:
Sets the state machine to "Idle" so that the captouch functionality is disabled.

Requires:

Promises:
  - Horizontal CapTouch sensor is not active
*/
void CapTouchOff(void)
{
  CapTouch_pfnStateMachine = CapTouchSM_Idle;
  CapTouch_u8CurrentHSliderValue = 0;
  CapTouch_u8CurrentVSliderValue = 0;
  
} /* end CapTouchOff() */


/*----------------------------------------------------------------------------------------------------------------------
Function: CaptouchCurrentHSlidePosition

Description:
Returns the current slider count (0-254)

Requires:

Promises:
  - Returns the current slider count (0-254)
*/
u8 CaptouchCurrentHSlidePosition(void)
{
  return CapTouch_u8CurrentHSliderValue;
  
} /* end CaptouchCurrentHSlidePosition() */


/*----------------------------------------------------------------------------------------------------------------------
Function: CaptouchCurrentVSlidePosition

Description:
Returns the current slider count (0-254)

Requires:

Promises:
  - Returns the current slider count (0-254)
*/
u8 CaptouchCurrentVSlidePosition(void)
{
  return CapTouch_u8CurrentVSliderValue;
  
} /* end CaptouchCurrentVSlidePosition() */


/*--------------------------------------------------------------------------------------------------------------------*/
/* Protected functions                                                                                                */
/*--------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------
Function: CapTouchInitialize

Description:
This function initializes the module. The library version is checked, the
buttons being used are initialized, and the configuration parameters are set.

The qt_xxx functions are part of the QTouch API.

Requires:

Promises:
  - Returns ERROR if the library doesn't match what's expected, else SUCCESS

*/
ErrorStatus CapTouchInitialize(void)
{
	/* Ensure library is correct */
	if (CapTouchVerify() != SUCCESS)
	{
		return (ERROR);
	}

	/* Reset touch sensing */
	qt_reset_sensing();

  /* Configure the GPIO used for the Horizontal Slider */
  qt_enable_slider( CHANNEL_0, CHANNEL_2, NO_AKS_GROUP, 50u, HYST_50, RES_8_BIT, 0u  );

  /* Configure the GPIO used for the Vertical Slider */
  qt_enable_slider( CHANNEL_19, CHANNEL_21, NO_AKS_GROUP, 50u, HYST_50, RES_8_BIT, 0u  );

  /* Initialise and calibrate touch sensing (all sensors must be enabled first)*/
  qt_init_sensing_with_burst( burst_10_AA_BB ,calc_masks);
  qt_calibrate_sensing();

  /* Set the parameters like recalibration threshold, Max_On_Duration etc .
  These are user configurable */
  CapTouchSetParameters( );

  /* Address to pass address of user functions */
  /* This function is called after the library has made capacitive measurements,
  but before it has processed them. The user can use this hook to apply filter
  functions to the measured signal values.(Possibly to fix sensor layout faults) */
  qt_filter_callback = 0;

  CapTouch_u32Timer = 0;
  CapTouch_u8CurrentHSliderValue = 0;
  CapTouch_u8CurrentVSliderValue = 0;
  
  CapTouch_pfnStateMachine = CapTouchSM_Idle;
  G_u32ApplicationFlags |= 0x00000080;
  return (SUCCESS);
}


/*----------------------------------------------------------------------------------------------------------------------
Function CapTouchRunActiveState()

Description:
Selects and runs one iteration of the current state in the state machine.
All state machines have a TOTAL of 1ms to execute, so on average n state machines
may take 1ms / n to execute.

Requires:
  - State machine function pointer points at current state

Promises:
  - Calls the function to pointed by the state machine function pointer
*/
void CapTouchRunActiveState(void)
{
  CapTouch_pfnStateMachine();

} /* end CapTouchRunActiveState */


/*----------------------------------------------------------------------------------------------------------------------
Function: CapTouchVerify

Description:
This function verifies the captouch library that's being used and makes sure
the capabilities (and version) match what's expected and required.

Requires:

Promises:
  - Returns ERROR if the library doesn't match what's expected, else SUCCESS

*/
ErrorStatus CapTouchVerify(void)
{
    u32 u32Error = 0;

    qt_lib_siginfo_t plib_sig;

    /* Read library signature info */
    qt_measure_sensors( 0 );
    qt_get_library_sig(&plib_sig);

    /* QTouch or Matrix */
    if((plib_sig.lib_sig_lword & 0x01) == 0)
    {
        DebugPrintf("Library QTouch ");
    }
    else
    {
        DebugPrintf("Library QMatrix ");
        u32Error++;
    }

    /* Max channels should be 32 */
    if ( ((plib_sig.lib_sig_lword >> 3) & 0x7F) != 32)
    {
       u32Error++;
    }

    /* Should supoprt sliders/roters */
    if( ((plib_sig.lib_sig_lword >> 10) & 0x01) == 0)
    {
        DebugPrintf("supports only keys \r\n");
        u32Error++;
    }
    else
    {
        DebugPrintf("supports keys and rotors/sliders. ");
    }

    /* Should supoprt 8 sliders */
    if ( ((plib_sig.lib_sig_lword >> 11) & 0x1F) != 8 )
    {
        u32Error++;
    }

    /* Current version: $0440 */
    DebugPrintf("Version ");
    DebugPrintNumber(plib_sig.library_version);
    DebugLineFeed();
    if ( (plib_sig.library_version) != 0x440)
    {
       u32Error++;
    }

    /* if error count = 0, all is good */
    if (u32Error == 0)
    {
       return (SUCCESS);
    }

    return (ERROR);
}


/*----------------------------------------------------------------------------------------------------------------------
Function: CapTouchSetParameters

Description:

This will fill the default threshold values in the configuration
data structure. These values can be tweaked to optimize performance.

Requires:
  - DEF_QT_xxx values are defined in touch_api.h

Promises:
  -

*/
static void CapTouchSetParameters( void )
{
    /*  This can be modified by the user to different values   */
    qt_config_data.qt_di              = 4u;
    qt_config_data.qt_neg_drift_rate  = 20;
    qt_config_data.qt_pos_drift_rate  = 5;
    qt_config_data.qt_max_on_duration = 0;
    qt_config_data.qt_drift_hold_time = 20;
    qt_config_data.qt_recal_threshold = RECAL_50;
    qt_config_data.qt_pos_recal_delay = 3u;
}


/*----------------------------------------------------------------------------------------------------------------------
Function: CapTouchUpdateSensorReadings

Description:

This is the main read routine to get the cap touch sensor
readings. It should be called periodically every 25ms.

Requires:
  - u16CurrentTimeMs is the current value of the tick timer
    (ideally in increments of 25ms)

Promises:
  - returns TRUE for successful read
  - returns FALSE if read times out !!!!! TODO 

*/
BOOL CapTouchUpdateSensorReadings(u16 u16CurrentTimeMs_)
{
  /*status flags to indicate the re-burst for library*/
  uint16_t status_flag = 0u;
  uint16_t burst_flag = 0u;

	do
	{
		/*  one time measure touch sensors    */
		status_flag = qt_measure_sensors( u16CurrentTimeMs_ );

		burst_flag = status_flag & (uint16_t) 0x0100;

	} while (burst_flag);

    return (TRUE);  // TODO: add timeout to return false
}

#line 394 "C:\\Users\\Anthony\\Google Drive\\Hobbies\\IAR\\Razor_Atmel\\firmware_dotmatrix\\drivers\\captouch.c"

/*----------------------------------------------------------------------------------------------------------------------
Function: u8CapTouchGetSliderValue

Description:

Call this function after a successful read from CapTouchUpdateSensorReadings
to obtain the value of a slider reading.

Requires:
  - eSliderNumber_ is the slider to read

Promises:
  - returns 8-bit value for sensor reading

*/
u8 u8CapTouchGetSliderValue(SliderNumberType eSliderNumber_)
{
  return (qt_measure_data . qt_touch_status . rotor_slider_values[eSliderNumber_]);
}


/*----------------------------------------------------------------------------------------------------------------------
Function: CapTouchGetDebugValues

Description:

Call this function after a successful read to obtains the raw channel measurement
and reference value. This will indicate what the 'normal' values should be when
the sensor is idle/not active (no finger present) along with the current reading.

Requires:

Promises:
  - *pu16Measure_ returns the value of the current measurement
  - *pu16Reference_ returns the normal, untouched value

*/
void CapTouchGetDebugValues(u8 u8Channel, u16* pu16Measure_, u16* pu16Reference_)
{
  *pu16Measure_ = qt_measure_data.channel_signals[u8Channel];
  *pu16Reference_ = qt_measure_data.channel_references[u8Channel];
}


/***********************************************************************************************************************
State Machine Function Definitions
***********************************************************************************************************************/

/*--------------------------------------------------------------------------------------------------------------------*/
void CapTouchSM_Idle(void)
{
  /* Do nothing here as the sensor is off */
  
} /* end CapTouchSM_Idle */


/*--------------------------------------------------------------------------------------------------------------------*/
void CapTouchSM_Measure(void)
{
  static u32 u32DebugPrintTimer = 0;
  static u8 au8CaptouchValuesMessage[] = "Captouch (H:V) "; 
  
  if( IsTimeUp(&CapTouch_u32Timer, (u32)25) )
  {
    CapTouch_u32Timer = G_u32SystemTime1ms;
    CapTouchUpdateSensorReadings((u16)G_u32SystemTime1ms);

    /* Read the horizontal slider */
    CapTouch_u8CurrentHSliderValue = u8CapTouchGetSliderValue(SLIDER0);
    
    /* Read the vertical slider */
    CapTouch_u8CurrentVSliderValue = u8CapTouchGetSliderValue(SLIDER1);

  }
  
  /* Print the current values if Debug function is enabled */
  if(G_u32DebugFlags & (u32)0x00010000)
  {
    if( IsTimeUp(&u32DebugPrintTimer, (u32)200) )
    {
      u32DebugPrintTimer = G_u32SystemTime1ms;

      DebugPrintf(au8CaptouchValuesMessage);
      DebugPrintNumber(CapTouch_u8CurrentHSliderValue);
      DebugPrintf(":");
      DebugPrintNumber(CapTouch_u8CurrentVSliderValue);
      DebugLineFeed();
    }
   
  }
               
} /* end CapTouchSM_Idle */
