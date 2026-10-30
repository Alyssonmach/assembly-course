# código em assembly que adiciona conteúdos dentro de um array vazio

.data
	# definindo um array vazio
	myArray: .space 12
	
.text
	# registradores que armazenam conteúdos a serem adicionados no array
	addi $s0, $zero, 4
	addi $s1, $zero, 14
	addi $s2, $zero, 24
	
	# inicializando o contador que vai acessar o endereço do array para a adição dos conteúdos
	addi $t0, $zero, 0
	
	# adiciona o conteúdo dos registradores $s0, $s1 e $s2 no array vazio, incrementando os endereços via $t0
	sw $s0, myArray($t0)
	addi $t0, $zero, 4
	sw $s1, myArray($t0)
	addi $t0, $zero, 4
	sw $s2, myArray($t0)
	
	# lê no registrador $s3 o conteúdo armazenado no array no endereço $zero
	lw $s3, myArray($zero)
	
	# comando para exibir um número inteiro na tela
	li $v0, 1
	# visualizando o número armazenado em #s3 na tela
	add $a0, $s3, $zero
	# chamada do sistema para executar a operação definida em $v0
	syscall
	
	# comando para encerrar o programa
	li $v0, 10
	# chamada do sistema para executar a operação definida em $v0
	syscall
	
	