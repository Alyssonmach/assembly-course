# Código em assembly que exibe um número flutuante na tela.

.data

	# O diretivo .float é usado para indicar que quatro bytes devem ser alocados na memória para armazenar o número flutuante.
	PI: .float 3.14

.text

	# Carrega o valor 2 no registrador $v0, indicando que a chamada de sistema subsequente será para exibir um número flutuante 
	# na tela.
	li $v0, 2
	# Carrega o conteúdo da variável PI para o registrador de ponto flutuante $f12, que será usado como argumento para a chamada 
	# de sistema.
	lwc1 $f12, PI
	# syscall faz a chamada de sistema propriamente dita, que exibe o caractere na tela.
	syscall
