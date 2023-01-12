; The main loop or body of our typewriter program:

.org 00h
    ljmp start; power up and reset vector

.org 100h
start:
    lcall init
    mov R1, #41h; Initialize counter for 65 characters
    loop:
        lcall getchr
        lcall sndchr
        mov P1, a; Read letter output to the 
        DJNZ R1, loop; decrement R1, if 0, run crlf sub-function 
        lcall crlf
        sjmp loop

init:
    mov tmod, #20h
    mov tcon, #41h
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
    mov sbuf, a; 
    txloop:
        jnb scon.1, txloop
    ret

crlf:
    mov A, #0Dh; Carriage Return #13d, #0Dh
    lcall sndchr 
    mov A, #0Ah; Linefeed #10d,#0Ah 
    lcall sndchr
    mov R0, #41h; Reset the Counter to 3
    ret; return to DJNZ call

