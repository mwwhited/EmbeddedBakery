#include "LCDDisplay.h"
#include "Settings.h"
#include <Arduino.h>

LCDDisplay::LCDDisplay(uint8_t rs, uint8_t en, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7)
    : lcd(rs, en, d4, d5, d6, d7) {
}

void LCDDisplay::initialize() {
    lcd.begin(16, 2);  // 16x2 LCD
    lcd.clear();
    showMessage("Timer Relay", "Initializing...");
}

void LCDDisplay::clear() {
    lcd.clear();
}

void LCDDisplay::showRelayStatus(const Relay &relay) {
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print(relay.name);
    lcd.print(": ");
    lcd.print(relay.ticks == 0 ? "OFF" : "ON");

    if (relay.ticks > 0) {
        lcd.setCursor(0, 1);
        unsigned long remaining = (relay.timeout - elapsedTime(relay.ticks, millis())) / 1000;
        lcd.print(remaining);
        lcd.print("s remaining");
    }
}

void LCDDisplay::showSystemStatus() {
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Log:");
    lcd.print(Settings::getLoggingEnabled() ? "ON" : "OFF");
    lcd.print(" Dbg:");
    lcd.print(Settings::getDebugEnabled() ? "ON" : "OFF");
}

void LCDDisplay::showMessage(const char* line1, const char* line2) {
    lcd.clear();
    if (line1) printCentered(line1, 0);
    if (line2) printCentered(line2, 1);
}

void LCDDisplay::printCentered(const char* text, uint8_t row) {
    int len = strlen(text);
    int pos = (16 - len) / 2;
    if (pos < 0) pos = 0;
    lcd.setCursor(pos, row);
    lcd.print(text);
}