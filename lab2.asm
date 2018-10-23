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
.stack 100
.data
ZerDiv     Dw  0
.const
X          Db  -2
Y          Db  -1
Z          Db  2
Zero       Equ 0
.code
.startup
.386
_Start:
           Mov   Al, Y
           Imul  Al
           MovSx Bx, Y
           Imul  Bx, Ax  ;Bx = Y^3
           
           MovSx Ax, X
           Neg   Ax      ;Ax = -X
           

           Jne   Not_Zero

           Mov   Dx, Zero
           Jmp   Short _Exit

Not_Zero:
           Jl  Branch_C

           Mov   Al, X
           Imul  Y
           Neg   Ax 
           Sub   Ax, 4

           Jmp   Short Rezult

Branch_C:  MovSx Ax, Y          ;386
           Imul  Ax, Ax, 2	;386
           Inc   Ax
Rezult:
           Cmp   Ax, Zero
           Jne   _Div

           Mov   ZerDiv, 1 
           Jmp   Short _Exit

_Div:
           Xchg  Ax, Bx         ;       Ax = FFF7 (-9), Bx = FFFF (-1)
           MovSx EBx, Bx      	;386   EBx = FFFF FFFF
           Cwde			;386   EAx = FFFF FFF7
           Cdq 			;386   EDx = FFFF FFFF
           IDiv EBx		;386   EAx = 0000 0009, EDx = 0000 0000 
_Exit:

.exit 0
end