#ifndef MESSAGEPACKET_H
#define MESSAGEPACKET_H

#include "spark_wiring_stream.h"

class MessagePacket
{
public:
	MessagePacket();
	MessagePacket(uint8_t packet[]);
	bool get_LeftForward();
	uint8_t get_LeftSpeed();
	bool get_RightForward();
	uint8_t get_RightSpeed();
	bool get_AButton();

	static bool TryRead(Stream &stream, MessagePacket &packet);
	void Debug(Stream &stream);

private:
	bool _leftForward;
	char _leftSpeed;
	bool _rightForward;
	char _rightSpeed;
	bool _aButton;
};

#endif