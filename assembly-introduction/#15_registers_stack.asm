# código em assembly para incrementar temporariamente os registradores 

.data
	newLine: .asciiz "\n"

.text
	# função principal do programa
	main:
		# incrementa no registrador $s0 o valor constante 10
		addi $s0, $zero, 10
		# chamada da função que incrementa no registrador
		jal increaseMyRegister
	
	# comando para imprimir uma string na tela
	li $v0, 4
	# adicionando o conteúdo de "newLine" ao registrador $a0 para exibir na tela
	la $a0, newLine
	# chamada do sistema para executar a operação em $v0
	syscall
	
	# comando para imprimir um número inteiro na tela
	li $v0, 1
	# adicionando o conteúdo do registrador em $a0 para exibir o conteúdo na tela
	move $a0, $s0
	# chamada do sistema para executar o comando definido em $v0
	syscall
	
	
	# comando para encerrar o programa
	li $v0, 10
	# chamada do sistema para executar a operação definida em $v0
	syscall
	
	# função secundára para incrementar um valor no registrador
	increaseMyRegister:
		# reservando um espaço na pilha para atualizar o valor do registrador
		addi $sp, $sp, -4
		sw $s0, 0($sp)
		
		# incrementando um valor constante no registrador
		addi $s0, $s0, 30
		
		# comando para imprimir um número inteiro na tela
		li $v0, 1
		# adicionando o conteúdo do registrador $s0 em $a0 para exibir na tela
		move $a0, $s0
		# chamada do sistema para executar o comando armazenado no registrador $v0
		syscall
		
		# organizando o endereço da pilha para sua forma original
		lw $s0, 0($sp)
		addi $sp, $sp, 4
		
		# comando para encerrar a função
		jr $ra
	