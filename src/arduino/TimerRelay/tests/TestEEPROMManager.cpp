#include "ArduinoUnitTests.h"
#include "../EEPROMManager.h"

class TestEEPROMManager : public TestCase {
public:
    void setup() override {
        // Initialize EEPROM with test values
        EEPROMManager::initialize();
    }

    void test() override {
        // Test timeout operations
        EEPROMManager::saveTimeout(0, 5000);
        TEST_ASSERT(EEPROMManager::loadTimeout(0) == 5000);

        // Test debounce operations
        EEPROMManager::saveDebounce(0, 100);
        TEST_ASSERT(EEPROMManager::loadDebounce(0) == 100);

        // Test default values
        TEST_ASSERT(EEPROMManager::loadTimeout(1) == DEFAULT_TIMEOUT);
        TEST_ASSERT(EEPROMManager::loadDebounce(1) == DEFAULT_DEBOUNCE);

        // Test settings version check
        TEST_ASSERT(EEPROMManager::loadSettings() == true);
    }
};