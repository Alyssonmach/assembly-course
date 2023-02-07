# código em assembly que printa um caractere na tela

.data
	# o diretivo .byte é usado para indicar que apenas um byte deve ser alocado na memória para armazenar o caractere
	myCharacter: .byte 'm'
	
.text
	# comando para exibir um caractere na tela
	li $v0, 4
	# carrega o endereço da variável myCharacter no registrador $a0 para exibir o conteúdo na tela
	la $a0, myCharacter
	# fazendo a chamada do sistema para exibir o conteúdo na tela
	syscall
