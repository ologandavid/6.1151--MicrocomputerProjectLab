setpup:
	MOV DPTR, #0FE33h
	MOV A , #80h  ; Activate 8255
	MOVX @DPTR, A 
	lcall delay

	; SET Display for 8 but communication 

	MOV DPTR, #0FE32h 
	MOV A , #00h ; lower the E Line 
	MOVX @DPTR, A 
	lcall delay
	
	MOV DPTR, #0FE31h
	MOV A , #38h
	MOVX @DPTR, A 
	lcall delay

	MOV DPTR, #0FE32h 
	MOV A , #04h ; raise the E Line 
	MOVX @DPTR, A 
	lcall delay
	
	MOV DPTR, #0FE32h 
	MOV A , #00h ; lower the E Line, latching command 
	MOVX @DPTR, A 
	lcall delay

	; Turn Display on, Hide Cursor
	MOV DPTR, #0FE31h 
	MOV A , #0Ch 
	MOVX @DPTR, A 
	lcall delay
	
	MOV DPTR, #0FE32h 
	MOV A , #04h ; raise the E Line 
	MOVX @DPTR, A 
	lcall delay
	
	MOV DPTR, #0FE32h 
	MOV A , #00h ; lower the E Line, latching command
	MOVX @DPTR, A 
	lcall delay
	
	
	
	; Clear display:
	MOV DPTR, #0FE31h 
	MOV A , #01h 
	MOVX @DPTR, A 
	lcall delay
	
	MOV DPTR, #0FE32h 
	MOV A , #04h ; raise the E Line 
	MOVX @DPTR, A 
	lcall delay
	
	MOV DPTR, #0FE32h 
	MOV A , #00h ; lower the E Line, latching command
	MOVX @DPTR, A 
	lcall delay

	;Set RAM address to 0
	
	MOV DPTR, #0FE31h 
	MOV A , #80h 
	MOVX @DPTR, A 
	lcall delay
	
	MOV DPTR, #0FE32h 
	MOV A , #04h ; raise the E Line 
	MOVX @DPTR, A 
	lcall delay
	
	MOV DPTR, #0FE32h
	MOV A , #00h ; lower the E Line 
	MOVX @DPTR, A 
	lcall delay
	

MOV R1, #0h

main: 
	MOV DPTR, #0FE32h 
	MOV A , #01h ; lower the E Line 
	MOVX @DPTR, A 
	lcall delay
	
	MOV DPTR, #message
	MOV A, R1
	movc A , @A + DPTR 
	CJNE A, #0FCh, display 
	loop: sjmp loop 
	
display:
MOV DPTR, #0FE31h ; location to send to to DPTR
MOVX @DPTR, A 
lcall delay

MOV DPTR, #0FE32h 
MOV A , #05h ; raise the E Line 
MOVX @DPTR, A 
lcall delay

MOV DPTR, #0FE32h 
MOV A , #01h ; lower the E Line, latching command
MOVX @DPTR, A 
lcall delay
inc R1

sjmp main 
	

delay: 
MOV R0, #0FEh
delayloop: djnz R0, delayloop
ret

.org 150h

message:
		
	.db 36h, 2Eh, 31h, 31h, 35h,3Dh, 53h, 41h, 44h , 0FCh
	
	
	
	
	
	
	
	
	