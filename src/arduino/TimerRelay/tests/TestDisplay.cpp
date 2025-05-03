#include "ArduinoUnitTests.h"
#include "MockDisplay.h"
#include "../Relay.h"

class TestDisplay : public TestCase {
private:
    MockDisplay display;
    Relay testRelay{"test", 1, 2, 3, 0, 0};

public:
    void test() override {
        // Test initialization
        display.initialize();
        TEST_ASSERT(display.initialized);
        TEST_ASSERT(display.lastMessage1 == "");
        
        // Test relay status display
        display.showRelayStatus(testRelay);
        TEST_ASSERT(display.lastRelay == &testRelay);
        TEST_ASSERT(display.lastMessage1 == "test");
        TEST_ASSERT(display.lastMessage2 == "OFF");
        
        // Test message display
        display.showMessage("Line 1", "Line 2");
        TEST_ASSERT(display.lastMessage1 == "Line 1");
        TEST_ASSERT(display.lastMessage2 == "Line 2");
        
        // Test clear
        display.clear();
        TEST_ASSERT(display.lastMessage1 == "");
        TEST_ASSERT(display.lastMessage2 == "");
    }
};