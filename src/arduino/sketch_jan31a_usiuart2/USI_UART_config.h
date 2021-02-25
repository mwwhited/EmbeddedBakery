#ifndef USI_UART_H_
#define USI_UART_H_


#include <avr/io.h>
#include <avr/interrupt.h>

#ifdef __cplusplus
extern "C" {
#endif

/*****************************************************************************

  Copyright (C) 2003 Atmel Corporation

  File          : USI_UART_config.h
  Compiler      : IAR EWAAVR 2.28a
  Created       : 18.07.2002 by JLL
  Modified      : 02-10-2003 by LTA

  Support mail  : avr@atmel.com

  AppNote       : AVR307 - Half duplex UART using the USI Interface

  Description   : Header file for USI_UART driver


  Modified by Frank Zhao to work with Arduino
****************************************************************************/

//********** USI UART Defines **********//

//#define SYSTEM_CLOCK             14745600
//#define SYSTEM_CLOCK             11059200
//#define SYSTEM_CLOCK              8000000
//#define SYSTEM_CLOCK              7372800
//#define SYSTEM_CLOCK              3686400
//#define SYSTEM_CLOCK              2000000
//#define SYSTEM_CLOCK              1843200
//#define SYSTEM_CLOCK              1000000
#define SYSTEM_CLOCK (F_CPU)

//#define BAUDRATE                   115200
//#define BAUDRATE                    57600 // doesn't work on 16 MHz Trinket
//#define BAUDRATE                    28800
//#define BAUDRATE                    19200 // tested and works on 16 MHz Trinket
//#define BAUDRATE                    14400
#define BAUDRATE                     9600


//********** USI UART Defines **********//

#define DATA_BITS                 8
#define START_BIT                 1
#define STOP_BIT                  1
#define HALF_FRAME                5

//======================================================

/* General defines */
#ifndef TRUE
  #define TRUE                      1
#endif
#ifndef FALSE
  #define FALSE                     0
#endif

#define TIMER_PRESCALER           1
//#define TIMER_PRESCALER           8

#ifdef __AVR_ATtiny2313__
  #define UART_RX_BUFFER_SIZE        4     /* 2,4,8,16,32,64,128 or 256 bytes */
  #define UART_TX_BUFFER_SIZE        2
#else
  #define UART_RX_BUFFER_SIZE        8     /* 2,4,8,16,32,64,128 or 256 bytes */
  #define UART_TX_BUFFER_SIZE        4
#endif

//********** USI_UART Prototypes **********//

//unsigned char Bit_Reverse( unsigned char );
void          USI_UART_Flush_Buffers( void );
void          USI_UART_Initialise_Receiver( void );
void          USI_UART_Initialise_Transmitter( void );
void          USI_UART_Transmit_Byte( unsigned char );
unsigned char USI_UART_Receive_Byte( void );
unsigned char USI_UART_Data_In_Receive_Buffer( void );

extern volatile unsigned char UART_RxHead;
extern volatile unsigned char UART_RxTail;
extern unsigned char          UART_RxBuf[UART_RX_BUFFER_SIZE];

#ifdef __cplusplus
}
#endif

#ifdef __AVR_ATtiny2313__
  //#define __TIMER1__

  #ifdef __TIMER1__
    #ifndef TCNTn
      #define TCNTn TCNT1
    #endif
    #ifndef TCCRn
      #define TCCRn TCCR1B
    #endif
    #ifndef TOVn
      #define TOVn TOV1
    #endif
    #ifndef TOIEn
      #define TOIEn TOIE1
    #endif
  #else
    #ifndef TCNTn
      #define TCNTn TCNT0
    #endif
    #ifndef TCCRn
      #define TCCRn TCCR0B
    #endif
    #ifndef TOVn
      #define TOVn TOV0
    #endif
    #ifndef TOIEn
      #define TOIEn TOIE0
    #endif
  #endif
  
  #ifndef PSRn
    #define PSRn PSR10
  #endif
  #ifndef GIFR 
    #define GIFR EIFR
  #endif
  
#else
  #ifndef TCNTn
    #define TCNTn TCNT1
  #endif
  #ifndef TCCRn
    #define TCCRn TCCR1
  #endif
  #ifndef TOVn
    #define TOVn TOV1
  #endif
  #ifndef TOIEn
    #define TOIEn TOIE1
  #endif
  #ifndef PSRn
    #define PSRn PSR0
  #endif
#endif

#endif
