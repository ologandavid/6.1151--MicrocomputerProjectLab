; Calculator program

.org 00h
    ljmp start ; power up and reset vector

.org 100h

start:
    lcall init
    mov R1, #03h ;Initialize counter for 3 characters
    mov R2, #02h; Initialize counter for both numbers
    mov R3, #01h; Initialize counter for operation
    loop:
        lcall getchr
        lcall sndchr
        mov P1, a; Read letter output to the LED
        push a
        lcall cnvrt; converts to hex, pushes to stack
        DJNZ R1, loop; decrement R1, if not 0 go to loop
        lcall crlf
        DJNZ R2, loop; decrement R2, if not 0 go to loop
        lcall two
        sjmp loop

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

crlf: 
    mov sbuf, #0Ah; Linefeed #10d,#0Ah 
    mov sbuf, #0Dh; Carriage Return #13d, #0Dh 
    mov R1, #03h; Reset the Counter to 3
    ret; return to DJNZ call

cnvrt:
    pop R4
    pop R5

    pop R6
    clr A
    mov A, #0d0h
    ADD A, R6
    push a
    clr R6

    push R5
    push R4
    ret
    ;convert input into binary, push to stack


two:
;The stack has 6 hex numbers that need to be converted into 2 bytes for the stack
    pop R4
    pop R5
    pop R6; ones place
    pop R7; tens place
    pop R8; hundreds place

    mov A, #64h
    mov R8, B
    MUL A,B 
    mov A, R8
    mov A, #64h
    mov R8, B
    MUL A,B 
    mov A, R8


    push R5
    push R4

sub:
    SUBB A, R1
    ret

add:
    pop R6; low byte return address
    pop R7; high byte return address

    pop R1
    pop acc

    ADD A, R1
    push acc

    push R7
    push R6
    ret;

reset: ;Reset Counters, clr Registers
