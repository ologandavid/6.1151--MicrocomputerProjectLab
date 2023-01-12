.org 00h
ljmp main

.org 00Bh   

T0ISR:
    cpl P1.0        ; Interrupt Service Routine, Complement P1.0
    reti            ; reti to return to main loop

.org 0030h

main:
    mov dph, #10h
    mov dpl, #00h   ; Preset dph and dpl to 9000h
    movx A, @dptr   ; Move the value at 9000h into acc
    mov R0, A       ; Move value from acc into register

    mov TMOD, #02h  ; Set Mode
    mov TH0, R0     ; Set Count
    setb TR0
    mov IE, #82h
    loop:           ; Infinite Loop
        sjmp loop