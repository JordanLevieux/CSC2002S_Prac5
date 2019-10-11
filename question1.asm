#program returns all the positive single digit divisors of a number (except 1)
#
#Registers:
#   $t0     -holds number to be divised
#   $t1     -holds remainder
#   $t2     -holds counter
#   $a0     -for syscall arguments
.text

main:
    la $a0, start_msg			#print start message
    li $v0, 4
    syscall
    
    li $v0, 5					#read int
    syscall
    move $t0, $v0				#move int into $t0
    
    la $a0, instruction_msg		#print instruction
    li $v0, 4
    syscall
    
    li $t2, 1					#set counter to 1
    
check_loop:
    beq $t2, 9, exit			#if counter is equal to 9 exit
    add $t2, 1					#increment counter
    div $t0, $t2				#divide number by the counter
    mfhi $t1					#move remainder into $t1
    beqz $t1, divises			#branch to divises if no remainder
    b check_loop
    
divises:
    move $a0, $t2				#print counter
    li $v0, 1
    syscall
    la $a0, new_line
    li $v0, 4
    syscall
    b check_loop
    
exit:
    li $v0, 10					#exit program
    syscall
    
.data
start_msg: .asciiz "Enter a number:\n"
instruction_msg: .asciiz "The single digit divisors are:\n"
new_line: .asciiz "\n"
debug_loop: .asciiz "Start Loop:\nCounter: "
