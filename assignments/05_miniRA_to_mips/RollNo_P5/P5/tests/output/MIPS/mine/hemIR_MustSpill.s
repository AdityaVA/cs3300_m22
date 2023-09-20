	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 44
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
	jal Test35
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
	addu $sp, $sp, 44
	jr $ra
	.text
	.globl Test35
Test35:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 100
	sw $s0 -76 ($fp)
	sw $s1 -80 ($fp)
	sw $s2 -84 ($fp)
	sw $s3 -88 ($fp)
	sw $s4 -92 ($fp)
	sw $s5 -96 ($fp)
	sw $s6 -100 ($fp)
	sw $s7 -104 ($fp)
	li $v0, 0
	sw $v0 -12 ($fp)
	li $v0, 1
	sw $v0 -16 ($fp)
	li $v0, 2
	sw $v0 -20 ($fp)
	li $v0, 3
	sw $v0 -24 ($fp)
	li $v0, 4
	sw $v0 -28 ($fp)
	li $v0, 5
	sw $v0 -32 ($fp)
	li $v0, 6
	sw $v0 -36 ($fp)
	li $v0, 7
	sw $v0 -40 ($fp)
	li $v0, 8
	sw $v0 -44 ($fp)
	li $v0, 9
	sw $v0 -48 ($fp)
	li $v0, 10
	sw $v0 -52 ($fp)
	li $v0, 11
	sw $v0 -56 ($fp)
	li $v0, 12
	sw $v0 -60 ($fp)
	li $v0, 13
	sw $v0 -64 ($fp)
	li $v0, 14
	sw $v0 -68 ($fp)
	li $v0, 15
	sw $v0 -72 ($fp)
	li $t8, 16
	li $t9, 17
	li $s0, 18
	li $s1, 19
	li $s2, 20
	li $s3, 21
	li $s4, 22
	li $s5, 23
	li $s6, 24
	li $s7, 25
	li $t0, 26
	li $t1, 27
	li $t2, 28
	li $t3, 29
	li $t4, 30
	li $t5, 31
	li $t6, 32
	li $t7, 33
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
	move $a0, $s0
	jal _print
	move $a0, $t9
	jal _print
	move $a0, $t8
	jal _print
	lw $v0 -72 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -68 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -64 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -60 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -56 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -52 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -48 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -44 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -40 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -36 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -32 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -28 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -24 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -20 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -16 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -12 ($fp)
	move $a0, $v0
	jal _print
	lw $v0 -12 ($fp)
	move $v0, $v0
	lw $s7 -104 ($fp)
	lw $s6 -100 ($fp)
	lw $s5 -96 ($fp)
	lw $s4 -92 ($fp)
	lw $s3 -88 ($fp)
	lw $s2 -84 ($fp)
	lw $s1 -80 ($fp)
	lw $s0 -76 ($fp)
	lw $ra, -4($fp)
	addu $sp, $sp, 100
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
