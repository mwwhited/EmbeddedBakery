/********************************* Shenzhen Aerospace Electronics Co., Ltd *******************************
 * Experiment Name: Serial Communication Experiment
 * Experiment Description: Open a serial port and set it to automatically receive and transmit data to the external device.
 * Experiment Platform: Aerospace 51 microcontroller development board
 * Connection Method: N/A
 * Note: Please select the COM port and baud rate according to the external device. If using the COM port, ensure that the port is available and not occupied by other programs.
 *            Also, please be aware that the COM port may conflict with other ports or operations, resulting in unpredictable results.
 * Author: Aerospace Electronics Product Development Department    QQ: 1909197536
 * Store: http://shop120013844.taobao.com/
 ****************************************************************************************/

#include <reg52.h>
#include <intrins.h>

#define FOSC 11059200L // Crystal oscillator setting, default is 11.0592M Hz
// #define FOSC 12000000L // Crystal oscillator setting, using 12M Hz
// #define FOSC 24000000L // Crystal oscillator setting, using 24M Hz
#define BAUD 9600

// IO interface definition

// Global variables

/*******************************************************************************
 * Function Name: UsartConfiguration
 * Function Description: Configure USART communication
 * Input: None
 * Output: None
 *******************************************************************************/
void UsartConfiguration()
{
	SCON = 0X50;							   // Set UART mode 1: 10-bit asynchronous mode with variable baud rate
	TMOD |= 0x20;							   // Set timer 1 as auto-reload mode 2, 8-bit auto-reload
	PCON = 0X80;							   // Enable SMOD bit for serial communication (28800)
	TH1 = 256 - (FOSC / 12 / 32 / (BAUD / 2)); // Set reload value for timer 1
	TL1 = 256 - (FOSC / 12 / 32 / (BAUD / 2));
	TR1 = 1; // Start timer 1
	ES = 1;	 // Enable serial port interrupt
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
	UsartConfiguration();
	while (1)
	{
	}
}

/*******************************************************************************
 * Function Name: UsartInt
 * Function Description: Interrupt service routine for USART communication
 * Input: None
 * Output: None
 *******************************************************************************/
void UsartInt() interrupt 4
{
	unsigned char receiveData;
	if (RI == 1)
	{
		receiveData = SBUF; // Read received data
		RI = 0;				// Clear receive interrupt flag
		SBUF = receiveData; // Send received data back
		while (!TI)
			;	// Wait until transmission is complete
		TI = 0; // Clear transmission interrupt flag
	}
}