# código em assembly para passar argumentos através de uma função e obter um valor de retorno

.data

.text
	# função principal do programa
	main:
		# soma de imediatos para adicionar a constante 5 ao registrador $a1
		addi $a1, $zero, 5
		# soma de imediatos para adicionar a constante 10 ao registrador $a2
		addi $a2, $zero, 10
		
		# chamada da função "addNumbers"
		jal addNumbers
		
		# chaamda do sistema para exibir um número inteiro na tela
		li $v0, 1
		# adiciona o conteúdo do registrador $v1 para o registrador $a0 exibir na tela
		add $a0, $zero, $v1
		# chamada do sistema para executar a operação definida em $vo
		syscall
	
	# código definido para encerrar o programa
	li $v0, 10
	# chamada do sistema para executar a operação definida em $vo
	syscall
	
	# definindo uma função secundária
	addNumbers:
		# somado conteúdo dos registrador $a1 e $a2 no registrador $v1
		add $v1, $a1, $a2
		
		# encerrando o conteúdo da função
		jr $ra
		
	