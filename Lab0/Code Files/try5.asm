main:
	mov P1, #0FFh; initialize P1 at max, FFh
	mov R0, #62h; use register to store a reasonable delay, 62 since the delay step takes another turn
	loop:
		dec P1; decrement P1 by 1
		DJNZ R0, loop; implement the delay
	sjmp loop; return to loop, repeat decrement step
	
