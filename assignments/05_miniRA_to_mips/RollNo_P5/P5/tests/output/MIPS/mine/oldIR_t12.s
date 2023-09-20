	.text
	.globl main
main:
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 48
	li $s0, 8
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	li $s2, 0
	sw $s2, 0($s1)
	sw $s2, 4($s1)
	li $s0, 20
	move $a0, $s0
	jal _halloc
	move $s0, $v0
	la $s2, DLList_go
	sw $s2, 16($s0)
	la $s2, DLList_init
	sw $s2, 12($s0)
	la $s2, DLList_insert
	sw $s2, 8($s0)
	la $s2, DLList_delete
	sw $s2, 4($s0)
	la $s2, DLList_print
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 16($s2)
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
	.globl Node_init
Node_init:
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
	sw $s0, 8($s0)
	sw $s0, 4($s0)
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
	.globl Node_addl
Node_addl:
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
	sw $s1, 8($s0)
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
	.globl Node_addr
Node_addr:
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
	sw $s1, 4($s0)
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
	.globl Node_hasright
Node_hasright:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 80
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
	lw $v0, 4($s1)
	move $s2, $v0
	lw $v0, 0($s2)
	move $s3, $v0
	lw $v0, 8($s3)
	move $s3, $v0
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
	move $s2, $v0
	lw $v0, 0($s1)
	move $s4, $v0
	lw $v0, 8($s4)
	move $s4, $v0
	move $a0, $s1
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
	jalr $s4
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
	sne $s1, $s2, $s3
	beqz $s1 Node_hasright_L1
	li $s4, 1
	move $s0, $s4
Node_hasright_L1:
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
	addu $sp, $sp, 80
	lw $fp, -8($fp)
	jr $ra
	.text
	.globl Node_getval
Node_getval:
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
	lw $v0, 12($s0)
	move $s1, $v0
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
	.globl Node_getright
Node_getright:
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
	lw $v0, 4($s0)
	move $s1, $v0
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
	.globl Node_getleft
Node_getleft:
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
	lw $v0, 8($s0)
	move $s1, $v0
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
	.globl DLList_go
DLList_go:
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
	move $s1, $a0
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 12($s0)
	move $s0, $v0
	li $s2, 10
	move $a0, $s1
	move $a1, $s2
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
	move $v1, $s0
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $s2, $v0
	move $v1, $s2
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 8($s2)
	move $s2, $v0
	li $s3, 1
	move $a0, $s1
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
	jalr $s2
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
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $v1, $s3
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 8($s2)
	move $s2, $v0
	li $s3, 2
	move $a0, $s1
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
	jalr $s2
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
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $v1, $s3
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 8($s2)
	move $s2, $v0
	li $s3, 3
	move $a0, $s1
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
	jalr $s2
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
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $v1, $s3
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 8($s2)
	move $s2, $v0
	li $s3, 4
	move $a0, $s1
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
	jalr $s2
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
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $v1, $s3
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 8($s2)
	move $s2, $v0
	li $s3, 5
	move $a0, $s1
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
	jalr $s2
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
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $v1, $s3
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 8($s2)
	move $s2, $v0
	li $s3, 6
	move $a0, $s1
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
	jalr $s2
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
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $v1, $s3
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 4($s2)
	move $s2, $v0
	li $s3, 4
	move $a0, $s1
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
	jalr $s2
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
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $v1, $s3
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 4($s2)
	move $s2, $v0
	li $s3, 5
	move $a0, $s1
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
	jalr $s2
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
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $v1, $s3
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 8($s2)
	move $s2, $v0
	li $s3, 6
	move $a0, $s1
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
	jalr $s2
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
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $v1, $s3
	lw $v0, 0($s1)
	move $s2, $v0
	lw $v0, 4($s2)
	move $s2, $v0
	li $s3, 6
	move $a0, $s1
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
	jalr $s2
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
	lw $v0, 0($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s0, $v0
	move $a0, $s1
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
	move $v1, $s3
	li $s0, 10
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
	.globl DLList_init
DLList_init:
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
	move $s1, $a0
	move $s2, $a1
	li $s0, 0
	move $s0, $s0
	li $s3, 1
	move $s3, $s3
	li $s4, 1
	li $s5, 0
	sne $s6, $s2, $s5
	sub $s4, $s4, $s6
	beqz $s4 DLList_init_L2
	li $s5, 0
	move $s3, $s5
DLList_init_L2:
	nop
	li $s4, 0
	sne $s3, $s3, $s4
	beqz $s3 DLList_init_L3
	li $s3, 16
	move $a0, $s3
	jal _halloc
	move $s4, $v0
	li $s5, 0
	sw $s5, 0($s4)
	sw $s5, 4($s4)
	sw $s5, 8($s4)
	sw $s5, 12($s4)
	li $s3, 28
	move $a0, $s3
	jal _halloc
	move $s6, $v0
	la $s7, Node_init
	sw $s7, 24($s6)
	la $s7, Node_addl
	sw $s7, 20($s6)
	la $s7, Node_addr
	sw $s7, 16($s6)
	la $s7, Node_hasright
	sw $s7, 12($s6)
	la $s7, Node_getval
	sw $s7, 8($s6)
	la $s7, Node_getright
	sw $s7, 4($s6)
	la $s7, Node_getleft
	sw $s7, 0($s6)
	sw $s6, 0($s4)
	sw $s4, 4($s1)
	lw $v0, 4($s1)
	move $s6, $v0
	lw $v0, 0($s6)
	move $s3, $v0
	lw $v0, 24($s3)
	move $s3, $v0
	li $s5, 12
	move $a0, $s6
	move $a1, $s5
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
	move $s7, $v0
	move $v1, $s7
	lw $v0, 4($s1)
	move $s5, $v0
	move $s1, $s5
DLList_init_L4:
	li $s3, 2
	sub $s3, $s2, $s3
	sle $s3, $s0, $s3
	beqz $s3 DLList_init_L5
	li $s3, 16
	move $a0, $s3
	jal _halloc
	move $s4, $v0
	li $s5, 0
	sw $s5, 0($s4)
	sw $s5, 4($s4)
	sw $s5, 8($s4)
	sw $s5, 12($s4)
	li $s3, 28
	move $a0, $s3
	jal _halloc
	move $s6, $v0
	la $s7, Node_init
	sw $s7, 24($s6)
	la $s7, Node_addl
	sw $s7, 20($s6)
	la $s7, Node_addr
	sw $s7, 16($s6)
	la $s7, Node_hasright
	sw $s7, 12($s6)
	la $s7, Node_getval
	sw $s7, 8($s6)
	la $s7, Node_getright
	sw $s7, 4($s6)
	la $s7, Node_getleft
	sw $s7, 0($s6)
	sw $s6, 0($s4)
	move $s4, $s4
	lw $v0, 0($s4)
	move $s3, $v0
	lw $v0, 24($s3)
	move $s3, $v0
	li $s6, 15
	li $t0, 1
	sub $t0, $s0, $t0
	mul $t0, $s0, $t0
	add $s5, $s6, $t0
	move $a0, $s4
	move $a1, $s5
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
	move $s7, $v0
	move $v1, $s7
	lw $v0, 0($s1)
	move $s3, $v0
	lw $v0, 16($s3)
	move $s3, $v0
	move $a0, $s1
	move $a1, $s4
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
	move $s3, $v0
	move $v1, $s3
	lw $v0, 0($s4)
	move $s3, $v0
	lw $v0, 20($s3)
	move $s3, $v0
	move $a0, $s4
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
	move $s3, $v0
	move $v1, $s3
	move $s1, $s4
	li $s3, 1
	add $s3, $s0, $s3
	move $s0, $s3
	b DLList_init_L4
DLList_init_L5:
	nop
DLList_init_L3:
	nop
	move $v0, $s2
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
	.globl DLList_insert
DLList_insert:
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
	move $s1, $a0
	move $s2, $a1
	li $s0, 16
	move $a0, $s0
	jal _halloc
	move $s3, $v0
	li $s4, 0
	sw $s4, 0($s3)
	sw $s4, 4($s3)
	sw $s4, 8($s3)
	sw $s4, 12($s3)
	li $s0, 28
	move $a0, $s0
	jal _halloc
	move $s4, $v0
	la $s5, Node_init
	sw $s5, 24($s4)
	la $s5, Node_addl
	sw $s5, 20($s4)
	la $s5, Node_addr
	sw $s5, 16($s4)
	la $s5, Node_hasright
	sw $s5, 12($s4)
	la $s5, Node_getval
	sw $s5, 8($s4)
	la $s5, Node_getright
	sw $s5, 4($s4)
	la $s5, Node_getleft
	sw $s5, 0($s4)
	sw $s4, 0($s3)
	move $s3, $s3
	lw $v0, 0($s3)
	move $s0, $v0
	lw $v0, 24($s0)
	move $s0, $v0
	move $a0, $s3
	move $a1, $s2
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
	lw $v0, 0($s3)
	move $s0, $v0
	lw $v0, 16($s0)
	move $s0, $v0
	lw $v0, 4($s1)
	move $s4, $v0
	lw $v0, 0($s4)
	move $s5, $v0
	lw $v0, 4($s5)
	move $s5, $v0
	move $a0, $s4
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
	jalr $s5
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
	move $s4, $v0
	move $a0, $s3
	move $a1, $s4
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
	move $v1, $s0
	lw $v0, 4($s1)
	move $s4, $v0
	lw $v0, 0($s4)
	move $s0, $v0
	lw $v0, 4($s0)
	move $s0, $v0
	move $a0, $s4
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
	lw $v0, 0($s5)
	move $s4, $v0
	lw $v0, 20($s4)
	move $s4, $v0
	move $a0, $s5
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
	jalr $s4
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
	lw $v0, 4($s1)
	move $s0, $v0
	lw $v0, 0($s0)
	move $s4, $v0
	lw $v0, 16($s4)
	move $s4, $v0
	move $a0, $s0
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
	jalr $s4
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
	lw $v0, 0($s3)
	move $s0, $v0
	lw $v0, 20($s0)
	move $s0, $v0
	lw $v0, 4($s1)
	move $s1, $v0
	move $a0, $s3
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
	move $v1, $s0
	move $v0, $s2
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
	.globl DLList_delete
DLList_delete:
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
	move $s0, $a0
	move $s2, $a1
	lw $v0, 4($s0)
	move $s1, $v0
	move $s0, $s1
	li $s1, 1
	lw $v0, 0($s0)
	move $s3, $v0
	lw $v0, 8($s3)
	move $s3, $v0
	move $a0, $s0
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
	move $s3, $v0
	sne $s3, $s3, $s2
	sub $s1, $s1, $s3
	beqz $s1 DLList_delete_L6
	lw $v0, 0($s0)
	move $s1, $v0
	lw $v0, 12($s1)
	move $s1, $v0
	move $a0, $s0
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
	move $s1, $v0
	beqz $s1 DLList_delete_L7
	lw $v0, 0($s0)
	move $s1, $v0
	lw $v0, 4($s1)
	move $s1, $v0
	move $a0, $s0
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
	move $s1, $v0
	move $s1, $s1
	lw $v0, 0($s1)
	move $s3, $v0
	lw $v0, 20($s3)
	move $s3, $v0
	move $a0, $s1
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
	move $s3, $v0
	move $v1, $s3
	move $s0, $s1
	b DLList_delete_L8
DLList_delete_L7:
	li $s3, 999
	move $a0, $s3
	jal _print
DLList_delete_L8:
	nop
DLList_delete_L6:
	nop
DLList_delete_L9:
	lw $v0, 0($s0)
	move $s3, $v0
	lw $v0, 12($s3)
	move $s3, $v0
	move $a0, $s0
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
	move $s3, $v0
	beqz $s3 DLList_delete_L10
	lw $v0, 0($s0)
	move $s3, $v0
	lw $v0, 4($s3)
	move $s3, $v0
	move $a0, $s0
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
	move $s4, $v0
	move $s0, $s4
	li $s4, 1
	lw $v0, 0($s0)
	move $s5, $v0
	lw $v0, 8($s5)
	move $s5, $v0
	move $a0, $s0
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
	jalr $s5
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
	sne $s5, $s5, $s2
	sub $s3, $s4, $s5
	beqz $s3 DLList_delete_L11
	lw $v0, 0($s0)
	move $s3, $v0
	lw $v0, 12($s3)
	move $s3, $v0
	move $a0, $s0
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
	move $s3, $v0
	beqz $s3 DLList_delete_L12
	lw $v0, 0($s0)
	move $s3, $v0
	lw $v0, 4($s3)
	move $s3, $v0
	move $a0, $s0
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
	move $s3, $v0
	move $s1, $s3
	lw $v0, 0($s1)
	move $s3, $v0
	lw $v0, 20($s3)
	move $s3, $v0
	lw $v0, 0($s0)
	move $s4, $v0
	lw $v0, 0($s4)
	move $s4, $v0
	move $a0, $s0
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
	jalr $s4
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
	move $a0, $s1
	move $a1, $s5
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
	move $s3, $v0
	move $v1, $s3
	lw $v0, 0($s0)
	move $s3, $v0
	lw $v0, 0($s3)
	move $s3, $v0
	move $a0, $s0
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
	move $s4, $v0
	lw $v0, 0($s4)
	move $s5, $v0
	lw $v0, 16($s5)
	move $s5, $v0
	move $a0, $s4
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
	jalr $s5
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
	move $v1, $s3
	b DLList_delete_L13
DLList_delete_L12:
	lw $v0, 0($s0)
	move $s1, $v0
	lw $v0, 0($s1)
	move $s1, $v0
	move $a0, $s0
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
	move $s3, $v0
	lw $v0, 0($s3)
	move $s4, $v0
	lw $v0, 16($s4)
	move $s4, $v0
	lw $v0, 0($s0)
	move $s5, $v0
	lw $v0, 0($s5)
	move $s5, $v0
	move $a0, $s0
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
	jalr $s5
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
	move $a0, $s3
	move $a1, $s5
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
	jalr $s4
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
DLList_delete_L13:
	nop
DLList_delete_L11:
	nop
	b DLList_delete_L9
DLList_delete_L10:
	nop
	li $s5, 0
	move $v0, $s5
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
	.globl DLList_print
DLList_print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 80
	sw $s0 -12 ($fp)
	sw $s1 -16 ($fp)
	sw $s2 -20 ($fp)
	sw $s3 -24 ($fp)
	sw $s4 -28 ($fp)
	sw $s5 -32 ($fp)
	sw $s6 -36 ($fp)
	sw $s7 -40 ($fp)
	move $s0, $a0
	lw $v0, 4($s0)
	move $s1, $v0
	move $s0, $s1
	lw $v0, 0($s0)
	move $s1, $v0
	lw $v0, 8($s1)
	move $s1, $v0
	move $a0, $s0
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
	move $s1, $v0
	move $a0, $s1
	jal _print
DLList_print_L14:
	lw $v0, 0($s0)
	move $s1, $v0
	lw $v0, 12($s1)
	move $s1, $v0
	move $a0, $s0
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
	move $s1, $v0
	beqz $s1 DLList_print_L15
	lw $v0, 0($s0)
	move $s1, $v0
	lw $v0, 4($s1)
	move $s1, $v0
	move $a0, $s0
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
	move $s1, $v0
	move $s0, $s1
	lw $v0, 0($s0)
	move $s1, $v0
	lw $v0, 8($s1)
	move $s1, $v0
	move $a0, $s0
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
	move $s2, $v0
	move $a0, $s2
	jal _print
	b DLList_print_L14
DLList_print_L15:
	nop
	li $s1, 0
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
	addu $sp, $sp, 80
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
