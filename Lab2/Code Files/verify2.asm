.org 00h
    ljmp start ; power up and reset vector

.org 100h

start:
    lcall init ; intialize serial port
    loop:
        lcall getkey    ; call getkey, grabs a keypress from the keypad
        lcall fix       ; converts the random nibble into an ascii code
        lcall sndkey    ; sends the ascii character to the PC
    sjmp loop

init:
    mov tmod, #20h
    mov tcon, #41h
    mov th1, #0fdh
    mov scon, #50h
    ret

getkey:
    jnb P3.3, getkey            ; jump if bit not set, wait for the button press
    mov P1, #0FFh               ; Set Port 1 high to be read
    pressdone:
        jb P3.3, pressdone      ; When the press ends, keep going otherwise wait for it to end
        mov a, P1               ; Reading to Port 1
        clr C                   ; Clear the carryflag
        SUBB A, #0F0h           ; Subtract the factor to get a number
        mov P1, a               ; Writing to Port 1, to see output
        ret

sndkey:
    clr scon.1
    mov sbuf, a                 ; Move contents of the accummulator into sbuf
    txloop:
        jnb scon.1, txloop
    ret

fix:
    inc a                       ; increment accumulator
    movc a, @a+pc               ; grab value from data table, replace it with the correct code
    ret
    .db 00h, 00h, 30h, 00h, 00h, 39h, 38h, 37h, 00h, 36h, 35h, 34h, 00h, 33h, 32h, 31h ; Datatable with conversion to ascii characters

