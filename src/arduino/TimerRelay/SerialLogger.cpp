#include "SerialLogger.h"
#include "Configuration.h"
#include "RelayManager.h"
#include "Settings.h"
#include <Arduino.h>

bool loggingEnabled = false;
bool debugEnabled = false;

void logRelayStatus(Stream &s) {
  if (!Settings::getLoggingEnabled()) return;
  
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