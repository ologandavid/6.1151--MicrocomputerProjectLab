.org 8000h
    ; Assumes the two numbers have been read in at 9000h and 9001h
    ; 9002h contains the addition
    ; 9003h contains the subtraction
    ; 9004h, 9005h contains the 16 bit multiplication
    ; 9006h, 9007h contains the quotient and remainder
main:
    mov dph, #90h
    mov dpl, #00h   ; Preset dph and dpl to 9000h
    movx A, @dptr   ; Move the value at 9000h into acc
    mov R1, A       ; First Number from #9000h into R1
    mov dpl, #01h   ; Update dpl to address of 2nd number
    movx A, @dptr   ; Move the value at 9001h into acc
    mov R2, A       ; Second Number from 9001h into R2
    lcall addition  ; Call Addition
    lcall subtract  ; Call Subtraction
    lcall multiply  ; Call Multiplication
    lcall divide    ; Call Division
    ljmp 00h        ; Restart MINMON from beginning

addition:
    mov A, R1       ; Move first number from R1 into acc
    ADD A, R2       ; Add R2 to R1
    mov dpl, #02h   ; Update dpl to address for sum
    movx @dptr, A   ; Move sum into 9002h
    ret

subtract:
    mov A, R1       ; Move first number from R1 into acc
    SUBB A, R2      ; Subtract R2 from R1
    mov dpl, #03h   ; Update dpl to address for difference
    movx @dptr, A   ; Move difference into 9003h
    ret

multiply:
    mov A, R1       ; Move first number from R1 into acc
    mov B, R2       ; Move second number from R2 into B
    MUL AB          ; Multiply the two numbers together
    mov dpl, #05h   ; Update the address to hold the low byte of product
    movx @dptr, A   ; Move low byte of product into 9005h
    mov dpl, #04h   ; Update the address to hold the high byte of product
    mov A, B        ; Move high byte to acc
    movx @dptr, A   ; Move high byte of product into 9006h
    ret

divide:
    mov A, R1       ; Move first number from R1 into acc
    mov B, R2       ; Move second number from R2 into B
    DIV AB          ; Divide the first number by the second number
    mov dpl, #06h   ; Update the address to hold the quotient
    movx @dptr, A   ; Move quotient into 9006h
    mov dpl, #07h   ; Update the address to hold the remainder
    mov A, B        ; Move B into acc
    movx @dptr, A   ; Move remainder into 9007h
    ret
