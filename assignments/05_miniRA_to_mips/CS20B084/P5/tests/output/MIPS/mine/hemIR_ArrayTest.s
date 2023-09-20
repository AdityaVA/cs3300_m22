	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 52
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	move $s0, $s0
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s1, $v0
	move $s1, $s1
	la $s2, Test_start
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	move $s0, $s1
	lw $v0, 0($s0)
	move $s1, $v0
	lw $v0, 0($s1)
	move $s1, $v0
	li $s2, 10
	move $a0, $s0
	move $a1, $s2
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
	jalr $s1
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
	addu $sp, $sp, 52
	jr $ra
	.text
	.globl Test_start
Test_start:
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
	move $s1, $a1
	li $s0, 0
	move $v1, $s0
	li $s0, 0
	move $v1, $s0
	li $s0, 0
	move $v1, $s0
	li $s0, 1
	add $s0, $s1, $s0
	li $s2, 4
	mul $s0, $s0, $s2
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	move $s0, $s0
	li $s2, 4
	move $s2, $s2
Test_start_L2:
	li $s3, 1
	add $s3, $s1, $s3
	li $s4, 4
	mul $s3, $s3, $s4
	li $s4, 1
	sub $s3, $s3, $s4
	sle $s3, $s2, $s3
	beqz $s3 Test_start_L3
	add $s3, $s0, $s2
	li $s4, 0
	sw $s4, 0($s3)
	li $s3, 4
	add $s3, $s2, $s3
	move $s2, $s3
	b Test_start_L2
Test_start_L3:
	li $s2, 4
	mul $s1, $s1, $s2
	sw $s1, 0($s0)
	move $s0, $s0
	lw $v0, 0($s0)
	move $s1, $v0
	li $s2, 4
	div $s1, $s1, $s2
	move $s1, $s1
	li $s2, 0
	move $s2, $s2
Test_start_L4:
	li $s3, 1
	sub $s3, $s1, $s3
	sle $s3, $s2, $s3
	beqz $s3 Test_start_L5
	li $s3, 4
	mul $s3, $s2, $s3
	lw $v0, 0($s0)
	move $s4, $v0
	li $s5, 1
	li $s6, 1
	sub $s4, $s4, $s6
	sle $s4, $s3, $s4
	sub $s4, $s5, $s4
	beqz $s4 Test_start_L6
	b str_er
Test_start_L6:
	nop
	li $s4, 4
	add $s3, $s3, $s4
	add $s3, $s0, $s3
	sw $s2, 0($s3)
	li $s3, 4
	mul $s3, $s2, $s3
	lw $v0, 0($s0)
	move $s4, $v0
	li $s5, 1
	li $s6, 1
	sub $s4, $s4, $s6
	sle $s4, $s2, $s4
	sub $s4, $s5, $s4
	beqz $s4 Test_start_L7
	b str_er
Test_start_L7:
	nop
	li $s4, 4
	add $s3, $s3, $s4
	add $s3, $s0, $s3
	lw $v0, 0($s3)
	move $s3, $v0
	move $a0, $s3
	jal _print
	li $s3, 1
	add $s3, $s2, $s3
	move $s2, $s3
	b Test_start_L4
Test_start_L5:
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
