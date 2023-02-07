# código em assembly para multiplicar dois números inteiros longos e exibir na tela

.data

.text
	# adiciona a constante 2000 utilizando soma de imediato no registrador $t0
	addi $t0, $zero, 2000
	# adiciona a constante 10 utilizando soma de imediato no registrador $t1
	addi,$t1, $zero, 10
	# realiza a multiplicação do conteúdo dos registradores $t0 e $t1 e adiciona nos registradores low e high
	mult $t0, $t1
	# move o conteúdo do registrador low para o registrador $s0
	mflo $s0
	# comando para exibir um número inteiro na tela
	li $v0, 1
	# adiciona o conteúdo do registrador $s0 para o registrador $a0 para mostrar o conteúdo na tela
	add $a0, $zero, $s0
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall 
	
	
