Comment &
   Kirils Savinihs 161VDB005 20. variants
   f(X, Y) = (X^3Z-Y-1)/(-XY^2-Z+1)
&

.model tiny
.code
.startup
           Org 100h
           Jmp Short _Start  
X          Db   2
Y          Db   3
Z          Db	-1
ZerDiv     Dw   0

_Start:
		Mov  Al, X   ; Al = 2
		Imul Al      ; Ax = Al*Al = 2*2 = 4
		Mov  Bx, Ax  ; Bx = Ax = 4
		Mov  Al, X   ; Al = X = 2
		Cbw          ; Ax = (Word) Al; Ah=00 vai FF 
		Imul Bx      ; Dx:Ax = Ax*Bx = 8
		Mov  Bx, Ax	 ; Bx = Ax = 8
		Mov  Al, Z	 ; Al = -1
		Cbw			 ; Ax = (Word) Al
		Imul Bx		 ; Dx:Ax = Ax*Bx = -8 
		Mov  Bx, Ax  ; Bx = Ax = -8
		Mov  Al, Y	 ; Al = 3
		Cbw			 ; Ax = (Word) Al
		Sub  Bx, Ax  ; Bx = Bx - Ax = -8 - 3 = -11
		Dec  Bx		 ; Bx-- == -12
		Mov  Ax, Bx	 ; Ax = Bx = -12
		Je _Exit     ; if == 0 jmp to _Exit
		Mov  Cx, Ax  ; Cx = (X^3Z-Y-1)
		
		
		Mov  Al, Y   ; Al = 3
		Imul Al      ; Ax = Al*Al = 3*3=9
		Mov  Bx, Ax	 ; Bx = Ax = 9
		Mov  Al, X   ; Al = 2
		Cbw          ; Ax = (Word) Al
		Neg  Ax      ; Ax = -Ax = -2
		Imul Bx      ; Dx:Ax = Ax*Bx = -2*9 = -18
		Mov  Bx, Ax  ; Bx = Ax = -18
		Mov  Al, Z   ; Al = -1
		Cbw          ; Ax = (Word) Al = -1
		Sub  Bx, Ax  ; Bx = Bx - Ax = -18 -- 1 = -17
		Inc  Bx      ;Bx = (-XY^2-Z+1) = -17 + 1 = -16
		Mov  Ax, Bx  ; Ax = Bx = -16
		
		Jne _Div     ; if != 0 jmp _Div
		Mov ZerDiv, 1; ZerDiv = 1
		Jmp Short _Exit
		
_Div:
		   Mov Bx, Ax    ; Bx = Ax = -16
           Mov Ax, Cx    ; Ax = Cx = -12                       
           IDiv Bx       ; Ax = 0 ; Dx = -12 
_Exit:

.exit 0
end
