#include "EEPROMManager.h"
#include "Configuration.h"
#include "RelayManager.h"
#include "ErrorHandler.h"
#include <EEPROM.h>

#define SETTINGS_VERSION 1
#define VERSION_ADDRESS 0
#define SETTINGS_START_ADDRESS 1
#define SETTINGS_SIZE 4
#define MAX_TIMEOUT 3600000UL  // 1 hour maximum
#define MIN_DEBOUNCE 50       // 50ms minimum
#define MAX_DEBOUNCE 1000     // 1 second maximum

bool EEPROMManager::validateIndex(int index) {
    return index >= 0 && index < NUM_RELAYS;
}

bool EEPROMManager::validateTimeout(unsigned long timeout) {
    return timeout > 0 && timeout <= MAX_TIMEOUT;
}

bool EEPROMManager::validateDebounce(unsigned long debounce) {
    return debounce >= MIN_DEBOUNCE && debounce <= MAX_DEBOUNCE;
}

void EEPROMManager::initialize() {
    byte version;
    EEPROM.get(VERSION_ADDRESS, version);
    if (version != SETTINGS_VERSION) {
        EEPROM.put(VERSION_ADDRESS, SETTINGS_VERSION);
        for (int i = 0; i < NUM_RELAYS; i++) {
            saveTimeout(i, DEFAULT_TIMEOUT);
            saveDebounce(i, DEFAULT_DEBOUNCE);
        }
    }
}

bool EEPROMManager::loadSettings() {
    byte version;
    EEPROM.get(VERSION_ADDRESS, version);
    return version == SETTINGS_VERSION;
}

void EEPROMManager::saveSettings() {
    EEPROM.put(VERSION_ADDRESS, SETTINGS_VERSION);
}

int EEPROMManager::getTimeoutAddress(int index) {
    if (!validateIndex(index)) {
        return -1;
    }
    return SETTINGS_START_ADDRESS + (index * SETTINGS_SIZE * 2);
}

int EEPROMManager::getDebounceAddress(int index) {
    if (!validateIndex(index)) {
        return -1;
    }
    return getTimeoutAddress(index) + SETTINGS_SIZE;
}

unsigned long EEPROMManager::loadTimeout(int index) {
    if (!validateIndex(index)) {
        return DEFAULT_TIMEOUT;
    }
    unsigned long value;
    EEPROM.get(getTimeoutAddress(index), value);
    return (!validateTimeout(value)) ? DEFAULT_TIMEOUT : value;
}

unsigned long EEPROMManager::loadDebounce(int index) {
    if (!validateIndex(index)) {
        return DEFAULT_DEBOUNCE;
    }
    unsigned long value;
    EEPROM.get(getDebounceAddress(index), value);
    return (!validateDebounce(value)) ? DEFAULT_DEBOUNCE : value;
}

void EEPROMManager::saveTimeout(int index, unsigned long value) {
    if (!validateIndex(index) || !validateTimeout(value)) {
        return;
    }
    unsigned long current;
    int addr = getTimeoutAddress(index);
    EEPROM.get(addr, current);
    if (current != value) {
        EEPROM.put(addr, value);
    }
}

void EEPROMManager::saveDebounce(int index, unsigned long value) {
    if (!validateIndex(index) || !validateDebounce(value)) {
        return;
    }
    unsigned long current;
    int addr = getDebounceAddress(index);
    EEPROM.get(addr, current);
    if (current != value) {
        EEPROM.put(addr, value);
    }
}