#ifndef MOTOR_H
#define MOTOR_H

#include "spark_wiring_stream.h"

class Motor
{
public:
	//Motor();
	Motor(int pin1, int pin2, int pinPwm);
	void Setup();
	void Set(bool forward, uint8_t speed);
	void Debug(Stream &stream);

private:
	int _pin1;
	int _pin2;
	int _pinPwm;

	bool _lastForward;
	uint8_t _lastSpeed;
};

#endif