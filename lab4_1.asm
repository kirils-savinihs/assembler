;13.var atrast videjo aritmetisko visiem para (pec vertibas) elementiem katra matricas stabina

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
	lea	di,	Vector
	mov	cx,	TCLMN
	xor	bx,	bx
	xor	si,	si
	xor	bp,	bp

outer_loop:
	push	cx				;Save what iteration outer loop is at
	xor	ax,	ax			;Clear Ax (Used for sum)
	xor	bx,	bx			;Clear Bx (Counts rows)
	mov	cx,	TROW			;Set number of iterations for inner loop
	xor	bp,	bp
inner_loop:
	mov	dx,	Matrix[bx][si]
	test	dx,	1
	jnz	odd				;If odd then skip
	add	ax,	dx
	inc	bp
odd:
	add	bx,	ROW			;Increment Bx
	loop	inner_loop
	
	mov	bx,	bp
	idiv	bl				;Divide Ax by Bl
	mov	[di],	al			;Result is stored in Al, remainder in Dl
	inc	di
	add	si,	CLMN
	pop	cx
	loop	outer_loop


	xor	bx,	bx
	xor	ax,	ax
	mov	cx,	TCLMN
	lea	di,	Vector
print:
	mov	al,	[di+bx]
	inc	bx
	loop	print



.exit 0
end