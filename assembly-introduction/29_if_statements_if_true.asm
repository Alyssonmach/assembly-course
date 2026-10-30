# código em assembly que verifica se dois números flutuantes são iguais

.data
	number1: .float 4.5
	number2: .float 4.6
	message1: .asciiz "It was true. \n"
	message2: .asciiz "It was false. \n"

.text
	main:
		# carrega os números com precisão flutuante nos registradores $f0 e $f1 
		lwc1 $f0, number1
		lwc1 $f2, number2
		
		# compara se os conteúdos dos registradores $f0 e $f1 são iguais
		c.eq.s $f0, $f2
		# se a condição acima for verdadeira, executa a função que encerra o programa
		bc1t exit
		
		# comando para exibir uma string na tela
		li $v0, 4
		# exibe o conteúdo de "message2" na tela
		la $a0, message2
		# chamada do sistema para executar a operação definida em $v0
		syscall
	
	# comando para encerrar o programa
	li $v0, 10
	# chamada do sistema para executar a operação em $v0
	syscall
		
	# função secundária que encerra o programa
	exit:
		# comando para exibir uma string na tela
		li $v0, 4
		# exibe o conteúdo de "message1" na tela
		la $a0, message1
		# chamada do sistema para executar a operação definida em $v0
		syscall
		
		# comando para encerrar o programa
		li $v0, 10
		# chamada do sistema para executar a operação em $v0
		syscall
	
		
		