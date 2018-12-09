include lab6_1.asm
include lab6_2.asm

.model tiny
.code
.startup
        Org     100h
        Jmp Short Start
TROW		Equ 	2
TCLMN 		Equ	3

CLMN		Equ	2
ROW		Equ	6

Matrix		DW	8, 2, 4   
		DW	4, 4, 10   
Vector	DB	TCLMN Dup (?)
S	Equ	Type Matrix

Start:
	calcAvgs	TROW, TCLMN, Matrix, Vector, ROW, CLMN, S
	print		TCLMN,	Vector

.exit 0
end