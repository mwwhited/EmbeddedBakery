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

void setup() {
 DDRD = 0b1111111;  //Set all of port D to output
  DDRB = 0b00001111; //Set port B [4..7] to input and [0..3] to output
  //DDRA = 0b010;      // set port A[1] to ouput and A[0] to input //TODO: remap for external clock

  PORTD = 0b0000000;  //Set all low
  PORTB = 0b00000000; //Set all low
  //PORTA = 0b000;      //Set all low //TODO: remap for external clock
}

int digit = 0;
long time = 0x120000;
long lastMillis = 0;
long btnDownMillis = 0;
int millisToSecondsAdjustment = 1000; //120 //Note: with internal clock it was 120

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

    //TODO: remape this if using external clock     
    // //toggle colon
    // if ((PINA & 0b010) ==0) { PORTA |= 0b010;}
    // else { PORTA &= ~0b010;}
  }
}

static void CheckInputs(){
  int input = (PINB & 0xf0) >> 4;
  if (input != 0xf && btnDownMillis == 0){ // detect button press
    btnDownMillis = millis();
    
    if      ((input & 0x8) == 0){
      time = AddSeconds(time, 60*60); // subtract and hour
    } 
    else if ((input & 0x4) == 0) {
      time = AddSeconds(time, -60*60); // add an hour
    } 
    else if ((input & 0x2) == 0){ 
      time &= 0xffff00;//clear seconds on increment
      time = AddSeconds(time, 60); // subtract a minute
    }
    else if ((input & 0x1) == 0) {
      time &= 0xffff00; //clear seconds on decrement
      time = AddSeconds(time, -60); // add a minute
    }

  }
  else if (input == 0xf && btnDownMillis != 0){ // release
    btnDownMillis = 0;
  }
}

static void DisplayDigit(long time, int digit) {

  int milTime = 1; // PINA & 0b001; //TODO: remap this if using external clock

  int timeOffset = time >> 8; //drop secounds

  if (!milTime) {
    int h = Encoding::BCD2Long((timeOffset & 0xff00) >> 8);
    while (h > 12) {h-=12;}
    timeOffset &= 0x00ff; //remove hours
    timeOffset |= Encoding::Long2BCD(h) << 8; // add back hours
  }

  PORTD = SegmentedDisplay::DigitTo7Segment((timeOffset >> (digit << 2)) & 0xf);
  PORTB |= 0x0f;  // turn off all digits
  PORTB &= ~(1 << digit);  //turn on current digit
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
