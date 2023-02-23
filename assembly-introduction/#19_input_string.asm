# código em assembly que recebe uma string do usuário e exibe na tela

.data	
	message1: .asciiz "Please, enter your name: "
	message2: .asciiz "Hello, "
	userInput: .space 20

.text
	# comando para exibir uma string na tela
	li $v0, 4
	# adiciona o conteúdo de "message1" no registrador $a0 para exibir na tela
	la $a0, message1
	#chamada do sistem para executar a operação em $vo
	syscall
	
	# comando para receber um texto do usuário
	li $v0, 8
	# recebe do usuário uma mensagem e armazena seu conteúdo em "userInput"
	la $a0, userInput
	# define o tamanha máximo da string a ser recebida e define esse tamanho no registrador $a1
	li $a1, 20
	# chamada do sistema para executar a operação em $v0
	syscall
	
	# comando para exibir uma string na tela
	li $v0, 4
	# adiciona o conteúdo de "message2" no registrador $a0 para exibir na tela
	la $a0, message2
	#chamada do sistem para executar a operação em $vo
	syscall
	
	# comando para mostrar uma string na tela
	li $v0, 4
	# adiciona o conteúdo de "userInput" ao registrador $a0 para exibir na tela
	la $a0, userInput
	# chamada do sistema para executar a operação definida em $v0
	syscall