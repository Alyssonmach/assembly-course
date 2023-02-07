# Código em assembly que exibe na tela um número do tipo double.

.data

	# O diretivo .double faz uso de registradores do tipo "double" (ponto flutuante de 64 bits) para armazenar e manipular 
	# valores decimais.
	myDouble: .double 7.202
	zeroDouble: .double 0.00
	
.text
	
	#  O valor de "myDouble" é carregado no registrador $f2.
	ldc1 $f2, myDouble
	#  O valor de "zeroDouble" é carregado no registrador $f0.
	ldc1 $f0, zeroDouble
	
	# Solicita ao sistema operacional que exiba um número do tipo "double".
	li $v0, 3
	# Adiciona os valores armazenados nos registradores $f2 e $f0 e armazena o resultado no registrador $f12.
	add.d $f12, $f2, $f0
	# syscall faz a chamada de sistema propriamente dita, que exibe o caractere na tela.
	syscall
