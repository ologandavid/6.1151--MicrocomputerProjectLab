; This little program turns an LED on. 

mov P1, #00h	; Clear the LED Bank
mov P1, #80h	; Turn on a Single Light
loop:
	sjmp loop
	
