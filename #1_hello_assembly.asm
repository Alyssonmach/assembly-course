# Código em assembly que printa uma mensagem na tela do usuário.

# A região .data é utilizada para declarar constantes e variáveis globais que serão usadas pelo programa. Esses dados são alocados 
# na memória RAM e ficam disponíveis para serem lidos ou escritos ao longo do tempo de execução do programa.

.data

	# O diretivo .asciiz é usado para indicar que a string deve ser armazenada na memória incluindo o caractere de nova linha 
	# (\n) no final.
	myMessage: .asciiz "Hello World| \n"

# A região .text é usada para armazenar o código executável propriamente dito, ou seja, as instruções que serão interpretadas 
# pelo processador. Essas instruções são armazenadas na memória ROM ou em outro tipo de memória não-volátil, e são carregadas 
# na memória RAM antes de serem executadas.	

.text

	# Carrega o valor 4 na registrador $v0, indicando que a chamada de sistema subsequente será para exibir uma string na tela.
	li $v0, 4 
	# Carrega o endereço da variável myMessage no registrador $a0, que será usado como argumento para a chamada de sistema.
	la $a0, myMessage
	# syscall faz a chamada de sistema propriamente dita, que exibe a string na tela.
	syscall
