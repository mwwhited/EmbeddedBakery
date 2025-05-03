#include "ArduinoUnitTests.h"
#include "../CommandHandler.h"

class TestCommandHistory : public TestCase {
public:
    void setup() override {
        CommandHandler::addToHistory("first");
        CommandHandler::addToHistory("second");
        CommandHandler::addToHistory("third");
    }

    void test() override {
        // Test command history navigation
        TEST_ASSERT(CommandHandler::getPreviousCommand() == "third");
        TEST_ASSERT(CommandHandler::getPreviousCommand() == "second");
        TEST_ASSERT(CommandHandler::getPreviousCommand() == "first");
        TEST_ASSERT(CommandHandler::getPreviousCommand() == "");
        
        // Test forward navigation
        TEST_ASSERT(CommandHandler::getNextCommand() == "second");
        TEST_ASSERT(CommandHandler::getNextCommand() == "third");
        TEST_ASSERT(CommandHandler::getNextCommand() == "");
        
        // Test adding new command
        CommandHandler::addToHistory("fourth");
        TEST_ASSERT(CommandHandler::getPreviousCommand() == "fourth");
    }
};