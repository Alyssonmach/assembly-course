# código em assembly que verifica se um digito é maior que o outro

.data
	message1: .asciiz "The number is less than another"
	message2: .asciiz "The number is not less than another"
	
.text
	main:
		# adicionando aos registradores $t0 e $t1 os valores dos dígitos a serem comparados
		addi $t0, $zero, 400
		addi $t1, $zero, 500
		
		# compara $t0 com $t1: $s0 recebe 1 quando $t0 é menor
		slt $s0, $t0, $t1
		# escolhe a mensagem conforme o resultado da comparação
		beq $s0, $zero, printMessage2
		j printMessage1
	
	# função secundária para exibir a mensagem se um dígito for menor que o outro
	printMessage1:
		# comando para exibir uma string na tela
		li $v0, 4
		# comando para adicionar o conteúdo de "message2" no registrador $a0 para exibir na tela
		la $a0, message1
		# chamada do sistema para executar o comando definido em $v0
		syscall
		j exit
	
	# função secundária para exibir a mensagem se um dígito não for menor que o outro
	printMessage2:
		# comando para exibir uma string na tela
		li $v0, 4
		# comando para adicionar o conteúdo de "message2" no registrador $a0 para exibir na tela
		la $a0, message2
		# chamada do sistema para executar o comando definido em $v0
		syscall

	exit:
		li $v0, 10
		syscall
