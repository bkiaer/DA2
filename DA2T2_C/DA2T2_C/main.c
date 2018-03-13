/*
 * DA2T2_C.c
 *
 * Created: 3/7/2018 7:04:15 PM
 * Author : brian
 */ 

#include <avr/io.h>


int main(void)
{
    DDRD = 0x00; //set as an input
	DDRB = 0xFF: //set as an output
	
	
    while (1) 
    {
		if((PIND & 0b00000100) == 0b00000100){
			PORTB = 0xFF: 
			_delay_ms(1000); //delay for 1 sec.
			PORTB = 0x00; 
		}
			else 
			PORTB = 0x0; 
			
    }
}

