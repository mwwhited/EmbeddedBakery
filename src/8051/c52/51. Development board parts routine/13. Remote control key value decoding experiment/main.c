/********************************* XXX Company *******************************
 * Implementation: Infrared receiver
 * Implementation method: After receiving the infrared signal successfully, use the infrared receiver pin to receive the header and data bits of the signal, and then decode it. The corresponding data value can be displayed.
 * Platform: L298N motor driver board
 * Connection method: Connect the infrared receiver to CN18, HW_RD to CN14, and P32.
 * Note: Please pay attention to the wiring of the components to avoid short circuits, etc., especially CN26.
 * Product consultation: QQ 1909197536
 * Shop link: http://shop120013844.taobao.com/
 ****************************************************************************************/

#include <reg52.h>
#include <intrins.h>

#define FOSC 11059200L // Oscillation frequency, default 11.0592M Hz
// #define FOSC 12000000L // Oscillation frequency, using 12M Hz
// #define FOSC 24000000L // Oscillation frequency, using 24M Hz

// IO interface
#define LED_PORT P0
sbit wela_1 = P2 ^ 4;
sbit wela_2 = P2 ^ 5;
sbit wela_3 = P2 ^ 6;
sbit wela_4 = P2 ^ 7;

sbit IRIN = P3 ^ 2; // Infrared receiver pin

// Global variables
unsigned char IRCOM[4];
unsigned char ir_value = 0;
// LED display mode 0-F
unsigned code table[] = {0Xc0, 0xf9, 0xa4, 0xb0, 0x99, 0x92, 0x82, 0xf8, 0x80, 0x90, 0x88, 0x83, 0xc6, 0xa1, 0x86, 0x8e};

/*******************************************************************************
 * Function: Delayms
 * Description: Implement time delay in milliseconds
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

/*******************************************************************************
 * Function: Exit0Init
 * Description: Initialize external interrupt 0
 * Parameters: None
 *******************************************************************************/
void Exit0Init()
{
	EX0 = 1; // Enable INT1 external interrupt
	IT0 = 1; // Set interrupt type as falling edge triggered
	EA = 1;	 // Enable interrupts
}

/*******************************************************************************
 * Function: DelayIr
 * Description: Implement a delay of 0.14 milliseconds
 * Parameters: x - delay count
 *******************************************************************************/
void DelayIr(unsigned char x)
{
	unsigned char i;
	while (x--)
	{
		for (i = 0; i < 13; i++)
		{
		}
	}
}

/*******************************************************************************
 * Function: main
 * Description: Main function
 * Parameters: None
 *******************************************************************************/
void main()
{
	IRIN = 1; // Initialize I/O
	Exit0Init();
	while (1)
	{
		LEDdisplay(ir_value);
	}
}

/*******************************************************************************
* Function: Exit0Int
* Description: External interrupt 0 ISR

*******************************************************************************/
void Exit0Int() interrupt 0
{
	unsigned char j, k, N = 0;

	EX0 = 0;	   // Disable external interrupt 0
	DelayIr(15);   // Delay for 15 times 0.14 milliseconds
	if (IRIN == 1) // Check if IR input is high
	{
		EX0 = 1; // Enable external interrupt 0
		return;
	}
	// Ensure the correctness of the IR signal
	while (!IRIN) // Wait for the falling edge of the IR signal, indicating the start of the IR frame, which should last for about 9ms
	{
		DelayIr(1); // Delay for 0.14 milliseconds
	}

	for (j = 0; j < 4; j++) // Receive the 4 bytes of the IR signal
	{
		for (k = 0; k < 8; k++) // Receive each bit of the byte
		{
			while (IRIN) // Wait for the falling edge of the IR signal, indicating the start of a logic 0 bit, which should last for about 4.5ms
			{
				DelayIr(1); // Delay for 0.14 milliseconds
			}
			while (!IRIN) // Wait for the rising edge of the IR signal, indicating the start of a logic 1 bit
			{
				DelayIr(1); // Delay for 0.14 milliseconds
			}
			while (IRIN) // Count the duration of the high signal, determining whether it's a logic 0 or logic 1 bit
			{
				DelayIr(1);	 // Delay for 0.14 milliseconds
				N++;		 // Increment the duration counter
				if (N >= 30) // If the duration exceeds 30 (about 4.2ms), it's considered as the end of the IR frame
				{
					EX0 = 1; // Enable external interrupt 0 for the next frame
					return;	 // Exit the function
				}
			}
			IRCOM[j] = IRCOM[j] >> 1; // Shift the received bit to the right by 1 position
			if (N >= 8)				  // If the duration exceeds 8 (about 1.1ms), it's considered as a logic 1 bit
			{
				IRCOM[j] = IRCOM[j] | 0x80; // Set the MSB (most significant bit) to 1
			}
			N = 0; // Reset the duration counter for the next bit
		}		   // end for k
	}			   // end for j

	if (IRCOM[2] != ~IRCOM[3]) // Check if the third byte matches its complement, ensuring the correctness of the received data
	{
		EX0 = 1; // Enable external interrupt 0 for the next frame
		return;	 // Exit the function
	}
	ir_value = IRCOM[2]; // Store the received IR value
	EX0 = 1;			 // Enable external interrupt 0 for the next frame
}
