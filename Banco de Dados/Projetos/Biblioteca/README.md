# 📚 Banco de Dados - Biblioteca
## 📌 Sobre o projeto

Este projeto consiste na criação de um banco de dados chamado db_bibliotecas, desenvolvido em MySQL, com o objetivo de armazenar informações sobre livros e autores.

O exercício trabalha conceitos de criação e manipulação de tabelas, relacionamentos entre tabelas, consultas SQL, funções e procedimentos armazenados (Stored Procedures).

## 🎯 Objetivos
Criar um banco de dados para uma biblioteca.
Criar tabelas para armazenar livros e autores.
Estabelecer relacionamentos entre as tabelas.
Realizar consultas utilizando SELECT, JOIN, WHERE e subconsultas.
Criar uma função para somar dois números.
Criar um procedimento para consultar o preço de um livro.
Criar uma função para calcular o aumento de 10% no preço de um livro.

## 🗄️ Estrutura do banco de dados

O banco possui três tabelas principais:

1. Tabela livro

Armazena as informações dos livros.

Campo	Tipo	Descrição
codlivro	INT	Código do livro (chave primária)
titulo	VARCHAR(45)	Nome do livro
preco	DECIMAL(10,2)	Preço do livro
2. Tabela autor

Armazena as informações dos autores.

Campo	Tipo	Descrição
mat	INT	Matrícula do autor (chave primária)
nome	VARCHAR(45)	Nome do autor
3. Tabela autor_livro

Faz o relacionamento entre livros e autores.

Campo	Tipo	Descrição
codlivro	INT	Chave estrangeira da tabela livro
mat	INT	Chave estrangeira da tabela autor

## 📖 Dados cadastrados

Os livros inseridos inicialmente são:

Red Queen
PJO
Anomalous

Os autores cadastrados são:

Victoria
Rick Riordan
Daniele

## 🔎 Consultas SQL

O projeto contém consultas para:

Visualizar todos os livros.
Visualizar todos os autores.
Relacionar livros e autores utilizando JOIN.
Relacionar tabelas utilizando WHERE.
Utilizar subconsultas.
Consultar livros com preços acima de R$ 90,00.
Ordenar livros pelo preço.
Consultar o maior e o menor preço.
Calcular a média dos preços.

## ⚙️ Funções e procedimentos
1. Função soma

Recebe dois números inteiros e retorna a soma entre eles.

Exemplo de utilização:

sql
SELECT soma(10, 20) AS resultado;


Resultado esperado: 30.

2. Procedure verPreco

Recebe o código de um livro e retorna seu título e preço.

Exemplo de utilização:

sql
CALL verPreco(1);


Resultado esperado: retorna o livro de código 1 e seu respectivo preço.

3. Função aumentoLivro

Recebe o preço de um livro e calcula um aumento de 10%.

Exemplo de utilização:

sql
SELECT titulo, preco,
aumentoLivro(preco) AS preco_com_aumento
FROM livro;


Exemplo de cálculo:

Preço original: R$ 100,00.
Aumento de 10%: R$ 10,00.
Novo preço: R$ 110,00.
### 💰 Preços cadastrados
Livro	Preço
Red Queen	R$ 100,00
PJO	R$ 150,00
Anomalous	R$ 80,00
### 🛠️ Tecnologias utilizadas
MySQL
SQL
MySQL Workbench (para execução e gerenciamento do banco de dados)
### ▶️ Como executar o projeto
Abra o MySQL Workbench.
Crie uma nova aba de consulta SQL.
Copie o código SQL do projeto.
Execute os comandos na ordem apresentada.
Utilize as consultas e chamadas de funções para verificar os resultados.

Observação: o banco de dados deve ser criado antes da execução das demais instruções. Caso já exista, será necessário evitar a recriação das tabelas e funções.

📚 Conclusão

Com este exercício, foi possível praticar a criação e manipulação de bancos de dados relacionais, além de compreender o funcionamento de funções e procedimentos armazenados no MySQL.

O projeto também demonstra como utilizar consultas SQL para buscar, relacionar, filtrar e organizar informações de um banco de dados.
