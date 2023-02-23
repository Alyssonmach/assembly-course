# código em assembly que divide dois números inteiros longos, calcula o quociente e o resto, e os exibe na tela

.data

.text
	# adiciona a constante 30, por soma de imediatos, a variável %t0
	addi $t0, $zero, 30
	# adiciona a constante 8, por soma de imediatos, a variável %t1
	add $t1, $zero, 8
	# realiza a operação de divisão com os valores dos registrador $t0 e $t1, adicionando-os nos registradores low e high
	div $t0, $t1
	# adiciona o quociente, a partir do registrador low, para o registrador $s0
	mflo $s0 
	# adiciona o resto, a partir do registrador high, para o registrador $s1
	mfhi $s1 
	# comando para exibir um número inteiro na tela
	li $v0, 1
	# adiciona o conteúdo do registrador $s0, por soma, ao registrador $a0 para exibir o conteúdo na tela
	add $a0, $zero, $s1
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall
