main:
    mov dptr, #0FE33h       ; Initialize the 8255 for 8 bit
    mov a, #80h             
    movx @dptr, a
    mov R3, #0Ch            ; Count to 12, since we do 2 moves per cycle, this gets us 24  
    lcall init              ; Setup Serial Commands
    lcall getchr            ; Get and Input Character
    lcall sndchr            ; Display Character in Serial

    loop:
    mov dptr, #0FE30h       ; Initialize in the location
    mov a, #01h             ; 
    movx @dptr, a           ; Start the first coil
    lcall delay             ; Input Delay

    mov dptr, #0FE30h       ; Initialize in the location
    mov a, #04h             ; Switch off to the 2nd coil
    movx @dptr, a
    lcall delay             ; Input Delay

    mov dptr, #0FE30h       ; Initialize in the location
    mov a, #02h             ; Switch off to the first coil
    movx @dptr, a   
    lcall delay             ; Input Delay

    mov dptr, #0FE30h       ; Initialize the 8255 for 8 bit
    mov a, #08h             ; Switch off to the 2nd coil
    movx @dptr, a
    lcall delay             ; Input Delay

    DJNZ R3, loop           ; Repeat until 12 

    loop2:
    sjmp loop2

delay:
    mov R0, #0FFh               ; Set Registers with Counters
    mov R1, #0FFh
    mov R2, #07h
    sups:
        DJNZ R0, sups           ; Nested DJNZ to Count out Time
        mov R0, #0FFh
        DJNZ R1, sups
        mov R1, #0FFh
        DJNZ R2, sups
    ret

init:
    mov tmod, #20h
    mov tcon, #40h
    mov th1, #0fdh
    mov scon, #50h
    ret

getchr:
    jnb ri, getchr
    mov a, sbuf
    anl a, #7fh
    clr ri
    ret

sndchr:
    clr scon.1
    mov sbuf, a; Move contents of the accummulator into sbuf
    txloop:
        jnb scon.1, txloop
    ret

