
main:
    mov dptr, #0FE33h
    mov a, #80h
    movx @dptr, a
    lcall delay

    ; Set display for 8 bit communication
    mov dptr, #0FE32h
    mov a, #00h
    movx @dptr, a
    lcall delay

    mov dptr, #0FE31h
    mov a, #38h
    movx @dptr, a
    lcall delay

    mov dptr, #0FE32h
    mov a, #04h
    movx @dptr, a
    lcall delay

    mov dptr, #0FE32h
    mov a, #00h
    movx @dptr, a
    lcall delay

    ; Turn display on, hide cursor
    mov dptr, #0FE31h
    mov a, #0Ch
    movx @dptr, a
    lcall delay

    mov dptr, #0FE32h
    mov a, #04h
    movx @dptr, a
    lcall delay

    mov dptr, #0FE32h
    mov a, #00h
    movx @dptr, a
    lcall delay

    ; Clear display
    mov dptr, #0FE31h
    mov a, #01h
    movx @dptr, a
    lcall delay
    
    mov dptr, #0FE32h
    mov a, #04h
    movx @dptr, a
    lcall delay

    mov dptr, #0FE32h
    mov a, #00h
    movx @dptr, a
    lcall delay

    ; Set RAM address to zero
    mov dptr, #0FE32h
    mov a, #00h
    movx @dptr, a
    lcall delay

    mov dptr, #0FE31h
    mov a, #80h
    movx @dptr, a
    lcall delay

    mov dptr, #0FE32h
    mov a, #04h
    movx @dptr, a
    lcall delay

    mov dptr, #0FE32h
    mov a, #00h
    movx @dptr, a
    lcall delay

    ;Display Characters
    mov dptr, #0FE32h
    mov a, #01h
    movx @dptr, a
    lcall delay
    
    mov dptr, #0FE31h
    mov a, #39h
    movx @dptr, a
    lcall delay

    mov dptr, #0FE32h
    mov a, #05h
    movx @dptr, a
    lcall delay

    mov dptr, #0FE32h
    mov a, #01h
    movx @dptr, a
    lcall delay

    loop:
    sjmp loop

delay:
    mov R0, #0FFh
    sups:
    DJNZ R0, sups
    mov R1, #0FFh
    sups2:
    DJNZ R1, sups2
    ret

