# printing a double on the screen

.data
	myDouble: .double 7.202
	zeroDouble: .double 0.00
	
.text
	ldc1 $f2, myDouble
	ldc1 $f0, zeroDouble
	
	li $v0, 3
	add.d $f12, $f2, $f0
	syscall
