#include "ArduinoUnitTests.h"
#include "../RelayManager.h"

class MockISR {
public:
    static void callback() {}
};

class TestRelayManager : public TestCase {
private:
    TestStream testStream;

public:
    void setup() override {
        // Reset all relays to known state
        for (int i = 0; i < NUM_RELAYS; i++) {
            turnOff(relays[i]);
        }
    }

    void test() override {
        // Test relay initialization
        setupRelay(relays[0], MockISR::callback);
        TEST_ASSERT(relays[0].latch == 0);
        TEST_ASSERT(relays[0].ticks == 0);

        // Test turn on/off
        turnOn(relays[0]);
        TEST_ASSERT(relays[0].latch == 1);
        TEST_ASSERT(relays[0].ticks > 0);

        turnOff(relays[0]);
        TEST_ASSERT(relays[0].latch == 0);
        TEST_ASSERT(relays[0].ticks == 0);

        // Test elapsed time calculation
        TEST_ASSERT(elapsedTime(0, 100) == 100);
        TEST_ASSERT(elapsedTime(100, 50) == ULONG_MAX - 49);
    }

    void teardown() override {
        // Clean up
        for (int i = 0; i < NUM_RELAYS; i++) {
            turnOff(relays[i]);
        }
    }
};