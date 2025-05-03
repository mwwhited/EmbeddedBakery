#ifndef EEPROM_MANAGER_H
#define EEPROM_MANAGER_H

#include <Arduino.h>

class EEPROMManager {
public:
    static void initialize();
    static bool loadSettings();
    static void saveSettings();
    static unsigned long loadTimeout(int index);
    static unsigned long loadDebounce(int index);
    static void saveTimeout(int index, unsigned long value);
    static void saveDebounce(int index, unsigned long value);
    
private:
    static int getTimeoutAddress(int index);
    static int getDebounceAddress(int index);
    static bool validateIndex(int index);
    static bool validateTimeout(unsigned long timeout);
    static bool validateDebounce(unsigned long debounce);
};

#endif