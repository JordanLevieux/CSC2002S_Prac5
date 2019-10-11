#Program to give multiples of A up to AXB
#
#Registers:
#	t0: A
#	t1: B
#	t2: Current Multiple
#	a0: syscall register
#	v0: syscall register

		.text
main:
	li $v0, 5		#read_int
	syscall
	move $t0, $v0	#move A into $t0
	
	li $v0, 5		#read_int
	syscall
	move $t1, $v0	#move B into $t1
	
	blez $t1, exit	#if B negative exit
	
	mul $t1, $t0, $t1	#override $t1 with AXB
	move $t2, $t0
loop:
	move $a0, $t2		#load current multiple into output register
	li $v0, 1			#load print int
	syscall
	beq $t2, $t1, exit	#if Multiple = AXB exit
	add $t2, $t2, $t0	#increment Multiple
	la $a0, space
	li $v0, 4
	syscall
	b loop
	
exit:
	li $v0, 10
	syscall
	
		.data
space: .asciiz " "
