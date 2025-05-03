#ifndef RELAY_MANAGER_H
#define RELAY_MANAGER_H

#include "Relay.h"
#include <Stream.h>

#define EEPROM_VERSION 1
#define EEPROM_VERSION_ADDR 0

void turnOn(Relay &r);
void turnOff(Relay &r);
void setupRelay(Relay &r, void (*isr)());
void handleButtonInterrupt(Relay &r);
unsigned long elapsedTime(unsigned long start, unsigned long current);

// EEPROM functions
void loadRelaySettings(int i);
void saveRelaySettings(int i);
void saveAllSettings();
unsigned long loadRelayTimeout(int i);
unsigned long loadRelayDebounce(int i);
unsigned long readRelayTimeout(int i);
unsigned long readRelayDebounce(int i);

extern Relay relays[];
extern const int NUM_RELAYS;
extern volatile unsigned long lastInterruptTime;
extern bool settingsChanged;

#endif