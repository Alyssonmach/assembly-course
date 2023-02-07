# Código em assembly que soma dois números inteiros e os exibe na tela.

.data
	
	# O diretivo .word é usado para indicar que quatro bytes devem ser alocados na memória para armazenar o número inteiro.
	number1: .word 5
	number2: .word 10
	 
.text
	
	#  O valor de "number1" é carregado no registrador $t0.
	lw $t0, number1($zero)
	#  O valor de "number2" é carregado no registrador $t1.
	lw $t1, number2($zero)
	# Adiciona os valores armazenados nos registradores $t0 e $t1 e armazena o resultado no registrador $t2.
	add $t2, $t0, $t1
	# Carrega o valor 1 na registrador $v0, indicando que a chamada de sistema subsequente será para exibir um número inteiro 
	# na tela.
	li $v0, 1
	# O valor a ser exibido é passado para o sistema operacional através do registrador $a0, que é preenchido com o valor 
	# armazenado em $t2.
	add $a0, $t2, $zero # outro método: move $a0, $t2
	# syscall faz a chamada de sistema propriamente dita, que exibe o caractere na tela.
	syscall

