# código em assembly para receber um número inteiro do usuário

.data
	prompt: .asciiz "Enter your age: "
	message: .asciiz "\nYour age is: "

.text
	# comando para imprimir uma string na tela
	li $v0, 4
	# adiciona o conteúdo de "prompt" ao registrador $a0 para exibir na tela
	la $a0, prompt
	# chamada do sistema para executar a operação em $v0
	syscall
	
	# comando para receber um número inteiro do usuário
	li $v0, 5
	# chamado do sistema para executar a operação em $v0
	syscall
	
	# adicionando o conteúdo de $v0 no registrador $t0
	move $t0, $v0
	
	# comando para imprimir uma string na tela
	li, $v0, 4
	# adiciona o conteúdo de "message" no registrador $a0
	la $a0, message
	# chamado do sistema para executar a operação em $v0
	syscall
	
	# comando para imprimir um número inteiro na tela
	li $v0, 1
	# mandando o conteúdo do registrador $t0 para $a0 para exibir um conteúdo na tela
	move $a0, $t0
	# chamada do sistema para executar a operação em $v0
	syscall
