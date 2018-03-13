;
; DA2_Task2_avr.asm
;
; Created: 3/5/2018 5:16:19 PM
; Author : brian
;


; Replace with your application code
.org 0 

	SBI DDRD, 0x00  ; set PD2 as an input 
	LDI R20, 0xFF
	OUT DDRD, R20 ; set PB2 as an output 
LOOP: 
	IN R20, PIND ;get value of 
	ANDI R20, (1<<PD2) ;masks bits for result PD2
	CPI R20, 0b00000100 ;compare masked bit
	BREQ TOGGLE		;if equal then toggle LED to turn on for 1 second
	SBI PORTB, 0x00; ;if not equal keep LED off
	JMP LOOP		;while loop

TOGGLE: 
	SBI PORTB, 2; turn on LED
	RCALL delay_250ms
	RCALL delay_250ms
	RCALL delay_250ms
	RCALL delay_250ms
	SBI PORTB, 0x00 
	JMP LOOP
	
delay_1ms: ; delay subroutine 
	push R16 
	LDI R16, 99 
delay_1ms1: 
	NOP //no operation to simulate a delay. 
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	DEC R16 //counter to decrement and loop to simulate a delay
	BRNE delay_1ms1 
	POP R16 
	RET

delay_250ms: 
	PUSH R16 
	LDI R16, 250 
delay_250ms1:
	RCALL delay_1ms
	DEC R16 
	BRNE delay_250ms1
	POP R16 
	RET