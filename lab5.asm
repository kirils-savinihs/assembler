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

calcAvgs	proc
	push	bp		;bp+0 preserve bp
	mov	bp,	sp

	push	ax	
	push	bx	
	push	cx	
	push	dx	
	push	di	
	push	si	

	mov	di,	[bp+10]
	mov	cx,	[bp+4]
	mov	bx,	[bp+8]
	xor	dx,	dx
	xor	si,	si
outer_loop:
	push	cx				;Save what iteration outer loop is at
	xor	ax,	ax
	mov	cx,	[bp+6]			;Set number of iterations for inner loop
	xor	si,	si
inner_loop:
	test	[bx],word ptr	1
	jnz	odd				;If odd then skip
	add	ax,	[bx]
	inc	si
odd:
	add	bx,	ROW			;next row
	loop	inner_loop
	
	mov	bx,	[bp+8]
	add	dx,	CLMN
	add	bx,	dx
	push	dx
	push	bx
	mov	bx,	si
	idiv	bl			;Divide Ax by Bl
	pop	bx
	pop	dx
	mov	[di],	al		;Result is stored in Al, remainder in Dl
	inc	di
	pop	cx
	loop	outer_loop

	pop	si
	pop	di
	pop	dx
	pop	cx
	pop	bx
	pop	ax

	pop	bp
	ret 2*4
calcAvgs	endp

print	proc
	push	bp		;bp+0 preserve bp
	mov	bp,	sp

	push	cx
	push	bx
	push	ax

	mov	cx,	[bp+4]
	mov	bx,	[bp+6]

pr:	
	xor	ax,	ax
	mov	al,	[bx]
	add	bx,	1
	loop	pr

	pop	ax
	pop	bx
	pop	cx

	pop	bp
	ret	2*2
print	endp


Start:
	lea	ax,	Vector ;bp+10
	push	ax
	lea	ax,	Matrix ;bp+8
	push	ax
	mov	ax,	TROW   ;bp+6
	push	ax
	mov	ax,	TCLMN  ;bp+4
	push	ax
	call	calcAvgs       ;bp+2 saves Ip to stack

	lea	ax,	Vector
	push	ax
	mov	ax,	TCLMN
	push	ax
	call	print

.exit 0
end