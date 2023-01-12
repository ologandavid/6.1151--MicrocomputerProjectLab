main:
	mov P1, #0FFh; Intialize Max Value 5V
	loop:
	CLR P0.7; Turn on DAC
	DEC P1; Decrement DAC		
	SETB P0.7; Reset DAC
		
	sjmp loop; Repeat Endlessly
