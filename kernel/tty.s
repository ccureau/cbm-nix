;
; tty routines
;

	.export		_tty_putc
	.import		ptr1

.bss
	.byte		__tty_row = 0
	.byte		__tty_col = 0
	.word		__tty_ptr = 0

.code

_tty_putc:
	ldx	>__tty_ptr
	lda	#$12
	jsr	__tty_writereg

	ldx	<__tty_ptr
	lda	#$13
	jsr	__tty_writereg

	ldx	ptr1		; character to write
	lda	#$1f
	jsr 	__tty_writereg
	

__tty_writereg:
	sta	$d600
L1:	bit	$d600
	bpl	L1
	stx	$d601
	rts
