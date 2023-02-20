# código em assembly para incrementar temporariamente os registradores utilizando funções dentro de outras

.data
	newLine: .asciiz "\n"

.text
	# função principal do programa
	main:
		# soma de imediato no registrador $s0 com valor constante 10
		addi $s0, $zero, 10
		# chamada da função que incrementa no registrador
		jal increaseMyRegister
	
	# comando para imprimir uma string na tela
	li $v0, 4
	# adicionando o conteúdo de "newLine" ao registrador $a0 para exibir na tela
	la $a0, newLine
	# chamada do sistema para executar a operação em $v0
	syscall
	
	# chamada da função para exibir um número inteiro
	jal printValue
	
	# comando para encerrar o programa
	li $v0, 10
	# chamada do sistema para executar a operação definida em $v0
	syscall
	
	# função secundára para incrementar um valor no registrador
	increaseMyRegister:
		# reservando um espaço na pilha para atualizar o valor do registrador e fazer a chamada de uma função
		addi $sp, $sp, -8
		sw $s0, 0($sp)
		sw $ra, 4($sp)
		
		# incrementando um valor constante no registrador
		addi $s0, $s0, 30
		
		# chamada da função para exibir um número inteiro
		jal printValue
		
		# organizando o endereço da pilha para sua forma original
		lw $s0, 0($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 8
		
		# comando para encerrar a função
		jr $ra
	
	# função secundária para imprimir um número inteiro na tela
	printValue:
		# comando para imprimir um número inteiro na tela
		li $v0, 1
		# adicionando o conteúdo do registrador em $a0 para exibir o conteúdo na tela
		move $a0, $s0
		# chamada do sistema para executar o comando definido em $v0
		syscall
		
		# comando para encerrar a função
		jr $ra
	