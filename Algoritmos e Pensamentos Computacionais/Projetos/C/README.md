# 🎮 Jogo da Velha em C

## 📌 Sobre o projeto

Este projeto consiste no desenvolvimento de um **Jogo da Velha utilizando a linguagem de programação C**, executado diretamente pelo terminal.

O jogo permite que dois jogadores participem de uma mesma partida, alternando suas jogadas entre os símbolos **X** e **O** em um tabuleiro de 3x3 posições.

O programa utiliza matrizes, estruturas de repetição e condicionais para controlar as jogadas e atualizar o tabuleiro durante a execução.

## ⚙️ Funcionalidades

- Tabuleiro com dimensões de 3x3.
- Dois jogadores: X e O.
- Alternância de turnos entre os jogadores.
- Escolha de linhas e colunas para realizar as jogadas.
- Verificação de posições já ocupadas.
- Atualização e exibição do tabuleiro após cada jogada.
- Encerramento automático quando as nove posições são preenchidas.

## 🛠️ Tecnologias utilizadas

- **Linguagem C:** desenvolvimento da lógica do jogo.
- **Biblioteca `stdio.h`:** entrada e saída de dados.
- **Matrizes:** armazenamento das posições do tabuleiro.
- **Estruturas condicionais:** controle das jogadas.
- **Laços de repetição (`for` e `while`):** inicialização, execução e controle da partida.

## 🧠 Conceitos de programação aplicados

Durante o desenvolvimento, foram utilizados os seguintes conceitos:

| Conceito | Aplicação |
|---|---|
| Variáveis | Armazenamento de linhas, colunas e jogadas. |
| Matrizes | Representação do tabuleiro 3x3. |
| `for` | Inicialização e exibição do tabuleiro. |
| `while` | Controle dos turnos e validação das posições. |
| `if/else` | Verificação de posições disponíveis. |
| `scanf()` | Recebimento das jogadas dos usuários. |
| `printf()` | Exibição de mensagens e do tabuleiro. |

## ▶️ Como executar o projeto

### 1. Pré-requisitos

É necessário possuir um compilador da linguagem C, como o GCC.

### 2. Clonar o repositório

```bash
git clone URL_DO_REPOSITORIO
```

### 3. Acessar a pasta do projeto

```bash
cd NOME_DA_PASTA
```

### 4. Compilar o programa

```bash
gcc "Jogo da veia.c" -o jogo
```

### 5. Executar

No Linux:

```bash
./jogo
```

No Windows:

```bash
jogo.exe
```

## 🎲 Exemplo de execução

```text
VEZ DO JOGADOR 'X'

Digite a linha (0, 1 ou 2): 0
Digite a coluna (0, 1 ou 2): 0

Tabuleiro
 X  -  -
 -  -  -
 -  -  -

VEZ DO JOGADOR 'O'

Digite a linha (0, 1 ou 2): 1
Digite a coluna (0, 1 ou 2): 1

Tabuleiro
 X  -  -
 -  O  -
 -  -  -
```

## 🚀 Possíveis melhorias futuras

- Implementar a verificação de vitória por linha, coluna e diagonal.
- Exibir uma mensagem identificando o jogador vencedor.
- Implementar a detecção de empate.
- Adicionar validação para impedir coordenadas fora dos limites do tabuleiro.
- Melhorar a interface visual do jogo no terminal.

## 🎯 Objetivo acadêmico

O objetivo deste projeto é desenvolver e aprimorar conhecimentos em lógica de programação e linguagem C, aplicando conceitos fundamentais como matrizes, estruturas condicionais, laços de repetição e manipulação de dados.

O exercício também proporciona uma introdução à criação de jogos utilizando programação estruturada.

---

**Projeto desenvolvido para fins acadêmicos e de aprendizagem da linguagem C.**
