# código em assembly que multiplica e divide dois números flutuantes

.data
	number1: .double 15.00
	number2: .double 3.00
	newLine: .asciiz "\n"

.text	
	# carrega os números flutuantes nos registradores $f2 e $f4
	ldc1 $f2, number1
	ldc1 $f4, number2
	
	# multiplica os números flutuantes e os carrega no registrador $f12
	mul.d $f12, $f2, $f4
	
	# comando para exibir na tela o número flutuante carregado no registrador $f12
	li $v0, 3
	# chamada do sistema para executar o comando definido em $v0
	syscall
	
	# comando para exibir uma string na tela
	li $v0, 4
	# exibe o conteúdo de "newLine" na tela
	la $a0, newLine
	# chamada do sistema para executar o comando definido em $v0
	syscall
	
	# divide os números flutuantes e os carrega no registrador $f12
	div.d $f12, $f2, $f4
	
	# comando para exibir na tela o número flutuante carregado no registrador $f12
	li $v0, 3
	# chamada do sistema para executar o comando definido em $v0
	syscall
	
	