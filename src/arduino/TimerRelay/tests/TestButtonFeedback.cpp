#include "ArduinoUnitTests.h"
#include "../ButtonFeedback.h"

class TestButtonFeedback : public TestCase {
private:
    unsigned long currentMillis = 0;
    
public:
    void setup() override {
        ButtonFeedback::initialize();
    }
    
    void test() override {
        // Test single flash
        ButtonFeedback::flash(1);
        TEST_ASSERT(digitalRead(LED_BUILTIN) == HIGH);
        
        // Test flash duration
        delay(25);  // Half of FLASH_DURATION
        ButtonFeedback::update();
        TEST_ASSERT(digitalRead(LED_BUILTIN) == HIGH);
        
        delay(25);  // Complete first FLASH_DURATION
        ButtonFeedback::update();
        TEST_ASSERT(digitalRead(LED_BUILTIN) == LOW);
        
        // Test multiple flashes
        ButtonFeedback::flash(2);
        TEST_ASSERT(digitalRead(LED_BUILTIN) == HIGH);
        
        // Complete flash sequence
        for (int i = 0; i < 4; i++) {  // 4 states for 2 flashes
            delay(50);
            ButtonFeedback::update();
        }
        TEST_ASSERT(digitalRead(LED_BUILTIN) == LOW);
    }
};