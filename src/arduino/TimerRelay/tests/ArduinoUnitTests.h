#ifndef ARDUINO_UNIT_TESTS_H
#define ARDUINO_UNIT_TESTS_H

#include <Arduino.h>

class TestStream : public Stream {
public:
    virtual size_t write(uint8_t) override { return 1; }
    virtual int available() override { return 0; }
    virtual int read() override { return -1; }
    virtual int peek() override { return -1; }
};

class TestCase {
public:
    virtual void setup() {}
    virtual void test() = 0;
    virtual void teardown() {}
    
    void run() {
        setup();
        test();
        teardown();
    }
};

#define TEST_ASSERT(condition) \
    if (!(condition)) { \
        Serial.print(F("Assertion failed: ")); \
        Serial.println(F(#condition)); \
    }

#define RUN_TEST(TestClass) \
    do { \
        Serial.print(F("Running ")); \
        Serial.println(F(#TestClass)); \
        TestClass test; \
        test.run(); \
    } while(0)

#endif