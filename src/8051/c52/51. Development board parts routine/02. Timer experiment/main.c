/********************************* Shenzhen Aerospace Electronics Co., Ltd *******************************
 * Experiment Name: External interrupt experiment
 * Experiment Description: Click button S18, LED will cycle on and off
 * Experiment Platform: Aerospace 51 microcontroller development board V1.1
 * Connection Method: CN5 connects to CN15, connect pin CN10 pin 1 to MCU's P3^2 pin in ascending order of pin number
 * Note: Please use interrupts in this experiment, the experiment will not be fully explained without using interrupts
 * Author: Aerospace Electronics Product Development Department    QQ: 1909197536
 * Store: http://shop120013844.taobao.com/
 ****************************************************************************************/

#include <reg52.h>
#include <intrins.h>

#define FOSC 11059200L // Crystal oscillator setting, default is 11.0592M Hz
// #define FOSC 12000000L // Crystal oscillator setting, using 12M Hz
// #define FOSC 24000000L // Crystal oscillator setting, using 24M Hz

#define TIME_MS 10 // Set timing time ms, for 11.0592M, the minimum is 60ms

// IO interface definition
sbit LED = P1 ^ 0;

// Global variable definition
unsigned char count = 0;

/*******************************************************************************
 * Function Name: Delayms
 * Function Description: Implement ms-level delay
 * Input: ms
 * Output: None
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
 * Function Name: Timer0Init
 * Function Description: Timer 0 initialization
 * Input: None
 * Output: None
 *******************************************************************************/
void Timer0Init()
{
	TMOD = 0x01; // Set timer 0 mode to 1
	TH0 = (65536 - FOSC / 12 / 1000 * TIME_MS) / 256;
	TL0 = (65536 - FOSC / 12 / 1000 * TIME_MS) % 256;
	ET0 = 1; // Enable timer 0 interrupt
	TR0 = 1; // Start timer 0
	EA = 1;	 // Enable interrupts
}

/*******************************************************************************
 * Function Name: main
 * Function Description: Main function
 * Input: None
 * Output: None
 *******************************************************************************/
void main()
{
	Timer0Init();

	while (1)
	{
	}
}

/*******************************************************************************
 * Function Name: Timer0Int
 * Function Description: Timer 0 interrupt handler, every TIME_MS ms
 * Input: None
 * Output: None
 *******************************************************************************/
void Timer0Int() interrupt 1
{
	TH0 = (65536 - FOSC / 12 / 1000 * TIME_MS) / 256;
	TL0 = (65536 - FOSC / 12 / 1000 * TIME_MS) % 256;
	count++;
	if (count == 100) // 1s
	{
		LED = !LED; // LED on and off
		count = 0;
	}
}