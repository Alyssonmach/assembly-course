# código em assembly que printa uma mensagem na tela do usuário

.data
	# O diretivo .asciiz é usado para indicar que a string deve ser armazenada na memória incluindo o caractere de nova linha
	myMessage: .asciiz "Hello World| \n"

.text
	# comando para exibir uma string na tela
	li $v0, 4 
	# Carrega o endereço da variável myMessage no registrador $a0 para exibir o conteúdo na tela
	la $a0, myMessage
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall
