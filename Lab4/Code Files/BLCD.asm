;.org 8000h
main:
mov dptr, #0FE23h
MOV A, #80h
movx @dptr, A


; Set display for 8 bit communication, 5x7 char set
mov dptr, #0FE20h
MOV A, #00h
movx @dptr,A; #00h
lcall delay

mov dptr, #0FE21h
MOV A, #38h
movx @dptr,A; #38h
lcall delay

mov dptr, #0FE20h
MOV A, #04h
movx @dptr, A;#04h
lcall delay

mov dptr, #0FE20h
MOV A, #00h
movx @dptr, A;#00h
lcall delay

; Turn display on, hide cursor
mov dptr, #0FE21h
MOV A, #0Ch
movx @dptr, A;#0Ch
lcall delay

mov dptr, #0FE20h
MOV A, #04h
movx @dptr, A;#04h
lcall delay

mov dptr, #0FE20h
MOV A, #00h
movx @dptr, A;#00h
lcall delay

;Clear display
mov dptr, #0FE21h
MOV A, #01h
movx @dptr, A;#01h
lcall delay

mov dptr, #0FE20h
MOV A, #04h
movx @dptr, A;#04h
lcall delay

mov dptr, #0FE20h
MOV A, #00h
movx @dptr, A;#00h
lcall delay

;Set RAM address to zero
mov dptr, #0FE20h
MOV A, #00h
movx @dptr, A; #00h
lcall delay

mov dptr, #0FE21h
MOV A, #80h
movx @dptr, A; #80h
lcall delay

mov dptr, #0FE20h
MOV A, #04h
movx @dptr, A;#04h
lcall delay

mov dptr, #0FE20h
MOV A, #00h
movx @dptr, A;#00h
lcall delay

;Print Chars
mov R0, #32
mov dptr, #0FE20h
MOV A, #0FBh
movx @dptr, A;#0FBh
lcall delay

mov dptr, #5000h;FF00h

print_loop:
mov R3, dph
mov R4, dpl
movx A, @dptr; value of text
mov dptr, #0FE21h
movx @dptr, A
lcall delay

mov dptr, #0FE20h
MOV A, #0FFh
movx @dptr, A;#0FFh
lcall delay

mov dptr, #0FE20h
MOV A, #0FBh
movx @dptr, A;#0FBh
lcall delay

movx @dptr, A;#0FBh
lcall delay

mov dph, R3; put original address in pointer for incrementing
mov dpl, R4
inc dptr
DJNZ R0, print_loop

loop:
sjmp loop

delay:
mov R2, #0FFh
timer:
djnz R2, timer
ret

.org 5000h
.db 36h,0A5h,31h,31h,35h,20h,52h,75h,6ch,65h,73h,21h,20h,20h,20h,20h
.db 50h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,50h
