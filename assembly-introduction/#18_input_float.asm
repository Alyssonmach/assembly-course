# código em assembly para receber um número flutuante do usuário

.data
	message: .asciiz "Enter the value of PI: "
	zeroFloat: .float 0.0

.text
	# armazenando o número flutuante no registrador $f4
	lwc1 $f4, zeroFloat
	
	# comando para exibir uma string na tela
	li $v0, 4
	# adiciona o conteúdo de "message" no registrador $a0 para exibir seu conteúdo na tela
	la $a0, message
	# chamada do sistema para executar o comando no registrador $v0
	syscall
	
	# comando do sistema para receber um número flutuante do usuário e armazena automaticamente em $f0
	li $v0, 6
	# chamada do sistema para executar a operação em $v0
	syscall
	
	# comando do sistema para exibir na tela um número flutuante
	li $v0, 2
	# fazendo uma soma com precisão de número flutuante com o conteúdo dos registradores $f0 e $f4 e adicionando em $f12
	# para exibir um conteúdo na tela
	add.s $f12, $f0, $f4
	# chamada do sistema para executar a operação em $v0
	syscall
	
	
	