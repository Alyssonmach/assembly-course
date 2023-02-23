# código em assembly que percorre todo um array e exibe o seu conteúdo

.data
	# definindo um array vazio
	myArray: .space 12
	newLine: .asciiz "\n"
	
.text
	main:
		# registradores que armazenam conteúdos a serem adicionados no array
		addi $s0, $zero, 4
		addi $s1, $zero, 14
		addi $s2, $zero, 24
	
		# inicializando o contador que vai acessar o endereço do array para a adição dos conteúdos
		addi $t0, $zero, 0
	
		# adiciona o conteúdo dos registradores $s0, $s1 e $s2 no array vazio, incrementando os endereços via $t0
		sw $s0, myArray($t0)
		addi $t0, $t0, 4
		sw $s1, myArray($t0)
		addi $t0, $t0, 4
		sw $s2, myArray($t0)
		
		# reinicia o contador do array para fazer a leitura do array
		addi $t0, $zero, 0
		
		# comando para iniciar um bloco de código em loop
		while:
			# se o contador $t0 chegar no final do array, encerra o programa
			beq $t0, 12, exit
			# pega o conteúdo do array no endereço atual armazenado em $t0
			lw $s3, myArray($t0)
			
			# incrementa o contador do array com 4
			addi $t0, $t0, 4
			
			# comando para exibir um número inteiro na tela
			li $v0, 1
			# exibe o número em $s3 na tela
			move $a0, $s3
			# chamada do sistema para executar o comando definido em $v0
			syscall
			
			# comando para exibir uma string na tela
			li $v0, 4
			# exibe o conteúdo dem "newLine" na tela
			la $a0, newLine
			# chamada do sistema para executar o comando definido em $v0
			syscall
			
			# retorna para o inicio do bloco de código a ser repetido
			j while
			
		# lê no registrador $s3 o conteúdo armazenado no array no endereço $zero
		lw $s3, myArray($zero)
	
		# comando para exibir um número inteiro na tela
		li $v0, 1
		# visualizando o número armazenado em #s3 na tela
		add $a0, $s3, $zero
		# chamada do sistema para executar a operação definida em $v0
		syscall
	
	# função secundária que encerra o programa
	exit:
		# comando para encerrar o programa
		li $v0, 10
		# chamada do sistema para executar a operação definida em $v0
		syscall
	
	
