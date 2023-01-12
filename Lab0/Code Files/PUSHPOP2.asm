mov R0, #0E6h; Load High 4.5 in Register 0
mov R1, #1Ah; Load Low 4.5 in Register 1
mov R2, #2h; Duty Cycle can be controlled by varying relation between R2 and R3
mov R3, #2h; Period
PUSH 0; Add to Stack
PUSH 1; Add to Stack
main:
	POP 0;Take from Stack
	POP 1;Take from Stack
	PUSH 0; Readd to Stack or else this will fail after 1 cycle
	PUSH 1;Readd to Stack or else this will fail after 1 cycle

	mov A, 0; Give accumulator value in Register 0
	LCALL dacme; Call Dacme
	loop:
		DJNZ R2, loop; Show Value for Sepcified Duty Cycle
	mov A, 1; Give accumulator value in Register 1
	LCALL dacme; Call Dacme
	loop2:
		DJNZ R3, loop2; Show Value for Sepcified Duty Cycle
	sjmp main; Reset

dacme:
	CLR P0.7; Activate DAC
	mov P1, A; Move value of accumulator into Pin 1
	ret; Return to main
	