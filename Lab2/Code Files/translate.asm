main:
mov A, #00h 	; Move 0 into the accumulator
mov 90h, 0E0h	; Copy data from location E0 to P1
setb 92h	; Set 2nd bit at location 90h (Port 1) to 1
sjmp main	; Loop back to beginning
jnc 6Ch		; Code never gets beyond this point, I'm assuming
orl c, 74h	; This is the secret message
mov R1, #20h
xrl A, R7
xrl A, R6
jb 69h, 82h 
jb 36h, 45h
acall 31h
addc A, 21h


 


