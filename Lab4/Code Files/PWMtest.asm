main:
    lcall init
    main2:
    mov R0, #00h
    mov R1, #0FFh
    mov R2, #00h
    mov R3, #055h
    lcall forward
    sjmp main2


init:
    mov dptr, #0FE33h       ; Initialize the 8255 for 8 bit
    mov a, #80h             ; Read 80h into the acc
    movx @dptr, a           ; Move 80h into location of 8255
    ret

forward:
    mov dptr, #0FE30h       ; Logic Level High
    mov a, #03h             
    movx @dptr, a
    lcall delay1
    mov dptr, #0FE30h       ; Logic Level High
    mov a, #00h             
    movx @dptr, a
    lcall delay2
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

