#Program to find if two numbers are relatively prime
#
#works by first seeing if both numbers are even to eliminate half the cases, then it loops through odd values of 3 and above until the counter is greater than half of the smallest number
#
#Registers:
#	$t0		-counter
#	$t1		-first number
#	$t2		-second number
#	$t3		-remainder for divisions
#	$t4		-no of checks cap
#	$a0		-for syscall arguments

.text

main:

	li $t0, 2						#set counter to 2 for even check
	la $a0, instruction1_msg		#print first instruction
    li $v0, 4
    syscall
    
    li $v0, 5					#read first int
    syscall
    move $t1, $v0				#move int into $t1
    
    la $a0, instruction2_msg			#print second instruction
    li $v0, 4
    syscall
    
    li $v0, 5					#read first int
    syscall
    move $t2, $v0				#move int into $t2
    
    rem $t3, $t1, $t0				#checks if both even
	bnez $t3, setup
	rem $t3, $t2, $t0
	beqz $t3, not_rel_prime
	
setup:
	li $t0, 1					#set counter to 1
	bgt $t2, $t1, two_greater	
	div $t4, $t1, 2				#set cap to be half of $t1
	b check_loop
	
two_greater:
	div $t4, $t2, 2				#set cap to be half of $t2
    
check_loop:
	add $t0, $t0, 2				#increment over odd numbers
	bgt $t0, $t4, rel_prime			#loop until counter hits cap
	rem $t3, $t1, $t0
	beqz $t3, check_rel_prime
	b check_loop

check_rel_prime:
	rem $t3, $t2, $t0
	beqz $t3, not_rel_prime
	b check_loop

rel_prime:
	la $a0, relatively_prime_msg
	b exit
	
not_rel_prime:
	la $a0, not_relatively_prime_msg
    
exit:
	li $v0, 4			#print outcome
	syscall
	
    li $v0, 10					#exit program
    syscall
    
.data
instruction1_msg: .asciiz "Enter the first number:\n"
instruction2_msg: .asciiz "Enter the second number:\n"
new_line: .asciiz "\n"
relatively_prime_msg: .asciiz "The two numbers are relatively prime\n"
not_relatively_prime_msg: .asciiz "The two numbers are not relatively prime\n"
