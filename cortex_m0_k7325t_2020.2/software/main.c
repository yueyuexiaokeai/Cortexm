#include "system.h"

 unsigned char i=0;
 unsigned char  en=0; 
 void Btn_ISR()
{
	  i=0;
}

 void Timer_ISR()
{
	 en=1;
	}

//////////////////////////////////////////////////////////////////
// Main Function
//////////////////////////////////////////////////////////////////

int main(void) 
 {
	
	*(unsigned int*) AHB_TIMER_BASE= 0x0007ffff;		     //Timer load register: =<clock frequency>
	*(unsigned int*) AHB_TIMER_CONT = 0x07;				         //Timer 4-bits control register: [0]: timer enable, [1] mode (free-run or reload) [2]: prescaler
// *(unsigned int*) NVIC_INT_PRIORITY0 = 0x00004000;	   //Priority: IRQ0(Timer): 0x00, IRQ1(UART): 0x40
  *(unsigned int*) AHB_7SEG_BASE = 0x00000000;					 //reset 7-segment display	
	*(unsigned int*) AHB_LED_BASE = 0xA5; 
	*(unsigned int*) NVIC_INT_ENABLE = 0x00000003;		     //Enable interrupts for UART and timer
	while(1)
	{
	  if(en==1)
		{
			en=0;
		*(unsigned char*) AHB_LED_BASE = i; 
		*(unsigned int*) AHB_7SEG_BASE =i;
		*(unsigned int*) AHB_VGA_BASE =i+0x30;		//print the counter value to VGA
	  *(unsigned int*) AHB_VGA_BASE = ' ';				//print space
    i=i+1;
	   if (i==100)
		*(unsigned int*) AHB_TIMER_CONT= 0;	//Stop timer if counter reaches 9
	 }
 }		
	return 0;
}


