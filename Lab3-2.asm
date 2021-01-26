#Carlos Martinez-Bravo
#CSC 263-01
#Lab 3-2
#Write a complete program that prompts the user for a test score
#and prints out the letter score following the java if-else chain below.
.data
	prompt: .asciiz "\n Enter a score grade between 0-100**** "
	userIn: .asciiz "\n User input: "
	grade: .word 0
	invalidIn: .asciiz "\n Grade must be between 0...100"
	gA: .asciiz "\n Grade is A"
	gB: .asciiz "\n Grade is B"
	gC: .asciiz "\n Grade is C"
	gD: .asciiz "\n Grade is D"
	gF: .asciiz "\n Grade is F"
	
.text
	main:
	#Load in values for each grade
	addi $t0, $zero, 100
	addi $t1, $zero, 90
	addi $t2, $zero, 80
	addi $t3, $zero, 70
	addi $t4, $zero, 60
	
	#Display prompt
	li $v0, 4
	la $a0, prompt
	syscall
	#Get user input
	li $v0, 5
	syscall
	#Store user input
	sw $v0, grade
	lw $t5, grade
	#Display user input message
	li $v0, 4
	la $a0, userIn
	syscall
	#Output the user input back to the user
	li $v0, 1
	lw $a0, grade
	syscall
	
	#Determination
	bge $t5, $t1, gradeA
	bge $t5, $t2, gradeB
	bge $t5, $t3, gradeC
	bge $t5, $t4, gradeD
	blt $t5, $t4, gradeF
	
	blt $t5, $t0, invalid
	bgt $t5, $zero, invalid
	syscall
	#Subroutines for each grade
	gradeA:
	bgt $t5, $t0, invalid			#Branches if t5 is greater than 100. Fix for bug where in > 100 displays A and error msg
	li $v0, 4
	la $a0, gA
	syscall
	
	li $v0,10
	syscall
	gradeB:
	li $v0, 4
	la $a0, gB
	syscall
	
	li $v0,10
	syscall
	gradeC:
	li $v0, 4
	la $a0, gC
	syscall
	
	li $v0,10
	syscall
	gradeD:
	li $v0, 4
	la $a0, gD
	syscall
	
	li $v0,10
	syscall
	gradeF:
	blt $t5, $zero, invalid				#Branches if in < 0. Fix for error where if in < 0 displays F and error msg
	li $v0, 4
	la $a0, gF
	syscall
	
	li $v0,10
	syscall
	invalid:
	li $v0, 4
	la $a0, invalidIn
	syscall
	
	li $v0,10
	syscall
	