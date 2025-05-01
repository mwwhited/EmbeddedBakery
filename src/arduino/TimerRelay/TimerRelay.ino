/*
 This is a remote timer for a relay interface

  Pin Out

  | Pin  | Function | Use      |
  | ---- | -------- | -------- |
  | D5   | LED1     | PWM      |
  | D6   | LED2     | PWM      |
  | D8   | Button1  | PCINT4   |
  | D9   | Button2  | PCINT5   |
  | D16  | Relay2   |          |
  | D10  | Relay1   |          |
*/

// https://deepbluembedded.com/arduino-pcint-pin-change-interrupts/
#include "PinChangeInterrupt.h"

#define SET_LED_ON 1
#define SET_LED_OFF 0

#define SET_Relay_ON 0
#define SET_Relay_OFF 1

const unsigned long blue__timeout = 30l /*minutes*/ * 60l * 1000l;
const int blue__LED = 5;
const int blue__Button = 8;
const int blue__Relay = 10;
const int blue__on = 50;
const int blue__off = 5000;
unsigned long blue__target = 0;
unsigned long blue__ticks = 0;
unsigned long blue__last = 0;
int blue__state = 0;
int blue__latch = 0;

const unsigned long green_timeout = 30l /*minutes*/ * 60l * 1000l;
const int green_LED = 6;
const int green_Button = 9;
const int green_Relay = 16;
const int green_on = 50;
const int green_off = 5000;
unsigned long green_target = 0;
unsigned long green_ticks = 0;
unsigned long green_last = 0;
int green_state = 0;
int green_latch = 0;

#define serialBaud 9600

unsigned long last_out = 0;

void setup() {
  Serial.begin(serialBaud);

  //
  pinMode(blue__Button, INPUT);
  pinMode(blue__LED, OUTPUT);
  pinMode(blue__Relay, OUTPUT);
  attachPCINT(digitalPinToPCINT(blue__Button), BLUE_ISR, CHANGE);
  BLUE_OFF();

  //
  pinMode(green_Button, INPUT);
  pinMode(green_LED, OUTPUT);
  pinMode(green_Relay, OUTPUT);
  attachPCINT(digitalPinToPCINT(green_Button), GREEN_ISR, CHANGE);
  GREEN_OFF();
}

// https://deepbluembedded.com/arduino-timers/
// https://deepbluembedded.com/arduino-timer-interrupts/
// https://deepbluembedded.com/arduino-counter-timer/
// https://deepbluembedded.com/arduino-pcint-pin-change-interrupts/

unsigned long last = 0;
void loop() {
  unsigned long ticks = millis();

  if ((ticks - last) > 1000) {

    /*if (Serial)*/ {
      Serial.print(last);

      Serial.print(" blue>");
      Serial.print(" latch:");
      Serial.print(blue__latch);
      Serial.print(" tick:");
      Serial.print(blue__ticks);
      if (blue__ticks == 0) {
        Serial.print(" off");
      } else {
        Serial.print(" on:");
        Serial.print(ticks - blue__ticks);
        Serial.print(" timeout");
        Serial.print(blue__timeout);
      }

      Serial.print(" green>");
      Serial.print(" latch:");
      Serial.print(green_latch);
      Serial.print(" tick:");
      Serial.print(green_ticks);
      if (green_ticks == 0) {
        Serial.print(" off");
      } else {
        Serial.print(" on:");
        Serial.print(ticks - green_ticks);
        Serial.print(" timeout");
        Serial.print(green_timeout);
      }
      Serial.println();
      last = ticks;
    }
  }

  if (blue__ticks != 0 && (ticks - blue__ticks) > blue__timeout) {
    BLUE_OFF();
  }
  if (green_ticks != 0 && (ticks - green_ticks) > green_timeout) {
    GREEN_OFF();
  }
}

void BLUE_ISR(void) {
  //noInterrupts();
  blue__state = digitalRead(blue__Button);
  if (blue__state == 0) {
    if (blue__latch == 1) {
      BLUE_OFF();
    } else {
      BLUE_ON();
    }
  } else {
  }
  //interrupts();
}
void BLUE_OFF() {
  blue__latch = 0;
  blue__ticks = 0;
  digitalWrite(blue__LED, SET_LED_OFF);
  digitalWrite(blue__Relay, SET_Relay_OFF);
}
void BLUE_ON() {
  blue__latch = 1;
  blue__ticks = millis();
  digitalWrite(blue__LED, SET_LED_ON);
  digitalWrite(blue__Relay, SET_Relay_ON);
}

void GREEN_ISR(void) {
  //noInterrupts();
  green_state = digitalRead(green_Button);
  if (green_state == 0) {
    if (green_latch == 1) {
      GREEN_OFF();
    } else {
      GREEN_ON();
    }
  } else {
  }
  //interrupts();
}
void GREEN_OFF() {
  green_latch = 0;
  green_ticks = 0;
  digitalWrite(green_LED, SET_LED_OFF);
  digitalWrite(green_Relay, SET_Relay_OFF);
}
void GREEN_ON() {
  green_latch = 1;
  green_ticks = millis();
  digitalWrite(green_LED, SET_LED_ON);
  digitalWrite(green_Relay, SET_Relay_ON);
}
