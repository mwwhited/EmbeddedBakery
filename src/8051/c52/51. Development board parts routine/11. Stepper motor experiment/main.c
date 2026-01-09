/********************************* XXX Company *******************************
* Implementation of motor control
* Implementation method: Dual-phase half-step mode, WX1-WX1WX2-WX2-WX2WX3-WX3-WX3WX4-WX4-WX4WX1
* Platform: L298N motor driver board
* Connection method: CN16 to CN7 MOT1 to P00  MOT2 to P01  MOT3 to P02  MOT4 to P03
* Connection considerations: Connect WX1 to the left end, WX2 to the second left end, WX3 to the third left end, WX4 to the right end, and VCC to the top end.
* Note: 1. The motor must be connected in accordance with the specified direction.
			 2. The speed can be adjusted appropriately, but it cannot be turned too fast.
* Motor-related product consultation: QQ 1909197536
* Shop link: http://shop120013844.taobao.com/
****************************************************************************************/

#include <reg52.h>
#include <intrins.h>

#define FOSC 11059200L // Oscillation frequency, default 11.0592M Hz
// #define FOSC 12000000L // Oscillation frequency, using 12M Hz
// #define FOSC 24000000L // Oscillation frequency, using 24M Hz

#define TIME_MS 1 // Set timing in ms, for 11.0592M, it takes approximately 60ms
#define SPEED 2

// I/O interface definitions
sbit WX1 = P0 ^ 0; // Coil 1
sbit WX2 = P0 ^ 1;
sbit WX3 = P0 ^ 2;
sbit WX4 = P0 ^ 3;

// Global variables
unsigned char Moter_flag = 0;
unsigned char MotorStep = 0;
unsigned int Moter_count = 0;

/*******************************************************************************
 * Function: Delayms
 * Description: Implement time delay in ms
 * Parameters: ms - milliseconds
 *******************************************************************************/
void Delayms(unsigned int ms)
{
	unsigned int i, j;
	for (i = 0; i < ms; i++)
#if FOSC == 11059200L
		for (j = 0; j < 114; j++)
			;
#elif FOSC == 12000000L
		for (j = 0; j < 123; j++)
			;
#elif FOSC == 24000000L
		for (j = 0; j < 249; j++)
			;
#else
		for (j = 0; j < 114; j++)
			;
#endif
}

/*******************************************************************************
 * Function: InitMotor
 * Description: Initialize the motor control pins
 *******************************************************************************/
void InitMotor()
{
	WX1 = 1;
	WX2 = 1;
	WX3 = 1;
	WX4 = 1;
}

/*******************************************************************************
 * Function: SetMotor
 * Description: Control the motor movement
 *******************************************************************************/
void SetMotor()
{
	if (Moter_flag)
	{
		switch (MotorStep)
		{
		case 0:
			WX1 = 0; // WX1
			WX2 = 1;
			WX3 = 1;
			WX4 = 1;
			MotorStep = 1;
			break;

		case 1:
			WX1 = 0; // WX1WX2
			WX2 = 0;
			WX3 = 1;
			WX4 = 1;
			MotorStep = 2;
			break;

		case 2: // WX2
			WX1 = 1;
			WX2 = 0;
			WX3 = 1;
			WX4 = 1;
			MotorStep = 3;
			break;

		case 3: // WX2WX3
			WX1 = 1;
			WX2 = 0;
			WX3 = 0;
			WX4 = 1;
			MotorStep = 4;
			break;
		case 4: // WX3
			WX1 = 1;
			WX2 = 1;
			WX3 = 0;
			WX4 = 1;
			MotorStep = 5;
			break;

		case 5: // WX3WX4
			WX1 = 1;
			WX2 = 1;
			WX3 = 0;
			WX4 = 0;
			MotorStep = 6;
			break;
		case 6: // WX4
			WX1 = 1;
			WX2 = 1;
			WX3 = 1;
			WX4 = 0;
			MotorStep = 7;
			break;
		case 7: // WX4WX1
			WX1 = 0;
			WX2 = 1;
			WX3 = 1;
			WX4 = 0;
			MotorStep = 0;
			break;
		}
		Moter_flag = 0;
	}
}

/*******************************************************************************
 * Function: Timer0Init
 * Description: Initialize Timer0
 *******************************************************************************/
void Timer0Init()
{
	TMOD = 0x01; // Set Timer0 mode to 1
	TH0 = (65536 - FOSC / 12 / 1000 * TIME_MS) / 256;
	TL0 = (65536 - FOSC / 12 / 1000 * TIME_MS) % 256;
	ET0 = 1; // Enable Timer0 interrupt
	TR0 = 1; // Start Timer0
	EA = 1;	 // Enable interrupts
}

/*******************************************************************************
 * Function: main
 * Description: Main function
 *******************************************************************************/
void main()
{
	Timer0Init();
	InitMotor();
	while (1)
	{
		SetMotor();
	}
}

/*******************************************************************************
 * Function: Timer0Int
 * Description: Timer0 interrupt routine, executed every TIME_MS ms
 *******************************************************************************/
void Timer0Int() interrupt 1
{
	TH0 = (65536 - FOSC / 12 / 1000 * TIME_MS) / 256;
	TL0 = (65536 - FOSC / 12 / 1000 * TIME_MS) % 256;
	if (Moter_count++ == SPEED)
	{
		Moter_flag = 1;
		Moter_count = 0;
	}
}