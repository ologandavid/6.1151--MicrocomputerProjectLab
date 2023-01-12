.org 8000h

main:
    mov dph, #90h
    mov dpl, #00h   ; Preset dph and dpl to 9000h
    movx A, @dptr   ; Move the value at 9000h into acc
    mov R0, A       ; Move acc into R0
    loop: 
    DJNZ R0, loop   ; Decrement Loop until R0=0
    cpl P1.0        ; Complement when Count over and restart
    sjmp main

