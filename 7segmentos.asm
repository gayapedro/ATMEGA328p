.include "/usr/share/avra/m328Pdef.inc"
.ORG 0x0000
RJMP main

main:
	LDI r16,0xFF
	OUT DDRD,r16
    LDI r16,0x00
    OUT PortD,r16

loop:
	LDI r25,Tabela+1
	OUT PortD,r25
	RCALL atraso
	RJMP loop

atraso:
	LDI r19, 64

volta:
	DEC r17
	BRNE volta
	DEC r18
	BRNE volta
	DEC r19
	BRNE volta
	RET

Tabela:
    .db 0b00000001, 0b00000010