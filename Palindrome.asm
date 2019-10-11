#Program to check if a user entered string is a palindrome
#
#Registers:
#	$t0: hold the string start pointer
#	$t1: hold the string end pointer
#	$t2: hold the start value
#	$t3: hold the end value
		.text
main:
	la $a0, string_space	#load user input into string
	li $a1, 1024
	li $v0, 8
	syscall
	
	la $t0, string_space	#load string pointer into A
	la $t1, string_space	#load string pointer into B
	
find_last_loop:				#get $t1 (B) to equal end of string
	lb $t3, ($t1)
	beqz $t3, end_find_last
	addu $t1, $t1, 1
	b find_last_loop
end_find_last:
	subu $t1, $t1, 2		#go before 0 terminator and newline
	
test_loop:
	bge $t0, $t1, palin
	lb $t2, ($t0)				#load value of A
	lb $t3, ($t1)				#load value of B
	bne $t2, $t3, not_palin		#if not equal return
	addu $t0, $t0, 1			#increment to next values
	subu $t1, $t1, 1
	b test_loop
	
not_palin:
	la $a0, failed_message
	b exit

palin:
	la $a0, success_message
	b exit
	
exit:
	li $v0, 4	#print message
	syscall
	
	li $v0, 10
	syscall
	
	
		.data
string_space: .space 1024
failed_message: .asciiz "Not a palindrome\n"
success_message: .asciiz "Palindrome!\n"
