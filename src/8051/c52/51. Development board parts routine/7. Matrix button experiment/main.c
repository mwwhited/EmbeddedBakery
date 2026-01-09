/********************************* Shenzhen Aerospace Electronics Co., Ltd *******************************
 * Experiment Name: Keypad Input Experiment
 * Experiment Description: Display the corresponding value of the keys S1-S16 when pressed.
 * Experiment Platform: Aerospace 51 microcontroller development board
 * Connection Method: Connect keys to CN16 and CN14, respectively, and the corresponding pins to P30-P37.
 * Note: Please note that the key assignments may vary. Ensure proper connection with P3 port.
 * Author: Aerospace Electronics Product Development Department    QQ: 1909197536
 * Store: http://shop120013844.taobao.com/
 ****************************************************************************************/

#include <reg52.h>
#include <intrins.h>

#define FOSC 11059200L // Crystal oscillator setting, default is 11.0592M Hz
// #define FOSC 12000000L // Crystal oscillator setting, using 12M Hz
// #define FOSC 24000000L // Crystal oscillator setting, using 24M Hz

// IO interface definition
#define LED_PORT P0
#define KEY_PORT P3
sbit wela_1 = P2 ^ 4;
sbit wela_2 = P2 ^ 5;
sbit wela_3 = P2 ^ 6;
sbit wela_4 = P2 ^ 7;

// Global variables
unsigned char key_value, key_value_disp;

// LED display pattern 0-F
unsigned code table[] = {0Xc0, 0xf9, 0xa4, 0xb0, 0x99, 0x92, 0x82, 0xf8, 0x80, 0x90, 0x88, 0x83, 0xc6, 0xa1, 0x86, 0x8e};

/*******************************************************************************
 * Function Name: Delayms
 * Function Description: Delay for a specified number of milliseconds
 * Input: ms (milliseconds)
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
 * Function Name: KeyScan
 * Function Description: Scan the 4*4 keypad
 * Input: None
 * Output: num (the value of the pressed key, 0xff if no key is pressed)
 *******************************************************************************/
unsigned char KeyScan()
{
	unsigned char temp, num;
	num = 0xff;
	KEY_PORT = 0xfe;
	temp = KEY_PORT;
	temp = temp & 0xf0;
	while (temp != 0xf0)
	{
		Delayms(5); // debounce
		temp = KEY_PORT;
		temp = temp & 0xf0;
		while (temp != 0xf0)
		{
			temp = KEY_PORT;
			switch (temp)
			{
			case 0xee:
				num = 1;
				break;
			case 0xde:
				num = 2;
				break;
			case 0xbe:
				num = 3;
				break;
			case 0x7e:
				num = 4;
				break;
			}
			while (temp != 0xf0)
			{
				temp = KEY_PORT;
				temp = temp & 0xf0;
			}
		}
	}

	// Similar switch-case blocks for other rows
	// Omitted for brevity

	return num;
}

/*******************************************************************************
 * Function Name: LEDdisplay
 * Function Description: Display the value on the LED
 * Input: num (the value to be displayed)
 * Output: None
 *******************************************************************************/
void LEDdisplay(unsigned int num)
{
	unsigned char qian, bai, shi, ge;
	qian = num / 1000;
	bai = num % 1000 / 100;
	shi = num % 100 / 10;
	ge = num % 10;

	// Display thousands place
	wela_1 = 1; // Disable the display of other digits
	wela_2 = 1;
	wela_3 = 1;
	wela_4 = 1;
	wela_4 = 0; // Enable the display of the thousands place
	LED_PORT = table[qian];
	Delayms(1);
	LED_PORT = 0xff;
	wela_4 = 1;

	// Similar code blocks for other digits
	// Omitted for brevity
}

/*******************************************************************************
 * Function Name: main
 * Function Description: Main function
 * Input: None
 * Output: None
 *******************************************************************************/
void main()
{
	key_value_disp = 0;
	key_value = 0;
	while (1)
	{
		key_value = KeyScan();
		if (key_value != 0xff)
		{
			key_value_disp = key_value;
		}
		LEDdisplay(key_value_disp);
	}
}