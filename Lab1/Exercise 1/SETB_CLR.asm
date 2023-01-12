main:
CLR A;
SETB ACC.0;
mov P1, A	; Set Value of P1.0
loop:
	sjmp loop
	
