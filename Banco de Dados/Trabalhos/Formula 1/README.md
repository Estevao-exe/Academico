#  🏎️ Banco de Dados – Sistema de Fórmula 1

## 📌 Sobre o projeto

Este projeto consiste na criação e manipulação de um banco de dados relacional utilizando SQL, com o tema **Fórmula 1**.

O banco de dados permite armazenar informações sobre países, equipes, pilotos, corridas e participantes, além de realizar consultas para obter dados específicos e gerar informações estatísticas.

O projeto foi desenvolvido com o objetivo de praticar conceitos fundamentais de banco de dados, como criação de tabelas, inserção de registros, chaves primárias, chaves estrangeiras, relacionamentos e consultas SQL.

## 🗂️ Estrutura do banco de dados

O banco de dados é composto por cinco tabelas principais:

---
| Tabela | Descrição |
|---|---|
| `tb_paises` | Armazena os países cadastrados. |
| `tb_equipes` | Armazena os nomes e siglas das equipes. |
| `tb_pilotos` | Armazena os dados dos pilotos, incluindo país, equipe e salário. |
| `tb_corridas` | Armazena informações sobre os Grandes Prêmios e suas quantidades de voltas. |
| `tb_participantes` | Relaciona os pilotos às corridas e registra suas posições de largada. |


## 🔗 Relacionamentos

O banco de dados utiliza chaves primárias (`PRIMARY KEY`) e chaves estrangeiras (`FOREIGN KEY`) para estabelecer os relacionamentos entre as tabelas.

- Um país pode estar relacionado a várias equipes.
- Um país pode estar relacionado a vários pilotos.
- Uma equipe pode possuir vários pilotos.
- Um país pode estar relacionado a várias corridas.
- Uma corrida pode possuir vários participantes.
- Um piloto pode participar de várias corridas.

A tabela `tb_participantes` funciona como uma tabela associativa entre pilotos e corridas.

## 📊 Dados cadastrados

O banco de dados contém informações de:

- **8 países:** Brasil, Itália, França, Inglaterra, Holanda, Alemanha, Japão e Estados Unidos.
- **6 equipes:** Red Bull Racing, Guarana Driver Racing, McLaren, Ferrari, Wilians e Mercedes.
- **12 pilotos:** incluindo pilotos brasileiros, italianos, franceses e outros países.
- **4 corridas:** GP do Brasil, GP da Itália, GP da França e GP do Japão.
- **9 participações:** registros de pilotos em diferentes Grandes Prêmios.

## 💻 Funcionalidades e consultas SQL

O projeto apresenta consultas para:

1. Listar países cujos nomes começam com a letra B e terminam com L.
2. Consultar pilotos brasileiros, italianos e franceses.
3. Listar todos os pilotos cadastrados.
4. Exibir os nomes dos Grandes Prêmios e suas quantidades de voltas utilizando `AS` (alias).
5. Consultar os pilotos e seus respectivos países utilizando `JOIN`.
6. Adicionar o atributo salário à tabela de pilotos.
7. Inserir os salários dos pilotos.
8. Listar pilotos com salários entre 70 mil e 100 mil utilizando `BETWEEN`.
9. Calcular a média salarial por país utilizando `AVG()` e `GROUP BY`.
10. Exibir os diferentes salários cadastrados utilizando `DISTINCT` e ordenar os valores em ordem crescente com `ORDER BY`.

## 🛠️ Tecnologias utilizadas

- SQL
- Banco de dados relacional
- Comandos DDL (`CREATE TABLE`, `ALTER TABLE`)
- Comandos DML (`INSERT INTO`)
- Consultas SQL (`SELECT`, `WHERE`, `JOIN`, `GROUP BY` e `ORDER BY`)

## ▶️ Como executar o projeto

1. Abra um sistema gerenciador de banco de dados compatível com o script SQL.
2. Crie ou selecione um banco de dados.
3. Abra o arquivo `Macquin.sql`.
4. Execute o script SQL para criar as tabelas e inserir os registros.
5. Execute as consultas presentes no arquivo para visualizar os resultados.

## 🎯 Objetivo acadêmico

O projeto tem como finalidade desenvolver conhecimentos práticos sobre bancos de dados relacionais e a linguagem SQL, trabalhando desde a modelagem e criação das tabelas até a manipulação e consulta das informações.

Também permite compreender como diferentes tabelas podem se relacionar e como utilizar funções e comandos SQL para extrair informações relevantes.

---

**Projeto desenvolvido para fins acadêmicos e de aprendizagem de SQL.**
