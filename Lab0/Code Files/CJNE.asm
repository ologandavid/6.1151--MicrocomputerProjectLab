mov R1, #10h;
main:
	CJNE R0, #01h, s1;
	CJNE R0, #02h, s2;
	CJNE R0, #03h, s3;
	CJNE R0, #04h, s4;
	sjmp main;

s1:
	mov P1, #0AAh;

s2:
	mov P1, #0B0h;
s3:
	loop:	
	CLR P0.7; DAC Turn On
	mov P1, #80h;	
	DJNZ R1, loop
	SETB P0.7;
s4:
	loop1:	
	CLR P0.7; DAC Turn On
	mov P1, #0CCh;	
	DJNZ R1, loop1
	SETB P0.7;

