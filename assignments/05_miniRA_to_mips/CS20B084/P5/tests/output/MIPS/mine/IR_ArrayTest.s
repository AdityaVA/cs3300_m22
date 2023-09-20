	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 52
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s2, 0
	sw $s2, 0($s1)
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s3, Test_start
	sw $s3, 0($s2)
	sw $s2, 0($s1)
	lw $v0, 0($s1)
	move $s3, $v0
	lw $v0, 0($s3)
	move $s3, $v0
	li $s0, 10
	move $a0, $s1
	move $a1, $s0
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
	jalr $s3
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
	move $s2, $v0
	move $a0, $s2
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
	move $s0, $a1
	add $s1, $s0, 1
	mul $s0, $s1, 4
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	sw $s1, 0($s2)
	li $s3, 0
	li $s4, 4
	sub $s0, $s0, 4
Test_start_L1:
	sle $s1, $s4, $s0
	beqz $s1 Test_start_L2
	add $s5, $s2, $s4
	sw $s3, 0($s5)
	add $s4, $s4, 4
	b Test_start_L1
Test_start_L2:
	nop
	move $s0, $s2
	lw $v0, 0($s0)
	move $s1, $v0
	sub $s1, $s1, 1
	move $s1, $s1
	li $s4, 0
	move $s2, $s4
Test_start_L3:
	li $s3, 1
	sub $s3, $s1, $s3
	sle $s5, $s2, $s3
	beqz $s5 Test_start_L4
	mul $s3, $s2, 4
	add $s3, $s3, 4
	add $s3, $s3, $s0
	sw $s2, 0($s3)
	mul $s3, $s2, 4
	add $s3, $s3, 4
	add $s3, $s0, $s3
	lw $v0, 0($s3)
	move $s4, $v0
	move $a0, $s4
	jal _print
	li $s4, 1
	add $s3, $s2, $s4
	move $s2, $s3
	b Test_start_L3
Test_start_L4:
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
