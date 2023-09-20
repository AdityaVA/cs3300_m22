	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 52
	li $s0, 12
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s2, 0
	sw $s2, 0($s1)
	sw $s2, 4($s1)
	sw $s2, 8($s1)
	li $s0, 16
	move $a0, $s0
	jal _halloc
	move $s2, $v0
	la $s3, LS_Start
	sw $s3, 12($s2)
	la $s3, LS_Print
	sw $s3, 8($s2)
	la $s3, LS_Search
	sw $s3, 4($s2)
	la $s3, LS_Init
	sw $s3, 0($s2)
	sw $s2, 0($s1)
	lw $v0, 0($s1)
	move $s3, $v0
	lw $v0, 12($s3)
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
	.globl LS_Start
LS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 84
	sw $s0 -12 ($fp)
	sw $s1 -16 ($fp)
	sw $s2 -20 ($fp)
	sw $s3 -24 ($fp)
	sw $s4 -28 ($fp)
	sw $s5 -32 ($fp)
	sw $s6 -36 ($fp)
	sw $s7 -40 ($fp)
	move $s2, $a0
	move $s0, $a1
	lw $v0, 0($s2)
	move $s1, $v0
	lw $v0, 0($s1)
	move $s1, $v0
	move $a0, $s2
	move $a1, $s0
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
	jalr $s1
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
	move $s0, $v0
	move $v1, $s0
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 8($s0)
	move $s0, $v0
	move $a0, $s2
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
	jalr $s0
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
	move $s1, $v0
	move $v1, $s1
	li $s0, 9999
	move $a0, $s0
	jal _print
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 4($s0)
	move $s0, $v0
	li $s1, 8
	move $a0, $s2
	move $a1, $s1
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
	jalr $s0
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
	move $s0, $v0
	move $a0, $s0
	jal _print
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 4($s0)
	move $s0, $v0
	li $s3, 12
	move $a0, $s2
	move $a1, $s3
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
	jalr $s0
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
	move $s1, $v0
	move $a0, $s1
	jal _print
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 4($s0)
	move $s0, $v0
	li $s1, 17
	move $a0, $s2
	move $a1, $s1
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
	jalr $s0
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
	move $a0, $s3
	jal _print
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 4($s0)
	move $s0, $v0
	li $s3, 50
	move $a0, $s2
	move $a1, $s3
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
	jalr $s0
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
	move $s1, $v0
	move $a0, $s1
	jal _print
	li $s3, 55
	move $v0, $s3
	lw $s7 -40 ($fp)
	lw $s6 -36 ($fp)
	lw $s5 -32 ($fp)
	lw $s4 -28 ($fp)
	lw $s3 -24 ($fp)
	lw $s2 -20 ($fp)
	lw $s1 -16 ($fp)
	lw $s0 -12 ($fp)
	lw $ra, -4($fp)
	addu $sp, $sp, 84
	lw $fp, -8($fp)
	jr $ra
	.text
	.globl LS_Print
LS_Print:
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
	move $s0, $s0
LS_Print_L1:
	lw $v0, 4($s1)
	move $s2, $v0
	li $s3, 1
	sub $s2, $s2, $s3
	sle $s2, $s0, $s2
	beqz $s2 LS_Print_L2
	lw $v0, 8($s1)
	move $s2, $v0
	mul $s3, $s0, 4
	add $s3, $s3, 4
	add $s2, $s2, $s3
	lw $v0, 0($s2)
	move $s3, $v0
	move $a0, $s3
	jal _print
	li $s3, 1
	add $s2, $s0, $s3
	move $s0, $s2
	b LS_Print_L1
LS_Print_L2:
	nop
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
	.globl LS_Search
LS_Search:
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
	move $s2, $a1
	li $s0, 1
	move $s0, $s0
	li $s3, 0
	move $v1, $s3
	li $s3, 0
	move $s3, $s3
LS_Search_L3:
	lw $v0, 4($s1)
	move $s4, $v0
	li $s5, 1
	sub $s4, $s4, $s5
	sle $s4, $s0, $s4
	beqz $s4 LS_Search_L4
	lw $v0, 8($s1)
	move $s4, $v0
	mul $s5, $s0, 4
	add $s5, $s5, 4
	add $s4, $s4, $s5
	lw $v0, 0($s4)
	move $s5, $v0
	move $s5, $s5
	li $s6, 1
	add $s4, $s2, $s6
	move $s4, $s4
	sle $s6, $s5, $s2
	beqz $s6 LS_Search_L7
	sne $s7, $s5, $s2
	move $s7, $s7
	b LS_Search_L8
LS_Search_L7:
	move $s7, $s6
LS_Search_L8:
	nop
	beqz $s7 LS_Search_L5
	li $s6, 0
	move $v1, $s6
	b LS_Search_L6
LS_Search_L5:
	li $s6, 1
	li $s7, 1
	sub $s4, $s4, $s7
	sle $s4, $s5, $s4
	sub $s4, $s6, $s4
	beqz $s4 LS_Search_L9
	li $s7, 0
	move $v1, $s7
	b LS_Search_L10
LS_Search_L9:
	li $s4, 1
	move $v1, $s4
	li $s4, 1
	move $s3, $s4
	lw $v0, 4($s1)
	move $s4, $v0
	move $s0, $s4
LS_Search_L10:
	nop
LS_Search_L6:
	nop
	li $s4, 1
	add $s4, $s0, $s4
	move $s0, $s4
	b LS_Search_L3
LS_Search_L4:
	nop
	move $v0, $s3
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
	.globl LS_Init
LS_Init:
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
	move $s0, $a1
	sw $s0, 4($s1)
	add $s0, $s0, 1
	mul $s2, $s0, 4
	move $a0, $s2
	jal _halloc
	move $s3, $v0
	sw $s0, 0($s3)
	li $s4, 0
	li $s5, 4
	sub $s2, $s2, 4
LS_Init_L11:
	sle $s0, $s5, $s2
	beqz $s0 LS_Init_L12
	add $s6, $s3, $s5
	sw $s4, 0($s6)
	add $s5, $s5, 4
	b LS_Init_L11
LS_Init_L12:
	nop
	sw $s3, 8($s1)
	li $s0, 1
	move $s0, $s0
	lw $v0, 4($s1)
	move $s5, $v0
	li $s6, 1
	add $s2, $s5, $s6
	move $s2, $s2
LS_Init_L13:
	lw $v0, 4($s1)
	move $s3, $v0
	li $s5, 1
	sub $s3, $s3, $s5
	sle $s4, $s0, $s3
	beqz $s4 LS_Init_L14
	li $s3, 2
	mul $s3, $s3, $s0
	move $s3, $s3
	li $s4, 3
	sub $s4, $s2, $s4
	move $s4, $s4
	lw $v0, 8($s1)
	move $s5, $v0
	mul $s6, $s0, 4
	add $s6, $s6, 4
	add $s6, $s6, $s5
	add $s3, $s3, $s4
	sw $s3, 0($s6)
	li $s3, 1
	add $s3, $s0, $s3
	move $s0, $s3
	li $s3, 1
	sub $s3, $s2, $s3
	move $s2, $s3
	b LS_Init_L13
LS_Init_L14:
	nop
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
