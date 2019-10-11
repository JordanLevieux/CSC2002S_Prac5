#Program returns lagrer of two user entered numbers
#
#Registers used:
#	$t0		-holds answer
#	$t1		-holds first number
#	$t2		-holds second number
#	$v0		-holds syscall parameter & return value
#	$a0		-syscall parameter

		.text
main:
	#get first number
	li $v0, 5			#load read_int into $v0
	syscall				#make syscall
	move $t1, $v0		#move first num into $t1
	
	#get second number
	li $v0, 5			#load read_int into $v0
	syscall				#make syscall
	move $t2, $v0		#move first num into $t2
	
	bgt $t1, $t2, t1_bigger	#if t1 is larger jump to alt code
	move $t0, $t2			
	b endif
	
	t1_bigger:
		move $t0, $t1
	
	endif:
		move $a0, $t0	#Print answer
		li $v0,1		#load PrintInt
		syscall	
		
		li $v0, 10		#exit
		syscall
