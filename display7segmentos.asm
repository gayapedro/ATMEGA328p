; display7segmentos.asm
; Autor: Pedro Gaya (pedrogaya@gmail.com)
; github: gayapedro

.include "./m328Pdef.inc"
.equ BOTAO = PD2
.equ DISPLAY = PortB
.def AUX = r16
.ORG 0x0000
RJMP main

main:
	LDI AUX,0x00
	OUT DDRD,AUX
    LDI AUX,0xFF
	OUT PortD,AUX
	OUT DDRB,AUX
	OUT PortB,AUX

loop:
	SBIS PinB,BOTAO
	RJMP loop
	CPI AUX,0x0F
	BRNE incr
	LDI AUX,0x00
	RJMP decod

incr:
	INC AUX

decod:
	RCALL decodifica
	RCALL atraso
	RJMP loop

atraso:
	LDI r19, 16

volta:
	DEC r17
	BRNE volta
	DEC r18
	BRNE volta
	DEC r19
	BRNE volta
	RET

decodifica:
	LDI ZH,HIGH(Tabela<<1)
	LDI ZL,LOW(Tabela<<1)
	ADD ZL,AUX
	BRCC le_tab
	INC ZH

le_tab:
	LPM R0,Z
	OUT DISPLAY,R0
	RET

Tabela: .dw 0x063F, 0x4F5B, 0x6D66, 0x077D, 0x6F7F, 0x7C77, 0x5E39, 0x7179