#ifndef RELAY_H
#define RELAY_H

#include "Configuration.h"

enum RelayColor { BLUE = 0, GREEN, YELLOW, RED };

struct Relay {
  const char* name;
  const int ledPin;
  const int buttonPin;
  const int relayPin;

  unsigned long timeout;     // ms (EEPROM)
  unsigned long debounce;    // ms (EEPROM)

  volatile unsigned long ticks;
  volatile int latch;
  volatile int state;
};

#endif