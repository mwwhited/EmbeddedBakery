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
 
#define SPIMAXSPEED (20000000)

#include <SPI.h>
#include <DigitLed72xx.h>

// What pin on the Arduino connects to the LOAD/CS pin on the MAX7219/MAX7221
#define LOAD_PIN 7
#define NCHIP 10

DigitLed72xx ld = DigitLed72xx(LOAD_PIN, NCHIP);
  
void setup() 
{
  for(int l = 0; l < NCHIP; l++)
    ld.on(l);
}

void loop() 
{
  for (int i = 0; ; i++) {
    for(int l = 0; l < NCHIP; l++){
      ld.printDigit(i * (l+1), l,0);
      //delay(2);
    }
  }
}
