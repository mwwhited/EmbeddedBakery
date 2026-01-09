/********************************* XXX Company *******************************
 * Implementation of DS18B20 temperature sensor
 * Implementation method: Display current temperature
 * Platform: L298N motor driver board
 * Connection method: Connect DS18B20 to the temperature sensor module U5, DS_RD to P22
 * Note:
 * 1. The direction of the motor must be connected according to the specified method.
 * 2. The speed can be adjusted appropriately, but it cannot be turned too fast.
 * Product consultation: QQ 1909197536
 * Shop link: http://shop120013844.taobao.com/
 ****************************************************************************************/
#include <reg52.h>
#include <intrins.h>

#define uchar unsigned char
#define uint unsigned int

#define FOSC 11059200L // Oscillation frequency, default 11.0592M Hz
// #define FOSC 12000000L // Oscillation frequency, using 12M Hz
// #define FOSC 24000000L // Oscillation frequency, using 24M Hz

// I/O interface definitions
sbit DQ = P2 ^ 2; // DS18B20 data pin DQ
#define LED_PORT P0
sbit wela_1 = P2 ^ 4;
sbit wela_2 = P2 ^ 5;
sbit wela_3 = P2 ^ 6;
sbit wela_4 = P2 ^ 7;

unsigned char temperature = 0;
// LED display module 0-F display mode
unsigned code table[] = {0Xc0, 0xf9, 0xa4, 0xb0, 0x99, 0x92, 0x82, 0xf8, 0x80, 0x90, 0x88, 0x83, 0xc6, 0xa1, 0x86, 0x8e};
unsigned char RomCode[8];

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
 * Function: LEDdisplay
 * Description: Loop display of the decimal number on LEDs
 * Parameters: num - number to be displayed
 *******************************************************************************/
void LEDdisplay(unsigned int num)
{
	unsigned char qian, bai, shi, ge;
	qian = num / 1000;
	bai = num % 1000 / 100;
	shi = num % 100 / 10;
	ge = num % 10;

	wela_1 = 1; // Turn off the display module
	wela_2 = 1;
	wela_3 = 1;
	wela_4 = 1;

	wela_4 = 0; // Display thousands place
	LED_PORT = table[qian];
	Delayms(1);
	LED_PORT = 0xff;
	wela_4 = 1;

	wela_3 = 0; // Display hundreds place
	LED_PORT = table[bai];
	Delayms(1);
	LED_PORT = 0xff;
	wela_3 = 1;

	wela_2 = 0; // Display tens place
	LED_PORT = table[shi];
	Delayms(1);
	LED_PORT = 0xff;
	wela_2 = 1;

	wela_1 = 0; // Display ones place
	LED_PORT = table[ge];
	Delayms(1);
	LED_PORT = 0xff;
}

/*******************************************************************/
/*                                                                 */
/*us delay function                                                */
/*                                                                 */
/*******************************************************************/

void Delay(unsigned int num)
{
	while (--num)
		;
}

/*******************************************************************/
/*                                                                 */
/* Initialize DS1820                                               */
/*                                                                 */
/*******************************************************************/
bit Init_DS18B20(void)
{
	bit presence;
	DQ = 1;	  // DQ pin high
	Delay(8); // Delay for 8us

	DQ = 0;	   // Send reset signal to the sensor
	Delay(90); // Wait for 480us

	DQ = 1; // Release the bus
	Delay(8);

	presence = DQ; // 0 = presence, 1 = no presence
	Delay(100);
	DQ = 1;

	return (presence); // Return presence status
}

/*******************************************************************/
/*                                                                 */
/* Read one byte                                                   */
/*                                                                 */
/*******************************************************************/
unsigned char ReadOneChar(void)
{
	unsigned char i = 0;
	unsigned char dat = 0;

	for (i = 8; i > 0; i--)
	{
		DQ = 0; // Generate start signal
		dat >>= 1;
		DQ = 1; // Release bus

		if (DQ)
			dat |= 0x80;
		Delay(4);
	}
	return (dat);
}

/*******************************************************************/
/*                                                                 */
/* Write one byte                                                  */
/*                                                                 */
/*******************************************************************/
void WriteOneChar(unsigned char dat)
{
	unsigned char i = 0;
	for (i = 8; i > 0; i--)
	{
		DQ = 0;
		DQ = dat & 0x01;
		Delay(5);

		DQ = 1;
		dat >>= 1;
	}
}

/*******************************************************************/
/*                                                                 */
/* Write temperature alarm value to DS18B20                        */
/*                                                                 */
/*******************************************************************/
void Write_Temperature_alarm(unsigned char Temp_h, unsigned char Temp_l)
{
	Init_DS18B20();

	WriteOneChar(0xCC);	  // Skip ROM command
	WriteOneChar(0x4e);	  // Write temperature alarm value to DS18B20
	WriteOneChar(Temp_h); // Write TH
	WriteOneChar(Temp_l); // Write TL
	WriteOneChar(0x7f);	  // 12-bit resolution

	Init_DS18B20();
	WriteOneChar(0xCC); // Skip ROM command
	WriteOneChar(0x48); // Copy scratchpad to EEPROM
}

/*******************************************************************/
/*                                                                 */
/* Read ROM code                                                    */
/*                                                                 */
/*******************************************************************/
void Read_RomCord(void)
{
	unsigned char j;
	Init_DS18B20();

	WriteOneChar(0x33); // Read ROM command
	for (j = 0; j < 8; j++)
	{
		RomCode[j] = ReadOneChar();
	}
}

/*******************************************************************/
/*                                                                 */
/* DS18B20 CRC8 checksum calculation                               */
/*                                                                 */
/*******************************************************************/
unsigned char CRC8()
{
	unsigned char i, x;
	unsigned char crcbuff, crc;

	crc = 0;
	for (x = 0; x < 8; x++)
