; The main loop or body of our typewriter program:

.org 00h        ; power up and reset vector
    ljmp start  ; when the micro wakes up, jump to the beginning of 
                ; the main body or loop in the program, called "start"
.org 100h       ; and located at the address location 110h in external mem
start:          
    lcall init
    mov R0, #41h; Initialize counter for 65 characters  
    loop:
        lcall getchr
        lcall sndchr
        mov P1, a       ; Read letter output to the 
        DJNZ R0, loop   ; decrement R1, if 0, run crlf sub-function 
        lcall crlf      ;carriage return, new line, reset counter
        sjmp loop
                        ; set up serial port with 11.0592 Mhz crystal.
init:                   ; user timer 1 for 9600 baud serial communication
    mov tmod, #20h      ; set timer 1 for auto reload mode 2
    mov tcon, #41h      ; run timer 1
    mov th1, #0fdh      ; set 9600 baud with xtal = 11.059 mhz
    mov scon, #50h      ; set seiral control reg for 8 bit data
    ret                 ; and mode 1

getchr:
    jnb ri, getchr      ; wait till character recieved
    mov a, sbuf         ; get character and put in the accumulator
    anl a, #7fh         ; mask off 8th bit
    clr ri              ; clear serial "recieve status" flag
    ret

sndchr:
    clr scon.1          ; clear the ti complete flag
    mov sbuf, a;        ; move a chracter from acc to sbuf
    txloop:
        jnb scon.1, txloop  ; wait till chr is sent
    ret

crlf:
    mov A, #0Dh; Carriage Return #13d, #0Dh
    lcall sndchr 
    mov A, #0Ah; Linefeed #10d,#0Ah 
    lcall sndchr
    mov R0, #41h; Reset the Counter to 3
    ret; return to DJNZ call



