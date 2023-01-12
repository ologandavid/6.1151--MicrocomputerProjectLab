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
    mov R1, #0FFh               ; REgisters R1, R2 hold the desired repetitions
    mov R2, #07h
    sups:
        DJNZ R0, sups           ; Nested DJNZ to Count out Time
        mov R0, #0FFh           ; Longer Delay, Lower Frequency
        DJNZ R1, sups
        mov R1, #0FFh
        DJNZ R2, sups
    ret
