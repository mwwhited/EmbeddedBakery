/********************************* Shenzhen Aerospace Electronics Co., Ltd *******************************
 * Experiment Name: LED Water Flow
 * Experiment Description: Sequentially lights up 8 LEDs like flowing water
 * Experiment Platform: Aerospace 51 microcontroller development board
 * Connection Method: Connect CN5 to CN15, ensuring pin connections from small to large
 * Note: N/A
 * Author: Aerospace Electronics Product Development Department    QQ: 1909197536
 * Store: http://shop120013844.taobao.com/
 ****************************************************************************************/

#include <reg52.h>
#include <intrins.h>

#define FOSC 11059200L // Crystal oscillator setting, default is 11.0592M Hz
// #define FOSC 12000000L // Crystal oscillator setting, using 12M Hz
// #define FOSC 24000000L // Crystal oscillator setting, using 24M Hz

// IO interface definition

// Global variable definition
unsigned char a, b, k;

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
 * Function Name: main
 * Function Description: Main function to implement LED water flow
 * Input: None
 * Output: None
 *******************************************************************************/
void main()
{
	k = 0xFE;
	P2 = k;
	while (1)
	{
		Delayms(500);
		k = _crol_(k, 1); // Circular left shift by 1
		P2 = k;
	}
}