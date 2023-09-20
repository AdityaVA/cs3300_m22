	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 64
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	move $s0, $s0
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	move $s1, $s1
	la $s2, A1_funA1
	sw $s2, 0($s0)
	la $s2, A1_funA1_2
	sw $s2, 4($s0)
	li $s2, 8
	move $s2, $s2
MAIN_L0:
	li $s3, 11
	sle $s3, $s2, $s3
	beqz $s3 MAIN_L1
	add $s3, $s1, $s2
	li $s4, 0
	sw $s4, 0($s3)
	li $s3, 4
	add $s3, $s2, $s3
	move $s2, $s3
	b MAIN_L0
MAIN_L1:
	sw $s0, 0($s1)
	move $s0, $s1
	lw $v0, 0($s0)
	move $s1, $v0
	lw $v0, 0($s1)
	move $s1, $v0
	li $s2, 8
	move $a0, $s2
	jal _halloc
	move $s2, $v0
	move $s2, $s2
	li $s3, 12
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	move $s3, $s3
	la $s4, A1_funA1
	sw $s4, 0($s2)
	la $s4, A1_funA1_2
	sw $s4, 4($s2)
	li $s4, 8
	move $s4, $s4
MAIN_L2:
	li $s5, 11
	sle $s5, $s4, $s5
	beqz $s5 MAIN_L3
	add $s5, $s3, $s4
	li $s6, 0
	sw $s6, 0($s5)
	li $s5, 4
	add $s5, $s4, $s5
	move $s4, $s5
	b MAIN_L2
MAIN_L3:
	sw $s2, 0($s3)
	move $s2, $s3
	lw $v0, 0($s2)
	move $s3, $v0
	lw $v0, 4($s3)
	move $s3, $v0
	move $a0, $s2
	sw $t0 -16 ($fp)
	sw $t1 -20 ($fp)
	sw $t2 -24 ($fp)
	sw $t3 -28 ($fp)
	sw $t4 -32 ($fp)
	sw $t5 -36 ($fp)
	sw $t6 -40 ($fp)
	sw $t7 -44 ($fp)
	sw $t8 -48 ($fp)
	sw $t9 -52 ($fp)
	jalr $s3
	lw $t9 -52 ($fp)
	lw $t8 -48 ($fp)
	lw $t7 -44 ($fp)
	lw $t6 -40 ($fp)
	lw $t5 -36 ($fp)
	lw $t4 -32 ($fp)
	lw $t3 -28 ($fp)
	lw $t2 -24 ($fp)
	lw $t1 -20 ($fp)
	lw $t0 -16 ($fp)
	move $v0, $v0
	sw $v0 -12 ($fp)
	li $s3, 8
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	move $s3, $s3
	li $s4, 12
	move $a0, $s4
	jal _halloc
	move $s4, $v0
	move $s4, $s4
	la $s5, A1_funA1
	sw $s5, 0($s3)
	la $s5, A1_funA1_2
	sw $s5, 4($s3)
	li $s5, 8
	move $s5, $s5
MAIN_L4:
	li $s6, 11
	sle $s6, $s5, $s6
	beqz $s6 MAIN_L5
	add $s6, $s4, $s5
	li $s7, 0
	sw $s7, 0($s6)
	li $s6, 4
	add $s6, $s5, $s6
	move $s5, $s6
	b MAIN_L4
MAIN_L5:
	sw $s3, 0($s4)
	move $s3, $s4
	lw $v0, 0($s3)
	move $s4, $v0
	lw $v0, 0($s4)
	move $s4, $v0
	li $s5, 1
	li $s6, 8
	move $a0, $s6
	jal _halloc
	move $s6, $v0
	move $s6, $s6
	li $s7, 12
	move $a0, $s7
	jal _halloc
	move $s7, $v0
	move $s7, $s7
	la $t0, A1_funA1
	sw $t0, 0($s6)
	la $t0, A1_funA1_2
	sw $t0, 4($s6)
	li $t0, 8
	move $t0, $t0
MAIN_L6:
	li $t1, 11
	sle $t1, $t0, $t1
	beqz $t1 MAIN_L7
	add $t1, $s7, $t0
	li $t2, 0
	sw $t2, 0($t1)
	li $t1, 4
	add $t1, $t0, $t1
	move $t0, $t1
	b MAIN_L6
MAIN_L7:
	sw $s6, 0($s7)
	move $s6, $s7
	lw $v0, 0($s6)
	move $s7, $v0
	lw $v0, 0($s7)
	move $s7, $v0
	li $t0, 0
	li $t1, 8
	move $a0, $t1
	jal _halloc
	move $t1, $v0
	move $t1, $t1
	li $t2, 12
	move $a0, $t2
	jal _halloc
	move $t2, $v0
	move $t2, $t2
	la $t3, A1_funA1
	sw $t3, 0($t1)
	la $t3, A1_funA1_2
	sw $t3, 4($t1)
	li $t3, 8
	move $t3, $t3
MAIN_L8:
	li $t4, 11
	sle $t4, $t3, $t4
	beqz $t4 MAIN_L9
	add $t4, $t2, $t3
	li $t5, 0
	sw $t5, 0($t4)
	li $t4, 4
	add $t4, $t3, $t4
	move $t3, $t4
	b MAIN_L8
MAIN_L9:
	sw $t1, 0($t2)
	move $t1, $t2
	lw $v0, 0($t1)
	move $t2, $v0
	lw $v0, 0($t2)
	move $t2, $v0
	li $t3, 1
	li $t4, 6
	li $t5, 8
	move $a0, $t5
	jal _halloc
	move $t5, $v0
	move $t5, $t5
	li $t6, 12
	move $a0, $t6
	jal _halloc
	move $t6, $v0
	move $t6, $t6
	la $t7, A1_funA1
	sw $t7, 0($t5)
	la $t7, A1_funA1_2
	sw $t7, 4($t5)
	li $t7, 8
	move $t7, $t7
MAIN_L10:
	li $t8, 11
	sle $t8, $t7, $t8
	beqz $t8 MAIN_L11
	add $t8, $t6, $t7
	li $s2, 0
	sw $s2, 0($t8)
	li $s2, 4
	add $s2, $t7, $s2
	move $t7, $s2
	b MAIN_L10
MAIN_L11:
	sw $t5, 0($t6)
	move $a0, $t1
	move $a1, $t3
	move $a2, $t4
	move $a3, $t6
	sw $t0 -16 ($fp)
	sw $t1 -20 ($fp)
	sw $t2 -24 ($fp)
	sw $t3 -28 ($fp)
	sw $t4 -32 ($fp)
	sw $t5 -36 ($fp)
	sw $t6 -40 ($fp)
	sw $t7 -44 ($fp)
	sw $t8 -48 ($fp)
	sw $t9 -52 ($fp)
	jalr $t2
	lw $t9 -52 ($fp)
	lw $t8 -48 ($fp)
	lw $t7 -44 ($fp)
	lw $t6 -40 ($fp)
	lw $t5 -36 ($fp)
	lw $t4 -32 ($fp)
	lw $t3 -28 ($fp)
	lw $t2 -24 ($fp)
	lw $t1 -20 ($fp)
	lw $t0 -16 ($fp)
	move $s2, $v0
	li $t1, 8
	move $a0, $t1
	jal _halloc
	move $t1, $v0
	move $t1, $t1
	li $t2, 12
	move $a0, $t2
	jal _halloc
	move $t2, $v0
	move $t2, $t2
	la $t3, A1_funA1
	sw $t3, 0($t1)
	la $t3, A1_funA1_2
	sw $t3, 4($t1)
	li $t3, 8
	move $t3, $t3
MAIN_L12:
	li $t4, 11
	sle $t4, $t3, $t4
	beqz $t4 MAIN_L13
	add $t4, $t2, $t3
	li $t5, 0
	sw $t5, 0($t4)
	li $t4, 4
	add $t4, $t3, $t4
	move $t3, $t4
	b MAIN_L12
MAIN_L13:
	sw $t1, 0($t2)
	move $a0, $s6
	move $a1, $t0
	move $a2, $s2
	move $a3, $t2
	sw $t0 -16 ($fp)
	sw $t1 -20 ($fp)
	sw $t2 -24 ($fp)
	sw $t3 -28 ($fp)
	sw $t4 -32 ($fp)
	sw $t5 -36 ($fp)
	sw $t6 -40 ($fp)
	sw $t7 -44 ($fp)
	sw $t8 -48 ($fp)
	sw $t9 -52 ($fp)
	jalr $s7
	lw $t9 -52 ($fp)
	lw $t8 -48 ($fp)
	lw $t7 -44 ($fp)
	lw $t6 -40 ($fp)
	lw $t5 -36 ($fp)
	lw $t4 -32 ($fp)
	lw $t3 -28 ($fp)
	lw $t2 -24 ($fp)
	lw $t1 -20 ($fp)
	lw $t0 -16 ($fp)
	move $s2, $v0
	li $s6, 8
	move $a0, $s6
	jal _halloc
	move $s6, $v0
	move $s6, $s6
	li $s7, 12
	move $a0, $s7
	jal _halloc
	move $s7, $v0
	move $s7, $s7
	la $t0, A1_funA1
	sw $t0, 0($s6)
	la $t0, A1_funA1_2
	sw $t0, 4($s6)
	li $t0, 8
	move $t0, $t0
MAIN_L14:
	li $t1, 11
	sle $t1, $t0, $t1
	beqz $t1 MAIN_L15
	add $t1, $s7, $t0
	li $t2, 0
	sw $t2, 0($t1)
	li $t1, 4
	add $t1, $t0, $t1
	move $t0, $t1
	b MAIN_L14
MAIN_L15:
	sw $s6, 0($s7)
	move $a0, $s3
	move $a1, $s5
	move $a2, $s2
	move $a3, $s7
	sw $t0 -16 ($fp)
	sw $t1 -20 ($fp)
	sw $t2 -24 ($fp)
	sw $t3 -28 ($fp)
	sw $t4 -32 ($fp)
	sw $t5 -36 ($fp)
	sw $t6 -40 ($fp)
	sw $t7 -44 ($fp)
	sw $t8 -48 ($fp)
	sw $t9 -52 ($fp)
	jalr $s4
	lw $t9 -52 ($fp)
	lw $t8 -48 ($fp)
	lw $t7 -44 ($fp)
	lw $t6 -40 ($fp)
	lw $t5 -36 ($fp)
	lw $t4 -32 ($fp)
	lw $t3 -28 ($fp)
	lw $t2 -24 ($fp)
	lw $t1 -20 ($fp)
	lw $t0 -16 ($fp)
	move $s2, $v0
	li $s3, 8
	move $a0, $s3
	jal _halloc
	move $s3, $v0
	move $s3, $s3
	li $s4, 12
	move $a0, $s4
	jal _halloc
	move $s4, $v0
	move $s4, $s4
	la $s5, A1_funA1
	sw $s5, 0($s3)
	la $s5, A1_funA1_2
	sw $s5, 4($s3)
	li $s5, 8
	move $s5, $s5
MAIN_L16:
	li $s6, 11
	sle $s6, $s5, $s6
	beqz $s6 MAIN_L17
	add $s6, $s4, $s5
	li $s7, 0
	sw $s7, 0($s6)
	li $s6, 4
	add $s6, $s5, $s6
	move $s5, $s6
	b MAIN_L16
MAIN_L17:
	sw $s3, 0($s4)
	move $a0, $s0
	lw $v0 -12 ($fp)
	move $a1, $v0
	move $a2, $s2
	move $a3, $s4
	sw $t0 -16 ($fp)
	sw $t1 -20 ($fp)
	sw $t2 -24 ($fp)
	sw $t3 -28 ($fp)
	sw $t4 -32 ($fp)
	sw $t5 -36 ($fp)
	sw $t6 -40 ($fp)
	sw $t7 -44 ($fp)
	sw $t8 -48 ($fp)
	sw $t9 -52 ($fp)
	jalr $s1
	lw $t9 -52 ($fp)
	lw $t8 -48 ($fp)
	lw $t7 -44 ($fp)
	lw $t6 -40 ($fp)
	lw $t5 -36 ($fp)
	lw $t4 -32 ($fp)
	lw $t3 -28 ($fp)
	lw $t2 -24 ($fp)
	lw $t1 -20 ($fp)
	lw $t0 -16 ($fp)
	move $s0, $v0
	move $a0, $s0
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 64
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
	sw $s0, 8($s1)
	lw $v0, 8($s1)
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
