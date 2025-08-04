#include "PinChangeInterrupt.h"
#include <EEPROM.h>
#include <util/atomic.h>
#include <limits.h>
#include <avr/wdt.h>

#define SET_LED_ON 1
#define SET_LED_OFF 0
#define SET_Relay_ON 0
#define SET_Relay_OFF 1

#define serialBaud 9600
#define DEFAULT_TIMEOUT 1800000UL  // 30 minutes
#define DEFAULT_DEBOUNCE 200
#define MAX_INPUT_LENGTH 64
#define EEPROM_VERSION 1
#define EEPROM_VERSION_ADDR 0

#if defined(ARDUINO_AVR_PRO)
#define IS_PRO_MINI
#elif defined(ARDUINO_AVR_LEONARDO)
#define IS_PRO_MICRO
#else
#error "Unsupported board"
#endif

// Enable Serial1 if supported
#if defined(UBRR1H)
#define USE_SERIAL1 1
#else
#define USE_SERIAL1 0
#endif

void(* resetFunc) (void) = 0;//declare reset function at address 0

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
  {"blue",   A3, 2, 6, 0, 0},
  {"green",  A2, 3, 7, 0, 0},
  {"yellow", A1, 4, 8, 0, 0},
  {"red",    A0, 5, 9, 0, 0}
};

const int NUM_RELAYS = sizeof(relays) / sizeof(Relay);
unsigned long lastOutput = 0;
volatile unsigned long lastInterruptTime = 0;

bool blink = true;
bool loggingEnabled = false;
bool debugEnabled = false;
bool settingsChanged = false;  // New flag to track if settings have changed

Stream* serialPorts[2];
int NUM_SERIALS = 0;

// EEPROM layout
int eepromAddr(int index, bool isDebounce) {
  // Add offset for version byte
  return (index * 8 + (isDebounce ? 4 : 0)) + 1;
}

// Helper function to handle millis() overflow
unsigned long elapsedTime(unsigned long start, unsigned long current) {
  return (current >= start) ? (current - start) : (ULONG_MAX - start + current + 1UL);
}

// Alternative implementation if ULONG_MAX isn't available
// unsigned long elapsedTime(unsigned long start, unsigned long current) {
//   return (current >= start) ? (current - start) : (~0UL - start + current + 1UL);
// }

unsigned long loadRelayTimeout(int i) {
  EEPROM.get(eepromAddr(i, false), relays[i].timeout);
  if (relays[i].timeout == 0xFFFFFFFF || relays[i].timeout == 0)
    relays[i].timeout = DEFAULT_TIMEOUT;
  return relays[i].timeout;
}
unsigned long loadRelayDebounce(int i) {
  EEPROM.get(eepromAddr(i, true), relays[i].debounce);
  if (relays[i].debounce == 0xFFFFFFFF || relays[i].debounce == 0)
    relays[i].debounce = DEFAULT_DEBOUNCE;
  return relays[i].debounce;
}

unsigned long readRelayTimeout(int i) {
  unsigned long value;
  EEPROM.get(eepromAddr(i, false), value);
  return value;
}
unsigned long readRelayDebounce(int i) {
  unsigned long value;
  EEPROM.get(eepromAddr(i, true), value);
  return value;
}

void loadRelaySettings(int i) {
  loadRelayTimeout(i);
  loadRelayDebounce(i);
}

void saveRelaySettings(int i) {
  // Only write if values have changed
  unsigned long storedTimeout;
  unsigned long storedDebounce;
  EEPROM.get(eepromAddr(i, false), storedTimeout);
  EEPROM.get(eepromAddr(i, true), storedDebounce);
  
  if (storedTimeout != relays[i].timeout)
    EEPROM.put(eepromAddr(i, false), relays[i].timeout);
  
  if (storedDebounce != relays[i].debounce)
    EEPROM.put(eepromAddr(i, true), relays[i].debounce);
}

void saveAllSettings() {
  for (int i = 0; i < NUM_RELAYS; i++)
    saveRelaySettings(i);
  settingsChanged = false;  // Reset the change flag after saving
}

void turnOn(Relay &r) {
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
    r.latch = 1;
    r.ticks = millis();
  }
  digitalWrite(r.ledPin, SET_LED_ON);
  digitalWrite(r.relayPin, SET_Relay_ON);
}

void turnOff(Relay &r) {
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
    r.latch = 0;
    r.ticks = 0;
  }
  digitalWrite(r.ledPin, SET_LED_OFF);
  digitalWrite(r.relayPin, SET_Relay_OFF);
}

void setupRelay(Relay &r, void (*isr)()) {
  pinMode(r.buttonPin, INPUT_PULLUP);
  pinMode(r.ledPin, OUTPUT);
  pinMode(r.relayPin, OUTPUT);
  digitalWrite(r.relayPin, SET_Relay_OFF);  // Ensure relay is OFF before attaching interrupt
  digitalWrite(r.ledPin, SET_LED_OFF);      // Ensure LED is OFF
  r.latch = 0;
  r.ticks = 0;
  attachPCINT(digitalPinToPCINT(r.buttonPin), isr, CHANGE);
}

void setup() {
  wdt_enable(WDTO_1S);  // Enable 1-second watchdog
  Serial.begin(serialBaud);
  serialPorts[NUM_SERIALS++] = &Serial;

#if USE_SERIAL1
  Serial1.begin(serialBaud);
  serialPorts[NUM_SERIALS++] = &Serial1;
#endif

  // Check EEPROM version
  byte version;
  EEPROM.get(EEPROM_VERSION_ADDR, version);
  if (version != EEPROM_VERSION) {
    // First time or format changed, initialize EEPROM
    EEPROM.put(EEPROM_VERSION_ADDR, EEPROM_VERSION);
    for (int i = 0; i < NUM_RELAYS; i++) {
      relays[i].timeout = DEFAULT_TIMEOUT;
      relays[i].debounce = DEFAULT_DEBOUNCE;
    }
    saveAllSettings();
  } else {
    for (int i = 0; i < NUM_RELAYS; i++) {
      loadRelaySettings(i);
    }
  }

  setupRelay(relays[BLUE], BLUE_ISR);
  setupRelay(relays[GREEN], GREEN_ISR);
  setupRelay(relays[YELLOW], YELLOW_ISR);
  setupRelay(relays[RED], RED_ISR);
  
  pinMode(LED_BUILTIN, OUTPUT);
  
  // Ensure all relays are OFF at startup
  for (int i = 0; i < NUM_RELAYS; i++) {
    relays[i].latch = 0;
    relays[i].ticks = 0;
    digitalWrite(relays[i].ledPin, SET_LED_OFF);
    digitalWrite(relays[i].relayPin, SET_Relay_OFF);
  }
}

void loop() {
  wdt_reset();  // Pet the watchdog
  unsigned long ticks = millis();

  for (int i = 0; i < NUM_RELAYS; i++) {
    if (relays[i].ticks && (elapsedTime(relays[i].ticks, ticks) > relays[i].timeout))
      turnOff(relays[i]);
  }

  if (elapsedTime(lastOutput, ticks) > 1000) {
    if (loggingEnabled){
      for (int i = 0; i < NUM_SERIALS; i++) {
        logRelayStatus(*serialPorts[i]);
      }
    }
    lastOutput = ticks;
    
    digitalWrite(LED_BUILTIN, (blink = !blink) ? HIGH : LOW); 
    
    if (debugEnabled) {
        for (int i = 0; i < NUM_SERIALS; i++) {
          serialPorts[i]->print(F("@"));
        }
    }
  }

  for (int i = 0; i < NUM_SERIALS; i++) {
    if (serialPorts[i]->available()) handleSerial(*serialPorts[i]);
  }
}

void handleSerial(Stream &s) {
  static String input;
  char c = s.read();
  if (c == '\n' || c == '\r') {
    input.trim();
    if (input.length() > 0) handleCommand(input, s);
    input = "";
  } else if (input.length() < MAX_INPUT_LENGTH) {  // Add a limit to prevent overflow
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
  if (line.length() > MAX_INPUT_LENGTH) {
    out.println(F("Command too long"));
    return;
  }
  
  String tokens[3];  // cmd, arg1, arg2
  int tokenCount = 0;
  int startPos = 0;
  int spacePos;
  
  while (tokenCount < 3 && (spacePos = line.indexOf(' ', startPos)) != -1) {
    tokens[tokenCount++] = line.substring(startPos, spacePos);
    startPos = spacePos + 1;
  }
  // Fix signed/unsigned comparison warning
  if (startPos < (int)line.length() && tokenCount < 3) {
    tokens[tokenCount++] = line.substring(startPos);
  }
  
  String &cmd = tokens[0];
  String arg1 = tokenCount > 1 ? tokens[1] : "";
  String arg2 = tokenCount > 2 ? tokens[2] : "";

  int i = findRelayByName(arg1);

  if (cmd == "set-timeout" && i != -1) {
    long seconds = arg2.toInt();
    if (seconds < 0) {
      out.println(F("Timeout must be a positive value"));
    } else if (seconds == 0) {
      // Set to default timeout (30 minutes) instead of disabling
      relays[i].timeout = DEFAULT_TIMEOUT;
      out.print(F("Timeout for "));
      out.print(relays[i].name);
      out.print(F(" set to default ("));
      out.print(DEFAULT_TIMEOUT / 1000);
      out.println(F(" seconds)"));
      settingsChanged = true;  // Mark that settings have changed
    } else {
      relays[i].timeout = seconds * 1000UL;
      out.print(F("Timeout for "));
      out.print(relays[i].name); 
      out.print(F(" set to ")); 
      out.print(seconds);
      out.println(F(" seconds"));
      settingsChanged = true;  // Mark that settings have changed
    }
  } else if (cmd == "set-debounce" && i != -1) {
    long debounce = arg2.toInt();
    if (debounce <= 0) {
      out.println(F("Debounce must be a positive value"));
    } else {
      relays[i].debounce = debounce;
      out.print(F("Debounce for "));
      out.print(relays[i].name);
      out.print(F(" set to "));
      out.print(relays[i].debounce);
      out.println(F(" ms"));
      settingsChanged = true;  // Mark that settings have changed
    }
  } else if (cmd == "on" && i != -1) {
    turnOn(relays[i]);
    out.print(relays[i].name); out.println(F(" turned on"));
  } else if (cmd == "off" && i != -1) {
    turnOff(relays[i]);
    out.print(relays[i].name); out.println(F(" turned off"));
  } else if (cmd == "show-timeout" && i != -1) {
    out.print(F("Timeout for ")); 
    out.print(relays[i].name);
    out.print(F(": "));
    out.print(relays[i].timeout / 1000);
    out.println(F(" seconds"));
  } else if (cmd == "show-debounce" && i != -1) {
    out.print(F("Debounce for "));
    out.print(relays[i].name);
    out.print(F(": "));
    out.print(relays[i].debounce); 
    out.println(F(" ms"));
  } else if (cmd == "show") {
    out.println(F("Current volatile settings:"));
    for (int i = 0; i < NUM_RELAYS; i++) {
      out.print(F("  "));
      out.print(relays[i].name);
      out.print(F(" => timeout: "));
      out.print(relays[i].timeout / 1000);
      out.print(F("s, debounce: "));
      out.print(relays[i].debounce);
      out.println(F("ms"));
    }
  } else if (cmd == "read-timeout" && i != -1) {
    out.print(F("Timeout for ")); 
    out.print(relays[i].name);
    out.print(F(": "));
    unsigned long value = readRelayTimeout(i);
    out.print(value / 1000);
    out.println(F(" seconds"));
  } else if (cmd == "read-debounce" && i != -1) {
    out.print(F("Debounce for ")); 
    out.print(relays[i].name);
    out.print(F(": "));
    unsigned long value = readRelayDebounce(i);
    out.print(value);
    out.println(F(" ms"));
  } else if (cmd == "load-timeout" && i != -1) {
    out.print(F("Timeout for ")); 
    out.print(relays[i].name);
    out.print(F("= "));
    unsigned long value = readRelayTimeout(i);
    out.print(value / 1000);
    out.println(F(" seconds"));
  } else if (cmd == "load-debounce" && i != -1) {
    out.print(F("Debounce for ")); 
    out.print(relays[i].name);
    out.print(F("= "));
    unsigned long value = readRelayDebounce(i);
    out.print(value);
    out.println(F(" ms"));
  }   else if (cmd == "status") {
    if (i != -1) {
      out.print(relays[i].name); 
      out.print(F("> latch:"));
      out.print(relays[i].latch); 
      out.print(F(" tick:")); 
      out.print(relays[i].ticks);
      out.print(F(" ")); 
      out.println(relays[i].ticks == 0 ? F("off") : F("on"));
    } else {
      for (int i = 0; i < NUM_RELAYS; i++) {
        out.print(relays[i].name); 
        out.print(F("> latch:"));
        out.print(relays[i].latch); 
        out.print(F(" tick:")); 
        out.print(relays[i].ticks);
        out.print(F(" ")); 
        out.println(relays[i].ticks == 0 ? F("off") : F("on"));
      }
    }
  } else if (cmd == "save") {
    if (settingsChanged) {
      saveAllSettings(); 
      out.println(F("Settings saved to EEPROM"));
    } else {
      out.println(F("No changes to save"));
    }
  } else if (cmd == "load") {
      out.println(F("Load settings from EEPROM"));      
      for (int i = 0; i < NUM_RELAYS; i++) {
        loadRelaySettings(i);
      }
  } else if (cmd == "reset") {
      out.println(F("Resetting device"));      
      delay(500);
      resetFunc();
  } else if ((cmd == "logging" || cmd == "log") && (arg1 == "on" || arg1 == "start")) {
    loggingEnabled = true; 
    out.println(F("Logging enabled"));
  } else if ((cmd == "logging" || cmd == "log") && (arg1 == "off" || arg1 == "stop")) {
    loggingEnabled = false; 
    out.println(F("Logging disabled"));
  } else if ((cmd == "debug" || cmd == "log") && (arg1 == "on" || arg1 == "start")) {
    debugEnabled = true; 
    out.println(F("debug enabled"));
  } else if ((cmd == "debug" || cmd == "log") && (arg1 == "off" || arg1 == "stop")) {
    debugEnabled = false; 
    out.println(F("debug disabled"));
  }  else if (cmd == "help" || cmd == "?") {
    out.println(F("Available commands:"));
    out.println(F("  on <relay> - Turn on relay"));
    out.println(F("  off <relay> - Turn off relay"));
    out.println(F("  set-timeout <relay> <seconds> - Set timeout (0 sets to default)"));
    out.println(F("  set-debounce <relay> <ms> - Set debounce"));
    out.println(F("  show-timeout <relay> - Display current timeout"));
    out.println(F("  show-debounce <relay> - Display current debounce"));
    out.println(F("  show - Show current timeout and debounce for all relays"));
    out.println(F("  read-timeout <relay> - Display saved timeout"));
    out.println(F("  read-debounce <relay> - Display saved debounce"));
    out.println(F("  load-timeout <relay> - Restore saved timeout"));
    out.println(F("  load-debounce <relay> - Restore saved debounce"));
    out.println(F("  status <relay> - Show relay status"));
    out.println(F("  save - Save settings to EEPROM"));
    out.println(F("  load - Load settings from EEPROM"));
    out.println(F("  reset - Reset device"));
    out.println(F("  logging on|off - Enable/disable status logging"));
    out.println(F("  debug on|off - Enable/disable status debuging"));
    out.println(F("  help - Show this help"));
  } else {
    out.println(F("Unknown command or invalid relay name"));
    out.println(F("Type 'help' for available commands"));
  }
}

void logRelayStatus(Stream &s) {
  for (int i = 0; i < NUM_RELAYS; i++) {
    Relay &r = relays[i];
    s.print(r.name);
    s.print(F("> latch:"));
    s.print(r.latch); 
    s.print(F(" tick:")); 
    s.print(r.ticks); 
    s.print(F(" "));
    s.print(r.ticks == 0 ? F("off") : F("on"));
    if (r.ticks > 0) {
      unsigned long now = millis();
      unsigned long remaining = (r.timeout - elapsedTime(r.ticks, now)) / 1000;
      s.print(F(" ("));
      s.print(remaining);
      s.print(F("s remaining)"));
    }
    s.println();
  }
  s.println();
}

// ISRs
void BLUE_ISR() { handleButtonInterrupt(relays[BLUE]); }
void GREEN_ISR() { handleButtonInterrupt(relays[GREEN]); }
void YELLOW_ISR() { handleButtonInterrupt(relays[YELLOW]); }
void RED_ISR() { handleButtonInterrupt(relays[RED]); }

void handleButtonInterrupt(Relay &r) {  
  if (debugEnabled) {
      for (int i = 0; i < NUM_SERIALS; i++) {
        serialPorts[i]->print(F(" BTN("));
        serialPorts[i]->print(r.name);
        serialPorts[i]->print(F(")"));
      }
  }

  unsigned long now = millis();
  if (elapsedTime(lastInterruptTime, now) < r.debounce) return;
  lastInterruptTime = now;

  int buttonState = digitalRead(r.buttonPin);
  if (buttonState == 0) {
    // Toggle relay state atomically
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
      if (r.latch) turnOff(r);
      else turnOn(r);
    }
  }
}