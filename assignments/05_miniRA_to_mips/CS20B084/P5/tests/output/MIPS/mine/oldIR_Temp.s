	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 48
	li $s0, 16
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s2, 0
	sw $s2, 0($s1)
	sw $s2, 4($s1)
	sw $s2, 8($s1)
	sw $s2, 12($s1)
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	la $s2, A_run
	sw $s2, 8($s0)
	la $s2, A_one
	sw $s2, 4($s0)
	la $s2, A_set
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
	.globl A_run
A_run:
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
	move $s3, $a0
	move $s1, $a1
	move $s2, $a2
	li $s0, 0
	move $v1, $s0
	sle $s0, $s1, $s2
	beqz $s0 A_run_L1
	move $s0, $s1
	b A_run_L2
A_run_L1:
	move $s0, $s2
A_run_L2:
	nop
	li $s1, 1
	beqz $s1 A_run_L7
	li $s2, 1
	move $s2, $s2
	b A_run_L8
A_run_L7:
	move $s2, $s1
A_run_L8:
	nop
	beqz $s2 A_run_L5
	move $s1, $s2
	b A_run_L6
A_run_L5:
	li $s2, 1
	beqz $s2 A_run_L9
	li $s4, 0
	move $s4, $s4
	b A_run_L10
A_run_L9:
	move $s4, $s2
A_run_L10:
	nop
	move $s1, $s4
A_run_L6:
	nop
	beqz $s1 A_run_L3
	li $s2, 0
	move $s2, $s2
	b A_run_L4
A_run_L3:
	move $s2, $s1
A_run_L4:
	nop
	sw $s2, 8($s3)
	lw $v0, 8($s3)
	move $s1, $v0
	move $a0, $s1
	jal _print
	li $s1, 1
	beqz $s1 A_run_L16
	li $s2, 1
	move $s2, $s2
	b A_run_L17
A_run_L16:
	move $s2, $s1
A_run_L17:
	nop
	beqz $s2 A_run_L14
	move $s1, $s2
	b A_run_L15
A_run_L14:
	li $s2, 1
	beqz $s2 A_run_L18
	li $s4, 0
	move $s4, $s4
	b A_run_L19
A_run_L18:
	move $s4, $s2
A_run_L19:
	nop
	move $s1, $s4
A_run_L15:
	nop
	beqz $s1 A_run_L12
	li $s2, 0
	move $s2, $s2
	b A_run_L13
A_run_L12:
	move $s2, $s1
A_run_L13:
	nop
	beqz $s2 A_run_L11
	lw $v0, 8($s3)
	move $s1, $v0
	sw $s1, 4($s3)
A_run_L11:
	nop
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
	.globl A_one
A_one:
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
	li $s0, 1
	sw $s0, 8($s1)
	li $s0, 1
	sw $s0, 4($s1)
	lw $v0, 8($s1)
	move $s0, $v0
	beqz $s0 A_one_L21
	lw $v0, 4($s1)
	move $s2, $v0
	move $s2, $s2
	b A_one_L22
A_one_L21:
	move $s2, $s0
A_one_L22:
	nop
	beqz $s2 A_one_L20
	li $s0, 999
	move $a0, $s0
	jal _print
A_one_L20:
	nop
	li $s0, 1
	lw $v0, 8($s1)
	move $s2, $v0
	beqz $s2 A_one_L25
	move $s2, $s2
	b A_one_L26
A_one_L25:
	lw $v0, 4($s1)
	move $s3, $v0
	move $s2, $s3
A_one_L26:
	nop
	sub $s0, $s0, $s2
	beqz $s0 A_one_L23
	li $s3, 888
	move $a0, $s3
	jal _print
	b A_one_L24
A_one_L23:
	li $s0, 333
	move $a0, $s0
	jal _print
A_one_L24:
	nop
	li $s0, 1
	lw $v0, 8($s1)
	move $s2, $v0
	beqz $s2 A_one_L30
	lw $v0, 4($s1)
	move $s3, $v0
	move $s4, $s3
	b A_one_L31
A_one_L30:
	move $s4, $s2
A_one_L31:
	nop
	sub $s0, $s0, $s4
	beqz $s0 A_one_L28
	move $s0, $s0
	b A_one_L29
A_one_L28:
	lw $v0, 4($s1)
	move $s2, $v0
	beqz $s2 A_one_L32
	move $s3, $s2
	b A_one_L33
A_one_L32:
	lw $v0, 8($s1)
	move $s2, $v0
	move $s3, $s2
A_one_L33:
	nop
	move $s0, $s3
A_one_L29:
	nop
	beqz $s0 A_one_L27
	li $s0, 1
	sw $s0, 12($s1)
A_one_L27:
	nop
	lw $v0, 8($s1)
	move $s0, $v0
	beqz $s0 A_one_L35
	lw $v0, 8($s1)
	move $s2, $v0
	beqz $s2 A_one_L37
	lw $v0, 4($s1)
	move $s3, $v0
	move $s3, $s3
	b A_one_L38
A_one_L37:
	move $s3, $s2
A_one_L38:
	nop
	move $s2, $s3
	b A_one_L36
A_one_L35:
	move $s2, $s0
A_one_L36:
	nop
	beqz $s2 A_one_L34
	li $s0, 1
	sw $s0, 12($s1)
A_one_L34:
	nop
	lw $v0, 12($s1)
	move $s0, $v0
	li $s1, 11
	add $s0, $s0, $s1
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
	.globl A_set
A_set:
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
	move $s1, $a1
	sw $s1, 12($s0)
	li $s0, 0
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
