# código em assembly que exibe um número flutuante na tela

.data
	# o diretivo .float é usado para indicar que quatro bytes devem ser alocados na memória para armazenar o número flutuante
	PI: .float 3.14

.text
	# comando para exibir um número com precisão do tipo float na tela
	li $v0, 2
	# adiciona os valores armazenados nos registradores $f2 e $f0  com precisão de float e armazena o resultado no registrador 
	# $f12 para exibir o conteúdo na tela
	lwc1 $f12, PI
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall
