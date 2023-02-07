# Código em assembly que exibe um número inteiro na tela.

.data

	# O diretivo .word é usado para indicar que quatro bytes devem ser alocados na memória para armazenar o número inteiro.
	age: .word 22

.text

	# Carrega o valor 1 na registrador $v0, indicando que a chamada de sistema subsequente será para exibir um número inteiro 
	# na tela.
	li $v0, 1
	# Carrega o endereço da variável age no registrador $a0, que será usado como argumento para a chamada de sistema.
	lw $a0, age
	# syscall faz a chamada de sistema propriamente dita, que exibe o caractere na tela.
	syscall
