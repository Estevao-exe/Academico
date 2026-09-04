🧮 Calculadora Científica — Flowgorithm

Projeto de uma Calculadora Científica com 20 funções, desenvolvida utilizando o Flowgorithm. O objetivo é representar a lógica de um programa de calculadora por meio de fluxograma, trabalhando conceitos fundamentais de algoritmos e programação.

📖 Descrição

A aplicação apresenta um menu interativo no qual o usuário pode escolher entre 20 operações matemáticas ou encerrar o programa.

O algoritmo utiliza estruturas de decisão, repetição, variáveis, entrada e saída de dados e funções matemáticas para executar as operações.

A calculadora permanece em execução até que o usuário selecione a opção 0 — Sair.

🎯 Objetivos

O projeto foi criado com os seguintes objetivos:

Praticar lógica de programação.
Aprender a representar algoritmos em fluxogramas.
Utilizar estruturas de repetição.
Trabalhar com estruturas condicionais.
Utilizar variáveis inteiras e reais.
Implementar operações matemáticas.
Trabalhar com funções trigonométricas.
Desenvolver um menu interativo.
Implementar o cálculo de fatorial utilizando repetição.
Praticar validação de entradas.
🔢 Operações disponíveis

A calculadora possui 20 operações:

Opção	Operação	Tipo
1	Soma	A + B
2	Subtração	A - B
3	Multiplicação	A × B
4	Divisão	A ÷ B
5	Potência	A ^ B
6	Módulo	A % B
7	Raiz quadrada	√A
8	Seno	sin(A)
9	Cosseno	cos(A)
10	Tangente	tan(A)
11	Arco-seno	arcsin(A)
12	Arco-cosseno	arccos(A)
13	Arco-tangente	arctan(A)
14	Logaritmo base 10	log10(A)
15	Logaritmo natural	log(A)
16	Exponencial	exp(A)
17	Valor absoluto	abs(A)
18	Parte inteira	int(A)
19	Sinal do número	sgn(A)
20	Fatorial	A!

A opção 0 encerra o programa.

🧩 Organização do algoritmo

O programa pode ser dividido em quatro etapas principais:

┌─────────────────────────┐
│       Início            │
└────────────┬────────────┘
             ↓
┌─────────────────────────┐
│ Exibe o menu            │
└────────────┬────────────┘
             ↓
┌─────────────────────────┐
│ Lê a opção do usuário   │
└────────────┬────────────┘
             ↓
      ┌──────┴──────┐
      │             │
   Opção 0?       Não
      │             │
     Sim            ↓
      │      ┌───────────────┐
      ↓      │ Valida opção  │
   Encerra   └───────┬───────┘
                      ↓
              ┌───────────────┐
              │ Executa       │
              │ operação      │
              └───────┬───────┘
                      ↓
              ┌───────────────┐
              │ Mostra        │
              │ resultado     │
              └───────┬───────┘
                      │
                      └──────→ Volta ao menu

🔄 Estrutura de repetição

O programa utiliza um while para manter a calculadora funcionando:

Enquanto op != 0
    Mostrar menu
    Ler opção
    Executar operação
    Mostrar resultado
Fim enquanto


Dessa maneira, o usuário pode realizar várias operações sem precisar reiniciar o programa.

A repetição somente termina quando:

op = 0

🔀 Estruturas condicionais

As escolhas são verificadas através de estruturas if.

Primeiro, o programa verifica se a opção está dentro do intervalo permitido:

Se op > 0 e op <= 20
    Executar operação
Senão
    Informar que a opção é inválida
Fim se


Depois, o algoritmo identifica qual operação foi selecionada.

Por exemplo:

Se op == 1
    resultado = a + b
Fim se

➕ Operações básicas

As seis primeiras opções trabalham com dois valores:

A
B

Soma
resultado = A + B

Subtração
resultado = A - B

Multiplicação
resultado = A × B

Divisão
resultado = A / B


Antes da divisão, o programa verifica se B é diferente de zero.

Potência
resultado = A ^ B

Módulo
resultado = A % B


O comportamento do operador % depende dos recursos e da interpretação do tipo numérico no ambiente utilizado pelo Flowgorithm.

📐 Funções trigonométricas

A calculadora possui seis operações relacionadas à trigonometria:

Seno
Cosseno
Tangente
Arco-seno
Arco-cosseno
Arco-tangente

As funções são chamadas utilizando o valor armazenado em A.

Exemplo:

resultado = sin(A)

📊 Funções logarítmicas e exponenciais

O projeto também possui funções relacionadas a logaritmos e exponenciais.

Logaritmo base 10
resultado = log10(A)

Logaritmo natural
resultado = log(A)

Exponencial
resultado = exp(A)


Essas operações são importantes em cálculos científicos e matemáticos.

🔢 Operações com números
Valor absoluto

A opção 17 utiliza:

resultado = abs(A)


O valor absoluto transforma um número negativo em seu equivalente positivo.

Exemplo:

abs(-15) = 15

Parte inteira

A opção 18 utiliza:

resultado = int(A)


Essa operação obtém a parte inteira do valor.

Sinal

A opção 19 utiliza:

resultado = sgn(A)


Essa função permite identificar o sinal de um número.

De forma geral:

Número positivo →  1
Zero             →  0
Número negativo → -1

❗ Fatorial

A opção 20 calcula o fatorial utilizando um laço for.

Primeiramente:

resultado = 1


Depois, o algoritmo multiplica o resultado por cada número de 1 até A:

Para i = 1 até A
    resultado = resultado × i
Fim para


Por exemplo:

5! = 1 × 2 × 3 × 4 × 5

5! = 120


Essa parte do projeto é especialmente interessante porque demonstra como uma operação matemática pode ser transformada em um algoritmo utilizando repetição.

🛡️ Validação de opções

O algoritmo verifica se a escolha está entre 0 e 20.

Caso o usuário informe um valor fora desse intervalo, aparece:

Opcao Invalida!


Isso impede que o programa tente executar uma operação inexistente.

⚠️ Divisão por zero

A divisão possui uma verificação específica:

Se B != 0
    resultado = A / B
Senão
    Mostrar "ERRO: Divisao por zero!"
    resultado = 0
Fim se


Essa validação evita uma operação matematicamente inválida.

🗃️ Variáveis utilizadas

O algoritmo possui quatro variáveis principais:

Variável	Tipo	Função
op	Integer	Armazena a opção escolhida
i	Integer	Contador utilizado no fatorial
a	Real	Primeiro valor da operação
b	Real	Segundo valor da operação
result	Real	Armazena o resultado
🧠 Conceitos de algoritmos aplicados

Este projeto reúne vários conceitos importantes:

Entrada de dados

O programa recebe informações do usuário através de comandos de entrada.

Exemplo:

input op
input a
input b

Saída de dados

As informações são apresentadas através de comandos de saída:

output "=== Calculadora Cientifica ==="

Condição

Utilização de:

if
else


para tomar decisões.

Repetição

Utilização de:

while
for


O while controla o funcionamento do programa, enquanto o for é utilizado no cálculo do fatorial.

Operadores

O projeto trabalha com operadores matemáticos e relacionais:

+
-
*
/
%
^
==
!=
>
<
>=
<=

🖥️ Exemplo de execução

Ao iniciar o programa, o usuário encontra o seguinte menu:

=== Calculadora Cientifica ===
1:Soma | 2:Subtração | 3:Multiplicação | 4:Divisão | 5:Potência | 6:Módulo
7:Raiz | 8:Seno | 9:Cosseno | 10:Tangente | 11:Asin | 12:Acos | 13:Atan
14:Log10 | 15:Ln | 16:Exp | 17:Abs | 18:Int | 19:Sinal | 20:Fatorial
0:Sair
--------------------------------
Escolha a operacao (0 a 20):


Exemplo utilizando a soma:

Escolha a operacao: 1

Digite o valor de A:
15

Digite o valor de B:
7

=====> Resultado: 22

📁 Arquivo do projeto

O projeto foi desenvolvido no formato utilizado pelo Flowgorithm:

Calculadora Científica.fprg


O arquivo contém a estrutura XML responsável por representar o fluxograma e suas instruções.

🔍 Sobre o formato .fprg

O Flowgorithm armazena seus fluxogramas em arquivos baseados em XML.

Por isso, o conteúdo do projeto apresenta elementos como:

<flowgorithm>


e:

<function name="Main">


Além disso, comandos do algoritmo são representados por elementos como:

<declare>
<assign>
<input>
<output>
<if>
<while>
<for>


Isso permite que o fluxograma seja salvo e posteriormente aberto novamente no Flowgorithm.

📚 O que foi aprendido

Com a construção da calculadora, é possível praticar:

Lógica de programação.
Fluxogramas.
Variáveis.
Tipos de dados.
Entrada e saída.
Operações matemáticas.
Condições.
Laços while.
Laços for.
Funções matemáticas.
Validação de dados.
Organização de menus.
Implementação de algoritmos matemáticos.
🚀 Possíveis melhorias

O projeto pode ser expandido futuramente com:

Histórico das operações realizadas.
Opção para limpar o resultado.
Conversão de graus e radianos.
Porcentagem.
Média aritmética.
Combinação e permutação.
Mais funções trigonométricas.
Validação dos valores utilizados em logaritmos.
Validação da raiz quadrada.
Tratamento de valores inválidos para fatorial.
Separação das operações em funções independentes.
🎓 Finalidade

Este projeto possui finalidade principalmente acadêmica e educacional. A calculadora serve como exercício para compreender como problemas matemáticos podem ser transformados em algoritmos e representados visualmente através de um fluxograma.

👨‍💻 Projeto

Nome: Calculadora Científica
Plataforma: Flowgorithm
Quantidade de funções: 20
Formato: .fprg
Tipo: Projeto de lógica de programação

⭐ Projeto desenvolvido para praticar algoritmos, estruturas de decisão e repetição utilizando Flowgorithm.
