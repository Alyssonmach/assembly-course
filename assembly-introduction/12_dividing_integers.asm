# código em assembly que divide dois números inteiros longos, calcula o quociente e o resto, e os exibe na tela

.data
	newLine: .asciiz "\n"

.text
	# adiciona a constante 30, por soma de imediatos, a variável %t0
	addi $t0, $zero, 30
	# adiciona a constante 8, por soma de imediatos, a variável %t1
	addi $t1, $zero, 8
	# realiza a operação de divisão com os valores dos registrador $t0 e $t1, adicionando-os nos registradores low e high
	div $t0, $t1
	# adiciona o quociente, a partir do registrador low, para o registrador $s0
	mflo $s0 
	# adiciona o resto, a partir do registrador high, para o registrador $s1
	mfhi $s1 
	# comando para exibir um número inteiro na tela
	li $v0, 1
	# exibe o quociente armazenado em $s0
	move $a0, $s0
	syscall

	# separa o quociente do resto com uma quebra de linha
	li $v0, 4
	la $a0, newLine
	syscall

	# exibe o resto armazenado em $s1
	li $v0, 1
	move $a0, $s1
	syscall
