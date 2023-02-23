# código em assembly que soma dois números inteiros e os exibe na tela

.data
	# o diretivo .word é usado para indicar que quatro bytes devem ser alocados na memória para armazenar o número inteiro
	number1: .word 5
	number2: .word 10
	 
.text	
	# 0 valor de "number1" é carregado no registrador $t0
	lw $t0, number1($zero)
	# 0 valor de "number2" é carregado no registrador $t1
	lw $t1, number2($zero)
	# adiciona os valores armazenados nos registradores $t0 e $t1 e armazena o resultado no registrador $t2
	add $t2, $t0, $t1
	# comando para exibir um número inteiro na tela
	li $v0, 1
	# adiciona o conteúdo do registrador $t2 ao registrador $a0 para exibir um conteúdo na tela
	add $a0, $t2, $zero
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall

