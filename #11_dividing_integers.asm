# código em assembly que divide dois números inteiros simples e exibe na tela

.data

.text
	# realiza a soma de imediatos, adicionando a constante 30 ao registrador $t0
	addi $t0, $zero, 30
	# realiza a soma de imediatos, adicionando a constante 5 ao registrador $t1
	add $t1, $zero, 5
	# realiza a divisão com o conteúdo dos registrados $t0 e $t1 e adiciona o resultado ao registrador $s0
	div $s0, $t0, $t1
	# comando para exibir um número inteiro na tela
	li $v0, 1
	# adiciona o conteúdo do registrador $s0 para o registrador $a0 para exibir o conteúdo na tela
	add $a0, $zero, $s0
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall
