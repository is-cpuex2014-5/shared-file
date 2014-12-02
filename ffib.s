	.data
l.19:
	.float	1.000000
	.text
	.globl  main
ffib.9:
	li	$r02, 2
	blti	$r01, $r02, bge_else.23
	subi	$r02, $r01, 1
	store	$r01, $r14, 0
	mov	$r01, $r02
	addil	$r14, $r14, 12
	call	ffib.9
	subi	$r14, $r14, 12
	load	$r01, $r14, 0
	subi	$r01, $r01, 2
	fstore	$f01, $r14, 8
	addil	$r14, $r14, 24
	call	ffib.9
	subi	$r14, $r14, 24
	fload	$f02, $r14, 8
	fadd	$f01, $f02, $f01
	ret
bge_else.23:
	fload	$f01, $r00, l.19
	ret
main: # main entry point
   # main program start
	li	$r01, 10
	addil	$r14, $r14, 8
	call	ffib.9
	subi	$r14, $r14, 8
   # main program end
	beq	$r00, $r00, $r15, 0
