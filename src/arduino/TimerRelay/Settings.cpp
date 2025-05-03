#include "Settings.h"
#include <EEPROM.h>

bool Settings::loggingEnabled = false;
bool Settings::debugEnabled = false;

const unsigned long Settings::DEFAULT_TIMEOUT = 1800000UL;  // 30 minutes
const unsigned long Settings::DEFAULT_DEBOUNCE = 200;
const unsigned long Settings::MAX_TIMEOUT = 3600000UL;      // 1 hour
const unsigned long Settings::MIN_DEBOUNCE = 50;
const unsigned long Settings::MAX_DEBOUNCE = 1000;
const unsigned long Settings::BAUD_RATE = 9600;
const uint8_t Settings::COMMAND_HISTORY_SIZE = 4;
const uint8_t Settings::MAX_INPUT_LENGTH = 64;

void Settings::load() {
    // Load settings from EEPROM if needed
    loggingEnabled = false;
    debugEnabled = false;
}

void Settings::save() {
    // Save settings to EEPROM if needed
}

void Settings::reset() {
    loggingEnabled = false;
    debugEnabled = false;
}

bool Settings::getLoggingEnabled() { return loggingEnabled; }
void Settings::setLoggingEnabled(bool enabled) { loggingEnabled = enabled; }
bool Settings::getDebugEnabled() { return debugEnabled; }
void Settings::setDebugEnabled(bool enabled) { debugEnabled = enabled; }

unsigned long Settings::getDefaultTimeout() { return DEFAULT_TIMEOUT; }
unsigned long Settings::getDefaultDebounce() { return DEFAULT_DEBOUNCE; }
unsigned long Settings::getMaxTimeout() { return MAX_TIMEOUT; }
unsigned long Settings::getMinDebounce() { return MIN_DEBOUNCE; }
unsigned long Settings::getMaxDebounce() { return MAX_DEBOUNCE; }

unsigned long Settings::getBaudRate() { return BAUD_RATE; }
uint8_t Settings::getCommandHistorySize() { return COMMAND_HISTORY_SIZE; }
uint8_t Settings::getMaxInputLength() { return MAX_INPUT_LENGTH; }