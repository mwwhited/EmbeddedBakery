/********************************* Shenzhen Aerospace Electronics Co., Ltd *******************************
 * Experiment Name: PWM Direct Control Experiment
 * Experiment Description: Adjust the speed of the motor through PWM control
 * Experiment Platform: Aerospace 51 microcontroller development board V1.1
 * Connection Method: CN16-CN7, MOT5-P04
 *                     CN10 UP-P34, Left-P35, Right-P36, Down-P37
 *                     The direction control can be directly connected to CN15 according to the corresponding pin
 * Note: 1. When PWM is 1, the motor stops; when it is 0, it rotates. PWM period is set to 5ms, and the duty cycle can be adjusted from 0% to 100%.
 *       2. When changing the motor speed, pay attention to the starting and stopping of the motor. Sudden changes in speed may cause damage to the motor or the driver circuit.
 * Author: Aerospace Electronics Product Development Department    QQ: 1909197536
 * Store: http://shop120013844.taobao.com/
 ****************************************************************************************/

#include <reg52.h>
#include <intrins.h>

#define FOSC 11059200L // Crystal oscillator setting, default is 11.0592M Hz
// #define FOSC 12000000L // Crystal oscillator setting, using 12M Hz
// #define FOSC 24000000L // Crystal oscillator setting, using 24M Hz

#define MAX_SPEED 90   // Maximum duty cycle
#define MIN_SPEED 20   // Minimum duty cycle
#define TIME_US 50	   // Time interval for PWM, in microseconds
#define SPEED_CHANGE 2 // Speed increment or decrement step

// IO interface definition
sbit PWM = P0 ^ 4;	   // PWM control pin
sbit key_inc = P3 ^ 4; // Key for speed increment
sbit key_dec = P3 ^ 7; // Key for speed decrement

// Global variables
unsigned char timer1, speed;

/*******************************************************************************
 * Function Name: Delayms
 * Function Description: Delay in milliseconds
 * Input: ms - delay time in milliseconds
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
 * Function Description: Initialize Timer0
 * Input: None
 * Output: None
 *******************************************************************************/
void Timer0Init()
{
	TMOD = 0x01; // Set Timer0 mode to mode 1
	TH0 = (65536 - (FOSC / 12 * TIME_US) / 1000000) / 256;
	TL0 = (65536 - (FOSC / 12 * TIME_US) / 1000000) % 256;
	ET0 = 1; // Enable Timer0 interrupt
	TR0 = 1; // Start Timer0
	EA = 1;	 // Enable global interrupt
}

/*******************************************************************************
 * Function Name: KeyScan
 * Function Description: Scan the keys for speed adjustment
 * Input: None
 * Output: None
 *******************************************************************************/
void KeyScan(void)
{
	if (key_inc == 0)
	{
		Delayms(5);
		if (key_inc == 0)
		{
			while (key_inc == 0)
				;
			speed += SPEED_CHANGE;
			if (speed > MAX_SPEED)
				speed = MAX_SPEED;
		}
	}
	if (key_dec == 0)
	{
		Delayms(5);
		if (key_dec == 0)
		{
			while (key_dec == 0)
				;
			if (speed <= MIN_SPEED)
				speed = MIN_SPEED;
			speed -= SPEED_CHANGE;
		}
	}
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
	speed = 30; // Initialize speed
	while (1)
	{
		KeyScan(); // Scan keys for speed adjustment
	}
}

/*******************************************************************************
 * Function Name: Timer0Int
 * Function Description: Timer0 interrupt handler, executed every TIME_US ms
 * Input: None
 * Output: None
 *******************************************************************************/
void Timer0Int() interrupt 1
{
	TH0 = (65536 - (FOSC / 12 * TIME_US) / 1000000) / 256;
	TL0 = (65536 - (FOSC / 12 * TIME_US) / 1000000) % 256;
	timer1++;
	if (timer1 > 100) // PWM period is 100 * TIME_US ms
	{
		timer1 = 0;
	}
	if (timer1 < speed) // Adjust duty cycle to control motor speed
	{
		PWM = 1; // Motor stops
	}
	else
	{
		PWM = 0; // Motor rotates
	}
}