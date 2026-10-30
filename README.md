# Assembly com MARS

Exemplos didáticos de Assembly MIPS para estudar instruções, entrada e saída, operações aritméticas, funções, desvios, laços, arrays e números de ponto flutuante. Os arquivos são programas independentes e seguem uma sequência introdutória.

## Como executar

1. Instale o Java e baixe o [MARS 4.5](https://dpetersanderson.github.io/MARS/).
2. Abra o arquivo `.asm` desejado no MARS.
3. Selecione **Run > Assemble** e depois **Run > Go**.
4. Para exemplos que recebem dados, digite a entrada no console do simulador.

Cada arquivo pode ser aberto e executado individualmente. Os exemplos usam serviços de sistema do MARS para ler entradas e exibir resultados.

## Roteiro de exemplos

### Fundamentos e operações

| Arquivo | Assunto |
| --- | --- |
| [01 — Hello Assembly](assembly-introduction/01_hello_assembly.asm) | Exibir uma mensagem |
| [02 — Caractere](assembly-introduction/02_printing_character.asm) | Exibir um caractere |
| [03 — Inteiro](assembly-introduction/03_printing_integer.asm) | Exibir um inteiro |
| [04 — Float](assembly-introduction/04_printing_float.asm) | Exibir um número `float` |
| [05 — Double](assembly-introduction/05_printing_double.asm) | Exibir um número `double` |
| [06 — Soma](assembly-introduction/06_adding_integers.asm) | Somar inteiros |
| [07 — Subtração](assembly-introduction/07_subtracting_integers.asm) | Subtrair inteiros |
| [08 — Multiplicação](assembly-introduction/08_multiplying_integers.asm) | Multiplicar inteiros |
| [09 — Multiplicação com `mult`](assembly-introduction/09_multiplying_integers.asm) | Usar os registradores `HI` e `LO` |
| [10 — Deslocamento de bits](assembly-introduction/10_multiplying_integers.asm) | Multiplicar por deslocamento |
| [11 — Divisão](assembly-introduction/11_dividing_integers.asm) | Dividir inteiros |
| [12 — Quociente e resto](assembly-introduction/12_dividing_integers.asm) | Usar `mflo` e `mfhi` |

### Funções e entrada de dados

| Arquivo | Assunto |
| --- | --- |
| [13 — Funções](assembly-introduction/13_introduction_to_functions.asm) | Chamar uma função |
| [14 — Argumentos e retorno](assembly-introduction/14_introduction_to_functions.asm) | Passar valores entre funções |
| [15 — Registradores e pilha](assembly-introduction/15_registers_stack.asm) | Preservar um registrador na pilha |
| [16 — Funções aninhadas](assembly-introduction/16_nested_procedures.asm) | Fazer chamadas aninhadas |
| [17 — Entrada de inteiros](assembly-introduction/17_input_integers.asm) | Ler um inteiro |
| [18a — Entrada de float](assembly-introduction/18_input_float.asm) | Ler um `float` |
| [18b — Entrada de double](assembly-introduction/18_input_double.asm) | Ler um `double` |
| [19 — Entrada de texto](assembly-introduction/19_input_string.asm) | Ler e exibir uma string |

### Controle de fluxo, arrays e ponto flutuante

| Arquivo | Assunto |
| --- | --- |
| [20 — Comparação e desvio](assembly-introduction/20_if_statements_branching.asm) | Comparar dois inteiros |
| [21 — Comparação com `slt`](assembly-introduction/21_number_less_than_another.asm) | Comparar valores inteiros |
| [22 — Desvios condicionais](assembly-introduction/22_branching_pseudo_instructions.asm) | Usar pseudoinstruções de desvio |
| [23 — Laço `while`](assembly-introduction/23_while_loop.asm) | Repetir instruções com um contador |
| [24 — Arrays](assembly-introduction/24_arrays.asm) | Armazenar valores em um array |
| [25 — Percorrer arrays](assembly-introduction/25_printing_arrays_in_loop.asm) | Ler valores em um laço |
| [26 — Inicialização de arrays](assembly-introduction/26_array_initializer.asm) | Inicializar e percorrer um array |
| [27 — Ponto flutuante](assembly-introduction/27_floating_point_numbers.asm) | Somar valores `double` |
| [28 — Operações com ponto flutuante](assembly-introduction/28_floating_point_operations.asm) | Multiplicar e dividir valores `double` |
| [29 — Condição com ponto flutuante](assembly-introduction/29_if_statements_if_true.asm) | Comparar valores `float` |

## Projeto: verificador de matrículas

O arquivo [`verifier_registrations.asm`](verifier_registrations.asm) demonstra validação de entrada, busca em arrays e sub-rotinas. Para manter o exemplo adequado a um repositório público, os registros usados no código são fictícios.

Experimente as matrículas `123456789`, `198765432`, `123450001` e `134567890`. Digite `0` para encerrar.

## Créditos

Os exemplos introdutórios foram inspirados pela playlist [Assembly Language with MARS, de Programming with Mosh](https://www.youtube.com/playlist?list=PL5b07qlmA3P6zUdDf-o97ddfpvPFuNa5A). Este repositório reúne exercícios de estudo e não é um material oficial do canal.

## Contribuições

Sugestões e correções são bem-vindas. Abra uma issue para discutir uma mudança ou envie um pull request com a descrição do ajuste.

## Licença

Distribuído sob a licença [MIT](LICENSE).
