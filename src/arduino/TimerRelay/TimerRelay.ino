#include "PinChangeInterrupt.h"
#include <EEPROM.h>

#define SET_LED_ON 1
#define SET_LED_OFF 0
#define SET_Relay_ON 0
#define SET_Relay_OFF 1

#define serialBaud 9600
#define DEFAULT_TIMEOUT 1800000UL  // 30 minutes in milliseconds
#define DEFAULT_DEBOUNCE 200

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

Relay relays[] = {
  {"blue",   A3, 15, 6, 0, 0},
  {"green",  A2, 14, 7, 0, 0},
  {"yellow", A1, 16, 8, 0, 0},
  {"red",    A0, 10, 9, 0, 0}
};

const int NUM_RELAYS = sizeof(relays) / sizeof(Relay);
unsigned long lastOutput = 0;
volatile unsigned long lastInterruptTime = 0;

// EEPROM layout: 8 bytes per relay (timeout + debounce)
int eepromAddr(int index, bool isDebounce) {
  return index * 8 + (isDebounce ? 4 : 0);
}

void loadRelaySettings(int i) {
  EEPROM.get(eepromAddr(i, false), relays[i].timeout);
  EEPROM.get(eepromAddr(i, true), relays[i].debounce);

  if (relays[i].timeout == 0xFFFFFFFF || relays[i].timeout == 0) {
    relays[i].timeout = DEFAULT_TIMEOUT;
  }
  if (relays[i].debounce == 0xFFFFFFFF || relays[i].debounce == 0) {
    relays[i].debounce = DEFAULT_DEBOUNCE;
  }
}

void saveRelaySettings(int i) {
  EEPROM.put(eepromAddr(i, false), relays[i].timeout);
  EEPROM.put(eepromAddr(i, true), relays[i].debounce);
}

void saveAllSettings() {
  for (int i = 0; i < NUM_RELAYS; i++) {
    saveRelaySettings(i);
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

void setupRelay(Relay &r, void (*isr)()) {
  pinMode(r.buttonPin, INPUT_PULLUP);
  pinMode(r.ledPin, OUTPUT);
  pinMode(r.relayPin, OUTPUT);
  attachPCINT(digitalPinToPCINT(r.buttonPin), isr, CHANGE);
  turnOff(r);
}

void setup() {
  Serial.begin(serialBaud);
  Serial1.begin(serialBaud);

  for (int i = 0; i < NUM_RELAYS; i++) {
    loadRelaySettings(i);
  }

  setupRelay(relays[BLUE], BLUE_ISR);
  setupRelay(relays[GREEN], GREEN_ISR);
  setupRelay(relays[YELLOW], YELLOW_ISR);
  setupRelay(relays[RED], RED_ISR);
}

void loop() {
  unsigned long ticks = millis();

  // Auto-off check
  for (int i = 0; i < NUM_RELAYS; i++) {
    if (relays[i].ticks && (ticks - relays[i].ticks > relays[i].timeout)) {
      turnOff(relays[i]);
    }
  }

  // Periodic status output
  if (ticks - lastOutput > 1000) {
    for (int i = 0; i < NUM_RELAYS; i++) {
      Relay &r = relays[i];
      Serial.print(r.name);
      Serial.print(F("> latch:"));
      Serial.print(r.latch);
      Serial.print(F(" tick:"));
      Serial.print(r.ticks);
      Serial.print(F(" "));
      if (r.ticks == 0) {
        Serial.print(F("off"));
      } else {
        Serial.print(F("on"));
      }
      Serial.println();
    }
    Serial.println();
    lastOutput = ticks;
  }

  // Handle serial input
  if (Serial.available()) handleSerial(Serial);
  if (Serial1.available()) handleSerial(Serial1);
}

void handleSerial(Stream &s) {
  static String input;

  char c = s.read();
  if (c == '\n' || c == '\r') {
    input.trim();
    if (input.length() > 0) handleCommand(input, s);
    input = "";
  } else {
    input += c;
  }
}

int findRelayByName(const String &name) {
  for (int i = 0; i < NUM_RELAYS; i++) {
    if (name.equalsIgnoreCase(relays[i].name)) return i;
  }
  return -1;
}

void handleCommand(const String &line, Stream &out) {
  String cmd, arg1, arg2;
  int firstSpace = line.indexOf(' ');
  int secondSpace = line.indexOf(' ', firstSpace + 1);

  cmd = line.substring(0, firstSpace);
  if (firstSpace > 0) arg1 = line.substring(firstSpace + 1, secondSpace == -1 ? line.length() : secondSpace);
  if (secondSpace > 0) arg2 = line.substring(secondSpace + 1);

  int i = findRelayByName(arg1);

  if (cmd == "set-timeout" && i != -1) {
    unsigned long sec = arg2.toInt();
    relays[i].timeout = sec * 1000UL;
    out.print(F("Timeout for "));
    out.print(relays[i].name);
    out.print(F(" set to "));
    out.print(relays[i].timeout);
    out.println(F(" ms"));
  } else if (cmd == "set-debounce" && i != -1) {
    relays[i].debounce = arg2.toInt();
    out.print(F("Debounce for "));
    out.print(relays[i].name);
    out.print(F(" set to "));
    out.print(relays[i].debounce);
    out.println(F(" ms"));
  } else if (cmd == "on" && i != -1) {
    turnOn(relays[i]);
    out.print(relays[i].name);
    out.println(F(" turned on"));
  } else if (cmd == "off" && i != -1) {
    turnOff(relays[i]);
    out.print(relays[i].name);
    out.println(F(" turned off"));
  } else if (cmd == "read-timeout" && i != -1) {out.print(F("Timeout for "));
    out.print(relays[i].name);
    out.print(F(": "));
    out.print(relays[i].timeout);
    out.println(F(" ms"));
  } else if (cmd == "read-debounce" && i != -1) {out.print(F("Debounce for "));
    out.print(relays[i].name);
    out.print(F(": "));
    out.print(relays[i].debounce);
    out.println(F(" ms"));
  } else if (cmd == "status" && i != -1) {
    out.print(F("%s> latch:"));
    out.print(relays[i].latch);
    out.print(F(" tick:"));
    out.print(relays[i].ticks);
    out.print(F(" "));
    if (relays[i].ticks == 0) {
      out.print(F("off"));
    } else {
      out.print(F("on"));
    }
    out.println();
  } else if (cmd == "save") {
    saveAllSettings();
    out.println(F("Settings saved to EEPROM"));
  } else {
    out.println(F("Unknown command or invalid relay name"));
  }
}

// ISRs
void BLUE_ISR()   { handleButtonInterrupt(relays[BLUE]); }
void GREEN_ISR()  { handleButtonInterrupt(relays[GREEN]); }
void YELLOW_ISR() { handleButtonInterrupt(relays[YELLOW]); }
void RED_ISR()    { handleButtonInterrupt(relays[RED]); }

void handleButtonInterrupt(Relay &r) {
  unsigned long now = millis();
  if ((now - lastInterruptTime) < r.debounce) return;
  lastInterruptTime = now;

  r.state = digitalRead(r.buttonPin);
  if (r.state == 0) {
    if (r.latch) turnOff(r);
    else turnOn(r);
  }
}
