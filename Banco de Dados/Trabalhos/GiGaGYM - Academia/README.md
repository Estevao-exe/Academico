# 🏋️ GiGa GYM — Sistema de Gerenciamento de Academia
## 📌 Sobre o projeto

O GiGa GYM é um projeto de banco de dados desenvolvido em SQL com o objetivo de gerenciar as principais operações de uma academia.

O sistema foi desenvolvido para organizar e armazenar informações de clientes, funcionários, instrutores, planos, serviços, matrículas, pagamentos, avaliações físicas, fornecedores, produtos e vendas.

O projeto utiliza o banco de dados MySQL e aplica conceitos fundamentais de modelagem e manipulação de dados, como criação de tabelas, chaves primárias e estrangeiras, relacionamentos, consultas SQL, funções armazenadas e triggers.

Além disso, o sistema possui mecanismos de controle automático de estoque e atualização dos valores das vendas, garantindo maior consistência das informações.

# 🎯 Objetivos do projeto
Desenvolver um banco de dados relacional para uma academia.
Organizar as informações administrativas e financeiras.
Gerenciar clientes, funcionários e instrutores.
Controlar planos, serviços oferecidos e matrículas.
Registrar pagamentos e avaliações físicas.
Gerenciar fornecedores, produtos e vendas.
Automatizar operações por meio de funções e triggers.

Aplicar consultas SQL para extração e análise de informações.
## 🛠️ Tecnologias utilizadas
MySQL: Sistema de gerenciamento de banco de dados.
SQL: Linguagem utilizada para criação, manipulação e consulta dos dados.

MySQL Workbench: Ferramenta que pode ser utilizada para executar e administrar o banco de dados.

## 🗄️ Estrutura do banco de dados

O banco de dados utilizado no projeto possui o nome GiGa_GYM e é composto por 14 tabelas principais, responsáveis por armazenar e relacionar as informações da academia.

## 📋 Tabelas e suas funcionalidades
```
Tabela	Descrição
tb_plano	Armazena os planos disponíveis, duração e valores mensais. 
tb_servico	Registra os serviços e modalidades oferecidos pela academia.
tb_plano_servico	Relaciona os planos aos serviços disponíveis.
tb_funcionario	Armazena os dados dos funcionários e seus cargos.
tb_instrutor	Armazena informações específicas dos instrutores, incluindo CREF.
tb_turma	Registra as turmas, horários, dias e instrutores responsáveis.
tb_cliente	Armazena os dados pessoais e de contato dos clientes.
tb_matricula	Registra as matrículas, planos contratados e seus status.
tb_pagamento	Armazena informações sobre pagamentos e vencimentos.
tb_avaliacao_fisica	Registra avaliações físicas dos clientes.
tb_fornecedor	Armazena os dados dos fornecedores.
tb_produto	Registra os produtos comercializados e suas quantidades em estoque.
tb_venda	Armazena as vendas realizadas pelos funcionários.
tb_item_produto	Registra os produtos, preços e quantidades de cada venda.
```
### 🔗 Relacionamentos do banco de dados

O projeto utiliza relacionamentos entre tabelas por meio de chaves primárias (PRIMARY KEY) e chaves estrangeiras (FOREIGN KEY).

Os principais relacionamentos são:

Planos e serviços: relacionamento muitos para muitos (N:N), implementado pela tabela tb_plano_servico.
Funcionários e instrutores: um funcionário pode possuir um cadastro específico como instrutor.
Serviços e turmas: um serviço pode estar associado a diversas turmas.
Instrutores e turmas: um instrutor pode ser responsável por diversas turmas.
Clientes e matrículas: um cliente pode possuir diferentes registros de matrícula.
Planos e matrículas: um plano pode estar associado a diversas matrículas.
Matrículas e pagamentos: uma matrícula pode possuir registros de pagamentos.
Clientes e avaliações físicas: um cliente pode realizar diversas avaliações.
Instrutores e avaliações: um instrutor pode realizar diversas avaliações físicas.
Fornecedores e produtos: um fornecedor pode fornecer diversos produtos.
Funcionários e vendas: um funcionário pode realizar diversas vendas.
Vendas e produtos: relacionamento muitos para muitos (N:N), implementado pela tabela tb_item_produto.

## ⚙️ Funcionalidades implementadas
1. Gerenciamento de clientes

O sistema permite armazenar e consultar informações dos clientes, incluindo:

Nome completo.
CPF.
Telefone.
E-mail.

Também foram desenvolvidas consultas para localizar clientes, organizar seus nomes em ordem alfabética e verificar informações cadastrais.

2. Gerenciamento de planos e serviços

O banco de dados possui três planos cadastrados:

Mensal.
Trimestral.
Anual Plus.

Cada plano possui uma duração e um valor mensal. A tabela de relacionamento tb_plano_servico determina quais modalidades estão disponíveis em cada plano.

Entre os serviços cadastrados estão musculação, CrossFit, spinning, pilates, treinamento funcional, yoga, Muay Thai e alongamento.

3. Gerenciamento de funcionários e instrutores

O sistema armazena informações dos funcionários, como nome, CPF, telefone, cargo, data de admissão e salário.

Os instrutores possuem uma tabela específica, que permite registrar seus números de CREF e relacioná-los aos funcionários cadastrados.

4. Gerenciamento de turmas

A tabela tb_turma permite registrar:

Nome da turma.
Dia da semana.
Horário de início.
Horário de término.
Serviço oferecido.
Instrutor responsável.
5. Controle de matrículas e pagamentos

O sistema permite registrar as matrículas dos clientes, vinculando cada uma a um plano contratado.

Também são armazenadas informações sobre pagamentos, incluindo:

Data do pagamento.
Data de vencimento.
Forma de pagamento.
Valor pago.
Matrícula relacionada.

6. Avaliações físicas

A tabela tb_avaliacao_fisica permite registrar informações sobre o acompanhamento físico dos clientes.

São armazenados dados como peso, altura, percentual de gordura, data da avaliação, observações e informações de pagamento.

Cada avaliação também é vinculada ao cliente e ao instrutor responsável.

7. Gerenciamento de fornecedores e produtos

O sistema permite cadastrar fornecedores e relacioná-los aos produtos comercializados pela academia.

Os produtos possuem nome, valor, quantidade disponível em estoque e fornecedor responsável.

8. Controle de vendas

As vendas são registradas na tabela tb_venda, contendo data, forma de pagamento, valor total e funcionário responsável.

A tabela tb_item_produto registra os produtos que fazem parte de cada venda, incluindo preço unitário e quantidade.

## 🧠 Funções armazenadas (FUNCTIONS)

Foram desenvolvidas três funções armazenadas para facilitar a consulta de informações no banco de dados.

listarNomeCliente()

Retorna os nomes de todos os clientes cadastrados, organizados em ordem alfabética.

clienteId(pessoa_id)

Recebe o ID de um cliente como parâmetro e retorna suas principais informações:

Nome.
CPF.
Telefone.
E-mail.
funcionarioCargo(cargo_fun)

Recebe um cargo como parâmetro e retorna os nomes dos funcionários que possuem aquele cargo, organizados em ordem alfabética.

Essas funções permitem reutilizar consultas e facilitar a obtenção de informações específicas.

## ⚡ Triggers (Gatilhos)

Uma das principais funcionalidades do projeto é a implementação de cinco triggers responsáveis pelo controle automático do estoque e pela atualização dos valores das vendas.

Os gatilhos são executados automaticamente quando ocorrem operações de inserção, alteração ou exclusão na tabela tb_item_produto.

Triggers desenvolvidos
Trigger	Evento	Funcionalidade
trg_item_bi_validar_estoque	BEFORE INSERT	Valida quantidade, preço e disponibilidade do estoque antes de inserir um item.
trg_item_ai_atualizar_estoque_total	AFTER INSERT	Dá baixa no estoque e recalcula o total da venda.
trg_item_bu_validar_alteracao	BEFORE UPDATE	Valida os dados e verifica se existe estoque suficiente para a alteração.
trg_item_au_reajustar_estoque_total	AFTER UPDATE	Ajusta o estoque e recalcula os valores das vendas após alterações.
trg_item_ad_estornar_estoque_total	AFTER DELETE	Devolve ao estoque os produtos excluídos e atualiza o total da venda.

### 🔍 Regras de negócio implementadas nos triggers

O controle automático segue algumas regras:
```
A quantidade de produtos vendidos deve ser um número inteiro maior que zero.
O preço unitário não pode ser nulo ou negativo.
Não é permitido vender produtos inexistentes.
Não é permitido realizar vendas com estoque insuficiente.
Ao inserir um produto em uma venda, o estoque é reduzido automaticamente.
Ao alterar a quantidade ou o produto de um item, o estoque é ajustado.
Ao excluir um item de uma venda, a quantidade correspondente retorna ao estoque.
O valor total da venda é recalculado automaticamente com base nos itens registrados.
```

Dessa maneira, o banco de dados consegue manter o estoque e os valores das vendas sincronizados com as operações realizadas.

## 📊 Consultas SQL desenvolvidas

O projeto apresenta diversas consultas utilizando diferentes recursos da linguagem SQL.

Consultas básicas:
---
SELECT para visualizar registros.
WHERE para filtrar informações.
ORDER BY para ordenar resultados.
LIMIT para limitar a quantidade de registros.
LIKE para localizar nomes com padrões específicos.
BETWEEN para pesquisar intervalos.
IN para verificar valores específicos.
IS NOT NULL para verificar campos preenchidos.
Funções de agregação

Também foram utilizadas funções para realizar cálculos e gerar informações resumidas:

COUNT(): contabiliza registros.
SUM(): calcula somatórios.
AVG(): calcula médias.
ROUND(): arredonda valores.
GROUP_CONCAT(): agrupa informações textuais.
Agrupamentos e relacionamentos

Foram desenvolvidas consultas utilizando:

GROUP BY para agrupar informações.
INNER JOIN para relacionar registros existentes em diferentes tabelas.
LEFT JOIN para apresentar todos os registros da tabela principal, mesmo quando não existe correspondência na tabela relacionada.

Entre os exemplos desenvolvidos estão:

Quantidade de funcionários por cargo.
Média salarial por cargo.
Total de matrículas por status.
Faturamento agrupado por forma de pagamento.
Clientes e seus respectivos planos.
Instrutores e seus registros CREF.
Serviços disponíveis em cada plano.
Turmas e seus respectivos instrutores.
Vendas e funcionários responsáveis.
---
# 🚀 Como executar o projeto

Para executar o projeto, é necessário possuir o MySQL instalado ou utilizar uma ferramenta de gerenciamento compatível, como o MySQL Workbench.

Passo a passo
Instale e abra o MySQL Workbench.
Conecte-se ao servidor MySQL.
Abra um novo arquivo SQL.
Copie o código-fonte do projeto para o editor.
Execute o script para criar o banco de dados, as tabelas e inserir os registros.
Execute as funções armazenadas e os triggers.
Realize as consultas disponíveis para verificar os resultados.
Criação do banco de dados

O banco é criado e selecionado utilizando os comandos:

sql
CREATE DATABASE GiGa_GYM;

USE GiGa_GYM;


Observação: o script foi desenvolvido para MySQL. Recomenda-se executá-lo em um banco de dados vazio, pois os comandos de criação das tabelas não utilizam IF NOT EXISTS e os registros de exemplo dependem dos IDs gerados durante a inserção.

📁 Organização sugerida dos arquivos

Para facilitar a organização do projeto no GitHub, recomenda-se a seguinte estrutura

```
text
GiGa_GYM/
│
├── README.md
│
├── GiGaGYM - Academia/
│   └── GIGA.GYM.sql
│
└── docs/
    └── modelo_relacional.png
```

README.md: documentação e apresentação do projeto.
giga_gym.sql: script completo de criação e alimentação do banco.
modelo_relacional.png: diagrama com as tabelas e seus relacionamentos.

## 📚 Conhecimentos aplicados

Durante o desenvolvimento do projeto, foram trabalhados os seguintes conceitos:

```
Modelagem de banco de dados relacionais.
Criação e manipulação de tabelas.
Chaves primárias e estrangeiras.
Relacionamentos 1:N e N:N.
Inserção e consulta de dados.
Ordenação e filtragem de registros.
Funções de agregação.
Agrupamentos com GROUP BY.
Relacionamentos com JOIN.
Criação de funções armazenadas.
Criação de triggers.
Integridade e consistência dos dados.
Automação do controle de estoque.
```

## 👨‍💻 Considerações finais

O projeto GiGa GYM foi desenvolvido com o propósito de aplicar na prática os conhecimentos de SQL e banco de dados relacionais, simulando as necessidades de gerenciamento de uma academia.

A implementação permite compreender como diferentes setores de uma organização podem ser integrados por meio de um banco de dados estruturado, além de demonstrar a importância de funções armazenadas e triggers na automatização de processos.

O projeto representa uma aplicação prática dos conceitos de banco de dados, servindo como exercício de desenvolvimento, aprendizado e aprimoramento de conhecimentos em MySQL.

Esse projeto foi realizado com participação de 

```
 Estevão, Daniel, Nicolas, Luan e Pedro 
```
### GitHub

- [![GitHub](https://img.shields.io/badge/GitHub-Estevão-181717?logo=github&logoColor=white)](https://github.com/Estevão-exe)
- [![GitHub](https://img.shields.io/badge/GitHub-Daniel-181717?logo=github&logoColor=white)](https://github.com/Danyel-xp)
- [![GitHub](https://img.shields.io/badge/GitHub-Nicolas-181717?logo=github&logoColor=white)](https://github.com/NicolasWebMaster)
- [![GitHub](https://img.shields.io/badge/GitHub-Luan-181717?logo=github&logoColor=white)](https://github.com/Luandos)
- [![GitHub](https://img.shields.io/badge/GitHub-Pedro-181717?logo=github&logoColor=white)](https://github.com/pedrohenriquenlins-prog)

GiGa GYM — Organização, tecnologia e desempenho! 💪
