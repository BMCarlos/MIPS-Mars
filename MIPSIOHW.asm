#Carlos Martinez-Bravo
#MIPS I/O HW
#
# MIPS program that prompts a user for their age and then prints out their age to the screen
#  
#
	.data
	prompt: .asciiz "\n What is your age?: "
	result: .asciiz "\n Your age is:  "
	.globl  main 
	.text
	main:
	# read first number
	# system call code for print string  
	li     $v0, 4             
	# system call code for print string  
	la     $a0, prompt   
	# load addr of prompt in $a0  
	syscall    # print prompt  

	li     $v0, 5   # system call code for read int  
	syscall         # read num1 into $v0  
	add    $t0, $zero, $v0      # add num1 to sum
 	# prints the age entered
 	li     $v0, 4             # system call code for print string
	 la     $a0, result     # load addr of result msg in $a0
 	syscall                   # print result msg 
 	li     $v0, 1             # system call code for print int 
 	move   $a0, $t0    # copy age into $a0 
 	syscall                  # print age
 	# exit from program
 	li     $v0, 10            # terminate execution and
 	 syscall                  # return control to system
  
