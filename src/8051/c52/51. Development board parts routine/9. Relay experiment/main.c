/********************************* Shenzhen Aerospace Electronics Co., Ltd *******************************
 * Experiment Name: Relay Control Experiment
 * Experiment Description: Control the relay to cycle on and off
 * Experiment Platform: Aerospace 51 microcontroller development board
 * Connection Method: CN16-CN7, JD1_drive-P05
 * Note: Please ensure that the power supply of the relay is connected correctly to avoid damage to the relay and the original circuit.
 * Author: Aerospace Electronics Product Development Department    QQ: 1909197536
 * Store: http://shop120013844.taobao.com/
 ****************************************************************************************/

#include <reg52.h>
#include <intrins.h>

#define FOSC 11059200L // Crystal oscillator setting, default is 11.0592M Hz
// #define FOSC 12000000L // Crystal oscillator setting, using 12M Hz
// #define FOSC 24000000L // Crystal oscillator setting, using 24M Hz

// IO interface definition
sbit RELAY = P0 ^ 5; // Relay control pin

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
 * Function Name: main
 * Function Description: Main function
 * Input: None
 * Output: None
 *******************************************************************************/
void main()
{
	while (1)
	{
		RELAY = 0; // Turn off the relay to make the controlled device off
		Delayms(1000);
		RELAY = 1; // Turn on the relay to make the controlled device on
		Delayms(1000);
	}
}