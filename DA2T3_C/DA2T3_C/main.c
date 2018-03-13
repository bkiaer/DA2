/*
 * DA2T3_C.c
 *
 * Created: 3/8/2018 8:39:29 AM
 * Author : brian
 */ 

#include <avr/io.h>
//#define F_CPU 8000000UL 
#include <util/delay.h>

//clock at 1MHz
//TCNT value = (1MHz)/(1024) * .25s
int main(void)
{
	int a = 3; 			//place holder for PB2 
	DDRB |= ( 1 << 2);  //set output for PB2 
	PORTB &= ~(1<<2); 	//set output off
	TCCR0B |= (1 << WGM02)|(1 << CS02)|(1 << CS00); //prescaler is 1024 WG mode 4
	TCCR0A |= ( 1 << COM0A0); //compare 
	TCNT0 = 0; //initialize
	OCR0A = 243; //calculated value *work is above 
    while (1) 
    {
		
		if(TIFR0 & 2) //if TIFR0 is set
		{
			PORTB = a;
			a ^= 0xFF; // toggle LED
			
		}
		TIFR0 |= 2;
		
    }
}
