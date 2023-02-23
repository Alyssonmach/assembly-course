# código em assembly que realiza a multiplicação com dois inteiros utilizando operação de deslocamento e printa na tela

.data

.text
	# soma de um imediato com valor de constante 4 no registrador $s0
	addi $s0, $zero, 4
	# realiza o deslocamento para a esquerda de dois bits no valor armazenado no registrados $s0 e armazena em $t0
	sll $t0, $s0, 2
	# comando para exibir um número inteiro na tela
	li, $v0, 1
	# adiciona o conteúdo do registrador $t0 no registrador $a0 para exibir o conteúdo na tela
	add $a0, $zero, $t0
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall
	
