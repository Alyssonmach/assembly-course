# código em assembly que subtrai dois números inteiros e os exibe na tela

.data
	# o diretivo .word é usado para indicar que quatro bytes devem ser alocados na memória para armazenar o número inteiro
	number1: .word 20
	number2: .word 8
	
.text
	# o valor de "number1" é carregado no registrador $s0
	lw $s0, number1
	# o valor de "number2" é carregado no registrador $s1
	lw $s1, number2
	# subtrai os valores armazenados nos registradores $s0 e $s1 e armazena o resultado no registrador $t0
	sub $t0, $s0, $s1
	# comando para exibir um número inteiro na tela
	li $v0, 1
	# move o conteúdo armazenado no registrados $t0 para o registrador $a0 para exibir um conteúdo na tela
	move $a0, $t0
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall
	
