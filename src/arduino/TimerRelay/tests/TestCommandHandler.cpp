#include "ArduinoUnitTests.h"
#include "../CommandHandler.h"

class TestCommandHandler : public TestCase {
private:
    TestStream testStream;

public:
    void test() override {
        // Test command parsing
        handleCommand("help", testStream);
        handleCommand("status", testStream);
        
        // Test relay commands
        handleCommand("on blue", testStream);
        TEST_ASSERT(relays[BLUE].latch == 1);
        
        handleCommand("off blue", testStream);
        TEST_ASSERT(relays[BLUE].latch == 0);
        
        // Test settings commands
        handleCommand("set-timeout blue 60", testStream);
        TEST_ASSERT(relays[BLUE].timeout == 60000);
        
        handleCommand("set-debounce blue 150", testStream);
        TEST_ASSERT(relays[BLUE].debounce == 150);
    }
};