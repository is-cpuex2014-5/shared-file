	.text
	.globl  main
fib.9:
	li	$r03, 2
	blti	$r01, $r03, bge_else.22
	subi	$r02, $r01, 1
	store	$r01, $r14, 0
	mov	$r01, $r02
	addil	$r14, $r14, 12
	call	fib.9
	subi	$r14, $r14, 12
	load	$r02, $r14, 0
	subi	$r02, $r02, 2
	store	$r01, $r14, 4
	mov	$r01, $r02
	addil	$r14, $r14, 20
	call	fib.9
	subi	$r14, $r14, 20
	load	$r02, $r14, 4
	add	$r01, $r02, $r01, 0
	ret
bge_else.22:
	li	$r01, 1
	ret
main: # main entry point
   # main program start
	li	$r01, 8
	addil	$r14, $r14, 12
	call	fib.9
	subi	$r14, $r14, 12
   # main program end
	beq	$r00, $r00, $r15, 0
