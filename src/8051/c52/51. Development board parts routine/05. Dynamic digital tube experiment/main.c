/********************************* Four-digit digital tube display control *******************************
* File Name: Digital Tube Display Control
* Description: Displays numbers from 0 to 100 sequentially and shows them on the digital tube display, with 4 digits displayed sequentially. This is to demonstrate the effect of refreshing, so each number will be displayed for a short period before switching to the next one.
* Product Version: 51 Single-Chip Microcomputer Experiment Kit V1.1
* Connection Method: CN3 connected to CN16, A connected to P00, B connected to P01, C connected to P02, D connected to P03, E connected to P04, F connected to P05, G connected to P06, DP connected to P07
*                  CN1 connected to CN17, PUT1 connected to P24, PUT2 connected to P25, PUT3 connected to P26, PUT4 connected to P27
* Note: The display is common anode display, and therefore the pins connected to the display should be pulled low when lighting up. Each number to be displayed is given a 1ms display time, during this 1ms period, only one number will be lit up,
*       the rest numbers are off, which makes it appear that only one number is lit up at any given moment.
*       The numbers displayed are continuous, but due to the high speed, it seems as if all numbers are lit up simultaneously.
* Author: Digital Tube Display Shop    QQ: 1909197536
* Store: http://shop120013844.taobao.com/
****************************************************************************************/

#include <reg52.h>
#include <intrins.h>

#define FOSC 11059200L // Oscillation frequency setting, default using 11.0592M Hz
//#define FOSC 12000000L // Oscillation frequency setting, using 12M Hz
//#define FOSC 24000000L // Oscillation frequency setting, using 24M Hz

#define TIME_MS 50 // Set time in ms, under 11.0592M oscillator, not exceeding 60ms

// IO Port definition
#define LED_PORT P0
sbit wela_1 = P2^4;
sbit wela_2 = P2^5;
sbit wela_3 = P2^6;
sbit wela_4 = P2^7;

// Global variables declaration
unsigned char count,temp;

// LED display table 0-F hexadecimal display mode
unsigned code table[]= {0Xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e};

/*******************************************************************************
* Function Name: Delayms
* Description: Delay for specified ms milliseconds
* Input: ms
* Output: None
*******************************************************************************/
void Delayms(unsigned int ms)
{
	unsigned int i,j;
	for(i=0;i<ms;i++)
	#if FOSC == 11059200L
		for(j=0;j<114;j++);
	#elif FOSC == 12000000L
	  for(j=0;j<123;j++);
	#elif FOSC == 24000000L
		for(j=0;j<249;j++);
	#else
		for(j=0;j<114;j++);
	#endif
}

/*******************************************************************************
* Function Name: Timer0Init
* Description: Timer 0 initialization
* Input: None
* Output: None
*******************************************************************************/
void Timer0Init()
{
	TMOD=0x01; // Set Timer 0 mode as mode 1
	TH0=(65536-FOSC/12/1000*TIME_MS)/256;
	TL0=(65536-FOSC/12/1000*TIME_MS)%256;
	ET0=1; // Enable Timer 0 interrupt
	TR0=1;	// Start Timer 0	
	EA=1;  // Enable global interrupt
}

/*******************************************************************************
* Function Name: LEDdisplay
* Description: Displays data on each digit sequentially
* Input: num - data to be displayed
* Output: None
*******************************************************************************/
void LEDdisplay(unsigned int num)
{
	unsigned char qian,bai,shi,ge;
	qian=num/1000;
	bai=num%1000/100;
	shi=num%100/10;
	ge=num%10;
	
	wela_1 = 1;	  // Turn off all digital tubes
	wela_2 = 1;
	wela_3 = 1;
	wela_4 = 1;	

	wela_4=0;  // Display the thousand digit
	LED_PORT=table[qian];
	Delayms(1);
	LED_PORT = 0xff;
	wela_4=1;
	
	wela_3=0;  // Display the hundred digit
	LED_PORT=table[bai];
	Delayms(1);
	LED_PORT = 0xff;
	wela_3=1;
	
	wela_2=0;  // Display the ten digit
	LED_PORT=table[shi];
	Delayms(1);
	LED_PORT = 0xff;
	wela_2=1;
	
	wela_1=0;  // Display the single digit
	LED_PORT=table[ge];
	Delayms(1);
	LED_PORT = 0xff;
}

/*******************************************************************************
* Function Name: main
* Description: Main function
* Input: None
* Output: None
*******************************************************************************/
void main()
{
	Timer0Init();
	count = 0;
	temp = 0;
	while(1)
	{ 
		if(count==5) // Every 1s
		  {
			count=0;
			temp++;
			if(temp==100)
			   {
					temp=0;
			   }
		  }
		LEDdisplay(temp);
	}
}

/*******************************************************************************
* Function Name: Timer0Int
* Description: Timer 0 interrupt function, triggered every TIME_MS ms
* Input: None
* Output: None
*******************************************************************************/
void Timer0Int() interrupt 1
{
	TH0=(65536-FOSC/12/1000*TIME_MS)/256;
	TL0=(65536-FOSC/12/1000*TIME_MS)%256;
	count++;	
}