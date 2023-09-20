	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 48
	li $s0, 20
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s2, 0
	sw $s2, 0($s1)
	sw $s2, 4($s1)
	sw $s2, 8($s1)
	sw $s2, 12($s1)
	sw $s2, 16($s1)
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	la $s2, yeaboi_fn
	sw $s2, 4($s0)
	la $s2, yeaboi_foo
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 4($s2)
	move $s2, $v0
	move $a0, $s1
	sw $t0 -12 ($fp)
	sw $t1 -16 ($fp)
	sw $t2 -20 ($fp)
	sw $t3 -24 ($fp)
	sw $t4 -28 ($fp)
	sw $t5 -32 ($fp)
	sw $t6 -36 ($fp)
	sw $t7 -40 ($fp)
	sw $t8 -44 ($fp)
	sw $t9 -48 ($fp)
	jalr $s2
	lw $t9 -48 ($fp)
	lw $t8 -44 ($fp)
	lw $t7 -40 ($fp)
	lw $t6 -36 ($fp)
	lw $t5 -32 ($fp)
	lw $t4 -28 ($fp)
	lw $t3 -24 ($fp)
	lw $t2 -20 ($fp)
	lw $t1 -16 ($fp)
	lw $t0 -12 ($fp)
	move $s0, $v0
	move $a0, $s0
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 48
	jr $ra
	.text
	.globl yeaboi_fn
yeaboi_fn:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 80
	sw $s0 -12 ($fp)
	sw $s1 -16 ($fp)
	sw $s2 -20 ($fp)
	sw $s3 -24 ($fp)
	sw $s4 -28 ($fp)
	sw $s5 -32 ($fp)
	sw $s6 -36 ($fp)
	sw $s7 -40 ($fp)
	move $s1, $a0
	li $s0, 1
	sw $s0, 4($s1)
	li $s0, 1
	sw $s0, 16($s1)
	li $s0, 0
	sw $s0, 12($s1)
	lw $v0, 16($s1)
	move $s0, $v0
	beqz $s0 yeaboi_fn_L1
	lw $v0, 12($s1)
	move $s2, $v0
	move $s2, $s2
	b yeaboi_fn_L2
yeaboi_fn_L1:
	move $s2, $s0
yeaboi_fn_L2:
	nop
	sw $s2, 8($s1)
	lw $v0, 16($s1)
	move $s0, $v0
	beqz $s0 yeaboi_fn_L4
	move $s0, $s0
	b yeaboi_fn_L5
yeaboi_fn_L4:
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 0($s2)
	move $s2, $v0
	move $a0, $s1
	sw $t0 -44 ($fp)
	sw $t1 -48 ($fp)
	sw $t2 -52 ($fp)
	sw $t3 -56 ($fp)
	sw $t4 -60 ($fp)
	sw $t5 -64 ($fp)
	sw $t6 -68 ($fp)
	sw $t7 -72 ($fp)
	sw $t8 -76 ($fp)
	sw $t9 -80 ($fp)
	jalr $s2
	lw $t9 -80 ($fp)
	lw $t8 -76 ($fp)
	lw $t7 -72 ($fp)
	lw $t6 -68 ($fp)
	lw $t5 -64 ($fp)
	lw $t4 -60 ($fp)
	lw $t3 -56 ($fp)
	lw $t2 -52 ($fp)
	lw $t1 -48 ($fp)
	lw $t0 -44 ($fp)
	move $s3, $v0
	move $s0, $s3
yeaboi_fn_L5:
	nop
	beqz $s0 yeaboi_fn_L3
	lw $v0, 4($s1)
	move $s2, $v0
	move $a0, $s2
	jal _print
yeaboi_fn_L3:
	nop
	li $s0, 1
	sw $s0, 4($s1)
	lw $v0, 12($s1)
	move $s0, $v0
	beqz $s0 yeaboi_fn_L7
	move $s0, $s0
	b yeaboi_fn_L8
yeaboi_fn_L7:
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 0($s2)
	move $s2, $v0
	move $a0, $s1
	sw $t0 -44 ($fp)
	sw $t1 -48 ($fp)
	sw $t2 -52 ($fp)
	sw $t3 -56 ($fp)
	sw $t4 -60 ($fp)
	sw $t5 -64 ($fp)
	sw $t6 -68 ($fp)
	sw $t7 -72 ($fp)
	sw $t8 -76 ($fp)
	sw $t9 -80 ($fp)
	jalr $s2
	lw $t9 -80 ($fp)
	lw $t8 -76 ($fp)
	lw $t7 -72 ($fp)
	lw $t6 -68 ($fp)
	lw $t5 -64 ($fp)
	lw $t4 -60 ($fp)
	lw $t3 -56 ($fp)
	lw $t2 -52 ($fp)
	lw $t1 -48 ($fp)
	lw $t0 -44 ($fp)
	move $s3, $v0
	move $s0, $s3
yeaboi_fn_L8:
	nop
	beqz $s0 yeaboi_fn_L6
	lw $v0, 4($s1)
	move $s2, $v0
	move $a0, $s2
	jal _print
yeaboi_fn_L6:
	nop
	li $s0, 1
	sw $s0, 4($s1)
	lw $v0, 12($s1)
	move $s0, $v0
	beqz $s0 yeaboi_fn_L10
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 0($s2)
	move $s2, $v0
	move $a0, $s1
	sw $t0 -44 ($fp)
	sw $t1 -48 ($fp)
	sw $t2 -52 ($fp)
	sw $t3 -56 ($fp)
	sw $t4 -60 ($fp)
	sw $t5 -64 ($fp)
	sw $t6 -68 ($fp)
	sw $t7 -72 ($fp)
	sw $t8 -76 ($fp)
	sw $t9 -80 ($fp)
	jalr $s2
	lw $t9 -80 ($fp)
	lw $t8 -76 ($fp)
	lw $t7 -72 ($fp)
	lw $t6 -68 ($fp)
	lw $t5 -64 ($fp)
	lw $t4 -60 ($fp)
	lw $t3 -56 ($fp)
	lw $t2 -52 ($fp)
	lw $t1 -48 ($fp)
	lw $t0 -44 ($fp)
	move $s3, $v0
	move $s3, $s3
	b yeaboi_fn_L11
yeaboi_fn_L10:
	move $s3, $s0
yeaboi_fn_L11:
	nop
	beqz $s3 yeaboi_fn_L9
	lw $v0, 4($s1)
	move $s2, $v0
	move $a0, $s2
	jal _print
yeaboi_fn_L9:
	nop
	li $s0, 1
	sw $s0, 4($s1)
	lw $v0, 16($s1)
	move $s0, $v0
	beqz $s0 yeaboi_fn_L13
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 0($s2)
	move $s2, $v0
	move $a0, $s1
	sw $t0 -44 ($fp)
	sw $t1 -48 ($fp)
	sw $t2 -52 ($fp)
	sw $t3 -56 ($fp)
	sw $t4 -60 ($fp)
	sw $t5 -64 ($fp)
	sw $t6 -68 ($fp)
	sw $t7 -72 ($fp)
	sw $t8 -76 ($fp)
	sw $t9 -80 ($fp)
	jalr $s2
	lw $t9 -80 ($fp)
	lw $t8 -76 ($fp)
	lw $t7 -72 ($fp)
	lw $t6 -68 ($fp)
	lw $t5 -64 ($fp)
	lw $t4 -60 ($fp)
	lw $t3 -56 ($fp)
	lw $t2 -52 ($fp)
	lw $t1 -48 ($fp)
	lw $t0 -44 ($fp)
	move $s3, $v0
	move $s3, $s3
	b yeaboi_fn_L14
yeaboi_fn_L13:
	move $s3, $s0
yeaboi_fn_L14:
	nop
	beqz $s3 yeaboi_fn_L12
	lw $v0, 4($s1)
	move $s2, $v0
	move $a0, $s2
	jal _print
yeaboi_fn_L12:
	nop
	li $s0, 1
	sw $s0, 4($s1)
	lw $v0, 12($s1)
	move $s0, $v0
	beqz $s0 yeaboi_fn_L16
	move $s0, $s0
	b yeaboi_fn_L17
yeaboi_fn_L16:
	lw $v0, 16($s1)
	move $s2, $v0
	beqz $s2 yeaboi_fn_L18
	move $s2, $s2
	b yeaboi_fn_L19
yeaboi_fn_L18:
	lw $v0, 0($s1)
	move $s3, $v0
	lw $v0, 0($s3)
	move $s3, $v0
	move $a0, $s1
	sw $t0 -44 ($fp)
	sw $t1 -48 ($fp)
	sw $t2 -52 ($fp)
	sw $t3 -56 ($fp)
	sw $t4 -60 ($fp)
	sw $t5 -64 ($fp)
	sw $t6 -68 ($fp)
	sw $t7 -72 ($fp)
	sw $t8 -76 ($fp)
	sw $t9 -80 ($fp)
	jalr $s3
	lw $t9 -80 ($fp)
	lw $t8 -76 ($fp)
	lw $t7 -72 ($fp)
	lw $t6 -68 ($fp)
	lw $t5 -64 ($fp)
	lw $t4 -60 ($fp)
	lw $t3 -56 ($fp)
	lw $t2 -52 ($fp)
	lw $t1 -48 ($fp)
	lw $t0 -44 ($fp)
	move $s4, $v0
	move $s2, $s4
yeaboi_fn_L19:
	nop
	move $s0, $s2
yeaboi_fn_L17:
	nop
	beqz $s0 yeaboi_fn_L15
	lw $v0, 4($s1)
	move $s3, $v0
	move $a0, $s3
	jal _print
yeaboi_fn_L15:
	nop
	li $s0, 1
	move $v0, $s0
	lw $s7 -40 ($fp)
	lw $s6 -36 ($fp)
	lw $s5 -32 ($fp)
	lw $s4 -28 ($fp)
	lw $s3 -24 ($fp)
	lw $s2 -20 ($fp)
	lw $s1 -16 ($fp)
	lw $s0 -12 ($fp)
	lw $ra, -4($fp)
	addu $sp, $sp, 80
	lw $fp, -8($fp)
	jr $ra
	.text
	.globl yeaboi_foo
yeaboi_foo:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 36
	sw $s0 -12 ($fp)
	sw $s1 -16 ($fp)
	sw $s2 -20 ($fp)
	sw $s3 -24 ($fp)
	sw $s4 -28 ($fp)
	sw $s5 -32 ($fp)
	sw $s6 -36 ($fp)
	sw $s7 -40 ($fp)
	move $s0, $a0
	li $s1, 5
	sw $s1, 4($s0)
	li $s0, 1
	move $v0, $s0
	lw $s7 -40 ($fp)
	lw $s6 -36 ($fp)
	lw $s5 -32 ($fp)
	lw $s4 -28 ($fp)
	lw $s3 -24 ($fp)
	lw $s2 -20 ($fp)
	lw $s1 -16 ($fp)
	lw $s0 -12 ($fp)
	lw $ra, -4($fp)
	addu $sp, $sp, 36
	lw $fp, -8($fp)
	jr $ra

	.text
	.globl _halloc
_halloc:
	li $v0, 9
	syscall
	j $ra

	.text
	.globl _print
_print:
	li $v0, 1
	syscall
	la $a0, newl
	li $v0, 4
	syscall
	j $ra

	.data
	.align   0
newl:    .asciiz "\n" 
	.data
	.align   0
str_er:  .asciiz " ERROR: abnormal termination\n" 
