#ifndef BINARYLED_H
#define BINARYLED_H

#include "spark_wiring_stream.h"

class BinaryLed
{
public:
	//Motor();
	BinaryLed(int pin);
	void Setup();
	void Set(bool on);
	void Debug(Stream &stream);

private:
	int _pin;
	bool _last;
};

#endif