#include "SegmentedDisplay.h"
#include "Encoding.h"

/*
  2023-01-01: Matthew Whited
  Simple Clock build around the ATTiny2313 MCU

*/

/*
Design at ./circuits/SimpleClock/SimpleClockExt

Added external clock so lost access to PINA.
Notes: Required changes to programming
  Press SW1 (PB4) to Toggle 12/24hr clock
  Press SW2 (PB5) to increment hour
  Press SW3 (PB6) to increment minute
  Press SW1 + SW2 to decerment hour
  Press SW1 + SW3 to decerment minute
  Toggle colon on second

*/

/* 
  Pinout 

  GND == LED03 (Dp anode)
  GND == LED07 (Seperator cathode)

  PA0 => Reset
  PA1 => Ext Crystal 0
  PA2 => Ext Crystal 1

  PB0 => LED14 (#___ cathode)
  PB1 => LED11 (_#__ cathode)
  PB2 => LED10 (__#_ cathode)
  PB3 => LED06 (___# cathode)

  PB4 <= SW1
  PB5 <= SW2
  PB6 <= SW3
  PB7 => 

  PD0 => LED13 (A anode)
  PD1 => LED09 (B anode)
  PD2 => LED04 (C anode)
  PD3 => LED02 (D anode)
  PD4 => LED01 (E anode)
  PD5 => LED12 (F anode)
  PD6 => LED05 (G anode)
*/

void setup() {
  DDRD = 0b1111111;  //Set all of port D to output
  DDRB = 0b10001111; //Set port B [0,4..7] to input and [1..3] to output


  PORTD = 0b0000000;  //Set all low
  PORTB = 0b00000000; //Set all low
}

int digit = 0;
long time = 0x120000;
long lastMillis = 0;
long btnDownMillis = 0;
int millisToSecondsAdjustment = 1000; //Note: you can use 16 to change minutes to seconds
int milTime = 0;

void loop() {
  digit %= 4;

  CheckTime();
  CheckInputs();
  DisplayDigit(time, digit);
 
  digit++;
}

static void CheckTime(){
  long currentMillis = millis();
  if ((currentMillis - lastMillis) > millisToSecondsAdjustment){
    // increment second
    time = AddSeconds(time , 1);
    lastMillis = currentMillis;

    //toggle colon
    if ((PINB & 0b10000000) ==0) { PORTB |= 0b10000000;}
    else { PORTB &= ~0b10000000;}
  }
}

static void CheckInputs(){
  int input = (PINB & 0b01110000) >> 4;

  if (input != 0xf && btnDownMillis == 0){ // detect button press
    btnDownMillis = millis();

    switch (input) {
      case 0b100: { //toggle 
        milTime ^= 1;
        break;
      }
      
      case 0b010: { //add hour
        time = AddSeconds(time, 60*60);
        break;
      }
      case 0b110: { //subtract hour
        time = AddSeconds(time, -60*60);
        break;
      }
      
      case 0b001: { //add minute
        time &= 0xffff00;
        time = AddSeconds(time, 60*60);
        break;
      }
      case 0b101: { //subtract minute
        time &= 0xffff00;
        time = AddSeconds(time, -60*60);
        break;
      }
    }
  }
  else if (input == 0xf && btnDownMillis != 0){ // release
    btnDownMillis = 0;
  }
}

static void DisplayDigit(long time, int digit) {
  int timeOffset = time >> 8; //drop secounds

  if (!milTime) {
    int h = Encoding::BCD2Long((timeOffset & 0xff00) >> 8);
    while (h > 12) {h-=12;}
    timeOffset &= 0x00ff; //remove hours
    timeOffset |= Encoding::Long2BCD(h) << 8; // add back hours
  }

  PORTD = SegmentedDisplay::DigitTo7Segment((timeOffset >> (digit << 2)) & 0xf);

  PORTB |= 0x0f;
  PORTB &= ~(1 << (3-digit));  //turn on current digit
}

static long AddSeconds(long input, int seconds)
{
    int h = Encoding::BCD2Long((input & 0xff0000) >> 16);
    int m = Encoding::BCD2Long((input & 0x00ff00) >> 8);
    int s = Encoding::BCD2Long((input & 0x0000ff) >> 0);

    s += seconds;
    while (s < 0)
    {
        s += 60;
        m--;
    }
    while (s > 59)
    {
        s -= 60;
        m++;
    }

    while (m < 0)
    {
        m += 60;
        h--;
    }
    while (m > 59)
    {
        m -= 60;
        h++;
    }
    while (h < 0)
    {
        h += 24;
    }
    while (h > 23)
    {
        h -= 24;
    }

    return
        Encoding::Long2BCD(h) << 16 |
        Encoding::Long2BCD(m) << 8 |
        Encoding::Long2BCD(s) << 0
        ;
}
