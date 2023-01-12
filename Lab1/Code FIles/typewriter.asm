; The main loop or body of our typerwriter program:

.org 00h
	ljmp start ;power up and reset vector

.org 100h
start:
	lcall init
	loop:
		lcall getchr
		lcall sndchr
		mov P1, a
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
	mov sbuf, a
	txloop:
		jnb scon.1, txloop
	ret





