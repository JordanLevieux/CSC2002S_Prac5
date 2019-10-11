#Program to test divisibility by 2 and 3
#
#Registers:
#	$t0		-holds number to be divised
#	$t1		-holds counter
#	$t2		-holds remainder for num/2
#	$t3		-holds remainder for num/3
#	$a0		-for syscall arguments

.text

main:

	li $t1, 0					#set counter to 0
	li $t4, 2
	li $t5, 3
	
check_loop:
	beq $t1, 5, exit			#loop 5 times
	add $t1, $t1, 1
	
	la $a0, instruction_msg		#print instruction
    li $v0, 4
    syscall
    
    li $v0, 5					#read int
    syscall
    move $t0, $v0				#move int into $t0
    
    #la $a0, new_line			#print new line
    #li $v0, 4
    #syscall
    
    div $t0, $t4					#get remainders into $t2 and $t3
    mfhi $t2
    div $t0, $t5
    mfhi $t3
    
    beqz $t2, div2				#check if divisible by 2
    beqz $t3, div3				#check if divisible by 3
    la $a0, div_neither_msg
    b print_msg
    
div2:
	beqz $t3, div2and3			#check if divisible by 2 and 3
	la $a0, div2_msg
	b print_msg
	
div3:
	la $a0, div3_msg
	b print_msg
	
div2and3:
	la $a0, div2and3_msg
	b print_msg
	
print_msg:
	li $v0, 4
	syscall
	b check_loop
   
    
exit:
    li $v0, 10					#exit program
    syscall
    
.data
instruction_msg: .asciiz "Enter a number:"
new_line: .asciiz "\n"
div2_msg: .asciiz "It is divisible by 2\n"
div3_msg: .asciiz "It is divisible by 3\n"
div2and3_msg: .asciiz "It is divisible by both 2 and 3\n"
div_neither_msg: .asciiz "It is neither divisible by 2 nor 3\n"
