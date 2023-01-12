mov R1, #10h; Set Initial Delay for DAC
main:
	s1:
	CJNE R0, #01h, s2; Check if Register R0 has a 1, if not progress to 2
	mov P1, #0AAh; If so, update P1 with AAh
	s2:
	CJNE R0, #02h, s3; Check if Register R0 has a 2, if not, progress to 3
	mov P1, #0B0h; If so update P1 to display a 3
	s3:
	CJNE R0, #03h, s4; Check if Register R0 has a 3, if not progress to 4
	loop:	
		CLR P0.7; DAC Turn On
		mov P1, #80h; Set DAC to 2.5 V
		DJNZ R1, loop
		SETB P0.7; Reset DAC
	s4:
	CJNE R0, #04h, s1; Check is Register R0 has a 4, if not cycle back through
	loop1:	
		CLR P0.7; DAC Turn On
		mov P1, #0CCh; Set DAC to 4V	
		DJNZ R1, loop1
		SETB P0.7; Reset DAC
	sjmp main;
