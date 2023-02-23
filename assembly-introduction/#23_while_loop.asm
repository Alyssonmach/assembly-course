# código em assembly que simula a estrutura de um loop

.data
	message: .asciiz "After while loop is done"
	newLine: .asciiz "\n"
	space: .asciiz ", "

.text
	main:
		# iniciando o contador do loop pelo registrador $t0
		addi $t0, $zero, 0
		
		# rótulo que vai definir o começo do bloco de código em loop
		while:
			# se $t0 for 10, executa a função exit
			bgt $t0, 10, exit
			# enquanto $t0 não for 10, executa a função que exibe o número na tela
			jal printNumber
			# incrementa o contador $t0 do loop
			addi $t0, $t0, 1
			# volta para o começo do bloco de código a ser repetido
			j while
	
	# função secundária que encerra o programa
	exit:
		# comando que exibe uma string na tela
		li $v0, 4
		# exibe o conteúdo de "message" na tela
		la, $a0, message
		# chamada do sistema para executar a operação em $v0
		syscall
		
		# comando para encerrar o programa
		li $v0, 10
		# chamada do sistema para executar a operação em $v0
		syscall
	
	# função secundária para exibir o número da incrementação na tela
	printNumber:
		# comando que exibe um número inteiro na tela
		li $v0, 1
		# exibe o conteúdo do contador $t0 na tela
		add $a0, $zero, $t0
		# chamada do sistema para executar a operação em $v0
		syscall
		
		# comando para exibir uma string na tela
		li $v0, 4
		# exibe o conteúdo de "space" na tela
		la $a0, space
		# chamada do sistema para executar a operação definida em $v0
		syscall
		
		# comando para finalizar a função secundária
		jr $ra
	
	
			