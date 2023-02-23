# Código em assembly que para fazer chamadas de funções

.data
	message: .asciiz "Hello everybody, my name is Alysson. \n"

.text
	# definindo a função principal do programa
	main:
		# fazendo a chamada de uma função secundária dentro da função principal
		jal displayMessage
	
	# soma de imediado para adicionar a constante 5 ao registrador $s0
	addi $s0, $zero, 5
	# comando para exibir um número inteiro na tela
	li, $v0, 1
	# adiciona o número inteiro ao registrador $a0 para exibir o conteúdo na tela
	add $a0, $zero, $s0
	# chamada do sistema para executar a operação definida no registrador $v0
	syscall
	
	# comando para encerrar o programa
	li $v0, 10
	# chamada do sistema para executar a operação definida no registrador $v0
	syscall
	
	# definindo uma função secundária
	displayMessage:
		# comando para exibir uma string na tela
		li, $v0, 4
		# carregando o conteúdo armazenado em "message" no registrador $a0 para exibir na tela
		la $a0, message
		# chamada do sistema para executar a operação definida no registrador $vo
		syscall
		
		# código obrigatório para encerrar a função
		jr $ra
