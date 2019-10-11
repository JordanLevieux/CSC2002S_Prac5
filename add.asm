#First Assembly Code by Ya Boi
#Program adds two user inputed numbers together
#	Result in register $t0
#
#Registers used:
#	$t0		-holds answer
#	$t1		-holds first number
#	$t2		-holds second number
#	$v0		-holds syscall parameter & return value
#	$a0		-syscall parameter

main:
	#get first number
	li $v0, 5			#load read_int into $v0
	syscall				#make syscall
	move $t1, $v0		#move first num into $t1
	
	#get second number
	li $v0, 5			#load read_int into $v0
	syscall				#make syscall
	move $t2, $v0		#move first num into $t2
	
	add $t0, $t1, $t2	#add numbers together
	
	move $a0, $t0		#move answer into print register
	li $v0, 1			#load print_int into syscall
	syscall
	
	li $v0, 10			#load syscall for exit
	syscall
