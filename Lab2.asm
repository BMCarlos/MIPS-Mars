#Carlos Martinez-Bravo
#CSC 263-01
#Lab 2
#Write a MIPS program that computes the volume and surface area of a rectangular parallelepiped shown below.
#Be sure to prompt the user to enter values for the sides from the keyboard.
#Input the following values from the keyboard:
#aSide = 73
#bSide = 14
#cSide = 16
#The output should display the value of each side and the volume and surface area of the rectangular parallelepiped. 
#Label all values that are printed.
.data
	prompt:	.asciiz "\n Enter values for the sides"
	sidea: .asciiz	"\n aSide = "
	sideb: .asciiz	"\n bSide = "
	sidec: .asciiz	"\n cSide = "
	vol: .asciiz "\n Volume = "
	surfarea: .asciiz "\n Surface Area = "
	numa: .word 0
	numb: .word 0
	numc: .word 0
.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	#input a
	li $v0, 4
	la $a0, sidea
	syscall
	li $v0,	5
	syscall
	sw $v0, numa
	
	#input b
	li $v0, 4
	la $a0, sideb
	syscall
	li $v0,	5
	syscall
	sw $v0, numb
	
	#input c
	li $v0, 4
	la $a0, sidec
	syscall
	li $v0,	5
	syscall
	sw $v0, numc
	
	#loads inputs into temp registers
	lw $t0, numa
	lw $t1, numb
	lw $t2, numc
	
	
	#Volume calculations
	mul $a0, $t1,$t0
	mul $t6,$t2,$a0
	move $t6, $s6
	li $v0, 4
	la $a0, vol
	syscall

	move $s6, $t6
	mflo $s0
	add $a0, $zero, $s0
	li $v0 1
	syscall
	#Surface area calculations
	li $v0, 4
	la $a0, surfarea
	syscall
	
	li $t3, 2
	mul $s1, $t0, $t1
	mul $s2, $t0, $t2
	mul $s3, $t1, $t2
	
	add $s4, $s1,$s2
	add $s5, $s4, $s3
	mul $s7, $t3, $s5
	
	mflo $s0
	add $a0, $zero, $s0
	li $v0 1
	syscall