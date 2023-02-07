# subtracting two integrals and printing to the screen

.data
	
	# # O diretivo .word é usado para indicar que quatro bytes devem ser alocados na memória para armazenar o número inteiro.
	number1: .word 20
	number2: .word 8
	
.text

	#  O valor de "number1" é carregado no registrador $s0.
	lw $s0, number1
	#  O valor de "number1" é carregado no registrador $s1.
	lw $s1, number2
	# Subtrai os valores armazenados nos registradores $s0 e $s1 e armazena o resultado no registrador $t0.
	sub $t0, $s0, $s1
	# Carrega o valor 1 na registrador $v0, indicando que a chamada de sistema subsequente será para exibir um número inteiro 
	# na tela.
	li $v0, 1
	# move o conteúdo armazenado no registrados $t0 para o registrador $a0
	move $a0, $t0
	# syscall faz a chamada de sistema propriamente dita, que exibe o caractere na tela.
	syscall
	