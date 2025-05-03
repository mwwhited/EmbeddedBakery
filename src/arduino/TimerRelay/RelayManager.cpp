#include "RelayManager.h"
#include "Configuration.h"
#include "EEPROMManager.h"
#include <Arduino.h>
#include <util/atomic.h>
#include <limits.h>
#include "PinChangeInterrupt.h"

Relay relays[] = {
  {"blue",   LED_BLUE_PIN, BUTTON_BLUE_PIN, RELAY_BLUE_PIN, 0, 0},
  {"green",  LED_GREEN_PIN, BUTTON_GREEN_PIN, RELAY_GREEN_PIN, 0, 0},
  {"yellow", LED_YELLOW_PIN, BUTTON_YELLOW_PIN, RELAY_YELLOW_PIN, 0, 0},
  {"red",    LED_RED_PIN, BUTTON_RED_PIN, RELAY_RED_PIN, 0, 0}
};

const int NUM_RELAYS = sizeof(relays) / sizeof(Relay);
volatile unsigned long lastInterruptTime = 0;
bool settingsChanged = false;

void turnOn(Relay &r) {
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
    r.latch = 1;
    r.ticks = millis();
  }
  digitalWrite(r.ledPin, SET_LED_ON);
  digitalWrite(r.relayPin, SET_RELAY_ON);
}

void turnOff(Relay &r) {
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
    r.latch = 0;
    r.ticks = 0;
  }
  digitalWrite(r.ledPin, SET_LED_OFF);
  digitalWrite(r.relayPin, SET_RELAY_OFF);
}

void setupRelay(Relay &r, void (*isr)()) {
  pinMode(r.buttonPin, INPUT_PULLUP);
  pinMode(r.ledPin, OUTPUT);
  pinMode(r.relayPin, OUTPUT);
  digitalWrite(r.relayPin, SET_RELAY_OFF);
  digitalWrite(r.ledPin, SET_LED_OFF);
  r.latch = 0;
  r.ticks = 0;
  attachPCINT(digitalPinToPCINT(r.buttonPin), isr, CHANGE);
}

unsigned long elapsedTime(unsigned long start, unsigned long current) {
  return (current >= start) ? (current - start) : (ULONG_MAX - start + current + 1UL);
}

unsigned long loadRelayTimeout(int i) {
  relays[i].timeout = EEPROMManager::loadTimeout(i);
  return relays[i].timeout;
}

unsigned long loadRelayDebounce(int i) {
  relays[i].debounce = EEPROMManager::loadDebounce(i);
  return relays[i].debounce;
}

void loadRelaySettings(int i) {
  loadRelayTimeout(i);
  loadRelayDebounce(i);
}

unsigned long readRelayTimeout(int i) {
  return EEPROMManager::loadTimeout(i);
}

unsigned long readRelayDebounce(int i) {
  return EEPROMManager::loadDebounce(i);
}

void saveRelaySettings(int i) {
  EEPROMManager::saveTimeout(i, relays[i].timeout);
  EEPROMManager::saveDebounce(i, relays[i].debounce);
}

void saveAllSettings() {
  for (int i = 0; i < NUM_RELAYS; i++) {
    saveRelaySettings(i);
  }
  settingsChanged = false;
}

void handleButtonInterrupt(Relay &r) {
  unsigned long now = millis();
  if (elapsedTime(lastInterruptTime, now) < r.debounce) return;
  lastInterruptTime = now;

  int buttonState = digitalRead(r.buttonPin);
  if (buttonState == 0) {
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
      if (r.latch) turnOff(r);
      else turnOn(r);
    }
  }
}