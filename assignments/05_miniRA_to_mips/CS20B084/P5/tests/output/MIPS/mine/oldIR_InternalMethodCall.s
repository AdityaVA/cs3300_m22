	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 76
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s2, 0
	sw $s2, 0($s1)
	sw $s2, 4($s1)
	sw $s2, 8($s1)
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $v0, $v0
	sw $v0 -12 ($fp)
	la $v0, A1_funA1
	sw $v0 -24 ($fp)
	lw $v0 -12 ($fp)
	lw $v1 -24 ($fp)
	sw $v1, 4($v0)
	la $v0, A1_funA1_2
	sw $v0 -24 ($fp)
	lw $v0 -12 ($fp)
	lw $v1 -24 ($fp)
	sw $v1, 0($v0)
	lw $v1 -12 ($fp)
	sw $v1, 0($s1)
	lw $v0, 0($s1)
	move $v0, $v0
	sw $v0 -24 ($fp)
	lw $v0 -24 ($fp)
	lw $v0, 4($v0)
	move $v0, $v0
	sw $v0 -24 ($fp)
	li $v0, 12
	sw $v0 -20 ($fp)
	lw $v0 -20 ($fp)
	move $a0, $v0
	jal _halloc
	move $s0, $v0
	li $s6, 0
	sw $s6, 0($s0)
	sw $s6, 4($s0)
	sw $s6, 8($s0)
	li $v0, 8
	sw $v0 -20 ($fp)
	lw $v0 -20 ($fp)
	move $a0, $v0
	jal _halloc
	move $s2, $v0
	la $s7, A1_funA1
	sw $s7, 4($s2)
	la $s7, A1_funA1_2
	sw $s7, 0($s2)
	sw $s2, 0($s0)
	lw $v0, 0($s0)
	move $s7, $v0
	lw $v0, 0($s7)
	move $s7, $v0
	move $a0, $s0
	sw $t0 -28 ($fp)
	sw $t1 -32 ($fp)
	sw $t2 -36 ($fp)
	sw $t3 -40 ($fp)
	sw $t4 -44 ($fp)
	sw $t5 -48 ($fp)
	sw $t6 -52 ($fp)
	sw $t7 -56 ($fp)
	sw $t8 -60 ($fp)
	sw $t9 -64 ($fp)
	jalr $s7
	lw $t9 -64 ($fp)
	lw $t8 -60 ($fp)
	lw $t7 -56 ($fp)
	lw $t6 -52 ($fp)
	lw $t5 -48 ($fp)
	lw $t4 -44 ($fp)
	lw $t3 -40 ($fp)
	lw $t2 -36 ($fp)
	lw $t1 -32 ($fp)
	lw $t0 -28 ($fp)
	move $s2, $v0
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s7, $v0
	li $t0, 0
	sw $t0, 0($s7)
	sw $t0, 4($s7)
	sw $t0, 8($s7)
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $v0, $v0
	sw $v0 -20 ($fp)
	la $s6, A1_funA1
	lw $v0 -20 ($fp)
	sw $s6, 4($v0)
	la $s6, A1_funA1_2
	lw $v0 -20 ($fp)
	sw $s6, 0($v0)
	lw $v1 -20 ($fp)
	sw $v1, 0($s7)
	lw $v0, 0($s7)
	move $s6, $v0
	lw $v0, 4($s6)
	move $s6, $v0
	li $s0, 1
	li $t1, 12
	move $a0, $t1
	jal _halloc
	move $t0, $v0
	li $t2, 0
	sw $t2, 0($t0)
	sw $t2, 4($t0)
	sw $t2, 8($t0)
	li $t1, 8
	move $a0, $t1
	jal _halloc
	move $t3, $v0
	la $t4, A1_funA1
	sw $t4, 4($t3)
	la $t4, A1_funA1_2
	sw $t4, 0($t3)
	sw $t3, 0($t0)
	lw $v0, 0($t0)
	move $t4, $v0
	lw $v0, 4($t4)
	move $t4, $v0
	li $t1, 0
	li $t5, 12
	move $a0, $t5
	jal _halloc
	move $t2, $v0
	li $t6, 0
	sw $t6, 0($t2)
	sw $t6, 4($t2)
	sw $t6, 8($t2)
	li $t5, 8
	move $a0, $t5
	jal _halloc
	move $t7, $v0
	la $t8, A1_funA1
	sw $t8, 4($t7)
	la $t8, A1_funA1_2
	sw $t8, 0($t7)
	sw $t7, 0($t2)
	lw $v0, 0($t2)
	move $t8, $v0
	lw $v0, 4($t8)
	move $t8, $v0
	li $t5, 1
	li $t6, 6
	li $t9, 12
	move $a0, $t9
	jal _halloc
	move $v0, $v0
	sw $v0 -16 ($fp)
	li $s3, 0
	lw $v0 -16 ($fp)
	sw $s3, 0($v0)
	lw $v0 -16 ($fp)
	sw $s3, 4($v0)
	lw $v0 -16 ($fp)
	sw $s3, 8($v0)
	li $t9, 8
	move $a0, $t9
	jal _halloc
	move $s5, $v0
	la $s4, A1_funA1
	sw $s4, 4($s5)
	la $s4, A1_funA1_2
	sw $s4, 0($s5)
	lw $v0 -16 ($fp)
	sw $s5, 0($v0)
	move $a0, $t2
	move $a1, $t5
	move $a2, $t6
	lw $v0 -16 ($fp)
	move $a3, $v0
	sw $t0 -28 ($fp)
	sw $t1 -32 ($fp)
	sw $t2 -36 ($fp)
	sw $t3 -40 ($fp)
	sw $t4 -44 ($fp)
	sw $t5 -48 ($fp)
	sw $t6 -52 ($fp)
	sw $t7 -56 ($fp)
	sw $t8 -60 ($fp)
	sw $t9 -64 ($fp)
	jalr $t8
	lw $t9 -64 ($fp)
	lw $t8 -60 ($fp)
	lw $t7 -56 ($fp)
	lw $t6 -52 ($fp)
	lw $t5 -48 ($fp)
	lw $t4 -44 ($fp)
	lw $t3 -40 ($fp)
	lw $t2 -36 ($fp)
	lw $t1 -32 ($fp)
	lw $t0 -28 ($fp)
	move $t7, $v0
	li $t9, 12
	move $a0, $t9
	jal _halloc
	move $v0, $v0
	sw $v0 -16 ($fp)
	li $s3, 0
	lw $v0 -16 ($fp)
	sw $s3, 0($v0)
	lw $v0 -16 ($fp)
	sw $s3, 4($v0)
	lw $v0 -16 ($fp)
	sw $s3, 8($v0)
	li $t9, 8
	move $a0, $t9
	jal _halloc
	move $s5, $v0
	la $s4, A1_funA1
	sw $s4, 4($s5)
	la $s4, A1_funA1_2
	sw $s4, 0($s5)
	lw $v0 -16 ($fp)
	sw $s5, 0($v0)
	move $a0, $t0
	move $a1, $t1
	move $a2, $t7
	lw $v0 -16 ($fp)
	move $a3, $v0
	sw $t0 -28 ($fp)
	sw $t1 -32 ($fp)
	sw $t2 -36 ($fp)
	sw $t3 -40 ($fp)
	sw $t4 -44 ($fp)
	sw $t5 -48 ($fp)
	sw $t6 -52 ($fp)
	sw $t7 -56 ($fp)
	sw $t8 -60 ($fp)
	sw $t9 -64 ($fp)
	jalr $t4
	lw $t9 -64 ($fp)
	lw $t8 -60 ($fp)
	lw $t7 -56 ($fp)
	lw $t6 -52 ($fp)
	lw $t5 -48 ($fp)
	lw $t4 -44 ($fp)
	lw $t3 -40 ($fp)
	lw $t2 -36 ($fp)
	lw $t1 -32 ($fp)
	lw $t0 -28 ($fp)
	move $t3, $v0
	li $t9, 12
	move $a0, $t9
	jal _halloc
	move $v0, $v0
	sw $v0 -16 ($fp)
	li $s3, 0
	lw $v0 -16 ($fp)
	sw $s3, 0($v0)
	lw $v0 -16 ($fp)
	sw $s3, 4($v0)
	lw $v0 -16 ($fp)
	sw $s3, 8($v0)
	li $t9, 8
	move $a0, $t9
	jal _halloc
	move $s5, $v0
	la $s4, A1_funA1
	sw $s4, 4($s5)
	la $s4, A1_funA1_2
	sw $s4, 0($s5)
	lw $v0 -16 ($fp)
	sw $s5, 0($v0)
	move $a0, $s7
	move $a1, $s0
	move $a2, $t3
	lw $v0 -16 ($fp)
	move $a3, $v0
	sw $t0 -28 ($fp)
	sw $t1 -32 ($fp)
	sw $t2 -36 ($fp)
	sw $t3 -40 ($fp)
	sw $t4 -44 ($fp)
	sw $t5 -48 ($fp)
	sw $t6 -52 ($fp)
	sw $t7 -56 ($fp)
	sw $t8 -60 ($fp)
	sw $t9 -64 ($fp)
	jalr $s6
	lw $t9 -64 ($fp)
	lw $t8 -60 ($fp)
	lw $t7 -56 ($fp)
	lw $t6 -52 ($fp)
	lw $t5 -48 ($fp)
	lw $t4 -44 ($fp)
	lw $t3 -40 ($fp)
	lw $t2 -36 ($fp)
	lw $t1 -32 ($fp)
	lw $t0 -28 ($fp)
	move $v0, $v0
	sw $v0 -20 ($fp)
	li $t9, 12
	move $a0, $t9
	jal _halloc
	move $v0, $v0
	sw $v0 -16 ($fp)
	li $s3, 0
	lw $v0 -16 ($fp)
	sw $s3, 0($v0)
	lw $v0 -16 ($fp)
	sw $s3, 4($v0)
	lw $v0 -16 ($fp)
	sw $s3, 8($v0)
	li $t9, 8
	move $a0, $t9
	jal _halloc
	move $s5, $v0
	la $s4, A1_funA1
	sw $s4, 4($s5)
	la $s4, A1_funA1_2
	sw $s4, 0($s5)
	lw $v0 -16 ($fp)
	sw $s5, 0($v0)
	move $a0, $s1
	move $a1, $s2
	lw $v0 -20 ($fp)
	move $a2, $v0
	lw $v0 -16 ($fp)
	move $a3, $v0
	sw $t0 -28 ($fp)
	sw $t1 -32 ($fp)
	sw $t2 -36 ($fp)
	sw $t3 -40 ($fp)
	sw $t4 -44 ($fp)
	sw $t5 -48 ($fp)
	sw $t6 -52 ($fp)
	sw $t7 -56 ($fp)
	sw $t8 -60 ($fp)
	sw $t9 -64 ($fp)
	lw $v0 -24 ($fp)
	jalr $v0
	lw $t9 -64 ($fp)
	lw $t8 -60 ($fp)
	lw $t7 -56 ($fp)
	lw $t6 -52 ($fp)
	lw $t5 -48 ($fp)
	lw $t4 -44 ($fp)
	lw $t3 -40 ($fp)
	lw $t2 -36 ($fp)
	lw $t1 -32 ($fp)
	lw $t0 -28 ($fp)
	move $v0, $v0
	sw $v0 -12 ($fp)
	lw $v0 -12 ($fp)
	move $a0, $v0
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 76
	jr $ra
	.text
	.globl A1_funA1
A1_funA1:
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
	move $v1, $a0
	move $v1, $a1
	move $s0, $a2
	move $v1, $a3
	li $s1, 5
	mul $s0, $s0, $s1
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
	.globl A1_funA1_2
A1_funA1_2:
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
	move $s1, $a0
	li $s0, 0
	sw $s0, 4($s1)
	lw $v0, 4($s1)
	move $s0, $v0
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
