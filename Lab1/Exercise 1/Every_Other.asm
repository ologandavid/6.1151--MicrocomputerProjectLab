main: 

mov P1, #00h	; Clear the LED Bank
mov P1, #55h	; Turn on Every Other Light
loop:
	sjmp loop
	
