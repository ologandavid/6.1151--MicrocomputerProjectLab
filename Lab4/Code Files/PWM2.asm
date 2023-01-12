main:
    mov dptr, #0FE33h       ; Initialize the 8255 for 8 bit
    mov a, #80h
    movx @dptr, a
    loop:
        mov dptr, #0FE30h       ; Logic Level Low
        mov a, #00h     
        movx @dptr, a
        lcall delay             ; Call Delay Function
        mov dptr, #0FE30h       ; Logic Level High
        mov a, #01h             
        movx @dptr, a
        lcall delay             ; Call Delay Function
        sjmp loop               ; Repeat


delay:
    mov R0, #0FFh               ; Set Registers with Counters
    mov R1, #028h               
    sups:
        DJNZ R1, sups           ; Single Delay tuned to desired low frequency
    ret                         ; return to lcall
