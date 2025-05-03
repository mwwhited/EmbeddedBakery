#include "Configuration.h"
#include "PinChangeInterrupt.h"
#include "Relay.h"
#include "RelayManager.h"
#include "CommandHandler.h"
#include "SerialLogger.h"
#include "EEPROMManager.h"
#include "Settings.h"
#include "LCDDisplay.h"
#include "Menu.h"
#include "ButtonHandler.h"
#include "SystemInfo.h"
#include <avr/wdt.h>

#if defined(UBRR1H)
#define USE_SERIAL1 1
#else
#define USE_SERIAL1 0
#endif

Stream* serialPorts[2];
int NUM_SERIALS = 0;
bool blink = true;
unsigned long lastOutput = 0;
unsigned long lastDisplayUpdate = 0;
LCDDisplay display(LCD_RS_PIN, LCD_EN_PIN, LCD_D4_PIN, LCD_D5_PIN, LCD_D6_PIN, LCD_D7_PIN);
Menu menu(display);
ButtonHandler buttonHandler(menu);
int currentDisplayedRelay = 0;

void setup() {
  wdt_enable(WDTO_1S);  // Enable 1-second watchdog
  Serial.begin(Settings::getBaudRate());
  serialPorts[NUM_SERIALS++] = &Serial;

#if USE_SERIAL1
  Serial1.begin(Settings::getBaudRate());
  serialPorts[NUM_SERIALS++] = &Serial1;
#endif

  Settings::load();
  EEPROMManager::initialize();
  
  display.initialize();
  buttonHandler.begin();
  SystemInfo::resetStats();
  
  for (int i = 0; i < NUM_RELAYS; i++) {
    loadRelaySettings(i);
  }

  setupRelay(relays[BLUE], BLUE_ISR);
  setupRelay(relays[GREEN], GREEN_ISR);
  setupRelay(relays[YELLOW], YELLOW_ISR);
  setupRelay(relays[RED], RED_ISR);
  
  pinMode(LED_BUILTIN, OUTPUT);
  display.showMessage("Timer Relay", "Ready");
}

void loop() {
  wdt_reset();  // Pet the watchdog
  unsigned long ticks = millis();

  // Update system statistics
  SystemInfo::update();

  // Check relay timeouts
  for (int i = 0; i < NUM_RELAYS; i++) {
    if (relays[i].ticks && (elapsedTime(relays[i].ticks, ticks) > relays[i].timeout)) {
      turnOff(relays[i]);
      if (!menu.isActive()) {
        display.showRelayStatus(relays[i]);
      }
    }
  }

  // Update serial output
  if (elapsedTime(lastOutput, ticks) > 1000) {
    if (Settings::getLoggingEnabled()) {
      for (int i = 0; i < NUM_SERIALS; i++) {
        logRelayStatus(*serialPorts[i]);
        
        // Log system stats if debug is enabled
        if (Settings::getDebugEnabled()) {
          serialPorts[i]->print(F("Uptime: "));
          serialPorts[i]->print(SystemInfo::getUptime());
          serialPorts[i]->print(F("s, CPU: "));
          serialPorts[i]->print(SystemInfo::getCPULoad());
          serialPorts[i]->print(F("%, Memory: "));
          serialPorts[i]->print(SystemInfo::getFreeMemory());
          serialPorts[i]->println(F(" bytes"));
        }
      }
    }
    lastOutput = ticks;
    digitalWrite(LED_BUILTIN, (blink = !blink) ? HIGH : LOW);
    
    if (Settings::getDebugEnabled()) {
      for (int i = 0; i < NUM_SERIALS; i++) {
        serialPorts[i]->print(F("@"));
      }
    }
  }

  // Update display if menu is not active
  if (!menu.isActive() && elapsedTime(lastDisplayUpdate, ticks) > 2000) {
    bool anyActive = false;
    for (int i = 0; i < NUM_RELAYS; i++) {
      if (relays[i].ticks > 0) {
        display.showRelayStatus(relays[i]);
        anyActive = true;
        break;
      }
    }
    if (!anyActive && Settings::getDebugEnabled()) {
      char buffer[17];
      snprintf(buffer, sizeof(buffer), "CPU: %.1f%%", SystemInfo::getCPULoad());
      display.showMessage("System Status", buffer);
    }
    lastDisplayUpdate = ticks;
  }

  // Handle button inputs
  buttonHandler.checkButtons();

  // Handle serial commands
  for (int i = 0; i < NUM_SERIALS; i++) {
    if (serialPorts[i]->available()) handleSerial(*serialPorts[i]);
  }
}

// ISRs
void BLUE_ISR() { 
    handleButtonInterrupt(relays[BLUE]); 
    if (!menu.isActive()) display.showRelayStatus(relays[BLUE]);
}
void GREEN_ISR() { 
    handleButtonInterrupt(relays[GREEN]); 
    if (!menu.isActive()) display.showRelayStatus(relays[GREEN]);
}
void YELLOW_ISR() { 
    handleButtonInterrupt(relays[YELLOW]); 
    if (!menu.isActive()) display.showRelayStatus(relays[YELLOW]);
}
void RED_ISR() { 
    handleButtonInterrupt(relays[RED]); 
    if (!menu.isActive()) display.showRelayStatus(relays[RED]);
}