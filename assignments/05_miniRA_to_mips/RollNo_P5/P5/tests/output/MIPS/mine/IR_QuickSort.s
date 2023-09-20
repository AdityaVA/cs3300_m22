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
	la $s3, QS_Start
	sw $s3, 12($s2)
	la $s3, QS_Sort
	sw $s3, 8($s2)
	la $s3, QS_Print
	sw $s3, 4($s2)
	la $s3, QS_Init
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
	.globl QS_Start
QS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 88
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
	lw $v0, 4($s0)
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
	lw $v0, 4($s2)
	move $s0, $v0
	li $s1, 1
	sub $s0, $s0, $s1
	move $s0, $s0
	lw $v0, 0($s2)
	move $s1, $v0
	lw $v0, 8($s1)
	move $s1, $v0
	li $s3, 0
	move $a0, $s2
	move $a1, $s3
	move $a2, $s0
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
	lw $v0, 4($s0)
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
	addu $sp, $sp, 88
	lw $fp, -8($fp)
	jr $ra
	.text
	.globl QS_Sort
QS_Sort:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 88
	sw $s0 -12 ($fp)
	sw $s1 -16 ($fp)
	sw $s2 -20 ($fp)
	sw $s3 -24 ($fp)
	sw $s4 -28 ($fp)
	sw $s5 -32 ($fp)
	sw $s6 -36 ($fp)
	sw $s7 -40 ($fp)
	move $s2, $a0
	move $s1, $a1
	move $s3, $a2
	li $s0, 0
	move $s0, $s0
	sle $s4, $s1, $s3
	beqz $s4 QS_Sort_L3
	sne $s5, $s1, $s3
	move $s5, $s5
	b QS_Sort_L4
QS_Sort_L3:
	move $s5, $s4
QS_Sort_L4:
	nop
	beqz $s5 QS_Sort_L1
	lw $v0, 8($s2)
	move $s4, $v0
	mul $s5, $s3, 4
	add $s5, $s5, 4
	add $s4, $s4, $s5
	lw $v0, 0($s4)
	move $s5, $v0
	move $s5, $s5
	li $s6, 1
	sub $s4, $s1, $s6
	move $s4, $s4
	move $s6, $s3
	li $s7, 1
	move $s7, $s7
QS_Sort_L5:
	beqz $s7 QS_Sort_L6
	li $t0, 1
	move $t0, $t0
QS_Sort_L7:
	beqz $t0 QS_Sort_L8
	li $t1, 1
	add $t1, $s4, $t1
	move $s4, $t1
	lw $v0, 8($s2)
	move $t1, $v0
	mul $t2, $s4, 4
	add $t2, $t2, 4
	add $t1, $t1, $t2
	lw $v0, 0($t1)
	move $t2, $v0
	move $t2, $t2
	li $t3, 1
	li $t4, 1
	sub $t5, $s5, $t4
	sle $t5, $t2, $t5
	sub $t1, $t3, $t5
	beqz $t1 QS_Sort_L9
	li $t4, 0
	move $t0, $t4
	b QS_Sort_L10
QS_Sort_L9:
	li $t1, 1
	move $t0, $t1
QS_Sort_L10:
	nop
	b QS_Sort_L7
QS_Sort_L8:
	nop
	li $t1, 1
	move $t0, $t1
QS_Sort_L11:
	beqz $t0 QS_Sort_L12
	li $t1, 1
	sub $t1, $s6, $t1
	move $s6, $t1
	lw $v0, 8($s2)
	move $t1, $v0
	mul $t3, $s6, 4
	add $t3, $t3, 4
	add $t1, $t1, $t3
	lw $v0, 0($t1)
	move $t3, $v0
	move $t2, $t3
	li $t3, 1
	li $t4, 1
	sub $t2, $t2, $t4
	sle $t2, $s5, $t2
	sub $t1, $t3, $t2
	beqz $t1 QS_Sort_L13
	li $t4, 0
	move $t0, $t4
	b QS_Sort_L14
QS_Sort_L13:
	li $t1, 1
	move $t0, $t1
QS_Sort_L14:
	nop
	b QS_Sort_L11
QS_Sort_L12:
	nop
	lw $v0, 8($s2)
	move $t0, $v0
	mul $t1, $s4, 4
	add $t1, $t1, 4
	add $t0, $t0, $t1
	lw $v0, 0($t0)
	move $t1, $v0
	move $s0, $t1
	lw $v0, 8($s2)
	move $t0, $v0
	mul $t1, $s4, 4
	add $t1, $t1, 4
	add $t1, $t1, $t0
	lw $v0, 8($s2)
	move $t0, $v0
	mul $t2, $s6, 4
	add $t2, $t2, 4
	add $t3, $t0, $t2
	lw $v0, 0($t3)
	move $t4, $v0
	sw $t4, 0($t1)
	lw $v0, 8($s2)
	move $t0, $v0
	mul $t2, $s6, 4
	add $t2, $t2, 4
	add $t2, $t2, $t0
	sw $s0, 0($t2)
	sle $t3, $s6, $s4
	beqz $t3 QS_Sort_L15
	li $t0, 0
	move $s7, $t0
	b QS_Sort_L16
QS_Sort_L15:
	li $t0, 1
	move $s7, $t0
QS_Sort_L16:
	nop
	b QS_Sort_L5
QS_Sort_L6:
	nop
	lw $v0, 8($s2)
	move $s5, $v0
	mul $s6, $s6, 4
	add $s6, $s6, 4
	add $s6, $s6, $s5
	lw $v0, 8($s2)
	move $s5, $v0
	mul $s7, $s4, 4
	add $s7, $s7, 4
	add $t0, $s5, $s7
	lw $v0, 0($t0)
	move $t0, $v0
	sw $t0, 0($s6)
	lw $v0, 8($s2)
	move $s5, $v0
	mul $s7, $s4, 4
	add $s7, $s7, 4
	add $s7, $s7, $s5
	lw $v0, 8($s2)
	move $s5, $v0
	mul $s6, $s3, 4
	add $s6, $s6, 4
	add $t0, $s5, $s6
	lw $v0, 0($t0)
	move $t1, $v0
	sw $t1, 0($s7)
	lw $v0, 8($s2)
	move $s5, $v0
	mul $s6, $s3, 4
	add $s6, $s6, 4
	add $s6, $s6, $s5
	sw $s0, 0($s6)
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 8($s0)
	move $s0, $v0
	li $s5, 1
	sub $s6, $s4, $s5
	move $a0, $s2
	move $a1, $s1
	move $a2, $s6
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
	move $t0, $v0
	move $v1, $t0
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 8($s0)
	move $s0, $v0
	li $s1, 1
	add $s1, $s4, $s1
	move $a0, $s2
	move $a1, $s1
	move $a2, $s3
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
	move $s5, $v0
	move $v1, $s5
	b QS_Sort_L2
QS_Sort_L1:
	li $s0, 0
	move $v1, $s0
QS_Sort_L2:
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
	addu $sp, $sp, 88
	lw $fp, -8($fp)
	jr $ra
	.text
	.globl QS_Print
QS_Print:
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
	move $s0, $s0
QS_Print_L1:
	lw $v0, 4($s1)
	move $s2, $v0
	li $s3, 1
	sub $s2, $s2, $s3
	sle $s2, $s0, $s2
	beqz $s2 QS_Print_L2
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
	b QS_Print_L1
QS_Print_L2:
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
	.globl QS_Init
QS_Init:
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
QS_Init_L1:
	sle $s0, $s5, $s2
	beqz $s0 QS_Init_L2
	add $s6, $s3, $s5
	sw $s4, 0($s6)
	add $s5, $s5, 4
	b QS_Init_L1
QS_Init_L2:
	nop
	sw $s3, 8($s1)
	lw $v0, 8($s1)
	move $s0, $v0
	li $s5, 0
	mul $s2, $s5, 4
	add $s2, $s2, 4
	add $s2, $s2, $s0
	li $s6, 20
	sw $s6, 0($s2)
	lw $v0, 8($s1)
	move $s5, $v0
	li $s4, 1
	mul $s6, $s4, 4
	add $s6, $s6, 4
	add $s6, $s6, $s5
	li $s0, 7
	sw $s0, 0($s6)
	lw $v0, 8($s1)
	move $s4, $v0
	li $s2, 2
	mul $s0, $s2, 4
	add $s0, $s0, 4
	add $s0, $s0, $s4
	li $s3, 12
	sw $s3, 0($s0)
	lw $v0, 8($s1)
	move $s2, $v0
	li $s0, 3
	mul $s3, $s0, 4
	add $s3, $s3, 4
	add $s3, $s3, $s2
	li $s2, 18
	sw $s2, 0($s3)
	lw $v0, 8($s1)
	move $s0, $v0
	li $s3, 4
	mul $s2, $s3, 4
	add $s2, $s2, 4
	add $s2, $s2, $s0
	li $s0, 2
	sw $s0, 0($s2)
	lw $v0, 8($s1)
	move $s3, $v0
	li $s2, 5
	mul $s0, $s2, 4
	add $s0, $s0, 4
	add $s0, $s0, $s3
	li $s3, 11
	sw $s3, 0($s0)
	lw $v0, 8($s1)
	move $s2, $v0
	li $s0, 6
	mul $s3, $s0, 4
	add $s3, $s3, 4
	add $s3, $s3, $s2
	li $s2, 6
	sw $s2, 0($s3)
	lw $v0, 8($s1)
	move $s0, $v0
	li $s3, 7
	mul $s2, $s3, 4
	add $s2, $s2, 4
	add $s2, $s2, $s0
	li $s0, 9
	sw $s0, 0($s2)
	lw $v0, 8($s1)
	move $s3, $v0
	li $s2, 8
	mul $s0, $s2, 4
	add $s0, $s0, 4
	add $s0, $s0, $s3
	li $s3, 19
	sw $s3, 0($s0)
	lw $v0, 8($s1)
	move $s2, $v0
	li $s0, 9
	mul $s3, $s0, 4
	add $s3, $s3, 4
	add $s3, $s3, $s2
	li $s1, 5
	sw $s1, 0($s3)
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
