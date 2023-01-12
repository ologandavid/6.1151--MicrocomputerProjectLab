.org 8000h
main:
    mov dptr, #9001h
    movx A, @dptr   ; Move the value at 9001h into acc
    mov R0, A       ; R0, high byte counter
    mov dpl, #00h   ; Preset dph and dpl to 9000h
    movx A, @dptr   ; A, low byte counter
    loop:
    jz carry        ; jump if acc is 0
    return:
    dec A           ; Decrement low byte and continue on
    sjmp loop       ; restart

carry:
    CJNE R0, #00h, here     ; Checks if R0 is 0, if not go to here
    CJNE A, #00h, loop      ; Checks if high byte and low byte are 0, i.e count ends
    cpl P1.0                ; Complement P1.0
    sjmp main               ; Return to beginning to reset counters
    here:
    dec R0                  ; Decrement high byte
    sjmp return             ; return to main loop


