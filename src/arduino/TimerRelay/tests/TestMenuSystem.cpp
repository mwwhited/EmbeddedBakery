#include "ArduinoUnitTests.h"
#include "MockDisplay.h"
#include "../Menu.h"
#include "../ButtonHandler.h"

class TestMenuSystem : public TestCase {
private:
    MockDisplay display;
    Menu menu;
    ButtonHandler buttonHandler;
    const unsigned long initialTimeout = 1800000UL;  // 30 minutes

public:
    TestMenuSystem() : menu(display), buttonHandler(menu) {}

    void setup() override {
        buttonHandler.begin();
        relays[BLUE].timeout = initialTimeout;
        relays[BLUE].debounce = 200;
    }

    void test() override {
        // Test initial state
        TEST_ASSERT(!menu.isActive());
        
        // Test menu activation
        menu.handleAction(ENTER_MENU);
        TEST_ASSERT(menu.isActive());
        TEST_ASSERT(display.lastMessage1 == "Main Menu");
        
        // Navigate to Relays menu
        menu.handleAction(NEXT_ITEM);
        menu.handleAction(NEXT_ITEM);
        TEST_ASSERT(display.lastMessage2.indexOf("Relays") != -1);
        
        // Enter Relays menu
        menu.handleAction(SELECT_ITEM);
        TEST_ASSERT(display.lastMessage2.indexOf("Blue Relay") != -1);
        
        // Select Blue Relay
        menu.handleAction(SELECT_ITEM);
        TEST_ASSERT(display.lastMessage2.indexOf("Timeout") != -1);
        
        // Select Timeout
        menu.handleAction(SELECT_ITEM);
        
        // Test timeout increase
        unsigned long originalTimeout = relays[BLUE].timeout;
        menu.handleAction(SELECT_ITEM);  // Increase timeout
        TEST_ASSERT(relays[BLUE].timeout == originalTimeout + 30000UL);
        
        // Test timeout decrease
        menu.handleAction(NEXT_ITEM);    // Move to decrease
        menu.handleAction(SELECT_ITEM);  // Decrease timeout
        TEST_ASSERT(relays[BLUE].timeout == originalTimeout);
        
        // Navigate to Debounce
        menu.handleAction(EXIT_MENU);
        menu.handleAction(NEXT_ITEM);
        TEST_ASSERT(display.lastMessage2.indexOf("Debounce") != -1);
        
        // Test debounce adjustment
        menu.handleAction(SELECT_ITEM);
        unsigned long originalDebounce = relays[BLUE].debounce;
        menu.handleAction(SELECT_ITEM);  // Increase debounce
        TEST_ASSERT(relays[BLUE].debounce == originalDebounce + 10);
        
        // Test menu exit
        menu.handleAction(EXIT_MENU);
        TEST_ASSERT(!menu.isActive());
    }
};