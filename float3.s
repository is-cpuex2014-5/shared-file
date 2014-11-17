	.data
l.162:
	.float	-12.300000
l.161:
	.float	2.000000
l.160:
	.float	3.141593
l.159:
	.float	12.566371
l.158:
	.float	6.283185
l.157:
	.float	-0.000029
l.156:
	.float	0.999470
l.155:
	.float	0.000333
l.154:
	.float	-0.165562
l.153:
	.float	-0.000914
l.152:
	.float	0.008087
l.151:
	.float	0.000512
l.150:
	.float	-0.000429
l.149:
	.float	0.000048
l.148:
	.float	-0.000002
l.147:
	.float	0.000000
	.text
	.globl  main
	.data
sqrt_D0:
	.integer   1597463174           # magic number m
sqrt_D1:
	.float  0.5
sqrt_D2:
	.float  1.5

	.text 
	.globl sqrt
sqrt: # sqrt by Newton's method(N = 3, using reciprocal of the root)
	fload 	$f03, $r00, sqrt_D0 
	fload	$f04, $r00, sqrt_D1
	fload	$f05, $r00, sqrt_D2
	fstore  $f01, $r14, 4
	load	$r02, $r14, 4
	load 	$r03, $r00, sqrt_D0
	srli    $r02, $r02, 1
	sub     $r02, $r03, $r02   # x0 = m - (u32of(x) >> 1);	
        store   $r02, $r14, 4
	fload	$f02, $r14, 4
	fmul    $f04, $f01, $f04   #  y = 0.5 * x;
	fmul    $f03, $f02, $f04   # 3 times
	fmul    $f03, $f02, $f03
	fsub    $f03, $f05, $f03           
	fmul    $f02, $f02, $f03   # xn = xn * (1.5 - y * xn * xn );
	fmul    $f03, $f02, $f04
	fmul    $f03, $f02, $f03
	fsub    $f03, $f05, $f03
	fmul    $f02, $f02, $f03
	fmul    $f03, $f02, $f04
	fmul    $f03, $f02, $f03
	fsub    $f03, $f05, $f03
	fmul    $f02, $f02, $f03
	fmul    $f01, $f01, $f02          # return x * 1/sqrt(x);
	ret
finv_D0:
	.float  0.5
finv_D1:
	.float  2.0
finv_D2:
	.float  -1.8823529          # -32.0 / 17.0
finv_D3:
	.float	2.8235294          #  48.0 / 17.0
	.globl finv
finv:
	fstore	$f01, $r14, 4
	load	$r01, $r14, 4
	srli    $r02, $r01, 23
	sub     $r02, $r00, $r02	# sign($f02) = sign($f01);
	addil   $r02, $r02, 253		# exponent($f02) = 253 - exponent($f01);
	slli    $r02, $r02, 23          # fraction($f02) = 0;
	store	$r02, $r14, 8
	fload	$f02, $r14, 8
	load	$r03, $r00, finv_D0
	slli    $r01, $r01, 9
	srli 	$r01, $r01, 9           # sign($f01) = 0;
	add     $r01, $r01, $r03        # exponent($f01) = 126;
	store   $r01, $r14, 4
	fload   $f01, $r14, 4
	fload   $f03, $r00, finv_D2
	fload   $f04, $r00, finv_D3
	fmul    $f03, $f01, $f03          # // initial guess
	fadd    $f03, $f03, $f04          # $f03 = -32/17 * $f01 + 48/17;
	fload   $f05, $r00, finv_D1
	fmul    $f04, $f01, $f03
	fsub    $f04, $f05, $f04          # // repeat 3 times
	fmul    $f03, $f03, $f04          # $f03 *= 2.0 - $f01 * $f03;
	fmul    $f04, $f01, $f03
	fsub    $f04, $f05, $f04
	fmul    $f03, $f03, $f04
	fmul    $f04, $f01, $f03
	fsub    $f04, $f05, $f04
	fmul    $f03, $f03, $f04
	fmul    $f01, $f02, $f03          # return $2 * $3;
	ret

	
fabs.64:
	li	$r11, l.147
	fload	$f02, $r11, 0
	bflti	$f01, $f02, bfge_else.166
	ret
bfge_else.166:
	fsub	$f01, $r00,  $f01
	ret
sin_sub.70:
	li	$r11, l.148
	fload	$f02, $r11, 0
	fmul	$f02, $f02, $f01
	li	$r11, l.149
	fload	$f03, $r11, 0
	fadd	$f02, $f02, $f03
	fmul	$f02, $f02, $f01
	li	$r11, l.150
	fload	$f03, $r11, 0
	fadd	$f02, $f02, $f03
	fmul	$f02, $f02, $f01
	li	$r11, l.151
	fload	$f03, $r11, 0
	fadd	$f02, $f02, $f03
	fmul	$f02, $f02, $f01
	li	$r11, l.152
	fload	$f03, $r11, 0
	fadd	$f02, $f02, $f03
	fmul	$f02, $f02, $f01
	li	$r11, l.153
	fload	$f03, $r11, 0
	fadd	$f02, $f02, $f03
	fmul	$f02, $f02, $f01
	li	$r11, l.154
	fload	$f03, $r11, 0
	fadd	$f02, $f02, $f03
	fmul	$f02, $f02, $f01
	li	$r11, l.155
	fload	$f03, $r11, 0
	fadd	$f02, $f02, $f03
	fmul	$f02, $f02, $f01
	li	$r11, l.156
	fload	$f03, $r11, 0
	fadd	$f02, $f02, $f03
	fmul	$f01, $f02, $f01
	li	$r11, l.157
	fload	$f02, $r11, 0
	fadd	$f01, $f01, $f02
	ret
sin.72:
	li	$r11, l.158
	fload	$f02, $r11, 0
	bflti	$f01, $f02, bfge_else.167
	li	$r11, l.159
	fload	$f03, $r11, 0
	bflti	$f01, $f03, bfge_else.168
	fsub	$f01, $f01, $f03
	beqi	 $r00, $r00, sin_sub.70
bfge_else.168:
	fsub	$f01, $f01, $f02
	beqi	 $r00, $r00, sin_sub.70
bfge_else.167:
	beqi	 $r00, $r00, sin_sub.70
cos.74:
	li	$r11, l.160
	fload	$f02, $r11, 0
	li	$r11, l.161
	fload	$f03, $r11, 0
	fstore	$f01, $r14, 0
	fstore	$f02, $r14, 8
	load	$r11, $r14, -4
	fadd	$f01, $f00, $f03
	store	$r11, $r14, 20
	addil	$r14, $r14, 24
	call	finv
	subi	$r14, $r14, 24
	load	$r11, $r14, 20
	store	$r11, $r14, -4
	fload	$f02, $r14, 8
	fmul	$f01, $f02, $f01
	fload	$f02, $r14, 0
	fadd	$f01, $f02, $f01
	beqi	 $r00, $r00, sin.72
main: # main entry point
   # main program start
	li	$r11, l.162
	fload	$f01, $r11, 0
	load	$r11, $r14, -4
	store	$r11, $r14, 4
	addil	$r14, $r14, 8
	call	fabs.64
	subi	$r14, $r14, 8
	load	$r11, $r14, 4
	store	$r11, $r14, -4
	load	$r11, $r14, -4
	store	$r11, $r14, 4
	addil	$r14, $r14, 8
	call	sqrt
	subi	$r14, $r14, 8
	load	$r11, $r14, 4
	store	$r11, $r14, -4
	load	$r11, $r14, -4
	store	$r11, $r14, 4
	addil	$r14, $r14, 8
	call	cos.74
	subi	$r14, $r14, 8
	load	$r11, $r14, 4
	store	$r11, $r14, -4
	load	$r11, $r14, -4
	store	$r11, $r14, 4
	addil	$r14, $r14, 8
	call	sin.72
	subi	$r14, $r14, 8
	load	$r11, $r14, 4
	store	$r11, $r14, -4
   # main program end
	beq	$r00, $r00, $r15, 0
