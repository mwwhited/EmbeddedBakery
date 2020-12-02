
#include "Motor.h"
#include "spark_utilities.h"
#include "spark_wiring_stream.h"

/*
Motor Controller
IN1 IN2 PWM Dir
H   H   X   Break
L   L   X   Break
X   X   L   Break
L   H   H   CCW
H   L   H   CW

Motor Controller Pinouts
Motor   IN1 IN2 PWM
A       D0  D1  A0
B       D2  D2  A1

*/


Motor::Motor(int pin1, int pin2, int pinPwm)
{
	_pin1 = pin1;
	_pin2 = pin2;
	_pinPwm = pinPwm;
	_lastForward = 0;
	_lastSpeed = 0;
}

void Motor::Setup()
{
	pinMode(_pinPwm, OUTPUT);
	pinMode(_pin1, OUTPUT);
	pinMode(_pin2, OUTPUT);

	analogWrite(_pinPwm, 0);
	digitalWrite(_pin1, LOW);
	digitalWrite(_pin2, LOW);
}


void Motor::Set(bool forward, uint8_t speed)
{
	_lastForward = forward;
	_lastSpeed = speed;
	if (forward) {
		digitalWrite(_pin1, LOW);
		digitalWrite(_pin2, HIGH);
	}
	else {
		digitalWrite(_pin1, HIGH);
		digitalWrite(_pin2, LOW);
	}
	analogWrite(_pinPwm, speed);
}

void Motor::Debug(Stream &stream)
{
	stream.print("M:");
	stream.print(_pin1);
	stream.print(",");
	stream.print(_pin2);
	stream.print(",");
	stream.print(_pinPwm);

	stream.print(";");
	stream.print(_lastForward ? "F" : "B");
	stream.print(",");
	stream.print(_lastSpeed, HEX);

	stream.println();
}