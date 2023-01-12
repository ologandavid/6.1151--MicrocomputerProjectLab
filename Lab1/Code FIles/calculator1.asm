; Calculator program

.org 00h
    ljmp start ; power up and reset vector

.org 100h

start:
    lcall init          ;Run init to start serial
    start2:
    mov R0, #03h        ; Initialize counter for 3 characters
    mov R1, #02h        ; Initialize counter for when both numbers are recieved
    loop:
        lcall getchr
        lcall sndchr
        ;mov P1, a; Read letter output to the LED
        lcall cnvrt     ; converts ASCII to hex, pushes to stack
        DJNZ R0, loop   ; decrement R0, if not 0 go to loop, tells you when a number has been completely entered
        lcall crlf      ; If so new line protocol, start with next number
        DJNZ R1, loop   ; decrement R1, if not 0 go to loop, if both numbers have been recieved
        lcall two       ; leave me with two 8 bit numbers on the stack
            lcall getchr
            lcall sndchr                ; wait for operation entry
            CJNE A, #2Bh, subtract      ; If not subtract, got to add

            addition:
                pop 03
                pop 04                  ; Pop Off both binary numbers, R4 is the first number, R3 the second
                ;mov P1, R4
                mov A, R3               ; Move R3 to the acc
                ADD A, R4               ; Add R3 and R4
                ;mov P1, A; Send binary number into the LED
                lcall reverse           ; Convert binary number into ASCII again
                lcall crlf              ; Get a new line
                mov A, R7               ; Send back the answer in ASCII starting with hundreds
                lcall sndchr
                mov A, R6               ; Send tens place next
                lcall sndchr
                mov A, R5               ; Send ones place next
                lcall sndchr            ; Starting with the 100ths place, send the characters back in order
                sjmp endArithmetic      ; Exit this loop to end arithmetic
            subtract:
                pop 03
                pop 04                  ; Pop Off both binary numbers, R4 is the first number, R3 the second
                mov A, R4               ; Move R4 into acc
                SUBB A,R3               ; Subtract R3 from R4 which we just put into the accumulator
                ;mov P1, A
                lcall reverse           ; Convert binary number into ASCII again
                lcall crlf              ; Get a new line
                mov A, R7               ; Send back the answer in ASCII starting with hundreds
                lcall sndchr
                mov A, R6               ; Send tens place next
                lcall sndchr
                mov A, R5               ; Send ones place next
                lcall sndchr            ; Starting with the 100ths place, send the characters back in order
                sjmp endArithmetic      ; Exit this loop to end arithmetic
            endArithmetic:
                sjmp start2             ; reset the program start back at the beginning after giving us the desired answer
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
    mov sbuf, a; Move contents of the accummulator into sbuf
    txloop:
        jnb scon.1, txloop
    ret

crlf:
    mov A, #0Dh     ; Carriage Return #13d, #0Dh
    lcall sndchr 
    mov A, #0Ah     ; Linefeed #10d,#0Ah 
    lcall sndchr
    mov R0, #03h    ; Reset the Counter to 3
    ret             ; return to DJNZ call

cnvrt:              ;convert input into binary, push to stack
    pop 03
    pop 04          ;Pop off the return address
    mov R5, acc     ;move ASCII number from accumulator into R5
    mov A, #0d0h    ;Convert ASCII to Hex
    ADD A, R5       ;Move Hex value into accumulator
    push acc        ;Push the number into the stack
    push 04
    push 03         ;Reload return address
    ret


two:
;The stack has 6 hex numbers that need to be converted into 2 bytes for the stack
    pop 03
    pop 04              ; Pop off return address
                        ; Second number
    pop 05              ; pop off ones place
    pop 06              ; pop off tens place
    pop 07              ; pop off hundreds place

    mov A, #64h         ; move 100 into the accumulator
    mov B, R7           ; move R7 into B (hundreds place)
    MUL AB              ; Multiply hundreds place by 100
    mov R7, A           ; Move result back into R7

    mov A, #0Ah         ; move 10 into acc
    mov B, R6           ; move R6 into B (tens place)
    MUL AB              ; Multiply tens place by 10
    mov R6, A           ; Move result back into R6

    mov A, R5           ; Move R5 into acc
    ADD A, R6           ; Add R6 to R5 (tens to ones)
    ADD A, R7           ; Add R7 to R6 and R5 (hundreds, tens, ones)
    mov R2, A           ; Save binary second number in R2

                        ; First number
    pop 05              ; pop off ones place
    pop 06              ; pop off tens place
    pop 07              ; pop off hundreds place

    mov A, #64h         ; move 100 into acc
    mov B, R7           ; move R7 into B (hundreds place)
    MUL AB              ; Multiply hundreds place by 100
    mov R7, A           ; Move result back into R7

    mov A, #0Ah         ; move 10 into acc
    mov B, R6           ; move R6 into B
    MUL AB              ; Multiply tens place by 10
    mov R6, A           ; Move result back into R6

    mov A, R5           ; Move R5 into acc
    ADD A, R6           ; Add R6 to R5 (tens to ones)
    ADD A, R7           ; Add R7 to R6 and R5 (hundreds, tens, ones)
    push acc            ; First number added to the stack first 
    mov A, R2           ; Second Number added to acc
    ;mov P1, a
    push acc            ; Second number added to the stack next
    push 04             ; Readd Return address to Stack
    push 03
    ret

reverse:
    ; takes answer and returns it as three ASCII characters
    ; start with 8-bit answer in accumulator, push three hex numbers to the stack
    ; A has the number
    
    mov B, #64h     ; moves 100 into B
    DIV AB          ; divides accumulator value by 100, gets the hundreths place
    SUBB A, #0d0h   ; converts the hundreths place
    mov R7, A       ; A has the hundreds place, save it in R7

    mov A, B        ; Take the remainder and move into acc
    mov B, #0Ah     ; Move 10 into B
    DIV AB          ; Divide A by 10 to get the tens place
    SUBB A, #0d0h   ; Convert to ASCII
    mov R6, a       ; Move tens place into R6

    mov A, B        ; Move Remainder into A
    ;mov P1, A       
    SUBB A, #0d0h   ; Convert Ones place into ASCII
    ADD A, #01h     ; Account for Carry Flag
    mov R5, A       ; Save ones place in R5
    ret





    

