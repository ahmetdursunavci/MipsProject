#Ahmet Dursun Avcý 21827129
.text
.globl main
main:
# Getting user integer input a into register v0
 li $v0, 5
 syscall
 # Moving the integer input to another register: $t0 <- a
 move $t0, $v0
# Getting the second user integer input a into register v0
 li $v0, 5
 syscall
 # Moving the integer input to another register: $t1 <- b
 move $t1, $v0
 

 
 bne $t0,$t1,L2 # if a different than b branch
 
  L1: # a=b
 	sll $t2,$t0,1 # t2= 2a
 	sll $t3,$t1,1 # t3=2b
 	add $v1,$t2,$t3 # result = 2a+2b
 	
 	li $v0,10 # stopping of the program
 	syscall
 
 L2: 
 # Preparing of the arguments of functions
 	addi $a0,$t0,0 
 	addi $a1,$t1,0
 	
 	jal compare # call the compare
 	
 	li $v0, 10 # stop the program
	syscall
 
 	
 	compare:
 		addi $sp,$sp,-4 # open some space for returning adress on stack
 		sw  $ra,0($sp)
 		
 		slt $t4,$a0,$a1  # if a<b t4=1 else t4=0
 		bne $t4,$0,L4    # if t4=!0 go L4
 		
 	
 	
 	
 	L3: # a>b
 		
 		jal award 	# call the award
 		lw  $ra,0($sp)	# take the adress of caller
 		addi $sp,$sp,4	# make available space of stack
 		jr $ra	# return to caller
 	
 	L4: # a<b
 		
 		jal punish # call the punish
 		lw  $ra,0($sp) # take the adress of caller
 		addi $sp,$sp,4 # make available space of stack
 		jr $ra # return to caller
 
 	
 	award:
 		sll $v1,$a0,2 # result = 4a
 		sub $v1,$v1,$a0# result = 4a-a
 		add $v1,$v1,$a1 # result = 3a+b
 		jr $ra # return to caller
 	
 	punish:
 		add $v1,$a0,$a1 # result = a+b
 		sll $t5,$a1,2 # t5 = 4b
 		sub $v1,$v1,$t5 # result = result - 4b = a+b-4b = a-3b
 		jr $ra # return to caller
 






