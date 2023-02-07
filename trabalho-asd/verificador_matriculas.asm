.data
	solicitar_matricula: .asciiz "Digite sua Matrícula: "
	entrada_matricula: .space 10

.text
    # == solicita ao usuário que ele digite a sua matrícula ==
    
    # syscall 4 é um comando para imprimir uma string na tela
    li $v0, 4 
    # carrega a mensagem de solicitação da matrícula no registrador $a0
    la $a0, solicitar_matricula 
    syscall

    # == leitura da matrícula de 9 dígitos do usuário ==
    
    # syscall 8 é um comando para ler uma string do usuário
    li $v0, 8 
    # carrega a string de 9 dígitos no registrador $a0
    la $a0, entrada_matricula 
    # especifica o tamanho máximo da string a ser lida
    li $a1, 10 
    syscall

    # == verificando se a matrícula não é nula ==
    
    # carrega o endereço da string de entrada em $a2
    la $a2, entrada_matricula 
    # inicializando o contador de zeros
    li $t0, 0
    # se o contador de zeros for 9, pule para a linha com o label de "exit"
    loop: beq $t0, 9, exit 
    # carrega o próximo caractere em $t1  
    lb $t1, 0($a2)   
    # avança para o próximo caractere, através do incremento do contador
    addi $a2, $a2, 1    
    # se o caractere é zero, realiza o incremento do contador de zeros
    beqz $t1, add_zero  
    # caso contrário, finaliza a verificação indo para o código a partir do label "continue"
    j continue          
    # incrementa o contador de zeros
    add_zero: addi $t0, $t0, 1    # Incrementa o contador de zeros
    # volta para o começo da repetição, cujo label é "loop"
    j loop               

   continue:
   # ... Seu código continua aqui

    # == finalizando o programa ==
    
    exit: li $v0, 10
    syscall
