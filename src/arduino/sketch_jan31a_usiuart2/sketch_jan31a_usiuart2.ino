/* UsiSerial by me@frank-zhao.com
 *  
 * UsiSerial is a simple wrapper around the code from AVR307 so that Arduino can use USI to implement a hardware serial port
 *
 * This is a simple echo example.
 *
 * The USI class works almost exactly like HardwareSerial
 * So you can use print and println and other functions like that
 *
 * PORTB0 is DI, thus it is RX
 * PORTB1 is DO, thus it is TX
 * default baud rate is 19200, which can only be changed in USI_UART_config.h
 * only some baud rates will work, depending on CPU frequency
 * buffers are small to save memory, since this library is designed for ATtiny
 * testing was done using a 16 MHz Trinket
 *
 * Important note: requires Timer1 and PCINT to be occupied
 
  Copyright (c) 2013 Frank Zhao
  All rights reserved.

  UsiSerial is free software: you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation, either version 3 of
  the License, or (at your option) any later version.

  UsiSerial is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with UsiSerial. If not, see
  <http://www.gnu.org/licenses/>.
*/
// C:\Users\mwwhi\AppData\Local\arduino15\packages\tiny\hardware\avr

#include "UsiSerial.h"
/*  
                ATiny2313
  Reset,17,PA2 -| 1 V 20|- Vcc
  RXD  ,00,PD0 -1 2   19|- PB7,PCINT7,16,SCK/SCL
  TXD  ,01,PD1 -| 3   18|- PB6,PCINT6,15,MISO
  XTAL2,02,PA1 -| 4   17|- PB5,PCINT5,14,MOSI/SDA
  XTAL1,03,PA0 -| 5   16|- PB4,PCINT4,13,OC1B
  INT0 ,04,PD2 -| 6   15|- PB3,PCINT3,12,OC1A
  INIT1,05,PD3 -| 7   14|- PB2,PCINT2,11,OC0A
       ,06,PD4 -| 8   13|- PB1,PCINT1,10
       ,07,PD5 -| 9   12|- PB0.PCINT0,09
       ,  ,GND -|10   11|- PD6,      ,08
 */

// == Memory Use ==
// 756/52 with nothing
// 788/52 with UsiSerial
// 1488/125 with Serial
// 1522/125 with Usi and Serial
// 1522/95 with USI/Serial and shrinking buffer 
// 1874/89 with USI,Serial,Small Buffer(4),Pin Control 

#define _Relay_
#define _WatchDog_

#ifdef _WatchDog_
  #define LED 4
  #define period (1000/8)
  unsigned long time_now = 0;
  bool set = 0;
#else
  #warning No Watch Dog
#endif
#ifdef _Relay_
  #define DIRECTION 9
  #define RS485_READ digitalWrite(DIRECTION, LOW)
  #define RS485_WRITE digitalWrite(DIRECTION, HIGH)  
  #define H4N Serial 
  #define RS485 UsiSerial
#else
  #warning No Relay
#endif

void setup()
{  
  #ifdef _Relay_
    H4N.begin(2400);
    RS485.begin();
    pinMode(DIRECTION, OUTPUT);
  #endif
  #ifdef _WatchDog_
    pinMode(LED, OUTPUT);
  #endif
}

void loop()
{
  #ifdef _WatchDog_
    if (millis() > time_now + period) {
      time_now = millis();
      set = !set;
      digitalWrite(LED, set);
    }
  #endif
  #ifdef _Relay_
    RS485_READ;
    
    if (RS485.available() > 0) {
      H4N.write(RS485.read());
    }
    
    if (H4N.available() > 0) {
      RS485_WRITE;
      RS485.write(H4N.read());
      RS485_READ;
    }
  #endif
}
