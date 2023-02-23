# código em assembly que soma dois números com precisão flutuante

.data
	number1: .double 3.56
	number2: .double 4.56

.text	
	# carrega os números flutuantes nos registradores $f2 e $f4
	ldc1 $f2, number1
	ldc1 $f4, number2
	
	# soma os números flutuantes e os carrega no registrador $f12
	add.d $f12, $f2, $f4
	
	# comando para exibir na tela o número flutuante carregado no registrador $f12
	li $v0, 3
	# chamada do sistema para executar o comando definido em $v0
	syscall
	
	# comando para encerrar o programa
	li $v0, 10
	# chamada do sistema para executar o comando definido em $v0
	syscall
	