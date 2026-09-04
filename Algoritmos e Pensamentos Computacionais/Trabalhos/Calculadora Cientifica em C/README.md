🧮 Calculadora Científica em C

Uma calculadora científica desenvolvida em linguagem C, com 20 funções matemáticas e operações diferentes. O projeto utiliza conceitos fundamentais de programação, como estruturas condicionais, laços de repetição, operações matemáticas e funções da biblioteca math.h.

📌 Sobre o projeto

Este projeto consiste em uma calculadora científica executada diretamente pelo terminal.

O usuário escolhe uma das 20 opções disponíveis através de um menu interativo e informa os valores necessários para realizar a operação.

Além das operações matemáticas básicas, a calculadora possui funções científicas, conversão entre graus e radianos, cálculo de fatorial e conversão de números inteiros para binário.

O projeto foi desenvolvido principalmente com finalidade educacional, colocando em prática conceitos básicos e intermediários da linguagem C.

✨ Funcionalidades

A calculadora possui as seguintes 20 funções:

Nº	Função	Descrição
1	➕ Soma	Soma dois números
2	➖ Subtração	Subtrai dois números
3	➗ Divisão	Divide dois números, verificando divisão por zero
4	✖️ Multiplicação	Multiplica dois números
5	√ Raiz Quadrada	Calcula a raiz quadrada de um número
6	🔢 Potência	Calcula uma base elevada a um expoente
7	ln Logaritmo Natural	Calcula o logaritmo natural
8	log10	Calcula o logaritmo na base 10
9	❗ Fatorial	Calcula o fatorial de um número inteiro
10	⬆️ Arredondar para cima	Utiliza ceil()
11	⬇️ Arredondar para baixo	Utiliza floor()
12	📐 Seno	Calcula o seno de um ângulo em radianos
13	📐 Cosseno	Calcula o cosseno de um ângulo em radianos
14	📐 Tangente	Calcula a tangente de um ângulo em radianos
15	° Graus	Converte radianos para graus
16	↔️ Radianos	Converte graus para radianos
17	📈 Exponencial	Calcula e^x
18	🔢 Valor absoluto	Retorna o valor absoluto de um número
19	🔹 Parte inteira e decimal	Separa um número em parte inteira e decimal
20	💻 Binário	Converte um número inteiro para sua representação binária
🛠️ Tecnologias utilizadas
C
stdio.h
math.h
Compilador compatível com C
Terminal/console
📚 Bibliotecas utilizadas
stdio.h

A biblioteca stdio.h fornece funções de entrada e saída utilizadas pelo programa.

No projeto, ela é utilizada principalmente através de:

printf()
scanf()


Essas funções permitem exibir informações na tela e receber valores digitados pelo usuário.

math.h

A biblioteca math.h fornece diversas funções matemáticas utilizadas pela calculadora:

sqrt()    // Raiz quadrada
pow()     // Potência
log()     // Logaritmo natural
log10()   // Logaritmo base 10
ceil()    // Arredondamento para cima
floor()   // Arredondamento para baixo
sin()     // Seno
cos()     // Cosseno
tan()     // Tangente
exp()     // Exponencial
fabs()    // Valor absoluto
modf()    // Separa parte inteira e decimal

🥧 Constante PI

O programa utiliza a constante M_PI para realizar as conversões entre graus e radianos.

Como M_PI pode não estar disponível em todos os compiladores, foi utilizado:

#ifndef M_PI
#define M_PI 3.1415
#endif

O que isso significa?

#ifndef significa "if not defined", ou seja, "se não estiver definido".

O código verifica se M_PI já existe. Caso não exista, ele cria a constante:

#define M_PI 3.1415


O #endif indica o final dessa condição.

💡 Observação: para maior precisão, o valor de PI poderia ser definido como 3.141592653589793.

🧠 Conceitos de programação utilizados

O projeto utiliza diversos conceitos importantes da linguagem C.

🔄 Laço while

O menu principal fica dentro de um:

while (1)


Isso faz com que a calculadora continue funcionando até que o usuário escolha a opção 0.

if (escolha == 0) {
    printf("Saindo...\n");
    break;
}


O break encerra o laço e finaliza o programa.

🔀 Estruturas condicionais

As opções do menu são verificadas utilizando:

if
else if
else


Dessa maneira, o programa identifica qual operação o usuário escolheu e executa o código correspondente.

🔢 Variáveis

O programa utiliza diferentes tipos de variáveis:

int escolha;
float n1, n2, n3;

int → números inteiros.
float → números com casas decimais.
long long → utilizado para armazenar valores inteiros maiores, como o resultado de fatoriais.
❗ Fatorial

O fatorial não depende de uma função da biblioteca math.h. Ele foi implementado manualmente utilizando um for.

long long fat = 1;

for (i = 1; i <= num; i++) {
    fat *= i;
}


Por exemplo:

5! = 5 × 4 × 3 × 2 × 1
5! = 120

💻 Conversão para binário

A conversão para binário também foi implementada manualmente, sem utilizar uma função específica da biblioteca.

O programa utiliza operações com bits, especialmente o operador:

>>


O operador >> realiza um deslocamento de bits para a direita.

Também é utilizado:

&


para verificar se determinado bit possui valor 0 ou 1.

A lógica percorre os bits do número e imprime sua representação binária.

Por exemplo:

Decimal: 10
Binário: 1010

📐 Conversão de graus e radianos

A calculadora possui duas funções para conversão de ângulos.

Radianos → Graus
graus = radianos × 180 / PI


No código:

n1 * 180.0 / M_PI

Graus → Radianos
radianos = graus × PI / 180


No código:

n1 * M_PI / 180.0

🛡️ Tratamento de erros

O programa possui algumas verificações para evitar operações matemáticas inválidas.

Divisão por zero
if (n2 == 0) {
    printf("Não é possível dividir por zero.\n");
}

Raiz quadrada de número negativo
if (n1 < 0) {
    printf("Não existe raiz real para esse número.\n");
}

Logaritmo

O logaritmo natural e o logaritmo base 10 exigem valores maiores que zero:

if (n1 <= 0) {
    printf("Erro: o valor deve ser maior que zero.\n");
}

Fatorial negativo

O fatorial é definido para números inteiros não negativos:

if (num < 0) {
    printf("Não existe fatorial de número negativo.\n");
}

▶️ Como executar
1. Clone o repositório
git clone https://github.com/seu-usuario/calculadora-c.git

2. Entre na pasta
cd calculadora-c

3. Compile o programa

Como o projeto utiliza funções da biblioteca matemática, em compiladores como o GCC pode ser necessário utilizar -lm:

gcc calculadora.c -o calculadora -lm

4. Execute

No Linux/macOS:

./calculadora


No Windows:

calculadora.exe

📂 Estrutura do projeto

Uma estrutura simples para o projeto pode ser:

calculadora-c/
│
├── calculadora.c
└── README.md

🖥️ Exemplo de utilização

Ao executar o programa, o usuário verá um menu semelhante a:

=================================
Calculadora de 20 funções
===================================
Escolha uma função!

[1]  Soma
[2]  Subtração
[3]  Dividir
[4]  Multiplicar
[5]  Raiz Quadrada
[6]  Potencia
[7]  Logaritimo
[8]  Logaritimo base10
[9]  Fatorial
[10] Arredondamento para cima
[11] Arredondamento para baixo
[12] Seno
[13] Cosseno
[14] Tangente
[15] Converter em graus
[16] Converter em radianos
[17] Exponencial
[18] Valor absoluto
[19] Separar parte inteira e decimal
[20] Converter para binarios
[0] Sair


Exemplo de soma:

Qual opção você irá escolher?: 1

Digite seu primeiro valor: 10
Digite seu segundo valor: 5

A soma de 10.00 e 5.00 é: 15.00

🎯 Objetivos do projeto

Este projeto tem como principais objetivos:

Praticar a linguagem C.
Aprender a utilizar bibliotecas.
Trabalhar com entrada e saída de dados.
Utilizar estruturas if, else if e else.
Praticar laços de repetição.
Trabalhar com operações matemáticas.
Utilizar funções da biblioteca math.h.
Entender conversões entre graus e radianos.
Implementar um cálculo de fatorial manualmente.
Praticar operações com bits.
Desenvolver um programa interativo no terminal.

Este projeto foi desenvolvido para fins educacionais e pode ser utilizado como material de estudo para programação em C.

⭐ Se este projeto foi útil para você, considere deixar uma estrela no repositório!
