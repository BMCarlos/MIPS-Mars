#Carlos Martinez-Bravo
#CSC 263-01
#Lab 1-Example 1
.text
.globl main
main:li $v0, 4 # load sys call code for print string to $v0  
	la $a0, prompt # address of string to print
	syscall # print the string
	li $v0, 1 # sys call for print integer
	lb $a0, val # load the integer byte to print to $a0
	syscall # print it
	addi   $t0, $t0, 1 #increment the value of $t0 by 1
	li $v0,  10 #sys call for exitsyscall
	.data
	prompt:	.asciiz	"your code is: " 
	val:	.byte	8