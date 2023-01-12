.org 00h 
ljmp main

main:
    lcall init
    loop:
        lcall getkey        ; Get a Button Press, R0 used to hold the original value
        mov R1, #04h

        SUBB A, R1
        ;JZ Cef
        mov R1, #04h
        SUBB A, R1
        JZ Bef
        mov R1, #04h
        SUBB A, R1
        JZ Aef
        ADD A, #0Ch ; reset if it fails all the tests
        norm:
            lcall fix           ; Obtain the freq hex code in acc from database
            lcall num
            sjmp loop
        endloop:
            sjmp loop
Aef:                    ; Ramps the Light from Level 9 to Level 0 over 10 seconds
    ADD A, #0Ch
    mov R0, A
    lcall fix           ; Retrieve High Frequency from Level 9

    mov dptr, #0FE00h   ; Initialize the lights to high
    movx @dptr, A       ; Move in the low byte to #FE00h
    mov R1, A
    mov dptr, #0FE00h
    mov a, #01h
    movx @dptr, A       ; Move in the high byte to #FE00h

    counterinit:

    mov R5, #05h
    mov A, R5
    counter:
        mov R2, #0FFh
        mov R3, #0FFh
        mov R4, #0FFh
        jz here 
        lvl1:
        DJNZ R2, lvl1
            lvl2:
            DJNZ R2, lvl2
                lvl3:
                    DJNZ R3, lvl3
                    dec A
            sjmp counter

    here:
        mov A, R1               ; Move Low byte into acc
        SUBB A, #05h
        jz exit
        mov dptr, #0FE00h   ; Initialize the lights to high
        movx @dptr, A       ; Move in the low byte to #FE00h
        mov dptr, #0FE00h
        mov a, #01h
        movx @dptr, A
        sjmp counterinit

    exit:
        mov A, R0
        sjmp endloop


Bef:                    ; Ramps the Light from Level 0 to Level 9 over 10 seconds
    ADD A, #08h
    mov R0, A
    lcall fix           ; Retrieve High Frequency from Level 9

    mov dptr, #0FE00h   ; Initialize the lights to high
    movx @dptr, A       ; Move in the low byte to #FE00h
    mov R1, A
    mov dptr, #0FE00h
    mov a, #01h
    movx @dptr, A       ; Move in the high byte to #FE00h

    counterinit2:

    mov R5, #0FFh
    mov A, R5
    counter2:
        mov R2, #0FFh
        mov R3, #0FFh
        mov R4, #0FFh
        jz here2 
        lvl12:
        DJNZ R2, lvl12
            lvl22:
            DJNZ R2, lvl22
                lvl32:
                    DJNZ R3, lvl32
                    dec A
            sjmp counter2
    here2:
        mov A, R1               ; Move Low byte into acc
        ADD A, #05h
        jz exit
        mov dptr, #0FE00h   ; Initialize the lights to high
        movx @dptr, A       ; Move in the low byte to #FE00h
        mov R1, A
        mov dptr, #0FE00h
        mov a, #01h
        movx @dptr, A
 
        sjmp counterinit2

    exit2:
        mov A, R0
        ret
Cef:
    ADD A, #04h
    mov R0, a
    mov a, R0
    ret

init:
    mov dptr, #0FE03h
    mov A, #36h
    movx @dptr, A     ; Update Control Byte with 36
    mov TMOD, #02h  ; Set Mode
    mov TH0, R0     ; Set Count
    setb TR0
    mov IE, #82h 

getkey:
    jnb P3.3, getkey        ; Jump if bit not set, wait for key press
    mov P1, #0FFh           ; Set Port 1 high to be read
    pressdone:              
        jb P3.3, pressdone  ; If press detected, wait for it to end
        mov a, P1           ; Reading to Port 1
        clr C             
        SUBB A, #0F0h       ; Make first nibble 0s
        mov P1, a; Writing to Port 1
        ;clr P1
        ret

fix:
    inc a                   ; increment acc
    movc a, @a+pc           ; get correct ASCII translation from data table
    ret
    .db 00h, 00h, 09h, 00h, 00h, 45h, 39h, 36h, 00h, 30h, 27h, 20h, 45h, 1Ch, 15h, 11h      ; datatable with correct ASCII codes

num:
    mov dptr, #0FE00h
    movx @dptr, A       ; Move in the low byte to #FE00h
    mov dptr, #0FE00h
    mov a, #01h
    movx @dptr, A       ; Move in the high byte to #FE00h
