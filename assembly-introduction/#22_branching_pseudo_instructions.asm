# código em assembly que verifica se um número é maior que o outro

.data
	message: .asciiz "Hi, how are you?"
	
.text
	main:
		# adicionando valores aos registradores $s0 e $s1 para comparar posteriormente
		addi $s0, $zero, 14
		addi $s1, $zero, 10
		
		# se o dígito em $s0 for maior em $s1, exibe a função "displayHi"
		bgt $s0, $s1, displayHi
		
		# comando para encerrar a função
		li $v0, 10
		# chamada do sistema para executar a operação definida em $v0
		syscall
	
	# função secundária que mostra uma mensagem de boas vindas ao usuário
	displayHi:
		# comando para exibir uma string
		li $v0, 4
		# comando para adicionar o conteúdo de "message" no registrador $a0 para exibir na tela
		la $a0, message
		# chamada do sistema para executar o comando definido em $v0
		syscall