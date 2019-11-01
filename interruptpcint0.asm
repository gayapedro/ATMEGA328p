; interruptpcint0.asm
; Autor: Pedro Gaya (pedrogaya@gmail.com)
; github: gayapedro

.include "./m328Pdef.inc"
.org 0x00						
rjmp reset
.org PCI0addr
rjmp PCINT0_vect

reset:	
	ldi r16, (1<<PCIE0)		
	sts PCICR, r16
    ldi r16, (1<<PCIF0)			
	out PCIFR, r16
    ldi r16, (1<<PCINT0)
    sts PCMSK0, r16
	; Sets PORTB as input						
 	ldi r17, 0x00			
	out DDRB, r17
	out PortB, r17
	ldi r17, 0xFF
	out DDRD, r17
	out PortD, r17
	; Global Enable Interrupt
	sei		

main:
    RJMP main

PCINT0_vect:
	SBIS PinB, PB0
	RJMP saida
	ldi r18, 0xFF
	eor r17,r18
	out PortD, r17
    RCALL atraso
	saida:
    RETI

atraso:
	LDI r19, 16
volta:
	DEC r20
	BRNE volta
	DEC r21
	BRNE volta
	DEC r19
	BRNE volta
	RET
