#include "PinChangeInterrupt.h"

#define SET_LED_ON 1
#define SET_LED_OFF 0
#define SET_Relay_ON 0
#define SET_Relay_OFF 1

#define serialBaud 9600

struct Relay {
  const char* name;
  const unsigned long timeout;
  const int ledPin;
  const int buttonPin;
  const int relayPin;
  const int onDelay;
  const int offDelay;

  volatile unsigned long ticks;
  volatile int latch;
  volatile int state;
};

const int BLUE = 0;
const int GREEN = 1;
const int YELLOW = 2;
const int RED = 3;

// Relay definitions with color names
Relay relays[] = {
  {"blue"  , 30L * 60L * 1000L, A3, 15, 6, 50, 5000, 0, 0, 0},
  {"green" , 30L * 60L * 1000L, A2, 14, 7, 50, 5000, 0, 0, 0},
  {"yellow", 30L * 60L * 1000L, A1, 16, 8, 50, 5000, 0, 0, 0},
  {"red"   , 30L * 60L * 1000L, A0, 10, 9, 50, 5000, 0, 0, 0}
};

const int NUM_RELAYS = sizeof(relays) / sizeof(Relay);
unsigned long lastOutput = 0;

void setupRelay(Relay &r, void (*isr)()) {
  pinMode(r.buttonPin, INPUT_PULLUP);
  pinMode(r.ledPin, OUTPUT);
  pinMode(r.relayPin, OUTPUT);
  attachPCINT(digitalPinToPCINT(r.buttonPin), isr, CHANGE);
  turnOff(r);
}

void setup() {
  Serial.begin(serialBaud);
  setupRelay(relays[BLUE], BLUE_ISR);
  setupRelay(relays[GREEN], GREEN_ISR);
  setupRelay(relays[YELLOW], YELLOW_ISR);
  setupRelay(relays[RED], RED_ISR);
}

void loop() {
  unsigned long ticks = millis();

  if ((ticks - lastOutput) > 1000) {
    Serial.print(ticks);
    Serial.println();

    for (int i = 0; i < NUM_RELAYS; i++) {
      Relay &r = relays[i];
      Serial.print(" ");
      Serial.print(r.name);
      Serial.print(">");
      Serial.print(" latch:");
      Serial.print(r.latch);
      Serial.print(" tick:");
      Serial.print(r.ticks);
      if (r.ticks == 0) {
        Serial.print(" off");
      } else {
        Serial.print(" on:");
        Serial.print(ticks - r.ticks);
        Serial.print(" timeout:");
        Serial.print(r.timeout);
      }
      
      Serial.println();
    }

    Serial.println();
    lastOutput = ticks;
  }

  for (int i = 0; i < NUM_RELAYS; i++) {
    if (relays[i].ticks != 0 && (ticks - relays[i].ticks) > relays[i].timeout) {
      turnOff(relays[i]);
    }
  }
}

void turnOn(Relay &r) {
  r.latch = 1;
  r.ticks = millis();
  digitalWrite(r.ledPin, SET_LED_ON);
  digitalWrite(r.relayPin, SET_Relay_ON);
}

void turnOff(Relay &r) {
  r.latch = 0;
  r.ticks = 0;
  digitalWrite(r.ledPin, SET_LED_OFF);
  digitalWrite(r.relayPin, SET_Relay_OFF);
}

// ISRs must still reference the right relay
void BLUE_ISR() {
  handleButtonInterrupt(relays[BLUE]);
}
void GREEN_ISR() {
  handleButtonInterrupt(relays[GREEN]);
}
void YELLOW_ISR() {
  handleButtonInterrupt(relays[YELLOW]);
}
void RED_ISR() {
  handleButtonInterrupt(relays[RED]);
}

void handleButtonInterrupt(Relay &r) {
  r.state = digitalRead(r.buttonPin);
  if (r.state == 0) {
    if (r.latch == 1) {
      turnOff(r);
    } else {
      turnOn(r);
    }
  }
}
