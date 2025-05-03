#include "ArduinoUnitTests.h"
#include "../SystemInfo.h"

class TestSystemInfo : public TestCase {
public:
    void setup() override {
        SystemInfo::resetStats();
        delay(1000); // Ensure we have some uptime
    }

    void test() override {
        // Test uptime
        TEST_ASSERT(SystemInfo::getUptime() > 0);
        
        // Test free memory
        TEST_ASSERT(SystemInfo::getFreeMemory() > 0);
        
        // Test CPU load calculation
        for (int i = 0; i < 1000; i++) {
            SystemInfo::update();
        }
        TEST_ASSERT(SystemInfo::getCPULoad() > 0.0f);
        
        // Test stats reset
        SystemInfo::resetStats();
        TEST_ASSERT(SystemInfo::getCPULoad() == 0.0f);
    }
};