#Carlos Martinez-Bravo
#CSC 263-01
#Lab 1-Example A
# Add Some Integers
#
# read num1 and num2 from keyboard
# print (on screen) the sum of the numbers read
#
# v0: num1 and num2
# t0: sum
#
.data
prompt: .asciiz "\n Enter a number: "
result: .asciiz "The sum of your numbers is "
.globl  main 
.text
main:
# read and add first num
# system call code for print string  
li     $v0, 4             
# system call code for print string  
la     $a0, prompt   
# load addr of prompt in $a0  
syscall    # print prompt  
li     $v0, 5   # system call code for read int  
syscall         # read num1 into $v0  
add    $t0, $t0, $v0      # add num1 to sum
# read and add second num  
li     $v0, 4             # system call code for print string 
 la     $a0, prompt   # load addr of prompt in $a0  
 syscall              # print prompt  
 li     $v0, 5        # system call code for read int 
 syscall         # read num2 into $v0 
 add    $t0, $t0, $v0   # add num2 to sum
 # print the sum
 li     $v0, 4             # system call code for print string
 la     $a0, result     # load addr of result msg in $a0
 syscall                   # print result msg 
 li     $v0, 1             # system call code for print int 
 move   $a0, $t0    # copy sum into $a0 
 syscall                  # print sum
 # exit from program
 li     $v0, 10            # terminate execution and
  syscall                  # return control to system
  