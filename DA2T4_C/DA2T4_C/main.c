/*
 * DA2T4_C.c
 *
 * Created: 3/8/2018 7:05:17 PM
 * Author : brian
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>

//Y = ((1MHz/1024)*.25s)-1 = 243
int main(void)
{
	
   DDRB |= (1 << 2); //set PB2 as an output
   TCNT0 = 12;		//timer
   TCCR0A = 0x00;	//set to normal mode
   TCCR0B = 0x05;	//
   TIMSK0 = (1 << TOIE0); 
   sei(); 
   
    while (1) 
    {
    }
}

ISR(TIMER0_OVF_vect)
{
	TCNT0 = 12; 
	PORTB ^= (1<<2);
	TIFR0 |= (1 << TOV0);
	
}
