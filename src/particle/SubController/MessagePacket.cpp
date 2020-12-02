
#include "MessagePacket.h"
#include "spark_wiring_stream.h"

// https://github.com/spark/firmware/tree/master/inc

/*

0x20,
0x20,
((byte)(
(this.LeftForward ? 0x01 : 0x00)
| (this.RightForward ? 0x02 : 0x00)
| (this.A ? 0x04 : 0x00)
)),
this.LeftSpeed,
this.RightSpeed,
0x0D,
0x0A,
*/

MessagePacket::MessagePacket()
{
	_leftForward = 0;
	_leftSpeed = 0;

	_rightForward = 0;
	_rightSpeed = 0;

	_aButton = 0;
}

MessagePacket::MessagePacket(uint8_t packet[])
{
	_leftForward = ((packet[2] & 0x01) == 0x01);
	_leftSpeed = packet[3];

	_rightForward = (packet[2] & 0x02) == 0x02;
	_rightSpeed = packet[4];

	_aButton = (packet[2] & 0x04) == 0x04;
}

bool MessagePacket::get_LeftForward()
{
	return _leftForward;
}
uint8_t MessagePacket::get_LeftSpeed()
{
	return _leftSpeed;
}
bool MessagePacket::get_RightForward()
{
	return _rightForward;
}
uint8_t MessagePacket::get_RightSpeed()
{
	return _rightSpeed;
}
bool MessagePacket::get_AButton()
{
	return _aButton;
}

bool MessagePacket::TryRead(Stream &stream, MessagePacket &packet)
{
	int availableBytes = 0;
	while ((availableBytes = stream.available())) {
		if (availableBytes == 7) {

			uint8_t input[7];
			for (int i = 0; i <= 7; i++){
				input[i] = (uint8_t)stream.read();
			}

			packet = MessagePacket(input);
			return 1;
		}
		else {
			stream.flush();
		}
	}
	return 0;
}

void MessagePacket::Debug(Stream &stream)
{
	stream.print("l");
	stream.print(_leftForward ? "F" : "B");
	stream.print(": ");
	stream.print(_leftSpeed, HEX);

	stream.print(" r");
	stream.print(_rightForward ? "F" : "B");
	stream.print(": ");
	stream.print(_rightSpeed, HEX);

	stream.print(" a");
	stream.print(_aButton ? "v" : "^");
	stream.println();
}