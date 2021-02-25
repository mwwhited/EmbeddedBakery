/*
  Basic code for using Maxim MAX7219/MAX7221 with Arduino.
  Version 0.0.3
  Wire the Arduino and the MAX7219/MAX7221 together as follows:
  | Arduino   | MAX7219/MAX7221 |
  | --------- | --------------- |
  | MOSI (11) | DIN (1)         |
  | SCK (13)  | CLK (13)        |
  | I/O (7)*  | LOAD/CS (12)    |
    * - This should match the LOAD_PIN constant defined below.
  
  For the rest of the wiring follow the wiring diagram found in the datasheet.
  
  Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX7219-MAX7221.pdf

   Thankyoy to Leonardo SAMMARTANO for help and support.
 */
#include <SPI.h>
#include <DigitLed72xxHex.h>

// What pin on the Arduino connects to the LOAD/CS pin on the MAX7219/MAX7221
#define LOAD_PIN 7
#define NCHIP 10

DigitLed72xx ld = DigitLed72xx(LOAD_PIN, NCHIP);
  
void setup() 
{
  for(int i = 0;i<NCHIP;i++)
    ld.on(i);
  
}

int i = 0;
void loop() 
{
  for(int n = 0;n<NCHIP;n++) {
    //ld.printDigit(i++, n);
    ld.write(LOAD_PIN, B01111110, n);
    delay(100);
  }
}
