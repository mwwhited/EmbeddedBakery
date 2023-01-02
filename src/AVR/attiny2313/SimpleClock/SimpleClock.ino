#include "SegmentedDisplay.h"


void setup() {

  DDRD = 0b01111111;  //Set all of port D to output
  DDRB = 0b00001111;  //Set port B [4..7] to input and [0..3] to output

  PORTD = 0b00000000;  //Set all low
  PORTB = 0b00000000;  //Set all low
}

int digit = 0;
int time = 0x1100;
int lastMillis = 0;
int btnDownMills = 0;

void loop() {
  digit %= 4;

  int currentMillis = millis();
  if ((currentMillis - lastMillis) > (10 * 6)){ // (1000 * 6)
     time = AddMinute(time);
     lastMillis = currentMillis;
  }

  int input = (PINB & 0xf0) >> 4;
  if      ((input & 0x8) == 0) digit = 3;
  else if ((input & 0x4) == 0) digit = 2;
  else if ((input & 0x2) == 0) digit = 1;
  else if ((input & 0x1) == 0) digit = 0;

  PORTD = SegmentedDisplay::DigitTo7Segment((time >> (digit << 2)) & 0xf);

  PORTB |= 0x0f;  // turn off all digits
  delayMicroseconds(5);
  PORTB &= ~(1 << digit);  //turn on current digit
  delayMicroseconds(20);
  PORTB |= 0x0f;  // turn off all digits
  
  digit++;
  //delay(10);
}

int AddMinute(int input) {
  int h = BCD2Int((input & 0xff00) >> 8);
  int m = BCD2Int((input & 0x00ff) >> 0);

  m++;
  if (m > 59) {
    m = 0;
    h++;
  }
  if (h > 24) { h = 0; }

  return Int2BCD(h) << 8 | Int2BCD(m);
}

int BCD2Int(int bcd) {
  return
    (bcd & 0x0f) +
    (bcd >> 4 & 0x0f) * 10 +
    (bcd >> 8 & 0x0f) * 100 +
    (bcd >> 12 & 0x0f) * 1000 +
    (bcd >> 16 & 0x0f) * 10000 +
    (bcd >> 20 & 0x0f) * 100000 +
    (bcd >> 24 & 0x0f) * 1000000 +
    (bcd >> 28 & 0x0f) * 10000000
    ;
}

int Int2BCD(int digit) {
  return 
    (((digit / 10000000) % 10) << 28) |
    (((digit / 1000000) % 10) << 24) |
    (((digit / 100000) % 10) << 20) |
    (((digit / 10000) % 10) << 16) |
    (((digit / 1000) % 10) << 12) |
    (((digit / 100) % 10) << 8) |
    (((digit / 10) % 10) << 4) |
    (digit % 10);
}
