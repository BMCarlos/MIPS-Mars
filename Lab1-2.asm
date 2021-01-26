#Carlos Martinez-Bravo
#CSC 263-01
#Lab 1-Example 2
.text
.globl  main
main:li $v0, 10	#sys call for exit
syscall
	.data
nums:	.byte   4,3,2,1
	.half   8,7,6,5
	.word  1,2,3,4
	.space  1
	.word   12
letters:.asciiz   "EFG"   # E=45 (hex)
	.ascii     "efg"    # e=65  (hex)
neg1s:	.byte   -1,-1
	.word  15