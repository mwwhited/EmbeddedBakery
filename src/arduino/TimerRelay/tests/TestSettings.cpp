#include "ArduinoUnitTests.h"
#include "../Settings.h"

class TestSettings : public TestCase {
public:
    void setup() override {
        Settings::reset();
    }

    void test() override {
        // Test default values
        TEST_ASSERT(!Settings::getLoggingEnabled());
        TEST_ASSERT(!Settings::getDebugEnabled());
        
        // Test setters
        Settings::setLoggingEnabled(true);
        TEST_ASSERT(Settings::getLoggingEnabled());
        
        Settings::setDebugEnabled(true);
        TEST_ASSERT(Settings::getDebugEnabled());
        
        // Test constants
        TEST_ASSERT(Settings::getDefaultTimeout() == 1800000UL);
        TEST_ASSERT(Settings::getDefaultDebounce() == 200);
        TEST_ASSERT(Settings::getMaxTimeout() == 3600000UL);
        TEST_ASSERT(Settings::getMinDebounce() == 50);
        TEST_ASSERT(Settings::getMaxDebounce() == 1000);
        TEST_ASSERT(Settings::getBaudRate() == 9600);
        
        // Test reset
        Settings::reset();
        TEST_ASSERT(!Settings::getLoggingEnabled());
        TEST_ASSERT(!Settings::getDebugEnabled());
    }
};