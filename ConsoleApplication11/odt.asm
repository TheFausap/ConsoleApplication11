;
; ODT SIMPLE
;
	ORG	10H
	CALL	OUTR
	RET
;
	ORG	100H
STATUS	EQU	0
DATA	EQU	1
IMASK	EQU	1
OMASK	EQU	80H
;
; JUMP TABLE
;
OUTR	JMP	CO
INP	JMP	CI
;
;
STAT	IN	STATUS
	RET
CI	PUSH	PSW
CI0	IN	STATUS
	ANI	IMASK
	JNZ	CI0
	POP	PSW
	IN	DATA
	OUT	DATA
	ORI	80H
	RET
CO	PUSH	PSW
CO0	IN	STATUS
	ANI	OMASK
	JNZ	CO0
	POP	PSW
	ANI	7FH
	OUT	DATA
	RET
;
; END
