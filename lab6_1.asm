calcAvgs	Macro _TROW, _TCLMN, _Matrix, _Vector, _ROW, _CLMN, _S
		Local outer_loop, inner_loop, odd

	push	ax	
	push	bx	
	push	cx	
	push	dx	
	push	di	
	push	si
	push	bp	

	lea	di,	_Vector
	mov	cx,	_TCLMN
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

	pop	bp
	pop	si
	pop	di
	pop	dx
	pop	cx
	pop	bx
	pop	ax

	pop	bp

	EndM