# 🎵 Sistema de Streaming de Música — Banco de Dados SQL

Projeto de banco de dados relacional que simula o funcionamento básico de uma plataforma de streaming musical. O banco armazena informações sobre artistas, músicas, usuários e reproduções, permitindo consultas analíticas sobre comportamento de uso e catálogo.

## 📋 Sumário

- [Sobre o Projeto](#-sobre-o-projeto)
- [Modelo de Dados](#-modelo-de-dados)
- [Estrutura das Tabelas](#-estrutura-das-tabelas)
- [Dados de Exemplo](#-dados-de-exemplo)
- [Consultas Implementadas](#-consultas-implementadas)
- [Como Executar](#-como-executar)
- [Tecnologias](#-tecnologias)
- [Conceitos Praticados](#-conceitos-praticados)

---

## 🎯 Sobre o Projeto

Este projeto demonstra a criação de um schema relacional para uma plataforma de música, cobrindo:

- Cadastro de artistas e suas músicas (relacionamento **1:N**);
- Cadastro de usuários com planos (**Premium / Grátis**);
- Registro de reproduções (relacionamento **N:N** entre usuários e músicas);
- Consultas SQL que exploram `JOINs`, agregações, filtros e agrupamentos.

O banco foi projetado para praticar conceitos de modelagem relacional, chaves estrangeiras e consultas analíticas.

---

## 🗂 Modelo de Dados

O modelo é composto por 4 entidades:

```text
┌─────────────┐         ┌─────────────┐
│  artista    │ 1     N │   musica    │
│─────────────│─────────│─────────────│
│ id_artista  │◄────────│ id_artista  │
│ nomeA       │         │ id_musica   │
│ genero      │         │ titulo      │
└─────────────┘         │ duracao_seg │
                        └──────┬──────┘
                               │ 1
                               │
                               │ N
                        ┌──────┴──────────┐
                        │  reproducao     │
                        │─────────────────│
                        │ id_reproducao   │
                        │ id_usuario (FK) │
                        │ id_musica  (FK) │
                        │ data_play       │
                        └──────┬──────────┘
                               │ N
                               │
                               │ 1
                        ┌──────┴──────────┐
                        │   usuarios      │
                        │─────────────────│
                        │ id_usuario      │
                        │ nomeU           │
                        │ plano           │
                        │ email_reculpe   │
                        └─────────────────┘
```

---

## 🧱 Estrutura das Tabelas

### `artista`
Armazena os artistas cadastrados na plataforma.

| Coluna | Tipo | Restrições |
| :--- | :--- | :--- |
| `id_artista` | `INT` | `PK` |
| `nomeA` | `VARCHAR(50)` | `NOT NULL` |
| `genero` | `VARCHAR(100)` | — |

### `musica`
Armazena as músicas, cada uma vinculada a um artista.

| Coluna | Tipo | Restrições |
| :--- | :--- | :--- |
| `id_musica` | `INT` | `PK` |
| `titulo` | `VARCHAR(100)` | — |
| `duracao_segundos` | `INT` | `NOT NULL` |
| `id_artista` | `INT` | `FK` → `artista(id_artista)` |

### `usuarios`
Armazena os usuários e seus planos de assinatura.

| Coluna | Tipo | Restrições |
| :--- | :--- | :--- |
| `id_usuario` | `INT` | `PK` |
| `nomeU` | `VARCHAR(70)` | — |
| `plano` | `VARCHAR(10)` | — |
| `email_reculpe` | `VARCHAR(70)` | — (pode ser `NULL`) |

### `reproducao`
Registra cada reprodução feita por um usuário.

| Coluna | Tipo | Restrições |
| :--- | :--- | :--- |
| `id_reproducao` | `INT` | `PK` |
| `id_usuario` | `INT` | `FK` → `usuarios(id_usuario)` |
| `id_musica` | `INT` | `FK` → `musica(id_musica)` |
| `data_play` | `DATE` | — |

---

## 💾 Dados de Exemplo

O projeto inclui um conjunto de dados fictícios para testes:

- **4 artistas cadastrados** (um deles, *Raphyx & Alec*, possui músicas).
- **6 músicas** com durações variadas (de `165s` a `543s`).
- **5 usuários** — mistura de planos *Premium* e *Grátis*, incluindo e-mails nulos.
- **8 reproduções** distribuídas entre os usuários.

Esses dados permitem validar consultas que envolvem `LEFT JOIN` (usuários sem reproduções) e filtros por `NULL` (e-mails ausentes).

---

## 🔍 Consultas Implementadas

O projeto traz 6 consultas que cobrem diferentes níveis de complexidade:

### 1️⃣ Músicas com duração superior a 3 minutos
```sql
SELECT musica.titulo AS 'Musicas', musica.duracao_segundos AS 'Segundos'
FROM musica
WHERE musica.duracao_segundos > 180
ORDER BY musica.duracao_segundos DESC;
```
> Lista as músicas mais longas, ordenadas por duração.

### 2️⃣ Usuários Premium sem e-mail de recuperação
```sql
SELECT usuarios.nomeU AS 'Nome', email_reculpe AS 'Email', plano
FROM usuarios
WHERE plano = 'Premium' AND email_reculpe IS NULL;
```
> Filtra usuários Premium que não possuem e-mail cadastrado.

### 3️⃣ Quantidade de músicas por artista
```sql
SELECT artista.nomeA AS 'Nome', COUNT(musica.id_musica) AS 'Quantidade de Musicas'
FROM artista
INNER JOIN musica ON artista.id_artista = musica.id_artista
GROUP BY artista.id_artista, artista.nomeA;
```
> Agrupa músicas por artista. Artistas sem músicas não aparecem (`INNER JOIN`).

### 4️⃣ Histórico completo de reproduções
```sql
SELECT usuarios.nomeU AS 'Nome do Usuário',
       musica.titulo AS 'Título da Música',
       reproducao.data_play AS 'Data'
FROM reproducao
INNER JOIN usuarios ON reproducao.id_usuario = usuarios.id_usuario
INNER JOIN musica   ON reproducao.id_musica  = musica.id_musica;
```
> Junção tripla: combina usuário, música e data de reprodução.

### 5️⃣ Total de músicas ouvidas por usuário
```sql
SELECT usuarios.nomeU AS 'Nome', COUNT(reproducao.id_reproducao) AS 'Musicas Ouvidas'
FROM usuarios
LEFT JOIN reproducao ON reproducao.id_usuario = usuarios.id_usuario
GROUP BY usuarios.id_usuario, usuarios.nomeU;
```
> Usa `LEFT JOIN` para incluir usuários que ainda não ouviram nenhuma música (contagem = `0`).

### 6️⃣ Artistas com duração média acima de 5 minutos
```sql
SELECT artista.nomeA AS 'Artista', ROUND(AVG(musica.duracao_segundos),1) AS 'Duração em Segundos'
FROM artista
INNER JOIN musica ON artista.id_artista = musica.id_artista
GROUP BY artista.nomeA, artista.id_artista
HAVING AVG(musica.duracao_segundos) > 300;
```
> Filtra artistas cuja média de duração ultrapassa 300 segundos, usando `HAVING`.

---

## ▶ Como Executar

1. Crie um banco de dados em qualquer SGBD compatível (MySQL, MariaDB, PostgreSQL):
   ```sql
   CREATE DATABASE streaming_musica;
   USE streaming_musica;
   ```
2. Execute o script de criação das tabelas (`CREATE TABLE ...`) na ordem apresentada:  
   `artista` → `musica` → `usuarios` → `reproducao`.
3. Insira os dados com os `INSERT INTO` fornecidos.
4. Execute as consultas individualmente para explorar os resultados.

> ⚠️ **Atenção:** A ordem de execução importa por causa das chaves estrangeiras: sempre crie e popule primeiro as tabelas-pai (`artista` e `usuarios`).

---

## 🛠 Tecnologias

| Tecnologia | Uso |
| :--- | :--- |
| **SQL (MySQL / PostgreSQL)** | Linguagem de definição e consulta |
| **Modelagem Relacional** | Estrutura de tabelas e FKs |
| **JOINs / GROUP BY / HAVING** | Consultas analíticas |

---

## 📚 Conceitos Praticados

- ✅ Criação de tabelas com `PRIMARY KEY` e `FOREIGN KEY`
- ✅ Relacionamentos **1:N** (`artista` → `música`) e **N:N** (`usuário` ↔ `música`)
- ✅ Uso de `INNER JOIN` e `LEFT JOIN`
- ✅ Funções de agregação (`COUNT`, `AVG`, `ROUND`)
- ✅ Filtros com `WHERE`, `IS NULL`, `GROUP BY` e `HAVING`
- ✅ Ordenação com `ORDER BY`
- ✅ Tratamento de valores `NULL`

---

## 👤 Autor

Projeto desenvolvido como exercício prático de SQL e modelagem de banco de dados.  
Sinta-se à vontade para usar, adaptar e expandir — novas consultas, tabelas e índices são bem-vindos! 🚀
