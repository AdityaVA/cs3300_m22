	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 8
	li $v0, 1
	sw $v0 -12 ($fp)
	li $s1, 2
	li $s2, 3
	li $s3, 4
	li $s4, 5
	li $s5, 6
	li $s6, 7
	li $s7, 8
	li $t0, 9
	li $t1, 10
	li $t2, 11
	li $t3, 12
	li $t4, 13
	li $t5, 14
	li $t6, 15
	li $t7, 16
	li $t8, 17
	li $t9, 18
	lw $v0 -12 ($fp)
	move $a0, $v0
	jal _print
	li $s0, 19
	move $a0, $s0
	jal _print
	li $v0, 20
	sw $v0 -12 ($fp)
	lw $v0 -12 ($fp)
	move $a0, $v0
	jal _print
	move $a0, $t9
	jal _print
	move $a0, $t8
	jal _print
	move $a0, $t7
	jal _print
	move $a0, $t6
	jal _print
	move $a0, $t5
	jal _print
	move $a0, $t4
	jal _print
	move $a0, $t3
	jal _print
	move $a0, $t2
	jal _print
	move $a0, $t1
	jal _print
	move $a0, $t0
	jal _print
	move $a0, $s7
	jal _print
	move $a0, $s6
	jal _print
	move $a0, $s5
	jal _print
	move $a0, $s4
	jal _print
	move $a0, $s3
	jal _print
	move $a0, $s2
	jal _print
	move $a0, $s1
	jal _print
	lw $v0 -12 ($fp)
	move $a0, $v0
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 8
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
