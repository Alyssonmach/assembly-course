# código em assembly que verifica se um digito é maior que o outro

.data
	message1: .asciiz "The number is less than another"
	message2: .asciiz "The number is not less than another"
	
.text
	main:
		# adicionando aos registradores $t0 e $t1 os valores dos dígitos a serem comparados
		addi $t0, $zero, 400
		addi $t1, $zero, 500
		
		# comparando se o dígito armazenado em $t0 é maior que o dígito em $t1, se verdade $s0 recebe zero
		slt $s0, $t0, $t1
		# chama a função que exibe a mensagem do dígito em $t0 ser maior que o dígito em $t1 caso $s0 seja zero
		beq $s0, $zero, printMessage1
		# caso contrário, exibe que o dígito em $t0 não é maior que o dígito em $t1
		bne $s0, $zero, printMessage2
		
		# comando para encerrar a função
		li $v0, 10
		# chamada do sistema para executar a operação definida em $v0
		syscall
	
	# função secundária para exibir a mensagem se um dígito for menor que o outro
	printMessage1:
		# comando para exibir uma string na tela
		li $v0, 4
		# comando para adicionar o conteúdo de "message2" no registrador $a0 para exibir na tela
		la $a0, message1
		# chamada do sistema para executar o comando definido em $v0
		syscall
	
	# função secundária para exibir a mensagem se um dígito não for menor que o outro
	printMessage2:
		# comando para exibir uma string na tela
		li $v0, 4
		# comando para adicionar o conteúdo de "message2" no registrador $a0 para exibir na tela
		la $a0, message2
		# chamada do sistema para executar o comando definido em $v0
		syscall