main:
	mov P1, #11h
	mov P1, #22h
	loop:
		mov P1, #55h
		sjmp loop
	