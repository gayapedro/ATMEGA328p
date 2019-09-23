.ORG 0x0000
RJMP main

main:
    LDI r16,0xFF
	OUT DDRB,r16
	LDI r20,0b000000
	OUT PortB, r20

loop:
	INC r20
	OUT PortB, r20
	RCALL atraso
	RJMP loop

atraso:
	LDI r19, 16 //aprox 200ms

volta:
	DEC r17
	BRNE volta
	DEC r18
	BRNE volta
	DEC r19
	BRNE volta
	RET