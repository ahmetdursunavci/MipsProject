#Ahmet Dursun Avcý 21827129
.data
A: .word 2, 3, 1, 4, 8, 20, 30, 7, 9, 15 # Initialize the array A in memory


.text
.globl main
main:
la $t1, A

# Load the address of A[0] to $t1
# Getting user integer input K into register v0

li $v0, 5 
syscall

# Moving the integer input to another register: $t0 <- K
move $t0, $v0



addi $t2,$0,0 #iterator register
addi $t3,$0,10 #size register

L1: #begin of loop
	beq  $t3 , $t2, L2
	
	sll $t4, $t2, 2 # t4=4*iterator
	add $t4, $t4, $t1 # t4= 4*iterator + array location
	lw $t4,0($t4) # take the word from $t4 to $t4
	
	addi $t2, $t2, 1 # increase iterator
	
	slt $t5, $t4, $t0 #compare input to array's elements if input>element $t5=1 else $t5=0
	bne $t5 , $zero, L3 # if true go to L3
	
	j L1

	L3: # branch of statement
    		addi $v1 , $v1, 1 #inrease the return value
   		j L1

L2: #exit of loop
	li $v0, 10 
	syscall

