;13 var

Comment &
   Kirils Savinihs 161VDB005 13. variants
   FUNKCIJA f(X, Y):
   (-XY^3+2Z)/(2XY-Z^2+1),  ja (-XY^3+2Z) > 0
   (-XY^3+2Z)/(XYZ^2+2),  ja (-XY^3+2Z) < 0
&
;Use MovSx - moves a byte into a word saving the sign (move with sign extension)
;Use MovZx - moves a byte into a word putting zeroes before it (move with zero extension)


dosseg
.model small
.stack	100
.data
ZerDiv	Dw	0
.const
X	Db	-4
Y	Db	-3
Z	Db	8
Zero	Equ	0
.code
.startup
.386
_Start:
		mov	al,	Y
		imul	al
		movsx	bx,	Y
		imul	bx,	ax	;Bx = Y^3

		movsx	ax,	X
		neg	ax		;Ax = -X

		imul	ax,	bx	;Ax = -XY^3
		mov	cx,	ax	;move to preserve value

		mov	al,	Z
		add	al,	Z	;Ax = 2Z
		cbw

		add	ax,	cx	;Ax = -XY^3+2Z seems correct
		jne	Not_Zero

		mov	dx,	Zero
		jmp	Short _Exit

Not_Zero:
		jl	LessThanZero ; <- if less than 0

	;if more than than 0:
		movsx	ax,	X
		add	ax,	ax	
		movsx	bx,	Y	
		imul	ax,	bx	;Ax = 2XY


		movsx	bx,	Z
		imul	bx,	bx
		inc	bx		;bx = Z^2+1

		sub	ax,	bx	;ax = (2XY-Z^2+1)

		jmp	Short Result

LessThanZero:
		movsx 	ax,	X
		movsx	bx,	Y
		imul	ax,	bx	;ax = XY

		movsx	bx,	Z
		imul	bx,	bx	; bx = z^2

		imul	ax, bx	; ax = XYZ^2
		add	ax, 2	; ax = XYZ^2+2

		jmp 	Short Result



Result:
		cmp	Ax,	Zero
		jne	_Div

		mov	ZerDiv,	1
		jmp	Short	_Exit

_Div:
		xchg	ax,	cx
		movsx	ecx,	cx
		cwde
		cdq
		idiv	ecx
_Exit:

.exit 0
end