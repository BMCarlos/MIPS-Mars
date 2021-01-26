#Carlos Martinez-Bravo
#CSC 263-01
#Lab 4-11
.data 
	spc: .space 100 
	ustr: .asciiz "Enter string: " 
	lstr: .asciiz "LowerCased: " 

.text 
main: 
	la $a0, ustr 	# Print loaded string 
	li $v0, 4 
	syscall 

	li $v0, 8 	# input 
	la $a0, spc 	# load byte space into address 
	li $a1, 100 	# allotting space
	syscall 
	move $s0, $a0 	

	li $v0, 4 
	li $t0, 0 

			#Loop to lower the case 
loop: 
	lb $t1, spc($t0) 	
	beq $t1, 0, exit 	
	blt $t1, 'A', lower 	 
	bgt $t1, 'Z', lower 	
	add $t1, $t1, 32 	
	sb $t1, spc($t0) 	

				#if lower, then increment $t0
lower: 
	addi $t0, $t0, 1 
	j loop 

exit: 
	la $a0, lstr 		# prints lower case 
	li $v0, 4 
	syscall 

	move $a0, $s0 		
	li $v0, 4 		# print string 
	syscall 
	li $v0, 10 		# end program
	syscall