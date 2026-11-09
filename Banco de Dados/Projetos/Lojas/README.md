# 🌸 Loja Bigger Flowers — Sistema de Controle de Estoque

## 📌 Sobre o Projeto

Este projeto consiste no desenvolvimento de um banco de dados relacional utilizando **MySQL**, com o objetivo de gerenciar produtos e controlar automaticamente o estoque de uma loja.

O sistema utiliza comandos SQL para criar tabelas, cadastrar produtos e implementar uma *Trigger* responsável por atualizar o estoque sempre que um novo item de venda é inserido.

O principal objetivo é garantir que as operações de venda respeitem a quantidade disponível de produtos, evitando estoques negativos e registros de quantidades inválidas.

---

## 🛠️ Tecnologias Utilizadas

- **MySQL:** Sistema de gerenciamento de banco de dados.
- **SQL:** Linguagem utilizada para criação e manipulação dos dados.
- **Triggers:** Automatização de operações no banco de dados.
- **Constraints:** Garantia da integridade dos registros.

---

## 🗂️ Estrutura do Banco de Dados

O banco de dados utilizado no projeto é chamado `loja_bigger_flowers`.

Ele possui duas tabelas principais:

### 1. Tabela `Produto`

Responsável por armazenar as informações dos produtos cadastrados.

| Campo | Tipo | Descrição |
|---|---|---|
| `idProduto` | INT | Identificador único do produto. |
| `nome` | VARCHAR(100) | Nome do produto. |
| `preco` | DECIMAL(10,2) | Preço do produto. |
| `estoque` | INT | Quantidade disponível em estoque. |

### 2. Tabela `ItensVenda`

Responsável por armazenar os itens vendidos.

| Campo | Tipo | Descrição |
|---|---|---|
| `idItem` | INT | Identificador automático do item. |
| `idProduto` | INT | Identificador do produto vendido. |
| `quantidade` | INT | Quantidade vendida. |

A tabela `ItensVenda` possui uma chave estrangeira (`FOREIGN KEY`) que estabelece o relacionamento com a tabela `Produto`.

---

## ⚙️ Funcionamento da Trigger

O principal recurso do projeto é a Trigger:

`trg_atualizar_estoque`

Ela é executada automaticamente **antes da inserção de um novo registro na tabela `ItensVenda`**.

### Regras implementadas

1. **Validação da quantidade:** impede a inserção de vendas com quantidade menor ou igual a zero.
2. **Verificação do estoque:** verifica se existe quantidade suficiente do produto.
3. **Atualização automática:** desconta do estoque a quantidade informada na venda.
4. **Tratamento de erros:** utiliza `SIGNAL SQLSTATE '45000'` para impedir operações inválidas.

### Exemplo da lógica

```sql
UPDATE Produto
SET estoque = estoque - NEW.quantidade
WHERE idProduto = NEW.idProduto
AND estoque >= NEW.quantidade;
```

Esse comando atualiza o estoque somente quando existe quantidade suficiente do produto.

Caso a operação não seja possível, a Trigger retorna uma mensagem de erro.

---

## 🧪 Testes Realizados

O projeto possui testes para verificar o funcionamento da Trigger.

### Produtos cadastrados inicialmente

| ID | Produto | Preço | Estoque |
|---|---|---:|---:|
| 1 | Notebook | R$ 3.500,00 | 10 |
| 2 | Mouse | R$ 80,00 | 20 |
| 3 | Teclado | R$ 150,00 | 15 |

### Testes de venda

| Produto | Quantidade | Resultado esperado |
|---|---:|---|
| Mouse | 8 | Venda permitida |
| Notebook | 7 | Venda permitida |
| Teclado | 12 | Venda permitida |
| Teclado | 50 | Venda rejeitada |
| Teclado | -20 | Venda rejeitada |

### Resultado esperado

Após as vendas válidas, os estoques ficam:

| Produto | Estoque inicial | Estoque final |
|---|---:|---:|
| Notebook | 10 | 3 |
| Mouse | 20 | 12 |
| Teclado | 15 | 3 |

As operações inválidas são bloqueadas automaticamente pela Trigger, sem descontar o estoque.

---

## 🚀 Como Executar o Projeto

### Pré-requisitos

- MySQL instalado.
- MySQL Workbench ou outro cliente compatível com MySQL.

### Passo a passo

**1.** Abra o MySQL Workbench.

**2.** Abra o arquivo `loja de flor.sql`.

**3.** Execute o script SQL para criar o banco de dados, as tabelas e inserir os produtos.

**4.** Execute a criação da Trigger.

**5.** Execute os comandos de teste para verificar o funcionamento do controle de estoque.

**6.** Consulte os estoques atualizados utilizando:

```sql
SELECT idProduto, nome, estoque
FROM Produto;
```

---

## 🎯 Objetivo Acadêmico

O objetivo deste projeto é desenvolver conhecimentos práticos sobre bancos de dados relacionais, utilizando conceitos de criação e manipulação de tabelas, chaves primárias, chaves estrangeiras e automação de processos com Triggers.

Além disso, o projeto demonstra como utilizar recursos do MySQL para garantir a integridade dos dados e automatizar operações comerciais.

---

## 👨‍💻 Autor

**Projeto desenvolvido para fins acadêmicos.**

Estudo e prática de SQL, MySQL e gerenciamento de bancos de dados relacionais.

---

⭐ Se você gostou do projeto, considere deixar uma estrela no repositório!
