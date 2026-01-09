/********************************* Shenzhen Aerospace Electronics Co., Ltd *******************************
 * Experiment Name: Dynamic display experiment
 * Experiment Description: Sequentially displays 16 numbers from 0 to F with 4-bit dynamic display
 * Experiment Platform: Aerospace 51 microcontroller development board
 * Connection Method: A -> P00, B -> P01, C -> P02, D -> P03, E -> P04, F -> P05, G -> P06, DP -> P07
 *                        PUT1 -> P24, PUT2 -> P25, PUT3 -> P26, PUT4 -> P27
 * Note: The connections are for common anode display, if using common cathode display, connections and logic need to be adjusted accordingly.
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
sbit wela_1 = P2 ^ 4;
sbit wela_2 = P2 ^ 5;
sbit wela_3 = P2 ^ 6;
sbit wela_4 = P2 ^ 7;

// Global variable
unsigned char num;

// LED display pattern 0-F
unsigned code table[] = {0Xc0, 0xf9, 0xa4, 0xb0, 0x99, 0x92, 0x82, 0xf8, 0x80, 0x90, 0x88, 0x83, 0xc6, 0xa1, 0x86, 0x8e};

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
 * Function Description: Main function
 * Input: None
 * Output: None
 *******************************************************************************/
void main()
{
   wela_1 = 0; // Enable dynamic display
   wela_2 = 0;
   wela_3 = 0;
   wela_4 = 0;

   while (1)
   {
      for (num = 0; num < 16; num++) // Loop through numbers and display on LED_PORT
      {
         LED_PORT = table[num]; // Display the current number
         Delayms(1000);
      }
   }
}