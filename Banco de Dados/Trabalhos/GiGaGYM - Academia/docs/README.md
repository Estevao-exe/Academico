# Modelo conceitual e logico

## 1.1 Descrição do cenário proposto

**Cenário ou Mini-Mundo:** Banco de Dados para uma Academia

Uma academia planeja adquirir um sistema para gerenciar suas atividades diárias.

O sistema deve ser capaz de cadastrar seus clientes, seus funcionários, os planos e serviços oferecidos, as turmas de aulas especiais, as avaliações físicas, as vendas de produtos e os fornecedores desses produtos.

Os clientes devem ser identificados por um código de identificação, devendo o sistema registrar seu nome, CPF, telefone, e-mail e CEP. Para frequentar a academia, o cliente é vinculado a uma matrícula, na qual o sistema deve registrar a data de início, a data de fim e o status. 

Cada matrícula pertence a um único cliente e está ligada a um único plano, mas um cliente pode ter mais de uma matrícula, ou ainda nenhuma, e um mesmo plano pode ser contratado em várias matrículas. 

Cada matrícula deve gerar um ou mais pagamentos (as mensalidades), nos quais o sistema registra a forma de pagamento, o valor, a data de vencimento e a data em que o pagamento foi realizado. Cada pagamento pertence a uma única matrícula. 
Os planos devem conter um código de identificação, nome, valor mensal e duração, e podem incluir diversos serviços, como:

| Musculação | Boxe | Muay thai | Forró |
|---|---|---|---|
| 💪 | 🥊 | 🥋 | 💃 |

**Cada serviço** tem um código de identificação, um nome e uma descrição, e pode estar presente em vários planos ou em nenhum. Alguns serviços são oferecidos por meio de turmas, como as aulas especiais de boxe, muay thai e forró.

**Cada turma** é identificada por um código e deve conter nome, dia da semana, hora de início e hora de fim. Uma turma pertence a um único serviço, e um serviço pode ter várias turmas ou nenhuma, como é o caso da musculação, em que o aluno vai quando quiser.

**Os funcionários** que trabalham na academia devem conter código de identificação, nome, CPF, cargo, salário e data de admissão. Alguns funcionários são instrutores e, nesse caso, o sistema deve registrar também o CREF (registro no Conselho Regional de Educação Física). Nem todo funcionário é instrutor. 
```
nome | cpf | cargo | salário | data de admissão
```
**Cada turma** deve ser ministrada por um único instrutor, e um instrutor pode ministrar várias turmas ou nenhuma. 
O sistema deve permitir o registro de avaliações físicas realizadas pelos clientes, guardando a data, o peso, a altura, o percentual de gordura, observações, o valor cobrado e a forma de pagamento. 

**Cada avaliação** é realizada por um único cliente e conduzida por um únicoinstrutor. Um cliente pode realizar várias avaliações ou nenhuma, e um instrutor pode conduzir várias avaliações ou nenhuma. A academia também vende produtos, e cada produto deve conter um código de identificação, nome, valor e a quantidade em estoque. 

**Cada venda** é identificada por um código e registra a data e a hora, o total e a forma de pagamento. Toda venda é feita para um único cliente e registrada por um único funcionário, e deve conter pelo menos um produto, sendo que, para cada item vendido, o sistema registra a quantidade e o preço da unidade. 

**Um produto** pode aparecer em várias vendas ou em nenhuma. Por fim, cada produto é fornecido por um único fornecedor, que deve ter código de identificação, nome, e-mail, telefone e CNPJ, e um fornecedor pode fornecer vários produtos ou ainda nenhum.

---
### Esse projeto foi realizado com o objeto de aprender mais sobre banco de dados, My SQL 
---

*Obrigado por ver esse projeto~*
<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0:0D0221,50:5B21B6,100:A855F7&height=120&section=footer" alt="Rodapé" />
