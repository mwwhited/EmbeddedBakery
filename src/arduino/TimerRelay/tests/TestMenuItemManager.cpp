#include "ArduinoUnitTests.h"
#include "../MenuItemManager.h"

static int actionCallCount = 0;
static void testAction() { actionCallCount++; }

class TestMenuItemManager : public TestCase {
public:
    void setup() override {
        MenuItemManager::initialize();
        actionCallCount = 0;
    }

    void test() override {
        // Test item creation
        MenuItem* item1 = MenuItemManager::createItem("Item 1", testAction);
        TEST_ASSERT(item1 != nullptr);
        TEST_ASSERT(String(item1->name) == "Item 1");
        
        // Test action execution
        item1->action();
        TEST_ASSERT(actionCallCount == 1);
        
        // Test max items
        for (int i = 0; i < 32; i++) {
            MenuItemManager::createItem("Test");
        }
        MenuItem* overflow = MenuItemManager::createItem("Overflow");
        TEST_ASSERT(overflow == nullptr);
        
        // Test cleanup
        MenuItemManager::cleanup();
        MenuItem* newItem = MenuItemManager::createItem("New Item");
        TEST_ASSERT(newItem != nullptr);
    }
};