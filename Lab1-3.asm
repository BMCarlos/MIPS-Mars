#Carlos Martinez-Bravo
#CSC 263-01
#Lab 1-Example A
	.text 
	la     $s0, neg1byte 
	la     $s1, oneword 
	la     $s2, twowords 
	la     $s3, smallstring 
	lb $t0, 3($s1) 
	add   $s1, $s1,$t0 
	lb     $t1, 0($s1) 
	addi   $s1, $s1,2 
	add   $s2, $s1,$t1 
	sb     $t0, 0($s2) 
	addi   $s1, $s1,7 
	add   $a0, $s1,$t0 
	li $v0, 4 
	syscall 
	lw $t0, 0($s3) 
	sh     $t0, -5($s2)
	li $v0, 10 
	syscall
	.data
	neg1byte:   .byte   -1
	oneword:    .word    0x02030405
	twowords:   .word    02, 03
	smallstring: .asciiz    "abc"
	halfwords:  .half     10, 11, 12, 13, 14, 15