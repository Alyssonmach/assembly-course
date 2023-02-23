# código em assembly que exibe um número inteiro na tela

.data
	# o diretivo .word é usado para indicar que quatro bytes devem ser alocados na memória para armazenar o número inteiro
	age: .word 22

.text
	# comando para exibir um número inteiro na tela
	li $v0, 1
	# carrega o endereço da variável age no registrador $a0 para exibir o conteúdo na tela
	lw $a0, age
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall
