# código em assembly que multiplica dois números inteiros simples e exibe na tela

.data

.text
	# adiciona o imediato com valor 10 ao registrador $s0
	addi $s0, $zero, 20
	# adiciona o imediato com valor 4 ao registrador $s1
	addi $s1, $zero, 4
	# multiplica o conteúdo do registrador $s0, $s1 e adiciona no registrador $t0
	mul $t0, $s0, $s1
	# comando para exibir um número inteiro na tela
	li $v0, 1
	# adiciona o conteúdo do registrador $s0 para o registrador $a0 para mostrar o conteúdo na tela
	add $a0, $zero, $t0
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall 
