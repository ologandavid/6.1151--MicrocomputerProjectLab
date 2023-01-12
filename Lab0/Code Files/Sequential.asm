main:
	SETB P3.3; Bring Pin 3.3 High, Select First Display
	mov P1, #0C0h; Display 0
	mov P1, #0FFh; Clear Display
	CLR P3.3; Bring Pin 3.3 Low, Select Second Display
	mov P1, #0F9h; Display 1
	mov P1, #0FFh; Clear Display
	SETB P3.3; Reset State of 3.3

	CLR P3.4; Bring Pin 3.4 Low,3.3 High, Select Third Display
	mov P1, #0A4h; Display 2
	mov P1, #0FFh; Clear Display
	CLR P3.3; bring Pin 3.3 Low, Choose Display 4
	mov P1, #0B0h; Display 3
	mov P1, #0FFh; Clear Display
	SETB P3.4;
	SETB P3.3; Reset initial states of Pins
	sjmp main
	
