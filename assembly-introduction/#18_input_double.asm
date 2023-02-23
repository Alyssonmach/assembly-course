# código em assembly para receber um número com precisão de double do usuário

.data
	prompt: .asciiz "Enter the value of e: "
	zeroDouble: .double 0.00
	
.text
	# armazenando no registrador $f10 o conteúdo de "zeroDouble"
	ldc1 $f10, zeroDouble
	
	# comando para exibir uma string na tela
	li $v0, 4
	# adicionando o conteúdo deo "prompt" no registrador $a0 para exibir o conteúdo na tela
	la $a0, prompt
	# chamada do sistema executar o comando em $v0
	syscall
	
	# comando para receber um número com precisão de double pelo usuário e armazenar em $f0
	li $v0, 7
	# chamada do sistema para executar o comando em $v0
	syscall 
	
	# comando para mostrar na tela um número com precisão do tipo double
	li $v0, 3
	# fazendo uma soma com precisão do tipo double com o conteúdo dos registradores $f0 e $f10 e adicionando em $f12
	# para exibir um conteúdo na tela
	add.d $f12, $f0, $f10
	# chamada do sistema para executar o comando em $v0
	syscall
	
	
	
	
