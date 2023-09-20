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
	li $s0, 24
	move $a0, $s0
	jal _halloc
	move $s3, $v0
	la $s4, BS_Start
	sw $s4, 20($s3)
	la $s4, BS_Search
	sw $s4, 16($s3)
	la $s4, BS_Div
	sw $s4, 12($s3)
	la $s4, BS_Compare
	sw $s4, 8($s3)
	la $s4, BS_Print
	sw $s4, 4($s3)
	la $s4, BS_Init
	sw $s4, 0($s3)
	sw $s3, 0($s1)
	lw $v0, 0($s1)
	move $s4, $v0
	lw $v0, 20($s4)
	move $s4, $v0
	li $s2, 20
	li $s5, 0
	add $s0, $s2, $s5
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
	jalr $s4
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
	move $s3, $v0
	move $a0, $s3
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 52
	jr $ra
	.text
	.globl BS_Start
BS_Start:
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
	lw $v0, 0($s2)
	move $s1, $v0
	lw $v0, 16($s1)
	move $s1, $v0
	li $s3, 8
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
	beqz $s0 BS_Start_L1
	li $s0, 1
	li $s1, 0
	add $s3, $s0, $s1
	move $a0, $s3
	jal _print
	b BS_Start_L2
BS_Start_L1:
	li $s0, 0
	li $s1, 0
	add $s0, $s0, $s1
	move $a0, $s0
	jal _print
BS_Start_L2:
	nop
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 16($s0)
	move $s0, $v0
	li $s1, 19
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
	beqz $s0 BS_Start_L3
	li $s0, 1
	li $s3, 0
	add $s1, $s0, $s3
	move $a0, $s1
	jal _print
	b BS_Start_L4
BS_Start_L3:
	li $s0, 0
	li $s1, 0
	add $s0, $s0, $s1
	move $a0, $s0
	jal _print
BS_Start_L4:
	nop
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 16($s0)
	move $s0, $v0
	li $s1, 20
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
	beqz $s0 BS_Start_L5
	li $s0, 1
	li $s3, 0
	add $s1, $s0, $s3
	move $a0, $s1
	jal _print
	b BS_Start_L6
BS_Start_L5:
	li $s0, 0
	li $s1, 0
	add $s0, $s0, $s1
	move $a0, $s0
	jal _print
BS_Start_L6:
	nop
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 16($s0)
	move $s0, $v0
	li $s1, 21
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
	beqz $s0 BS_Start_L7
	li $s0, 1
	li $s3, 0
	add $s1, $s0, $s3
	move $a0, $s1
	jal _print
	b BS_Start_L8
BS_Start_L7:
	li $s0, 0
	li $s1, 0
	add $s0, $s0, $s1
	move $a0, $s0
	jal _print
BS_Start_L8:
	nop
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 16($s0)
	move $s0, $v0
	li $s1, 37
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
	beqz $s0 BS_Start_L9
	li $s0, 1
	li $s3, 0
	add $s1, $s0, $s3
	move $a0, $s1
	jal _print
	b BS_Start_L10
BS_Start_L9:
	li $s0, 0
	li $s1, 0
	add $s0, $s0, $s1
	move $a0, $s0
	jal _print
BS_Start_L10:
	nop
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 16($s0)
	move $s0, $v0
	li $s1, 38
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
	beqz $s0 BS_Start_L11
	li $s0, 1
	li $s3, 0
	add $s1, $s0, $s3
	move $a0, $s1
	jal _print
	b BS_Start_L12
BS_Start_L11:
	li $s0, 0
	li $s1, 0
	add $s0, $s0, $s1
	move $a0, $s0
	jal _print
BS_Start_L12:
	nop
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 16($s0)
	move $s0, $v0
	li $s1, 39
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
	beqz $s0 BS_Start_L13
	li $s0, 1
	li $s3, 0
	add $s1, $s0, $s3
	move $a0, $s1
	jal _print
	b BS_Start_L14
BS_Start_L13:
	li $s0, 0
	li $s1, 0
	add $s0, $s0, $s1
	move $a0, $s0
	jal _print
BS_Start_L14:
	nop
	lw $v0, 0($s2)
	move $s0, $v0
	lw $v0, 16($s0)
	move $s0, $v0
	li $s1, 50
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
	beqz $s0 BS_Start_L15
	li $s0, 1
	li $s2, 0
	add $s1, $s0, $s2
	move $a0, $s1
	jal _print
	b BS_Start_L16
BS_Start_L15:
	li $s0, 0
	li $s1, 0
	add $s0, $s0, $s1
	move $a0, $s0
	jal _print
BS_Start_L16:
	nop
	li $s0, 999
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
	addu $sp, $sp, 84
	lw $fp, -8($fp)
	jr $ra
	.text
	.globl BS_Search
BS_Search:
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
	move $s1, $a0
	move $s2, $a1
	li $s0, 0
	move $s0, $s0
	li $s3, 0
	move $v1, $s3
	lw $v0, 8($s1)
	move $s3, $v0
	lw $v0, 0($s3)
	move $s3, $v0
	sub $s3, $s3, 1
	move $s3, $s3
	li $s4, 1
	sub $s4, $s3, $s4
	move $s3, $s4
	li $s4, 0
	move $s4, $s4
	li $s5, 1
	move $s5, $s5
BS_Search_L1:
	beqz $s5 BS_Search_L2
	add $s6, $s4, $s3
	move $s6, $s6
	lw $v0, 0($s1)
	move $s7, $v0
	lw $v0, 12($s7)
	move $s7, $v0
	move $a0, $s1
	move $a1, $s6
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
	jalr $s7
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
	move $s7, $v0
	move $s6, $s7
	lw $v0, 8($s1)
	move $s7, $v0
	mul $t0, $s6, 4
	add $t0, $t0, 4
	add $s7, $s7, $t0
	lw $v0, 0($s7)
	move $t0, $v0
	move $s0, $t0
	li $t0, 1
	sub $t0, $s0, $t0
	sle $s7, $s2, $t0
	beqz $s7 BS_Search_L3
	li $s7, 1
	sub $s7, $s6, $s7
	move $s3, $s7
	b BS_Search_L4
BS_Search_L3:
	li $s7, 1
	add $s6, $s6, $s7
	move $s4, $s6
BS_Search_L4:
	nop
	lw $v0, 0($s1)
	move $s6, $v0
	lw $v0, 8($s6)
	move $s6, $v0
	move $a0, $s1
	move $a1, $s0
	move $a2, $s2
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
	jalr $s6
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
	move $s6, $v0
	beqz $s6 BS_Search_L5
	li $s6, 0
	move $s5, $s6
	b BS_Search_L6
BS_Search_L5:
	li $s6, 1
	move $s5, $s6
BS_Search_L6:
	nop
	li $s6, 1
	sub $s6, $s4, $s6
	sle $s6, $s3, $s6
	beqz $s6 BS_Search_L7
	li $s6, 0
	move $s5, $s6
	b BS_Search_L8
BS_Search_L7:
	li $s6, 0
	move $v1, $s6
BS_Search_L8:
	nop
	b BS_Search_L1
BS_Search_L2:
	nop
	lw $v0, 0($s1)
	move $s3, $v0
	lw $v0, 8($s3)
	move $s3, $v0
	move $a0, $s1
	move $a1, $s0
	move $a2, $s2
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
	move $s1, $v0
	beqz $s1 BS_Search_L9
	li $s1, 1
	move $s1, $s1
	b BS_Search_L10
BS_Search_L9:
	li $s3, 0
	move $s1, $s3
BS_Search_L10:
	nop
	move $a0, $s0
	jal _print
	move $a0, $s2
	jal _print
	move $v0, $s1
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
	.globl BS_Div
BS_Div:
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
	move $s0, $s0
	li $s2, 0
	move $s2, $s2
	li $s3, 1
	sub $s1, $s1, $s3
	move $s1, $s1
BS_Div_L1:
	sle $s3, $s2, $s1
	beqz $s3 BS_Div_L3
	sne $s4, $s2, $s1
	move $s4, $s4
	b BS_Div_L4
BS_Div_L3:
	move $s4, $s3
BS_Div_L4:
	nop
	beqz $s4 BS_Div_L2
	li $s3, 1
	add $s3, $s0, $s3
	move $s0, $s3
	li $s3, 2
	add $s3, $s2, $s3
	move $s2, $s3
	b BS_Div_L1
BS_Div_L2:
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
	.globl BS_Compare
BS_Compare:
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
	move $s2, $a1
	move $s1, $a2
	li $s0, 0
	move $v1, $s0
	li $s0, 1
	add $s0, $s1, $s0
	move $s0, $s0
	li $s3, 1
	sub $s1, $s1, $s3
	sle $s1, $s2, $s1
	beqz $s1 BS_Compare_L1
	li $s1, 0
	move $s1, $s1
	b BS_Compare_L2
BS_Compare_L1:
	li $s3, 1
	li $s4, 1
	sub $s0, $s0, $s4
	sle $s0, $s2, $s0
	sub $s0, $s3, $s0
	beqz $s0 BS_Compare_L3
	li $s4, 0
	move $s1, $s4
	b BS_Compare_L4
BS_Compare_L3:
	li $s0, 1
	move $s1, $s0
BS_Compare_L4:
	nop
BS_Compare_L2:
	nop
	move $v0, $s1
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
	.globl BS_Print
BS_Print:
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
BS_Print_L1:
	lw $v0, 4($s1)
	move $s2, $v0
	sle $s2, $s0, $s2
	beqz $s2 BS_Print_L3
	lw $v0, 4($s1)
	move $s3, $v0
	sne $s3, $s0, $s3
	move $s3, $s3
	b BS_Print_L4
BS_Print_L3:
	move $s3, $s2
BS_Print_L4:
	nop
	beqz $s3 BS_Print_L2
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
	b BS_Print_L1
BS_Print_L2:
	nop
	li $s0, 9999
	li $s1, 0
	add $s0, $s0, $s1
	move $a0, $s0
	jal _print
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
	.globl BS_Init
BS_Init:
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
BS_Init_L1:
	sle $s0, $s5, $s2
	beqz $s0 BS_Init_L2
	add $s6, $s3, $s5
	sw $s4, 0($s6)
	add $s5, $s5, 4
	b BS_Init_L1
BS_Init_L2:
	nop
	sw $s3, 8($s1)
	lw $v0, 8($s1)
	move $s0, $v0
	li $s5, 0
	mul $s2, $s5, 4
	add $s2, $s2, 4
	add $s2, $s2, $s0
	li $s6, 0
	sw $s6, 0($s2)
	li $s5, 1
	move $s0, $s5
	lw $v0, 4($s1)
	move $s4, $v0
	li $s2, 1
	add $s6, $s4, $s2
	move $s2, $s6
BS_Init_L3:
	lw $v0, 4($s1)
	move $s3, $v0
	li $s4, 1
	sub $s3, $s3, $s4
	sle $s3, $s0, $s3
	beqz $s3 BS_Init_L4
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
	b BS_Init_L3
BS_Init_L4:
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
