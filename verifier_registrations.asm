# UNIVERSIDADE FEDERAL DE CAMPÍNA GRANDE
# DISCIPLINA: ARQUITETURA DE SISTEMAS DIGITAIS

# -------- CÓDIGO EM ASSEMBLY QUE VERIFICA MATRÍCULAS DE ALUNOS REGISTRADAS NO SISTEMA --------

.data
	# texto usado para identificar o registro de demonstração
	solicita_matricula: .asciiz "Digite uma matrícula de 9 dígitos (0 para sair): "
	credenciais_demonstracao1: .asciiz "Registro de demonstração: "
	credenciais_demonstracao2: .asciiz ", matrícula "

	matricula_nao_encontrada1: .asciiz "A matrícula "
	matricula_nao_encontrada2: .asciiz " não foi encontrada."
	matricula_encontrada1: .asciiz "A matrícula "
	matricula_encontrada2: .asciiz " corresponde ao aluno "
	pula_linha: .asciiz "\n"

	.align 2
	zero_matricula: .word 0
	auxiliar_conversor: .word 0x0000000F

	# Dados inteiramente fictícios para demonstração.
	matricula_destaque: .word 0x98765432
	nome_destaque: .asciiz "ALUNO DE DEMONSTRACAO"

	# Cada matrícula está associada a um ponteiro para o nome correspondente.
	.align 2
	matriculas: .word 0x23456789, 0x98765432, 0x23450001, 0x34567890
	nomes: .word nome_ana, nome_aluno, nome_bruno, nome_carla
	nome_ana: .asciiz "ANA EXEMPLO"
	nome_aluno: .asciiz "ALUNO DE DEMONSTRACAO"
	nome_bruno: .asciiz "BRUNO EXEMPLO"
	nome_carla: .asciiz "CARLA EXEMPLO"

.text	
	# função principal do programa
	main:
		# rótulo para manter o programa executando até o usuário solicitar a operação de saída
		loop_execucao:
			# chamada da função que mostra ao usuário uma mensagem de que seja digitada a sua matrícula
			jal mensagemSolicitacao
			# chamada da função que solicita ao usuário para que sua matrícula seja digitada
			jal recebeMatricula
			# chamada da função que verifica se a matricula é composta de zeros para encerrar o programa
			jal verificaMatricula
			# chamada da função que conta a quantidade de dígitos da matrícula e verifica se possui 9 dígitos
			jal contaDigitosMatricula
			# chamada da função que verifica se o primeiro dígito da matrícula informada é o número 1
			jal verificaPrimeiroDigito
			# chamada da função para verificar se a matrícula informada corresponde ao registro de demonstração
			jal verificaMatriculaDestaque
			# chamada da função que verifica se a matrícula digitada corresponde as matrículas cadastradas
			jal ProcuraMatricula
			# pula para a linha de código que mantém o programa executando até o usuário sair do programa
			j loop_execucao
		
	# chamada da função para encerrar o programa (apenas para manter o padrão da estrutura do código)
	jal exit
	
	# função secundária para imprimir na tela uma mensagem de solicitação de matrícula ao usuário
	mensagemSolicitacao: 
		# comando para imprimir uma string na tela
		li $v0, 4
		# adiciona o conteúdo de "solicita_matricula" ao registrador $a0 para exibir o conteúdo na tela
		la $a0, solicita_matricula
		# chamada do sistema para executar o comando armazenado no registrador $v0
		syscall
		
		# comando para encerrar a função
		jr $ra
	
	# função secundária para solicitar ao usuário que seja impresso uma matrícula na tela
	recebeMatricula:
		# comando para solicitar ao usuário que seja digitado um número inteiro na tela
		li $v0, 5
		# chamada do sistema para executar o comando armazenado no registrador $v0
		syscall
		
		# armazenando a matrícula digitada pelo usuário em $v0 no registrador $t0
		move $t1, $v0
		
		# comando para encerrar a função
		jr $ra
	
	# função  secundária para verificar se a matrícula do usuário é composta por zeros e encerrar o programa
	verificaMatricula:
		# carregando o conteúdo de "zero_matricula" no registrador $t0
		lw $t0, zero_matricula($zero)
		# se o conteúdo de $t1 e $t0 forem iguais (matrícula composta de zeros) encerrar o programa
		beq $t1, $t0, exit
		
		# comando para encerrar a função
		jr $ra
	
	# função secundária que exibe quando uma matrícula não é encontrada 
	exibeMatriculaNaoEncontrada:
		
		# comando para exibir uma string na tela
		li $v0, 4
		# carrega o conteúdo de "matricula_nao_encontrada1" no registrador $a0
		la $a0, matricula_nao_encontrada1
		# chamada do sistema para executar a operação definida em $v0
		syscall
		
		# comando do sistema para exibir um número inteiro na tela
		li $v0, 1
		# carrega o conteúdo do registrador $t1 (o número da matrícula) no registrador $a0
		add $a0, $zero, $t1
		# chamado do sistema para executar a operação definida em $v0
		syscall
		
		# comando para exibir uma string na tela
		li $v0, 4
		# carrega o conteúdo de "matricula_nao_encontrada2" no registrador $a0 para exibir o conteúdo na tela
		la $a0, matricula_nao_encontrada2
		# chamado do sistema para executar a operação definida em $v0
		syscall
		
		# comando para exibir uma string na tela
		li $v0, 4
		# manda o conteúdo de "pula_linha" para o contador $a0 para exibir na tela (pula uma linha)
		la $a0, pula_linha
		# chamada do sistema para executar a operação definida em $v0
		syscall
		
		# para evitar que mensagens duplicadas sejam exibidas na tela, volta para o começo da execução do código
		j loop_execucao
		
		# comando para encerrar a função
		jr $ra
	
	# função secundária que conta a quantidade de dígitos existentes na matrícula informada pelo usuário
	contaDigitosMatricula:
		# armazena o número inteiro 10 no registrador $s0
		li $s0, 10
		# armazena o número inteiro 0 no registrador $s1
		li $s1, 0
		# adiciona ao registrador $s2 o conteúdo de $t1 (a matrícula)
		add $s2, $t1, $zero
		# rótulo para indicar que o próxim bloco de código estará em loop
		loop_contador:
			# divide o conteúdo do registrador $s2 por $s0 e armazena no própio $s2
			div $s2, $s2, $s0
			# incrementa o registrador $s1 para contar a qwuantidade de dígitos
			addi $s1, $s1, 1
			# caso o conteúdo de $s2 seja um valor zero, não sobre mais nada pela divisão, finaliza o loop
			bne $s2, $zero, loop_contador
		
		# verifica se o contador armazenado no registrador $s1 é diferente de 9 dígitos, caso verdade,
		# pula para executar a função "exibeMatriculaNaoEncontrada"
		li $t9, 9
		bne $s1, $t9, exibeMatriculaNaoEncontrada
		
		# comando para encerrar a função 
		jr $ra
	
	# função secundária para verificar se o primeiro dígito da matrícula é o número 1
	verificaPrimeiroDigito:
		# armazena o número inteiro 100000000 no registrador $s0
		li $s0, 100000000
		# adiciona ao registrador $s2 o conteúdo de $t1 (a matrícula)
		add $s2, $t1, $zero
		# realiza a divisão dos conteúdos dos registradores $s2 dividido por $s1 e armazena em $s2
		div $s2, $s2, $s0
		# adiciona o quociente da divisão no registrador $s1
		mflo $s1
		
		# caso o primeiro dígito da matrícula seja diferente de 1, executa a função "exibeMatriculaNaoEncontrada"
		li $t9, 1
		bne $s1, $t9, exibeMatriculaNaoEncontrada
		
		# comando para encerrar a função
		jr $ra
	
	# função secundária que converte um número em hexadecimal para decimal
	converteHexaDecimal:
		# carrega no registrador $t3 o conteúdo de "auxiliar_conversor"
		lw $t3, auxiliar_conversor($zero)
		# inicializa o registrador $t2 com 0, o registrador responsável por armazenar o valor em hexa convertido para decimal
		li $t2, 0 
		# inicializa o registrador $t4 com 1, para servir de contador de loop da etapa de conversão 
		li $t4, 1
		# inicializa o contador $t5 com 10, para ir incrementando os dígitos separados individualmente do valor em hexa
		li $t5, 10
		
		# aplica uma operação de and com o valor auxiliar de conversor para capturar o último dígito em hexa
		and $t6, $t0, $t3 
		# soma de imediatos para adicionar o primeiro dígito 1 da matrícula e o último dígito capturado do valor em hexa
		addi $t2, $t6, 100000000
		# desloca para a esquerda o valor do auxiliar de conversor para capturar o próximo dígito
		sll $t3, $t3, 4
		
		# rótulo para indicar que o próximo bloco de código estará em loop (converte hexa para decimal)
		loop_conversao:
			# contador para decrementar o deslocamento para a esquerda dos valores resultantes da operação and
			li $t7, 0
			# aplica uma operação de and com o valor auxiliar de conversor para capturar o n-ésimo dígito em hexa
			and $t8, $t0, $t3
			
			# rótulo para indicar que o próximo bloco de código estará em loop (decrementa os bits de deslocamento)
			decrementa_conversao:
				# realiza o deslocamento para a direita com o valor resultante da operação and
				srl $t8, $t8, 4
				# soma com imediatos para incrementar o contador $t7 de realização dos deslocamentos
				addi $t7, $t7, 1
				# caso o contador de deslocamentos for diferente do contador do estado do dígito atual, realiza
				# novamente o decremento de 4 bits
				bne $t7, $t4, decrementa_conversao
			
			# move o conteúdo do registrador $t8 para $t5, o valor do dígito atual em decimal capturado de hexa
			move $t6, $t8
			# multiplica o valor do dígito atual para a sua devida casa decimal
			mul $t6, $t6, $t5
			# soma no registrador de conversão final $t2 o dígito capturado do número em hexa
			add $t2, $t2, $t6
			# atualiza a precisão da casa decimal para somar com o próximo dígito a ser capturado
			li $t9, 10
			mul $t5, $t5, $t9
			# desloca para a esquerda o valor do auxiliar de conversor para capturar o próximo dígito
			sll $t3, $t3, 4
			# incrementa o contador de conversão de hexa para decimal
			addi $t4, $t4, 1
			# se o número do conversor auxiliar for diferente de zero, continuar a conversão até o final
			bne $t3, $zero, loop_conversao
		
		# comando para encerrar a função
		jr $ra
	
	# função secundária para verificar a matrícula do registro de demonstração
	verificaMatriculaDestaque:
		# utilizando registradores como uma pilha para armazenar informações temporárias
		# mecanismo para fazer uma subrotina para que uma função seja utilizada dentro de outra
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		
		# carrega no registrador $t0 o valor em hexadecimal com a minha matricula
		lw $t0, matricula_destaque($zero)
		
		# chamada da função como subrotina para converter o valor da minha matrícula em hexa para decimal
		jal converteHexaDecimal
		
		# reorganizando a pilha com as informações temporárias
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		# caso a matrícula corresponda ao registro de demonstração, exibe seus dados fictícios
		beq $t1, $t2, exibeCredenciaisDemonstracao
		
		# chamada para encerrar a função
		jr $ra	
	
	# função secundária para exibir os dados fictícios do registro de demonstração
	exibeCredenciaisDemonstracao:
		# comando para exibir uma string na tela
		li $v0, 4
		# manda o conteúdo de "credenciais_demonstracao1" para o contador $a0 para exibir na tela
		la $a0, credenciais_demonstracao1
		# chamada do sistema para executar a operação definida em $v0
		syscall
		
		# comando para exibir uma string
		li $v0, 4
		# manda o conteúdo de "nome_destaque" para o contador $a0 para exibir na tela
		la $a0, nome_destaque
		# chamada do sistema para executar a operação definida em $v0
		syscall
		
		# comando para exibir uma string na tela
		li $v0, 4
		# manda o conteúdo de "credenciais_demonstracao2" para o contador $a0 para exibir na tela
		la $a0, credenciais_demonstracao2
		# chamada do sistema para executar a operação definida em $v0
		syscall
		
		# comando para exibir um número inteiro na tela
		li $v0, 1
		# adicionando o conteúdo de $t1 (a matrícula) ao registrador $a0 para exibir o conteúdo na tela
		add $a0, $t1, $zero
		# chamada do sistema para executar a operação definida em $v0
		syscall
		
		# comando para exibir uma string na tela
		li $v0, 4
		# manda o conteúdo de "pula_linha" para o contador $a0 para exibir na tela (pula uma linha)
		la $a0, pula_linha
		# chamada do sistema para executar a operação definida em $v0
		syscall
		
		# volta para o começo do programa para evitar que saídas indesejadas sejam exibidas na tela
		j loop_execucao
		
		# comando para encerrar a função
		jr $ra
	
	# função secundária que procura se a matrícula digitada está cadastrada no sistema
	ProcuraMatricula:
		# carregando o valor 0 no registrador $3, registrador responsável por interar entre os números de matrícula
		li $s3, 0
		# carregando o valor 0 no registrador $4, registrador responsável por interar entre os nomes de alunos
		li $s4, 0
		
		# rótulo para indicar que o próximo bloco de código vai ser um loop para pesquisar a matrícula digitada
		loop_procura_matricula:
			# carrega no registrador $t0 o valor atual da matrícula a ser verificada
			lw $t0, matriculas($s3)
			# utilizando registradores como uma pilha para armazenar informações temporárias
			# mecanismo para fazer uma subrotina para que uma função seja utilizada dentro de outra
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			# chamada da função que converte o valor da matrícula atual em hexadecimal para um número inteiro
			jal converteHexaDecimal
			# reorganizando a pilha com as informações temporárias
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			# se a matrícula pesquisada estiver no sistema, exibe que a matrícula foi encontrada
			beq $t1, $t2, MatriculaEncontrada
			# intera o registrador $s3 para carregar a próxima matrícula para verificação
			addi $s3, $s3, 4
			# intera o registrador $s4 para carregar o próximo nome de aluno cuja matrícula está em análise
			addi $s4, $s4, 4
			# se o registrador $3 já inteirou com todas as matrículas, encerra o programa
			li $t9, 16
			bne $s3, $t9, loop_procura_matricula
			
			# utilizando registradores como uma pilha para armazenar informações temporárias
			# mecanismo para fazer uma subrotina para que uma função seja utilizada dentro de outra
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			# caso o programa tenha interado entre todas as matrículas e não tenha encontrado nada, exibe que a 
			# matrícula não foi encontrada
			jal exibeMatriculaNaoEncontrada
			# reorganizando a pilha com as informações temporárias
			lw $ra, 0($sp)
			addi $sp, $sp, 4
		
		# chamada para encerrar a função
		jr $ra
	
	# função secundária que exibe na tela quando alguma matrícula foi encontrada
	MatriculaEncontrada:
		# comando para exibir uma string na tela
		li $v0, 4
		# carrega o conteúdo de "matricula_encontrada1" no registrador $a0 para exibir o conteúdo na tela
		la $a0, matricula_encontrada1
		# chamada do sistema para executar o comando definido no registrador $t0
		syscall
		
		# comando para exibir um número inteiro na tela
		li $v0, 1
		# carrega o conteúdo de $t1 no registrador $a0 para exibir a matrícula na tela
		add $a0, $zero, $t1
		# chamada do sistema para executar o comando definido no registrador $t0
		syscall
		
		# comando para exibir uma string na tela
		li $v0, 4
		# carrega o conteúdo de "matricula_encontrada2" no registrador $a0 para exibir o conteúdo na tela
		la $a0, matricula_encontrada2
		# chamada do sistema para executar o comando definido no registrador $t0
		syscall
		
		# comando para exibir uma string na tela
		li $v0, 4
		# carrega o conteúdo do nome atual do aluno no registrador $a0 para exibir na tela
		lw $a0, nomes($s4)
		syscall
		
		# comando para exibir uma string na tela
		li $v0, 4
		# manda o conteúdo de "pula_linha" para o contador $a0 para exibir na tela (pula uma linha)
		la $a0, pula_linha
		# chamada do sistema para executar a operação definida em $v0
		syscall
		
		# para evitar que o código demore mais na procura de matrículas, pula para o começo da execução
		j loop_execucao

		# chamada para encerrar a função
		jr $ra
		
	# função secundária para encerrar o programa
	exit:
		# comando para encerrar o programa
		li $v0, 10
		# chamada do sistema para executar o comando armazenado no registrador $v0
		syscall
		
		# comando para encerrar a função
		jr $ra
