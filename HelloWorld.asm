#Hello World Program
#Registers used:
#	v0 	-syscall parameter and return value
#	a0	-syscall parameter -- string to print

		.text
main:
	la $a0, hello_msg	#load address of hello message into $a0
	li $v0, 4			#load print_string syscall
	syscall
	
	li $v0, 10			#exit program
	syscall
	
		.data
hello_msg: .asciiz "Hello World\n"
