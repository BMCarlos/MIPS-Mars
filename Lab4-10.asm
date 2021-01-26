#Carlos Martinez-Bravo
#CSC 263-01
#Lab 4-10
.data 
  	str: .asciiz "Hello World!\n" 
   	result: .asciiz "No. of l's = " 
   
.text 
   	la $t0, str 	#get address of string 
   	li $t1, 0 	#count 

loop:   
	lb $t2, ($t0) 
  	beq $t2, '\0', prntresult	 
   	bne $t2, 'l', next 
   	add $t1, $t1, 1 	#increment count 
next: 
   	add $t0, $t0, 1 
   	b loop 
   
prntresult: 
   	li $v0, 4 
   	la $a0, result 
   	syscall 	#prints result
   
   	move $a0, $t1 
   	li $v0, 1 
   	syscall 	#prints no. of l's
   
  	 li $v0, 10 
	syscall		#exits program	