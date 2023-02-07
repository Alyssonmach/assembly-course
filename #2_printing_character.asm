# Código em assembly que printa um caractere na tela.

.data
	
	# O diretivo .byte é usado para indicar que apenas um byte deve ser alocado na memória para armazenar o caractere.
	myCharacter: .byte 'm'
	
.text
	
	# Carrega o valor 4 na registrador $v0, indicando que a chamada de sistema subsequente será para exibir um caractere na tela,
	# instrução semelhante para mostrar uma string na tela.
	li $v0, 4
	# Carrega o endereço da variável myCharacter no registrador $a0, que será usado como argumento para a chamada de sistema.
	la $a0, myCharacter
	# syscall faz a chamada de sistema propriamente dita, que exibe o caractere na tela.
	syscall
