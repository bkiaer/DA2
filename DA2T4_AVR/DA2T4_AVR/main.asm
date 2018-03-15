;
; DA2T4_AVR.asm
;
; Created: 3/8/2018 10:18:30 PM
; Author : brian
;

.org 0x00 ;location for reset
	JMP MAIN
.org 20 ;location for Timer0 OVF
	JMP TIM0_OVF_ISR

MAIN: 

	LDI R20, HIGH(RAMEND) 
	OUT SPH, R20 
	LDI R20, LOW(RAMEND)
	OUT SPL, R20 
	SBI DDRB, 2 ;set PB2 as an output 
	LDI R20, 12 ;value for 0.25s @ 1MHz
	OUT TCNT0, R20 ;timer
	LDI R20, 0x05 ;set prescaler to 1024
	OUT TCCR0B, R20 
	LDI R20, (1 << TOIE0) ;enable OVF Interrupt
	STS TIMSK0, R20
	SEI 



TIM0_OVF_ISR:
	IN R16, PORTB
	LDI R17, 0x04 ;xor using bit mask to toggle
	EOR R16, R17 
	OUT PORTB, R16
	LDI R20, ( 1 << TOV0)
	OUT TIFR0, R20 ;clear flag bit
	RET