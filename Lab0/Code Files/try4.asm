main:
	mov P1, #0FFh; initialize P1 at max, FFh
	loop:
		dec P1; decrement P1 by 1
	sjmp loop; return to loop, repeat decrement step
	

