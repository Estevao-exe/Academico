# Sistema de Matrizes em C

Programa de terminal escrito em C que lê de **2 a 10 matrizes** (de até **20x20**) e aplica uma operação entre elas: **adição**, **subtração**, **multiplicação** ou **divisão matricial**.

O projeto existe em duas versões com o mesmo código e o mesmo comportamento:

| Versão | Arquivos | Quando usar |
|---|---|---|
| **Modular** | `main.c`, `entrada.c`, `matrizes.c`, `matrizes.h` | Versão principal, com o código dividido em módulos. É a que deve ser entregue/estudada. |
| **Arquivo único** | `Total.c` | Todo o código em um só arquivo. Serve para rodar em compiladores online que não aceitam bem vários arquivos. |

---

## Estrutura do projeto

```
.
├── Total.c                  # versão completa em um único arquivo
└── SistemaMatrizes/         # versão modular
    ├── main.c               # programa principal (menu e fluxo)
    ├── entrada.c            # leitura e exibição das matrizes
    ├── matrizes.c           # operações matemáticas
    └── matrizes.h           # constantes, struct Matriz e declarações das funções
```

> Na versão modular, o `matrizes.h` deve ficar **na mesma pasta** dos arquivos `.c`, pois eles o incluem com `#include "matrizes.h"`.

---

## O que cada arquivo faz

### `matrizes.h` (o "contrato" do projeto)

- Define as constantes `MAX` (20, tamanho máximo de linhas/colunas) e `MAX_MATRIZES` (10, quantidade máxima de matrizes).
- Define a `struct Matriz`, que guarda o número de `linhas`, o número de `colunas` e os `elementos` (matriz de `double` de `MAX` x `MAX`).
- Declara (sem implementar) todas as funções usadas pelos outros arquivos.
- Usa *include guard* (`#ifndef MATRIZES_H`) para não ser incluído duas vezes na mesma compilação.

### `entrada.c` (entrada e saída)

| Função | O que faz |
|---|---|
| `erroEntrada()` | Mostra uma mensagem de erro e encerra o programa (código 1). É chamada quando o `scanf` não consegue ler nada. |
| `lerMatriz(Matriz *m, int numero)` | Pede ao usuário as linhas, as colunas e cada elemento de uma matriz. Repete a pergunta enquanto o valor estiver fora de 1 a `MAX`. Recebe um **ponteiro** porque precisa preencher a matriz original. |
| `mostrarMatriz(Matriz m)` | Imprime a matriz formatada com 2 casas decimais. Recebe uma **cópia**, pois só precisa ler. |

### `matrizes.c` (operações matemáticas)

Todas as funções devolvem `1` em caso de sucesso e `0` quando a operação é impossível, e guardam o resultado na matriz apontada por `resultado`.

| Função | Regra | Dimensão do resultado |
|---|---|---|
| `somar(a, b, &r)` | `a` e `b` com as mesmas dimensões | igual à de `a` |
| `subtrair(a, b, &r)` | `a` e `b` com as mesmas dimensões | igual à de `a` |
| `multiplicar(a, b, &r)` | colunas de `a` = linhas de `b` | linhas de `a` x colunas de `b` |
| `inverter(m, &inv)` | matriz quadrada e não singular | igual à de `m` |

A **inversa** é calculada pelo método de **Gauss-Jordan**:

1. Monta a matriz aumentada `[A | I]`.
2. Para cada coluna, escolhe o maior pivô (pivoteamento parcial) e troca as linhas se necessário.
3. Se o pivô for menor que `1e-10` em valor absoluto, a matriz é considerada **singular** (sem inversa).
4. Divide a linha do pivô para o pivô virar 1 e zera os outros elementos da coluna.
5. No final, a metade direita da matriz aumentada é a inversa.

### `main.c` (programa principal)

1. Pergunta quantas matrizes serão usadas (2 a 10).
2. Lê cada matriz com `lerMatriz`.
3. Mostra o menu e lê a operação escolhida.
4. A primeira matriz vira o resultado inicial, e a operação é aplicada **em sequência** com as demais:

   ```
   resultado = M1
   resultado = resultado (operação) M2
   resultado = resultado (operação) M3
   ...
   ```

5. Se alguma etapa falhar, mostra o erro correspondente e interrompe. Se tudo der certo, mostra o resultado.

---

## Operações

| Opção | Operação | O que é calculado |
|---|---|---|
| 1 | Adição | `M1 + M2 + M3 ...` |
| 2 | Subtração | `M1 - M2 - M3 ...` |
| 3 | Multiplicação | `M1 x M2 x M3 ...` (a ordem importa) |
| 4 | Divisão matricial | `M1 x M2⁻¹ x M3⁻¹ ...` |

A divisão de matrizes não existe como operação própria: dividir `A` por `B` significa multiplicar `A` pela **inversa** de `B`. Por isso, na opção 4, cada matriz a partir da segunda precisa ser **quadrada** e **não singular**. Como a multiplicação não é comutativa, `A ÷ B` é diferente de `B ÷ A`.

---

## Como compilar e executar

### Versão modular

Com o GCC instalado, abra o terminal na pasta com os quatro arquivos e rode:

```bash
gcc main.c entrada.c matrizes.c -o matrizes -lm
```

Depois execute:

```bash
# Windows
matrizes.exe

# Linux / macOS
./matrizes
```

> A flag `-lm` liga a biblioteca de matemática (usada pela função `fabs` em `matrizes.c`). É necessária no Linux e inofensiva no Windows.
>
> Os três `.c` precisam ser compilados **juntos**. O `.h` não entra na linha de comando, pois é incluído pelos `.c`.

### Versão em arquivo único (`Total.c`)

```bash
gcc Total.c -o total -lm
```

### Em um compilador online (ex.: OneCompiler)

1. Use o conteúdo do `Total.c` como único arquivo `.c` do projeto.
2. Preencha a aba **STDIN** com os valores que o programa vai pedir, **um por linha, na ordem das perguntas**, antes de clicar em Run.

Exemplo de STDIN (multiplicação de uma matriz 2x3 por uma 3x2):

```
2
2
3
1
2
3
4
5
6
3
2
7
8
9
10
11
12
3
```

---

## Exemplo de uso

Multiplicando `[1 2 3; 4 5 6]` por `[7 8; 9 10; 11 12]`:

```
Quantas matrizes deseja utilizar? (2 a 10): 2

========== MATRIZ 1 ==========
Quantidade de linhas (1 a 20): 2
Quantidade de colunas (1 a 20): 3

Digite os elementos da matriz:
Elemento [1][1]: 1
Elemento [1][2]: 2
Elemento [1][3]: 3
Elemento [2][1]: 4
Elemento [2][2]: 5
Elemento [2][3]: 6

========== MATRIZ 2 ==========
Quantidade de linhas (1 a 20): 3
Quantidade de colunas (1 a 20): 2

Digite os elementos da matriz:
Elemento [1][1]: 7
Elemento [1][2]: 8
Elemento [2][1]: 9
Elemento [2][2]: 10
Elemento [3][1]: 11
Elemento [3][2]: 12

========== MENU ==========
1 - Adicao
2 - Subtracao
3 - Multiplicacao
4 - Divisao matricial
Escolha uma operacao: 3

========== RESULTADO ==========
     58.00      64.00 
    139.00     154.00 
```

---

## Tratamento de erros

| Situação | O que o programa faz |
|---|---|
| Quantidade de matrizes, linhas ou colunas fora do intervalo | Mostra "Quantidade invalida!" e pergunta de novo |
| Opção do menu diferente de 1 a 4 | Mostra "Opcao invalida!" e encerra |
| Adição/subtração com dimensões diferentes | Mostra o erro e interrompe |
| Multiplicação com colunas de `A` diferentes das linhas de `B` | Mostra o erro e interrompe |
| Divisão com matriz singular ou não quadrada | Informa qual matriz causou o erro e interrompe |
| Entrada vazia, acabou antes da hora, ou letra no lugar de número | `erroEntrada()` mostra a mensagem e encerra, em vez de travar em loop |

---

## Limitações

- Máximo de 10 matrizes, cada uma com até 20x20 elementos (alterável em `MAX` e `MAX_MATRIZES`).
- Os elementos são `double`, então o resultado pode ter pequenos erros de arredondamento, principalmente na divisão.
- A divisão considera apenas a divisão à direita (`A x B⁻¹`).

---

## Solução de problemas

**"Time limit exceeded" ou o programa não termina no compilador online**
O STDIN está vazio ou tem menos valores do que o programa pede. Preencha o STDIN conforme o exemplo acima. Com a proteção de `erroEntrada()`, o programa encerra com uma mensagem em vez de travar.

**`fatal error: matrizes.h: No such file or directory`**
O compilador não encontrou o cabeçalho. Confira se `matrizes.h` está na mesma pasta dos arquivos `.c` e se o nome está exatamente igual (minúsculas, sem espaços). Durante o desenvolvimento, o OneCompiler não encontrou o cabeçalho na versão modular, e por isso existe o `Total.c`.

**`undefined reference to 'lerMatriz'` (ou `somar`, `inverter`...)**
Nem todos os `.c` foram compilados juntos. Inclua os três na linha do `gcc`: `main.c entrada.c matrizes.c`.

**`undefined reference to 'fabs'`**
Faltou a flag `-lm` na compilação.

---

## Conceitos praticados

- Divisão de um programa em módulos (`.h` + `.c`) e *include guards*
- `struct` e `typedef`
- Passagem por valor (cópia) e por ponteiro (alteração do original)
- Validação de entrada com `do { ... } while (...)` e verificação do retorno do `scanf`
- Álgebra linear: soma, subtração, produto e inversa de matrizes (Gauss-Jordan)

*Trabalho desenvolvido com a ajuda de I.A*
