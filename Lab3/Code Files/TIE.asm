.org 00h
ljmp main

.org 00Bh   

T0ISR:              ; Interrupt Service Routine
    lcall draw
    reti

.org 0030h

main:
    mov TMOD, #02h      ; Set Mode, Initialize the Interrupt
    mov TH0, #4Ch       ; Set Count
    setb TR0            
    mov IE, #82h
    mov R4, #00h        ; DAC 1 Current Position High Byte
    mov R5, #00h        ; DAC 1 Current Position Low Byte
    mov R6, #0C0h        ; DAC 2 Current Position High Byte
    mov R7, #00h        ; DAC 2 Current Position Low Byte
    loop:
        sjmp loop       ; Loop Back


.org 0500h
sine:
    .db 128,131,134,137,140,143,146,149,152,156,159,162,165,168,171,174,176,179,182,185,188,191,193,196,199,201,204,206,209,211,213,216,218,220,222,224,226,228,230,232,234,235,237,239,240,242,243,244,246,247,248,249,250,251,251,252,253,253,254,254,254,255,255,255,255,255,255,255,254,254,253,253,252,252,251,250,249,248,247,246,245,244,242,241,239,238,236,235,233,231,229,227,225,223,221,219,217,215,212,210,207,205,202,200,197,195,192,189,186,184,181,178,175,172,169,166,163,160,157,154,151,148,145,142,138,135,132,129,126,123,120,117,113,110,107,104,101,98,95,92,89,86,83,80,77,74,71,69,66,63,60,58,55,53,50,48,45,43,40,38,36,34,32,30,28,26,24,22,20,19,17,16,14,13,11,10,9,8,7,6,5,4,3,3,2,2,1,1,0,0,0,0,0,0,0,1,1,1,2,2,3,4,4,5,6,7,8,9,11,12,13,15,16,18,20,21,23,25,27,29,31,33,35,37,39,42,44,46,49,51,54,56,59,62,64,67,70,73,76,79,81,84,87,90,93,96,99,103,106,109,112,115,118,121,124,127

draw:
    mov R0, #03h        ; DAC 1 Counter High Byte
    mov R1, #00h        ; DAC 1 Counter Low Byte

    mov R2, #01h        ; DAC 2 Counter High Byte
    mov R3, #00h        ; DAC 2 Counter Low Byte

    clr C               ; DAC 1 Calculation
    mov a, R5           ; Move low byte current position into Acc
    add a, R1           ; Add low byte first
    mov R5, a           ; Update with the  result of the low byte addition into the low byte counter
    mov a, R4           ; Move the high byte current position into acc
    addc a, R0          ; Add to High 
    mov R4, a           ; Update with the result of the high byte addition into the high byte counter

    clr C               ; DAC 2 Calculation 
    mov a, R7           ; Move low byte Current Position into Acc
    add a, R3           ; Add low byte firstlow
    mov R7, a           ; Update with the result of the low byte addition into the low byte counter
    mov a, R6           ; Move high byte current position into acc
    addc a, R2          ; Add to High
    mov R6, a           ; Update with the result of the high byte addition into the high byte counter

                        ; Loading DAC 1
    mov a, R4           ; Obtain integer of high byte position for DAC 1
    mov dptr, #sine     ; Move address of data table into dptr
    movc A, @A+dptr     ; Load acc with the correct position in the sine table
    mov dptr, #0FE10h   ; Load dptr with the DAC location
    movx @dptr, a       ; Load sine value into DAC 1

                        ; Loading DAC 2
    mov a, R6           ; Obtain integer of high byte position for DAC 2
    mov dptr, #sine     ; Move address of data table into dptr
    movc A, @A+dptr     ; Loadd acc with the correct position in the sine table
    mov dptr, #0FE20h   ; Load dptr with the DAC location
    movx @dptr, a       ; Load sine value into DAC 2
    ret                 ; Return to ISR





