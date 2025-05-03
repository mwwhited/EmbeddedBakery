#include "ArduinoUnitTests.h"
#include "MockDisplay.h"
#include "../Menu.h"
#include "../ButtonHandler.h"
#include "../SystemInfo.h"

class TestMenuIntegration : public TestCase {
private:
    MockDisplay display;
    Menu menu;
    ButtonHandler buttonHandler;

public:
    TestMenuIntegration() : menu(display), buttonHandler(menu) {}

    void setup() override {
        Settings::reset();
        SystemInfo::resetStats();
        buttonHandler.begin();
    }

    void testNavigateToSystemInfo() {
        // Enter menu
        menu.handleAction(ENTER_MENU);
        TEST_ASSERT(menu.isActive());
        
        // Navigate to System menu
        menu.handleAction(NEXT_ITEM);
        menu.handleAction(NEXT_ITEM);
        menu.handleAction(SELECT_ITEM);
        TEST_ASSERT(display.lastMessage2.indexOf("Show Uptime") != -1);
        
        // Check system stats
        menu.handleAction(SELECT_ITEM);
        TEST_ASSERT(display.lastMessage1.indexOf("Uptime") != -1);
        
        // Check memory display
        menu.handleAction(NEXT_ITEM);
        menu.handleAction(SELECT_ITEM);
        TEST_ASSERT(display.lastMessage1.indexOf("Free Memory") != -1);
    }

    void testRelayConfiguration() {
        menu.handleAction(ENTER_MENU);
        menu.handleAction(NEXT_ITEM);
        menu.handleAction(SELECT_ITEM);  // Enter Relays menu
        menu.handleAction(SELECT_ITEM);  // Select Blue Relay
        
        // Test timeout adjustment
        menu.handleAction(SELECT_ITEM);  // Select Timeout
        menu.handleAction(SELECT_ITEM);  // Increase timeout
        TEST_ASSERT(display.lastMessage1.indexOf("Set Timeout") != -1);
        
        // Test debounce adjustment
        menu.handleAction(EXIT_MENU);
        menu.handleAction(NEXT_ITEM);    // Move to Debounce
        menu.handleAction(SELECT_ITEM);
        TEST_ASSERT(display.lastMessage1.indexOf("Set Debounce") != -1);
    }

    void test() override {
        testNavigateToSystemInfo();
        testRelayConfiguration();
        
        // Test menu exit returns to normal display
        menu.handleAction(EXIT_MENU);
        TEST_ASSERT(!menu.isActive());
    }
};