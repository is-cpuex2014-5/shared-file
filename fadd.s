	.data
l.9:
	.float	2.500000
l.8:
	.float	1.000000
	.text
	.globl  main
f.3:
	fadd	$f01, $f01, $f02
	ret
main: # main entry point
   # main program start
	li	$r11, l.8
	fload	$f01, $r11, 0
	li	$r11, l.9
	fload	$f02, $r11, 0
	load	$r11, $r14, -4
	store	$r11, $r14, 4
	addil	$r14, $r14, 8
	call	f.3
	subi	$r14, $r14, 8
	load	$r11, $r14, 4
	store	$r11, $r14, -4
   # main program end
	beq	$r00, $r00, $r15, 0
