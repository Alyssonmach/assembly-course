# printing an integer to the screen

.data
	age: .word 22

.text
	li $v0, 1
	lw $a0, age
	syscall