main:
	mov R0, #10h; Set Time Delay for High
	mov R1, #10h; Set Time Delay for Low
	loop:	
	CLR P0.7; DAC Turn On
	mov P1, #0E6h;	Set to 4.5 V
	DJNZ R0, loop; Iterate for Delay Time
	loop2:
	mov P1, #1Ah; Set to 0.5
	DJNZ R1, loop2; Iterate for same Delay Time
	SETB P0.7; Reset WR pin
	sjmp main

