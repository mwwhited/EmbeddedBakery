#include "ArduinoUnitTests.h"
#include "../ErrorHandler.h"

class TestErrorHandler : public TestCase {
private:
    TestStream testStream;

public:
    void setup() override {
        ErrorHandler::clearError();
    }

    void test() override {
        // Test error reporting
        ErrorHandler::reportError(testStream, ErrorHandler::INVALID_RELAY);
        TEST_ASSERT(ErrorHandler::hasError());
        TEST_ASSERT(ErrorHandler::getLastError() == ErrorHandler::INVALID_RELAY);

        // Test error clearing
        ErrorHandler::clearError();
        TEST_ASSERT(!ErrorHandler::hasError());
        TEST_ASSERT(ErrorHandler::getLastError() == ErrorHandler::NO_ERROR);

        // Test multiple errors
        ErrorHandler::reportError(testStream, ErrorHandler::INVALID_TIMEOUT);
        ErrorHandler::reportError(testStream, ErrorHandler::INVALID_DEBOUNCE);
        TEST_ASSERT(ErrorHandler::getLastError() == ErrorHandler::INVALID_DEBOUNCE);
    }
};