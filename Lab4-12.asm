#Carlos Martinez-Bravo
#CSC 263-01
#Lab 4-12
.data
	sum: .asciiz "Sum of squares from 1-10 is "
.text
	
main:
	li $v0, 4
	la $a0, sum
	syscall		#Print msg
	
	li $t0, 0	
	li $t2, 0	
	li $s0, 1	
	
	sumOfSquares:
	mult $s0, $s0	#squares the number
	mflo $t1	
	add $t2, $t2, $t1	#calculates sum
	addi $s0, $s0, 1	#increments square
	addi $t0, $t0, 1	#increments count
	bne $t0, 10, sumOfSquares	#if i != 10 execute sumOfSquares
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall
	