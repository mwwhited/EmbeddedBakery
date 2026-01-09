/********************************* Shenzhen Aerospace Electronics Co., Ltd *******************************

Experiment Name: External Interrupt Experiment
Experiment Description: Click button S18, LED will cycle on and off
Experiment Platform: Aerospace 51 Single Chip Development Board V1.1
Connection Method: CN5 connects to CN15, connect pin CN10 pin 1 to MCU's P3^2 pin in ascending order of pin number
Attention:
Author: Aerospace Electronic Product Development Department QQ: 1909197536
Store: http://shop120013844.taobao.com/
****************************************************************************************/
#include <reg52.h>
#include <intrins.h>

#define FOSC 11059200L // Crystal Oscillator Setting, default is 11.0592M Hz
// #define FOSC 12000000L // Crystal Oscillator Setting, using 12M Hz
// #define FOSC 24000000L // Crystal Oscillator Setting, using 24M Hz

// IO Interface Definition
sbit key = P3 ^ 2;
sbit LED = P1 ^ 0;
// Global Variable Definition

/*******************************************************************************

Function Name: Delayms
Function Description: Implement ms-level delay
Input: ms
Output: None
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

Function Name: Exit0Init
Function Description: External interrupt 0 initialization program
Input: None
Output: None
*******************************************************************************/
void Exit0Init()
{
	EX0 = 1; // Enable INT1 external interrupt
	IT0 = 1; // Trigger mode is negative edge triggered
	EA = 1;	 // Global interrupt enable
}
/*******************************************************************************

Function Name: main
Function Description: Main function
Input: None
Output: None
*******************************************************************************/
void main()
{
	Exit0Init();
	while (1)
		;
}
/*******************************************************************************

Function Name: Exit0Int
Function Description: External Interrupt 0 ISR
Input: None
Output: None
*******************************************************************************/
void Exit0Int() interrupt 0
{
	EX0 = 0;	  // Disable interrupt
	Delayms(30);  // Delay 30ms, removing this line will result in multiple interrupts with one press
	if (key == 0) // Anti-interference processing for the button
	{
		LED = !LED;
	}
	Delayms(30); // Delay 300 milliseconds for the next check
	EX0 = 1;	 // Enable interrupt
}