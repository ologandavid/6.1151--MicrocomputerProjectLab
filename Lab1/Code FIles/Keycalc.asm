; Calculator program

.org 00h
    ljmp start          ; Power up and reset vector

.org 100h

start:
    lcall init          ; Run init to start serial
    start2:
    mov R0, #03h        ; Initialize counter for 3 characters
    mov R1, #02h        ; Initialize counter for both numbers
    loop:
        lcall getkey        ; Get Key Press from Keypad
        lcall fix           ; Convert KeyPad Press to ASCII using data table
        ;mov P1, A           
        lcall sndchr
        ;mov P1, a          ; Read letter output to the LED
        lcall cnvrt         ; converts ASCII to hex, pushes to stack
        DJNZ R0, loop       ; decrement R0, if not 0 go to loop, tells you when a number has been completely entered
        lcall crlf          ; If so new line protocol, start with next number
        DJNZ R1, loop       ; decrement R1, if not 0 go to loop, if both numbers have been recieved
        lcall two           ; leave me with two 8 bit numbers on the stack
            lcall getchr
            lcall sndchr    ; wait for operation entry
            CJNE A, #2Bh, subtract;         ; If not Subtraction do addition

            addition:
                pop 03
                pop 04                      ; Pop Off both binary numbers, R4 is the first number, R3 the second
                ;mov P1, R4
                mov A, R3                   ; Move R3 into acc
                ADD A, R4                   ; Add R3, and R4
                ;mov P1, A                  ; Send binary number into the LED
                lcall reverse               ; Convert binary number into ASCII again
                lcall crlf                  ; Get New Line
                mov A, R7                   ; Send ASCII answer in order, hundreds first
                lcall sndchr
                mov A, R6                   ; Then tens place
                lcall sndchr
                mov A, R5                   ; Finally ones place
                lcall sndchr                ; Starting with the 100ths place, send the characters back in order
                sjmp endArithmetic          ; Go to end to restart process
            subtract:
                pop 03
                pop 04                      ; Pop Off both binary numbers, R4 is the first number, R3 is the second
                mov A, R4                   ; Move R4 into acc
                SUBB A,R3                   ; Subtract R3 from R4 which we just put into the accumulator
                ;mov P1, A
                lcall reverse               ; Convert the binary number into ASCII again
                lcall crlf                  ; Get New Line
                mov A, R7                   ; Send ASCII answer in order, hundreds first
                lcall sndchr
                mov A, R6                   ; Then tens place
                lcall sndchr
                mov A, R5                   ; Finally one's place
                lcall sndchr                ; Starting with the 100ths place, send the characters back in order
                sjmp endArithmetic          ; Go to end to restart process
            endArithmetic:
                sjmp start2                 ; reset the program start back at the beginning after giving us the desired answer
            ;sjmp loop2

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
    mov sbuf, a             ; Move contents of the accummulator into sbuf
    txloop:
        jnb scon.1, txloop
    ret

crlf:
    mov A, #0Dh         ; Carriage Return #13d, #0Dh
    lcall sndchr 
    mov A, #0Ah         ; Linefeed #10d,#0Ah 
    lcall sndchr
    mov R0, #03h        ; Reset the Counter to 3
    ret                 ; return to DJNZ call

cnvrt:              ; Convert input into binary, push to stack
    pop 03
    pop 04          ; Pop off the return address
    mov R5, acc     ; move ASCII number from accumulator into R5
    mov A, #0d0h    ; Convert ASCII to Hex
    ADD A, R5       ; Move Hex value into accumulator
    push acc        ; Push the number into the stack
    push 04
    push 03         ; Reload return address
    ret


two:
;The stack has 6 hex numbers that need to be converted into 2 bytes for the stack
    pop 03
    pop 04          ; Pop off return address
                    ; second number
    pop 05          ; Pop off ones place
    pop 06          ; Pop off tens place
    pop 07          ; Pop off hundreds place
                    ; Second Number
    mov A, #64h     ; Move 100 into acc
    mov B, R7       ; Move R7 to B (hundreds place)
    MUL AB          ; Multiply hundreds place by 100
    mov R7, A       ; Move converted hundreds place into R7

    mov A, #0Ah     ; Move 10 into acc
    mov B, R6       ; Move R6 into acc (tens place)
    MUL AB          ; Multiply tens place by 10
    mov R6, A       ; Move converted tens place into R6

    mov A, R5       ; Move ones place into acc
    ADD A, R6       ; Add tens place to ones place (R6+R5)
    ADD A, R7       ; Add R7 to R6 and R5. 
    mov R2, A       ; Save binary second number into R2

                    ; First number
    pop 05          ; Pop off ones place
    pop 06          ; Pop off tens place
    pop 07          ; Pop off hundreds place

    mov A, #64h     ; Move 100 into acc
    mov B, R7       ; Move R7 into B (hundreds place)
    MUL AB          ; Multiply hundreds place byb 100
    mov R7, A       ; Move converted hundreds place into R7

    mov A, #0Ah     ; Move 10 into acc
    mov B, R6       ; Move R6 into acc (tens place)
    MUL AB          ; Multiply tens place by 10
    mov R6, A       ; Move converted tens place into R6

    mov A, R5       ; Move ones place into acc
    ADD A, R6       ; Add tens place to ones place (R6+R5)
    ADD A, R7       ; Add R7 to R6 and R5
    push acc        ; First number added to the stack first 
    mov A, R2       ; Move second number into acc
    ;mov P1, a
    push acc        ; Second number added to the stack next
    push 04         ; Readd return address onto stack
    push 03
    ret

reverse:
    ; takes answer and returns it as three ASCII characters
    ; start with 8-bit answer in accumulator, push three hex numbers to the stack
    ; A has the number
    
    mov B, #64h         ; Moves 100 into B
    DIV AB              ; Divides Answer by 100 to get hundreths place
    SUBB A, #0d0h       ; Convert to ASCII
    mov R7, A           ; Move hundreths place into R7 

    mov A, B            ; Move remainder into acc
    mov B, #0Ah         ; Move 10 into B
    DIV AB              ; Divide remainder by 10 to get tens place
    SUBB A, #0d0h       ; Convert to ASCII
    mov R6, a           ; Move converted tens place into R6

    mov A, B            ; Move remainder into acc
    ;mov P1, A           
    SUBB A, #0d0h       ; Convert ones place to ASCII
    ADD A, #01h         ; Account for Carry Flag
    mov R5, A           ; Move converted ones place into R5
    ret

getkey:
    jnb P3.3, getkey        ; Jump if bit not set, wait for key press
    mov P1, #0FFh           ; Set Port 1 high to be read
    pressdone:              
        jb P3.3, pressdone  ; If press detected, wait for it to end
        mov a, P1           ; Reading to Port 1
        clr C               
        SUBB A, #0F0h       ; Make first nibble 0s
        ;mov P1, a; Writing to Port 1
        ret

fix:
    inc a                   ; increment acc
    movc a, @a+pc           ; get correct ASCII translation from data table
    ret
    .db 00h, 00h, 30h, 00h, 00h, 39h, 38h, 37h, 00h, 36h, 35h, 34h, 00h, 33h, 32h, 31h      ; datatable with correct ASCII codes
    
    




    

