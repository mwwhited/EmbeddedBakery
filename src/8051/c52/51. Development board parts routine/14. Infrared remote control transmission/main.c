/********************************* Sample Technology Co., Ltd. *******************************
 * Function: This program realizes the functionality of an infrared remote control.
 * Function Description: After the infrared signal is successfully received, it is sent to the control board. The control board sends data to the corresponding integrated circuit through a special protocol. The value of the key pressed is sent to the actual application through the chip on the control board.
 * Platform: MCU 51 microcontroller
 * Connection mode: CN19-HW_DRI, CN15-P16
 * Note: When transmitting data, the control board should output the start pulse, logic 1 is sent during TR1, and logic 0 is sent during TR1. When TR1 is low, data is transmitted to the receiving chip. When TR1 is high, data is transmitted to the high level.
 * When: QQ 1909197536
 * Shop: http://shop120013844.taobao.com/
 ****************************************************************************************/

#include <reg52.h>

#define FOSC 11059200L // Crystal frequency, default is 11.0592M Hz
// #define FOSC 12000000L // Crystal frequency, 12M Hz
// #define FOSC 24000000L // Crystal frequency, 24M Hz

// I/O interface
sbit IR_OUT = P1 ^ 6;
sbit dula = P2 ^ 6;
sbit wela = P2 ^ 7;

#define LED_PORT P0
#define KEY_PORT P3
sbit wela_1 = P2 ^ 4;
sbit wela_2 = P2 ^ 5;
sbit wela_3 = P2 ^ 6;
sbit wela_4 = P2 ^ 7;

// LED display model: 0-F hexadecimal mode
unsigned code table[] = {0Xc0, 0xf9, 0xa4, 0xb0, 0x99, 0x92, 0x82, 0xf8, 0x80, 0x90, 0x88, 0x83, 0xc6, 0xa1, 0x86, 0x8e};

unsigned char KeyScan();
void LEDdisplay(unsigned int num);

/*******************************************************************************
 * Function: Delayms
 * Description: Delay for ms milliseconds
 * Parameters: ms
 * Returns: None
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
 * Function: Init_Timer
 * Description: Initialize Timer1, 13us per count, interrupt generated every 38K
 * Parameters: None
 * Returns: None
 *******************************************************************************/
void Init_Timer(void)
{
	TMOD = 0x21; // T0 mode 1      T1 mode 2
	TH1 = 256 - (1000 * 11.002 / 38.0 / 12) / 2 + 0.5;
	// Timer initialization
	TL1 = TH1;
	ET1 = 1;
	EA = 1;
}

/*******************************************************************************
 * Function: Send_Start_Bit
 * Description: Send start bit, consisting of 9ms high and 4.5ms low pulses
 * Parameters: None
 * Returns: None
 *******************************************************************************/
void Send_Start_Bit(void) // TR1 value = high level
{
	// 9ms high
	TH0 = (65536 - 8295) / 256;
	TL0 = (65536 - 8295) % 256;
	TR0 = 1;
	TR1 = 1;

	while (!TF0)
		;

	TR1 = 0;
	TF0 = 0;
	TR0 = 0;

	IR_OUT = 1;
	// 4.5ms low
	TH0 = (65536 - 4146) / 256;
	TL0 = (65536 - 4146) % 256;
	TR0 = 1;
	TR1 = 0;

	while (!TF0)
		;

	TR1 = 0;
	TF0 = 0;
	TR0 = 0;

	IR_OUT = 1;
}

/*******************************************************************************
 * Function: Send_Bit_0
 * Description: Send bit 0
 * Parameters: None
 * Returns: None
 *******************************************************************************/
void Send_Bit_0(void)
{
	// 0.565ms high
	TH0 = (65536 - 521) / 256;
	TL0 = (65536 - 521) % 256;
	TR0 = 1;
	TR1 = 1;

	while (!TF0)
		;

	TR1 = 0;
	TF0 = 0;
	TR0 = 0;

	IR_OUT = 1;
	// 0.565ms low
	TH0 = (65536 - 521) / 256;
	TL0 = (65536 - 521) % 256;
	TR0 = 1;
	TR1 = 0;

	while (!TF0)
		;

	TR1 = 0;
	TF0 = 0;
	TR0 = 0;

	IR_OUT = 1;
}
/*******************************************************************************
 * Function Name: Send_Bit_1
 * Description: Sends a bit 1
 *******************************************************************************/
void Send_Bit_1(void)
{
	// 0.565ms 1
	TH0 = (65536 - 521) / 256;
	TL0 = (65536 - 521) % 256;
	TR0 = 1;
	TR1 = 1;

	while (!TF0)
		;

	TR1 = 0;
	TF0 = 0;
	TR0 = 0;

	IR_OUT = 1;
	// 1.685ms 0
	TH0 = (65536 - 1563) / 256;
	TL0 = (65536 - 1563) % 256;
	TR0 = 1;
	TR1 = 0;

	while (!TF0)
		;

	TR1 = 0;
	TF0 = 0;
	TR0 = 0;

	IR_OUT = 1;
}

/*******************************************************************************
 * Function Name: Send_over
 * Description: Sends the ending code, representing the end of a command, only the last bit is 1, others are 0.
 *******************************************************************************/
void Send_over(void) //
{
	// 0.500ms 1                 //Short 0.5ms pulse is used for marking the end of a command.
	TH0 = (65536 - 500) / 256;
	TL0 = (65536 - 500) % 256;
	TR0 = 1;
	TR1 = 1;

	while (!TF0)
		;

	TR1 = 0;
	TF0 = 0;
	TR0 = 0;

	IR_OUT = 1;
	// 0.500ms 0
	TH0 = (65536 - 500) / 256;
	TL0 = (65536 - 500) % 256;
	TR0 = 1;
	TR1 = 0;

	while (!TF0)
		;

	TR1 = 0;
	TF0 = 0;
	TR0 = 0;

	IR_OUT = 1;
}
/*******************************************************************************
 * Function Name: Send_Char
 * Description: Sends an 8-bit byte, attention, initialization required.
 * Arguments: add - address, date - data
 *******************************************************************************/
void Send_Char(unsigned char add, unsigned char date)
{
	unsigned char i, j1, j2, j3, j4;
	j1 = add;
	j2 = ~add;
	j3 = date;
	j4 = ~date;
	Send_Start_Bit();

	// Send address bits
	for (i = 0; i < 8; i++)
	{
		if (j1 & 0x01)
			Send_Bit_1();
		else
			Send_Bit_0();
		j1 = j1 >> 1;

		// Move to next bit
	}

	for (i = 0; i < 8; i++)
	{
		if (j2 & 0x01)
			Send_Bit_1();
		else
			Send_Bit_0();
		j2 = j2 >> 1;

		// Move to next bit
	}

	for (i = 0; i < 8; i++)
	{
		if (j3 & 0x01)
			Send_Bit_1();
		else
			Send_Bit_0();
		j3 = j3 >> 1;

		// Move to next bit
	}

	for (i = 0; i < 8; i++)
	{
		if (j4 & 0x01)
			Send_Bit_1();
		else
			Send_Bit_0();
		j4 = j4 >> 1;

		// Move to next bit
	}

	Send_over();

	// Send end code
}

/*******************************************************************************
 * Function Name: T1_ISR
 * Description: Timer 1 interrupt service routine, generates 38k Hz pulse
 *******************************************************************************/
void T1_ISR(void) interrupt 3
{
	IR_OUT = !IR_OUT;
}

/*******************************************************************************
 * Function Name: main
 * Description: Main function
 *******************************************************************************/
void main(void)
{
	unsigned char date = 0;
	unsigned int disp_data = 0;
	IR_OUT = 1;
	Init_Timer();
	while (1)
	{
		//	Send_Start_Bit();

		//	Send_Bit_1();
		// Send_Char(date+2,date);
		// date++;
		// Delayms(1000);
		// if(date == 100) date = 0;

		date = KeyScan();
		if (date != 0xff)
		{
			disp_data = (int)date;
			Send_Char(0x55, date);
		}
		LEDdisplay(disp_data);
	}
}
/*******************************************************************************
 * Function Name: KeyScan
 * Description: Scans a 4*4 keypad
 * Arguments: None
 * Returns: num - the value of the key pressed, returns 0xff if no key is pressed
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
		Delayms(5); // Delay for debounce
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

	KEY_PORT = 0xfd;
	temp = KEY_PORT;
	temp = temp & 0xf0;
	while (temp != 0xf0)
	{
		Delayms(5); //delay for debounc
		temp = KEY_PORT;
		temp = temp & 0xf0;
		while (temp != 0xf0)
		{
			temp = KEY_PORT;
			switch (temp)
			{
			case 0xed:
				num = 5;
				break;
			case 0xdd:
				num = 6;
				break;
			case 0xbd:
				num = 7;
				break;
			case 0x7d:
				num = 8;
				break;
			}
			while (temp != 0xf0)
			{
				temp = KEY_PORT;
				temp = temp & 0xf0;
			}
		}
	}

	KEY_PORT = 0xfb;
	temp = KEY_PORT;
	temp = temp & 0xf0;
	while (temp != 0xf0)
	{
		Delayms(5); 
		temp = KEY_PORT;
		temp = temp & 0xf0;
		while (temp != 0xf0)
		{
			temp = KEY_PORT;
			switch (temp)
			{
			case 0xeb:
				num = 9;
				break;
			case 0xdb:
				num = 10;
				break;
			case 0xbb:
				num = 11;
				break;
			case 0x7b:
				num = 12;
				break;
			}
			while (temp != 0xf0)
			{
				temp = KEY_PORT;
				temp = temp & 0xf0;
			}
		}
	}

	KEY_PORT = 0xf7;
	temp = KEY_PORT;
	temp = temp & 0xf0;
	while (temp != 0xf0)
	{
		Delayms(5); //  delay
		temp = KEY_PORT;
		temp = temp & 0xf0;
		while (temp != 0xf0)
		{
			temp = KEY_PORT;
			switch (temp)
			{
			case 0xe7:
				num = 13;
				break;
			case 0xd7:
				num = 14;
				break;
			case 0xb7:
				num = 15;
				break;
			case 0x77:
				num = 0;
				break;
			}
			while (temp != 0xf0)
			{
				temp = KEY_PORT;
				temp = temp & 0xf0;
			}
		}
	}
	return num;
}

/*******************************************************************************
 * Function Name: LEDdisplay
 * Description: Displays the digits of a number on a loop
 * Arguments: num - the number to be displayed
 * Returns: None
 *******************************************************************************/
void LEDdisplay(unsigned int num)
{
	unsigned char qian, bai, shi, ge;
	qian = num / 1000;
	bai = num % 1000 / 100;
	shi = num % 100 / 10;
	ge = num % 10;

	wela_1 = 1; // Disable all common cathodes
	wela_2 = 1;
	wela_3 = 1;
	wela_4 = 1;

	wela_4 = 0; // Display thousands digit
	LED_PORT = table[qian];
	Delayms(1);
	LED_PORT = 0xff;
	wela_4 = 1;

	wela_3=0;  //Display units digit
	LED_PORT=table[bai];
	Delayms(1);
	LED_PORT = 0xff;
	wela_3=1;
	
	wela_2=0;  //Display tens digit
	LED_PORT=table[shi];
	Delayms(1);
	LED_PORT = 0xff;
	wela_2=1;
	
	wela_1=0;  //Display units place
	LED_PORT=table[ge];
	Delayms(1);
	LED_PORT = 0xff;
}
