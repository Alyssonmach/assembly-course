# código em assembly que utiliza um comando do tipo if para verificar se dois números são iguais

.data
	message1: .asciiz "Informe o primeiro número inteiro: "
	message2: .asciiz "Informe o segundo número inteiro: "
	message3: .asciiz "Os números são iguais"
	message4: .asciiz "Os números não são iguais"

.text 
	main:
		# comando para exibir uma string na tela
		li $v0, 4
		# comando para adicionar o conteúdo de "message1" no registrador $a0 para exibir na tela
		la $a0, message1
		# chamada do sistema para executar o comando definido em $v0
		syscall
		
		# chamada da função para receber um número inteiro do usuário
		jal inputInteger
		# adicionando o conteúdo de $v0 no registrador $t0
		move $t0, $v0
		
		# comando para exibir uma string na tela
		li $v0, 4
		# comando para adicionar o conteúdo de "message2" no registrador $a0 para exibir na tela
		la $a0, message2
		# chamada do sistema para executar o comando definido em $v0
		syscall
		
		# chamada da função para receber um número inteiro do usuário
		jal inputInteger
		# adicionando o conteúdo de $v0 no registrador $v1
		move $t0, $v1
		
		# se o conteúdo dos registradores $v0 e $v1 forem iguais, executar a função "displayEqualNumbers"
		beq $t0, $t1, displayEqualNumbers
		# chamada da função que exibe uma mensagem quando os dois números são diferentes
		jal displayDifferentNumbers
		
	
	# função secundária que recebe um número inteiro do usuário
	inputInteger:
		# comando para receber um número inteiro do usuário
		li $v0, 5
		# chamado do sistema para executar a operação em $v0
		syscall
		
		# comando para encerrar a função
		jr $ra
	
	# função secundária para exibir uma mensagem quando os dois números são iguais
	displayEqualNumbers:
		# comando para exibir uma string na tela
		li $v0, 4
		# adicionando o conteúdo de "message3" no registrador $a0 para exibir o conteúdo na tela
		la $a0, message3
		# chamada do sistema para executar a operação em $v0
		syscall
		
		# comando para encerrar a função
		li $v0, 10
		# chamada do sistema para executar a operação em $v0
		syscall
		
		# comando para encerrar a função
		jr $ra
	
	# função secundária para exibir uma mensagem quando os dois números são diferentes
	displayDifferentNumbers:
		# comando para exibir uma string na tela
		li $v0, 4
		# adicionando o conteúdo de "message4" no registrador $a0 para exibir o conteúdo na tela
		la $a0, message4
		# chamada do sistema para executar a operação em $v0
		syscall
		
		# comando para encerrar a função
		li $v0, 10
		# chamada do sistema para executar a operação em $v0
		syscall
		
		# comando para encerrar a função
		jr $ra