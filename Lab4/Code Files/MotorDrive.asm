.org 0000h

main:
    mov R0, #00h
    mov R1, #0FFh
    mov R2, #00h
    mov R3, #055h
    lcall init
    lcall getkey2
    lcall getkey
    sjmp main

init:
    mov dptr, #0FE33h       ; Initialize the 8255 for 8 bit
    mov a, #80h             ; Read 80h into the acc
    movx @dptr, a           ; Move 80h into location of 8255
    ret

forward:
    mov R6, a
    mov dptr, #0FE30h       ; Logic Level High
    mov a, #03h             
    movx @dptr, a
    lcall delay1
    mov dptr, #0FE30h       ; Logic Level Low
    mov a, #00h             
    movx @dptr, a
    lcall delay2
    mov a, R6
    ret

right:
    mov R6, a
    mov dptr, #0FE30h       ; Logic Level High
    mov a, #01h             
    movx @dptr, a
    lcall delay1
    mov dptr, #0FE30h       ; Logic Level Low
    mov a, #00h             
    movx @dptr, a
    lcall delay2
    mov a, R6
    ret

left:
    mov R6, a
    mov dptr, #0FE30h       ; Logic Level High
    mov a, #02h             
    movx @dptr, a
    lcall delay1
    mov dptr, #0FE30h       ; Logic Level Low
    mov a, #00h             
    movx @dptr, a
    lcall delay2
    mov a, R6
    ret

stops:
    mov dptr, #0FE30h       ; Logic Level High
    mov a, #00h             
    movx @dptr, a
    ret

delay1:                 ; Comparing with R0(high), R1(low)
    mov R4, 0       ; high byte
    mov R5, 1       ; low byte
    start:
    CJNE R5, #00h, notsame0
    CJNE R4, #00h, notsame1 
    ret
    notsame0:
        dec R5
        sjmp start
    notsame1:
        dec R4
        mov R5, #0FFh
        sjmp start


delay2:
    mov R4, 2       ; high byte
    mov R5, 3       ; low byte
    start2:
    CJNE R5, #00h, notsame2
    CJNE R4, #00h, notsame3
    ret
    
    notsame2:
        dec R5
        sjmp start2
    notsame3:
        dec R4
        mov R5, #0FFh
        sjmp start2

getkey:
    jnb P3.3, getkey        ; Jump if bit not set, wait for key press
    mov P1, #0FFh           ; Set Port 1 high to be read
    mov a, P1           ; Reading to Port 1
    clr C               
    SUBB A, #0F0h       ; Make first nibble 0s
    pressdone:
        lcall choice              
        jb P3.3, pressdone  ; If press detected, wait for it to end
        lcall stops
        ret

getkey2:
    jnb P3.3, getkey2        ; Jump if bit not set, wait for key press
    mov P1, #0FFh           ; Set Port 1 high to be read
    mov a, P1           ; Reading to Port 1
    clr C               
    SUBB A, #0F0h       ; Make first nibble 0s
    pressdone2:            
        jb P3.3, pressdone2  ; If press detected, wait for it to end
        lcall choice2
        ret

choice:
    straight:
        CJNE A, #0Fh, turnr
        lcall forward
        sjmp finished
    turnr:
        CJNE A, #0Eh, turnl
        lcall right
        sjmp finished
    turnl:
        CJNE A, #0Dh, D50
        lcall left
        sjmp finished
    finished:
        ret

choice2:
    D50:
        CJNE A, #0Bh, D75
        mov R0, #00h
        mov R1, #0FFh
        mov R2, #00h
        mov R3, #0FFh
    D75:
        CJNE A, #0Ah, D1
        mov R0, #00h
        mov R1, #0FFh
        mov R2, #00h
        mov R3, #055h
    D1:
        CJNE A, #09h, finished2
        mov R0, #0FFh
        mov R1, #00h
        mov R2, #00h
        mov R3, #01h
    finished2:
        ret





