#include "ArduinoUnitTests.h"
#include "../CircularBuffer.h"

class TestCircularBuffer : public TestCase {
public:
    void test() override {
        CircularBuffer<String, 3> buffer;
        
        // Test empty buffer
        TEST_ASSERT(buffer.isEmpty());
        TEST_ASSERT(!buffer.isFull());
        TEST_ASSERT(buffer.size() == 0);
        
        // Test adding items
        buffer.push("first");
        TEST_ASSERT(!buffer.isEmpty());
        TEST_ASSERT(!buffer.isFull());
        TEST_ASSERT(buffer.size() == 1);
        TEST_ASSERT(buffer.peek() == "first");
        
        buffer.push("second");
        buffer.push("third");
        TEST_ASSERT(buffer.isFull());
        TEST_ASSERT(buffer.size() == 3);
        
        // Test overflow
        buffer.push("fourth");
        TEST_ASSERT(buffer.peek() == "second");
        TEST_ASSERT(buffer.size() == 3);
        
        // Test retrieval
        String item;
        TEST_ASSERT(buffer.pop(item));
        TEST_ASSERT(item == "second");
        TEST_ASSERT(buffer.size() == 2);
        
        // Test clear
        buffer.clear();
        TEST_ASSERT(buffer.isEmpty());
        TEST_ASSERT(buffer.size() == 0);
    }
};