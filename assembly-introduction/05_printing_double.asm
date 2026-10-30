# código em assembly que exibe na tela um número do tipo double

.data
	# o diretivo .double faz uso de registradores do tipo "double", ponto flutuante de 64 bits
	myDouble: .double 7.202
	zeroDouble: .double 0.00
	
.text
	# o valor de "myDouble" é carregado no registrador $f2
	ldc1 $f2, myDouble
	# o valor de "zeroDouble" é carregado no registrador $f0
	ldc1 $f0, zeroDouble
	# comando para exibir um número com precisão do tipo double na tela
	li $v0, 3
	# adiciona os valores armazenados nos registradores $f2 e $f0  com precisão de double e armazena o resultado no registrador 
	# $f12 para exibir o conteúdo na tela
	add.d $f12, $f2, $f0
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall
