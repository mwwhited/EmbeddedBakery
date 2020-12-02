
#include "BinaryLed.h"
#include "spark_utilities.h"
#include "spark_wiring_stream.h"

BinaryLed::BinaryLed(int pin)
{
	_pin = pin;
	_last = 0;
}

void BinaryLed::Setup()
{
	pinMode(_pin, OUTPUT);
	digitalWrite(_pin, LOW);
}


void BinaryLed::Set(bool on)
{
	_last = on;
	digitalWrite(_pin, (on ? HIGH : LOW));
}

void BinaryLed::Debug(Stream &stream)
{
	stream.print("BL:");
	stream.print(_pin);

	stream.print(";");
	stream.print(_last ? "1" : "0");

	stream.println();
}