#Carlos Martinez-Bravo
#CSC 263-01
#Lab 3-1 
#Write a complete program to find the absolute value of any number.
#The program should prompt the user for a number and then display the absolute value of the number. 
#You must use a beq instruction in your MIPS coding. Do not use the neg pseudo instruction.
.data
	prompt: .asciiz "\n Enter an integer to get the absolute value ****"
	uinput: .asciiz "\n User input: "
	output: .asciiz "\n The absolute value is "
	integer: .word 0
	absinteger: .word 0
	
.text
main:
	#Display message to user
	li $v0, 4
	la $a0, prompt
	syscall
	#Get user input
	li $v0, 5
	syscall
	#Store user input
	sw $v0, integer
	lw $t0, integer
	#Display user input message
	li $v0, 4
	la $a0, uinput
	syscall
	#Output the user input back to the user
	li $v0, 1
	lw $a0, integer
	syscall
	#Absolute value determination
	#la $a0, integer
	#lw $t0, ($a0)
	#ori $t1, $zero, $t0
	slt $t3, $t0, $zero
	beq $t3, $zero, printMessage
	#Absolute value
	abs $t0, $t0
	sw $t0, absinteger
	#Abs result
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 1
	lw $a0, absinteger
	syscall
	#End main
	li $v0,10
	syscall
	#Absolute value result message
	printMessage:
		li $v0, 4
		la $a0, output
		syscall
	#Absolute value output
		li $v0, 1
		lw $a0, integer
		syscall