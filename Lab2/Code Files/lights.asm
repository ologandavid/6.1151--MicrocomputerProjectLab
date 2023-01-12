.org 8000

main:
    mov dptr, #0FE03h
    mov A, #36h
    movx @dptr, A     ; Update Control Byte with 36 
    loop:
        lcall getkey        ; Get a Button Press
        lcall fix           ; Obtain the freq hex code in acc from database
        mov dptr, #0FE00h
        movx @dptr, A       ; Move in the low byte to #FE00h
        mov a, #01h
        movx @dptr, A       ; Move in the high byte to #FE00h
        sjmp loop

getkey:
    jnb P3.3, getkey        ; Jump if bit not set, wait for key press
    mov P1, #0FFh           ; Set Port 1 high to be read
    pressdone:              
        jb P3.3, pressdone  ; If press detected, wait for it to end
        mov a, P1           ; Reading to Port 1
        clr C             
        SUBB A, #0F0h       ; Make first nibble 0s
        ;mov P1, a; Writing to Port 1
        ;clr P1
        ret


fix:
    inc a                   ; increment acc
    movc a, @a+pc           ; get correct ASCII translation from data table
    ret
    .db 00h, 00h, 09h, 00h, 00h, 45h, 39h, 36h, 00h, 30h, 27h, 20h, 00h, 1Ch, 15h, 11h      ; datatable with correct ASCII codes

