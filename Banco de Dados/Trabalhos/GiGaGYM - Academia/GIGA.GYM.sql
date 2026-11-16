
CREATE DATABASE GiGa_GYM;

USE GiGa_GYM;
-- Tabela de planos
CREATE TABLE tb_plano (
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    duracao INT,
    nomeP VARCHAR(50) NOT NULL UNIQUE,
    valor_mensal DECIMAL(10, 2)
);

-- Tabela de serviços
CREATE TABLE tb_servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    nomeS VARCHAR(50),
    descricaoS VARCHAR(200)
);

-- Relacionamento entre planos e serviços
CREATE TABLE tb_plano_servico (
    id_plano INT,
    id_servico INT,
    PRIMARY KEY (id_plano, id_servico),
    FOREIGN KEY (id_plano) REFERENCES tb_plano(id_plano),
    FOREIGN KEY (id_servico) REFERENCES tb_servico(id_servico)
);

-- Tabela de funcionários
CREATE TABLE tb_funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nomeF VARCHAR(70) NOT NULL,
    cpfF VARCHAR(14) NOT NULL UNIQUE,
    foneF VARCHAR(14),
    cargo VARCHAR(50),
    data_admissao DATE,
    salario DECIMAL(10, 2)
);

-- Tabela de instrutores
CREATE TABLE tb_instrutor (
    id_instrutor INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT,
    creF VARCHAR(20),
    FOREIGN KEY (id_funcionario) REFERENCES tb_funcionario(id_funcionario)
);

-- Tabela de turmas
CREATE TABLE tb_turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    nomeT VARCHAR(50),
    dia VARCHAR(20),
    hora_inicio TIME,
    hora_fim TIME,
    id_servico INT,
    id_instrutor INT,
    FOREIGN KEY (id_servico) REFERENCES tb_servico(id_servico),
    FOREIGN KEY (id_instrutor) REFERENCES tb_instrutor(id_instrutor)
);

-- Tabela de clientes
CREATE TABLE tb_cliente (
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomeC VARCHAR(100) NOT NULL,
    cpfC VARCHAR(20) UNIQUE NOT NULL,
    foneC VARCHAR(14),
    email VARCHAR(100)
);

-- Tabela de matrículas
CREATE TABLE tb_matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio DATE,
    data_fim DATE,
    status VARCHAR(20),
    id_plano INT,
    id_cliente INT,
    FOREIGN KEY (id_plano) REFERENCES tb_plano(id_plano),
    FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
);

-- Tabela de pagamentos
CREATE TABLE tb_pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    data_pagamento DATE,
    data_vencimento DATE,
    forma_pag VARCHAR(30),
    valor DECIMAL(10, 2),
    id_matricula INT,
    FOREIGN KEY (id_matricula) REFERENCES tb_matricula(id_matricula)
);

-- Tabela de avaliações físicas
CREATE TABLE tb_avaliacao_fisica (
    id_avali_fisic INT PRIMARY KEY AUTO_INCREMENT,
    dataF DATE,
    peso DECIMAL(5,2),
    altura DECIMAL(5,2),
    valorF DECIMAL(10, 2),
    forma_pag VARCHAR(30),
    observacao VARCHAR(200),
    percentual_gordura DECIMAL(5, 2),
    id_cliente INT,
    id_instrutor INT,
    FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente),
    FOREIGN KEY (id_instrutor) REFERENCES tb_instrutor(id_instrutor)
);


-- Tabela de fornecedores
CREATE TABLE tb_fornecedor (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    cnpj VARCHAR(20) UNIQUE NOT NULL,
    nomeFO VARCHAR(100),
    emailFO VARCHAR(100),
    foneFO VARCHAR(14)
);

-- Tabela de produtos
CREATE TABLE tb_produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nomePR VARCHAR(100),
    valorPR DECIMAL(10, 2),
    qnt_estoque INT,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES tb_fornecedor(id_fornecedor)
);

-- Tabela de vendas
CREATE TABLE tb_venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE,
    forma_pag VARCHAR(30),
    total DECIMAL(10, 2),
    id_funcionario INT,
    FOREIGN KEY (id_funcionario) REFERENCES tb_funcionario(id_funcionario)
);

-- Tabela de itens dos produtos vendidos
CREATE TABLE tb_item_produto (
    id_produto INT,
    id_venda INT,
    preco_unico DECIMAL(10, 2),
    quantidade INT,
    PRIMARY KEY (id_produto, id_venda),
    FOREIGN KEY (id_produto) REFERENCES tb_produto(id_produto),
    FOREIGN KEY (id_venda) REFERENCES tb_venda(id_venda)
);


-- Planos 
INSERT INTO tb_plano (duracao,nomeP,valor_mensal)
VALUES
(1, 'Mensal', 150.0),
(3, 'Trimestral', 135.0),
(12, 'Anual Plus', 115.0);


-- SERVIÇOS
INSERT INTO tb_servico (nomeS, descricaoS)
VALUES
('Musculação','Treinamento com pesos e equipamentos' ),
('Cross Fit','Treino com pesos e ritimos' ),
('Spinning', 'Aulas de ciclismo' ),
('Pilates', 'Aulas de pilates solo e com aparelhos para postura e mobilidade'),
('Treinamento Funcional', 'Exercícios integrados para força, equilíbrio e condicionamento'),
('Yoga', 'Práticas de respiração, flexibilidade e consciência corporal'),
('Muay Thai', 'Aulas de técnica, coordenação e condicionamento físico'),
('Alongamento', 'Sessões orientadas de mobilidade e flexibilidade');  


-- Relacionamento Planos e Serviços (O plano 1 e 2 dão acesso aos serviços 1 e 2)
INSERT INTO tb_plano_servico (id_plano, id_servico) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 8),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8);


-- Funcionários 
INSERT INTO tb_funcionario (nomeF, cpfF, foneF, cargo, data_admissao, salario) VALUES
('Carlos Silva', '113.456.621-09', '(61) 9988-1212', 'Instrutor', '2025-01-10', 2800.00),
('Mariana Souza', '112.321.763-01', '(55) 9999-2222', 'Atendente', '2025-03-15', 2500.00),
('Douglas Ribeiro', '532.321.763-01', '(61) 9569-5292', 'Instrutor', '2025-11-20', 2850.00),
('Carlus La Celott', '795.141.663-21', '(11) 9969-5592', 'Zelador', '2025-02-15', 3000.00),
('Jailso Menedenz', '061.489.934-83', '(12) 9852-4893', 'Zelador', '2026-01-08', 3000.00),
('Silx Sevenx', '067.067.067-67', '(55) 9789-6612', 'Zelador', '2025-02-17', 3067.00),
('Luiza Sonzax', '857.223.144-57', '(65) 9889-4492', 'Instrutor', '2025-01-09', 2850.00),
('Jair Golzonaro', '453.178.287-91', '(22) 9222-2222', 'Atendente', '2026-02-26', 2500.00),
('Maria Antonietta', '879.963.612-12', '(11) 9889-4492', 'Atendente', '2026-02-26', 2500.00),
('Lulet Silveiz', '070.680.938-68', '(77) 9613-1313', 'Instrutor', '2025-12-13', 2500.00),
('Renata Oliveira', '301.100.001-01', '(61) 9911-3001', 'Instrutor', '2025-04-08', 3200.0),
('Marcos Vinicius Prado', '302.100.002-02', '(61) 9922-3002', 'Atendente', '2025-05-12', 2550.0),
('Patricia Gomes Nunes', '303.100.003-03', '(61) 9933-3003', 'Instrutor', '2025-06-02', 3100.0),
('Eduardo Martins Braga', '304.100.004-04', '(61) 9924-3004', 'Gerente', '2024-08-19', 4800.0),
('Fernanda Costa Reis', '305.100.005-05', '(61) 9955-3005', 'Atendente', '2025-07-21', 2600.0),
('Roberto Almeida Farias', '306.100.006-06', '(61) 9926-3006', 'Instrutor', '2025-09-03', 2950.0),
('Aline Barbosa Melo', '307.100.007-07', '(61) 9927-3007', 'Limpeza', '2025-10-14', 2100.0),
('Diego Henrique Pires', '308.100.008-08', '(61) 9928-3008', 'Instrutor', '2025-11-05', 3050.0),
('Simone Carvalho Leal', '309.100.009-09', '(61) 9929-3009', 'Atendente', '2026-01-12', 2600.0),
('André Luiz Moreira', '310.100.010-10', '(61) 9900-3010', 'Instrutor', '2026-02-09', 3150.0);

-- INSTRUTORES
INSERT INTO tb_instrutor (id_funcionario, creF) VALUES
(1, '123456-G/SP'),
(3, '987654-G/MG'),
(7, '987654-G/DF'), 
(10, '987654-G/RJ'),
(11, '012345-G/DF'),
(13, '023456-G/DF'),
(16, '034567-G/DF'),
(18, '045678-G/DF'),
(20, '056789-G/DF');


-- CLIENTES
INSERT INTO tb_cliente (nomeC, cpfC, foneC, email)
VALUES
('João da Silva', '123.453.673-07','(86) 9818-3397', 'joaosilva023@gmail.com'),
('Pedro Lins', '134.987.444-07','(61) 9888-3333', 'pedrolins@gmail.com'),
('Estevão Figeiredo', '145.322.111-07','(61) 9898-2222', 'estevaofigeiredo2001@gmail.com'),
('Nicolas Araújo', '112.432.999-07','(61) 0000-9896', 'nicolasaraujoo045@gmail.com'),
('Luan do Santos', '122.444.222-07', '(61) 1111-2222', 'luansantos00245@gmail.com'),
('Daniel Rodrigues', '112.340.660-07', '(86) 9815-5347', 'danielrdn023@gmail.com'),
('Amanda Queiroz', '400.000.000-01', '(61) 9907-3001', 'amanda.queiroz01@example.com'),
('Felipe Moura', '400.000.000-02', '(61) 9914-3002', 'felipe.moura02@example.com'),
('Carolina Peixoto', '400.000.000-03', '(61) 9921-3003', 'carolina.peixoto03@example.com'),
('Rodrigo Tavares', '400.000.000-04', '(61) 9928-3004', 'rodrigo.tavares04@example.com'),
('Bruna Cavalcante', '400.000.000-05', '(61) 9935-3005', 'bruna.cavalcante05@example.com'),
('Marcelo Duarte', '400.000.000-06', '(61) 9942-3006', 'marcelo.duarte06@example.com'),
('Priscila Macedo', '400.000.000-07', '(61) 9949-3007', 'priscila.macedo07@example.com'),
('Renan Azevedo', '400.000.000-08', '(61) 9956-3008', 'renan.azevedo08@example.com'),
('Tatiane Falcão', '400.000.000-09', '(61) 9963-3009', 'tatiane.falcao09@example.com'),
('Igor Rezende', '400.000.000-10', '(61) 9970-3010', 'igor.rezende10@example.com'),
('Gabriela Pacheco', '400.000.000-11', '(61) 9977-3011', 'gabriela.pacheco11@example.com'),
('Leonardo Siqueira', '400.000.000-12', '(61) 9984-3012', 'leonardo.siqueira12@example.com'),
('Michele Borges', '400.000.000-13', '(61) 9991-3013', 'michele.borges13@example.com'),
('Ramon Medeiros', '400.000.000-14', '(61) 9998-3014', 'ramon.medeiros14@example.com'),
('Daniela Vasconcelos', '400.000.000-15', '(61) 9905-3015', 'daniela.vasconcelos15@example.com'),
('Caue Ramos', '400.000.000-16', '(61) 9912-3016', 'caue.ramos16@example.com'),
('Natalia Correia', '400.000.000-17', '(61) 9919-3017', 'natalia.correia17@example.com'),
('Alex Moraes', '400.000.000-18', '(61) 9926-3018', 'alex.moraes18@example.com'),
('Flavia Peçanha', '400.000.000-19', '(61) 9933-3019', 'flavia.pecanha19@example.com'),
('Vitor Nogueira', '400.000.000-20', '(61) 9940-3020', 'vitor.nogueira20@example.com'),
('Monique Cunha', '400.000.000-21', '(61) 9947-3021', 'monique.cunha21@example.com'),
('Renato Lacerda', '400.000.000-22', '(61) 9954-3022', 'renato.lacerda22@example.com'),
('Elaine Porto', '400.000.000-23', '(61) 9961-3023', 'elaine.porto23@example.com'),
('Samuel Bittencourt', '400.000.000-24', '(61) 9968-3024', 'samuel.bittencourt24@example.com'),
('Jessica Figueira', '400.000.000-25', '(61) 9975-3025', 'jessica.figueira25@example.com'),
('Cristiano Matos', '400.000.000-26', '(61) 9982-3026', 'cristiano.matos26@example.com'),
('Debora Assis', '400.000.000-27', '(61) 9989-3027', 'debora.assis27@example.com'),
('Leandro Goulart', '400.000.000-28', '(61) 9996-3028', 'leandro.goulart28@example.com'),
('Raquel Dantas', '400.000.000-29', '(61) 9903-3029', 'raquel.dantas29@example.com'),
('Mauricio Neves', '400.000.000-30', '(61) 9910-3030', 'mauricio.neves30@example.com'),
('Priscila Furtado', '400.000.000-31', '(61) 9917-3031', 'priscila.furtado31@example.com'),
('Danilo Coelho', '400.000.000-32', '(61) 9924-3032', 'danilo.coelho32@example.com'),
('Vanessa Mota', '400.000.000-33', '(61) 9931-3033', 'vanessa.mota33@example.com'),
('Rafael Quevedo', '400.000.000-34', '(61) 9938-3034', 'rafael.quevedo34@example.com'),
('Livia Sampaio', '400.000.000-35', '(61) 9945-3035', 'livia.sampaio35@example.com'),
('Wesley Andrade', '400.000.000-36', '(61) 9952-3036', 'wesley.andrade36@example.com'),
('Cintia Mendes', '400.000.000-37', '(61) 9959-3037', 'cintia.mendes37@example.com'),
('Elias Barros', '400.000.000-38', '(61) 9966-3038', 'elias.barros38@example.com'),
('Marta Lins', '400.000.000-39', '(61) 9973-3039', 'marta.lins39@example.com'),
('Fabio Brito', '400.000.000-40', '(61) 9980-3040', 'fabio.brito40@example.com'),
('Sabrina Paiva', '400.000.000-41', '(61) 9987-3041', 'sabrina.paiva41@example.com'),
('Joao Victor Rangel', '400.000.000-42', '(61) 9994-3042', 'joaovictor.rangel42@example.com'),
('Nathalia Freire', '400.000.000-43', '(61) 9901-3043', 'nathalia.freire43@example.com'),
('Caio Bastos', '400.000.000-44', '(61) 9908-3044', 'caio.bastos44@example.com'),
('Luiza Peixoto', '400.000.000-45', '(61) 9915-3045', 'luiza.peixoto45@example.com'),
('Pedro Henrique Lobo', '400.000.000-46', '(61) 9922-3046', 'pedrohenrique.lobo46@example.com'),
('Marina Farias', '400.000.000-47', '(61) 9929-3047', 'marina.farias47@example.com'),
('Arthur Cavalcanti', '400.000.000-48', '(61) 9936-3048', 'arthur.cavalcanti48@example.com'),
('Isadora Rios', '400.000.000-49', '(61) 9943-3049', 'isadora.rios49@example.com'),
('Bernardo Vilela', '400.000.000-50', '(61) 9950-3050', 'bernardo.vilela50@example.com');

-- FORNECEDORES
INSERT INTO tb_fornecedor (cnpj, nomeFO, emailFO, foneFO)
VALUES
('11.111.111/0001-11', 'Suplementos DF', 'contato@suplementosdf.com', '(61) 3333-3333'),
('22.222.222/0002-22', 'Equipamentos Fitness', 'vendas@fitness.com', '(61) 1111-1111'),
('31.456.789/0001-10', 'Nutrição Esportiva Centro-Oeste', 'comercial@nutricaoesportiva.example.com', '(61) 3333-4101'),
('32.567.890/0001-21', 'Ativa Fitness Distribuidora', 'vendas@ativafitness.example.com', '(61) 3333-4102'),
('33.678.901/0001-32', 'ProHealth Suplementos', 'atendimento@prohealth.example.com', '(11) 3333-4103'),
('34.789.012/0001-43', 'Movimento Equipamentos', 'contato@movimento.example.com', '(11) 3333-4104'),
('35.890.123/0001-54', 'Vita Natural Alimentos', 'pedidos@vitanatural.example.com', '(31) 3333-4105'),
('36.901.234/0001-65', 'Forte Performance', 'comercial@forteperformance.example.com', '(21) 3333-4106'),
('37.012.345/0001-76', 'Essencial Sportswear', 'vendas@essencialsportswear.example.com', '(41) 3333-4107'),
('38.123.456/0001-87', 'Prime Acessórios Fitness', 'contato@primeacessorios.example.com', '(51) 3333-4108');

-- TURMAS
INSERT INTO tb_turma (nomeT, dia, hora_inicio, hora_fim, id_servico, id_instrutor)
VALUES 
('Musculação Noite', 'Terça', '19:00', '20:00', 1, 2),
('Cross Fit Manhã', 'Quarta', '07:00', '08:00', 2, 3),
('Spinning Noite', 'Sexta', '18:00', '19:00', 3, 4),
('Pilates Manhã', 'Segunda', '07:00', '08:00', 4, 5),
('Funcional Noite', 'Segunda', '19:00', '20:00', 5, 6),
('Yoga Manhã', 'Terça', '08:00', '09:00', 6, 7),
('Muay Thai Noite', 'Terça', '20:00', '21:00', 7, 8),
('Alongamento Manhã', 'Quarta', '06:30', '07:15', 8, 9),
('Pilates Noite', 'Quarta', '18:00', '19:00', 4, 5),
('Funcional Manhã', 'Quinta', '07:00', '08:00', 5, 6),
('Yoga Noite', 'Quinta', '19:00', '20:00', 6, 7),
('Muay Thai Manhã', 'Sexta', '08:00', '09:00', 7, 8),
('Alongamento Noite', 'Sexta', '18:30', '19:15', 8, 9),
('Musculação Iniciante', 'Sábado', '09:00', '10:00', 1, 5),
('Cross Fit Intermediário', 'Sábado', '10:00', '11:00', 2, 6),
('Spinning Manhã', 'Sábado', '08:00', '09:00', 3, 7),
('Funcional Sábado', 'Sábado', '11:00', '12:00', 5, 8),
('Pilates Sábado', 'Sábado', '09:30', '10:30', 4, 9);


-- MATRÍCULAS
INSERT INTO tb_matricula (data_inicio, data_fim, status, id_plano, id_cliente)
VALUES
('2026-10-01', '2027-03-31', 'Ativa', 1, 1),
('2026-09-01', '2027-08-31', 'Ativa', 2, 2),
('2026-10-15', '2027-04-14', 'Ativa', 1, 3),
('2026-08-01', '2027-01-31', 'Ativa', 1, 4),
('2026-05-01', '2026-10-31', 'Inativa', 2, 5),
('2026-11-01', '2027-10-31', 'Ativa', 2, 6),
('2026-01-01', '2026-06-30', 'Inativa', 1, 7),
('2026-01-07', '2027-01-06', 'Ativa', 2, 8),
('2026-01-13', '2026-02-12', 'Inativa', 3, 9),
('2026-01-19', '2026-04-18', 'Inativa', 3, 10),
('2026-01-25', '2027-01-24', 'Ativa', 2, 11),
('2026-01-31', '2026-07-30', 'Inativa', 1, 12),
('2026-02-06', '2027-02-05', 'Ativa', 2, 13),
('2026-02-12', '2026-03-11', 'Inativa', 3, 14),
('2026-02-18', '2026-05-17', 'Inativa', 3, 15),
('2026-02-24', '2027-02-23', 'Ativa', 2, 16),
('2026-03-02', '2026-09-01', 'Inativa', 1, 17),
('2026-03-08', '2027-03-07', 'Ativa', 2, 18),
('2026-03-14', '2026-04-13', 'Inativa', 3, 19),
('2026-03-20', '2026-06-19', 'Inativa', 3, 20),
('2026-03-26', '2027-03-25', 'Ativa', 2, 21),
('2026-04-01', '2026-09-30', 'Inativa', 1, 22),
('2026-04-07', '2027-04-06', 'Ativa', 2, 23),
('2026-04-13', '2026-05-12', 'Inativa', 3, 24),
('2026-04-19', '2026-07-18', 'Inativa', 3, 25),
('2026-04-25', '2027-04-24', 'Ativa', 2, 26),
('2026-05-01', '2026-10-31', 'Inativa', 1, 27),
('2026-05-07', '2027-05-06', 'Ativa', 2, 28),
('2026-05-13', '2026-06-12', 'Inativa', 3, 29),
('2026-05-19', '2026-08-18', 'Inativa', 3, 30),
('2026-05-25', '2027-05-24', 'Ativa', 2, 31),
('2026-05-31', '2026-11-29', 'Ativa', 1, 32),
('2026-06-06', '2027-06-05', 'Ativa', 2, 33),
('2026-06-12', '2026-07-11', 'Inativa', 3, 34),
('2026-06-18', '2026-09-17', 'Inativa', 3, 35),
('2026-06-24', '2027-06-23', 'Ativa', 2, 36),
('2026-06-30', '2026-12-29', 'Ativa', 1, 37),
('2026-07-06', '2027-07-05', 'Ativa', 2, 38),
('2026-07-12', '2026-08-11', 'Inativa', 3, 39),
('2026-07-18', '2026-10-17', 'Inativa', 3, 40),
('2026-07-24', '2027-07-23', 'Ativa', 2, 41),
('2026-07-30', '2027-01-29', 'Ativa', 1, 42),
('2026-08-05', '2027-08-04', 'Ativa', 2, 43),
('2026-08-11', '2026-09-10', 'Inativa', 3, 44),
('2026-08-17', '2026-11-16', 'Ativa', 3, 45),
('2026-08-23', '2027-08-22', 'Ativa', 2, 46),
('2026-08-29', '2027-02-27', 'Ativa', 1, 47),
('2026-09-04', '2027-09-03', 'Ativa', 2, 48),
('2026-09-10', '2026-10-09', 'Inativa', 3, 49),
('2026-09-16', '2026-12-15', 'Ativa', 3, 50),
('2026-09-22', '2027-09-21', 'Ativa', 2, 51),
('2026-09-28', '2027-03-27', 'Ativa', 1, 52),
('2026-10-04', '2027-10-03', 'Ativa', 2, 53),
('2026-10-10', '2026-11-09', 'Ativa', 3, 54),
('2026-10-16', '2027-01-15', 'Ativa', 3, 55),
('2026-10-22', '2027-10-21', 'Ativa', 2, 56);

-- PAGAMENTOS
INSERT INTO tb_pagamento (data_pagamento, data_vencimento, forma_pag, valor, id_matricula)
VALUES
('2026-10-01', '2026-10-01', 'Cartão', 120.00, 1),
(NULL, '2026-11-01', 'Pix', 100.00, 2),
('2026-11-05', '2026-11-05', 'Dinheiro', 120.00, 3),
(NULL, '2026-11-10', 'Cartão', 120.00, 4),
('2026-10-01', '2026-10-01', 'Pix', 100.00, 5),
(NULL, '2026-12-01', 'Pix', 100.00, 6),
(NULL, '2026-01-31', 'Pix', 120.00, 7),
('2026-02-06', '2026-02-06', 'Cartão', 100.00, 8),
('2026-02-12', '2026-02-12', 'Débito', 150.00, 9),
(NULL, '2026-02-18', 'Dinheiro', 135.00, 10),
('2026-02-24', '2026-02-24', 'Transferência', 115.00, 11),
('2026-03-02', '2026-03-02', 'Pix', 120.00, 12),
(NULL, '2026-03-08', 'Cartão', 100.00, 13),
('2026-03-14', '2026-03-14', 'Débito', 150.00, 14),
('2026-03-20', '2026-03-20', 'Dinheiro', 135.00, 15),
(NULL, '2026-03-26', 'Transferência', 115.00, 16),
('2026-04-01', '2026-04-01', 'Pix', 120.00, 17),
('2026-04-07', '2026-04-07', 'Cartão', 100.00, 18),
(NULL, '2026-04-13', 'Débito', 150.00, 19),
('2026-04-19', '2026-04-19', 'Dinheiro', 135.00, 20),
('2026-04-25', '2026-04-25', 'Transferência', 115.00, 21),
(NULL, '2026-05-01', 'Pix', 120.00, 22),
('2026-05-07', '2026-05-07', 'Cartão', 100.00, 23),
('2026-05-13', '2026-05-13', 'Débito', 150.00, 24),
(NULL, '2026-05-19', 'Dinheiro', 135.00, 25),
('2026-05-25', '2026-05-25', 'Transferência', 115.00, 26),
('2026-05-31', '2026-05-31', 'Pix', 120.00, 27),
(NULL, '2026-06-06', 'Cartão', 100.00, 28),
('2026-06-12', '2026-06-12', 'Débito', 150.00, 29),
('2026-06-18', '2026-06-18', 'Dinheiro', 135.00, 30),
(NULL, '2026-06-24', 'Transferência', 115.00, 31),
('2026-06-30', '2026-06-30', 'Pix', 120.00, 32),
('2026-07-06', '2026-07-06', 'Cartão', 100.00, 33),
(NULL, '2026-07-12', 'Débito', 150.00, 34),
('2026-07-18', '2026-07-18', 'Dinheiro', 135.00, 35),
('2026-07-24', '2026-07-24', 'Transferência', 115.00, 36),
(NULL, '2026-07-30', 'Pix', 120.00, 37),
('2026-08-05', '2026-08-05', 'Cartão', 100.00, 38),
('2026-08-11', '2026-08-11', 'Débito', 150.00, 39),
(NULL, '2026-08-17', 'Dinheiro', 135.00, 40),
('2026-08-23', '2026-08-23', 'Transferência', 115.00, 41),
('2026-08-29', '2026-08-29', 'Pix', 120.00, 42),
(NULL, '2026-09-04', 'Cartão', 100.00, 43),
('2026-09-10', '2026-09-10', 'Débito', 150.00, 44),
('2026-09-16', '2026-09-16', 'Dinheiro', 135.00, 45),
(NULL, '2026-09-22', 'Transferência', 115.00, 46),
('2026-09-28', '2026-09-28', 'Pix', 120.00, 47),
('2026-10-04', '2026-10-04', 'Cartão', 100.00, 48),
(NULL, '2026-10-10', 'Débito', 150.00, 49),
('2026-10-16', '2026-10-16', 'Dinheiro', 135.00, 50),
('2026-10-22', '2026-10-22', 'Transferência', 115.00, 51),
(NULL, '2026-10-28', 'Pix', 120.00, 52),
('2026-11-03', '2026-11-03', 'Cartão', 100.00, 53),
('2026-11-09', '2026-11-09', 'Débito', 150.00, 54),
(NULL, '2026-11-15', 'Dinheiro', 135.00, 55),
(NULL, '2026-11-21', 'Transferência', 115.00, 56);

-- AVALIAÇÕES FÍSICAS
INSERT INTO tb_avaliacao_fisica (dataF, peso, altura, valorF, forma_pag, observacao, percentual_gordura, id_cliente, id_instrutor)
VALUES
('2026-10-05', 75.50, 1.75, 50.00, 'Pix', 'Avaliação inicial', 18.50, 1, 1),
('2026-10-06', 62.30, 1.65, 50.00, 'Cartão', 'Avaliação inicial', 22.00, 2, 2),
('2026-10-15', 88.00, 1.80, 50.00, 'Pix', 'Avaliação inicial', 25.00, 3, 3),
('2026-10-18', 70.50, 1.72, 50.00, 'Dinheiro', 'Avaliação inicial', 19.00, 4, 4),
('2026-10-20', 80.00, 1.78, 50.00, 'Cartão', 'Avaliação de acompanhamento', 21.50, 5, 1),
('2026-11-02', 68.00, 1.68, 50.00, 'Pix', 'Avaliação inicial', 23.00, 6, 2),
('2026-03-01', 54.0, 1.52, 50.0, 'Pix', 'Avaliação inicial', 15.0, 7, 1),
('2026-03-08', 55.3, 1.59, 45.0, 'Cartão', 'Reavaliação de acompanhamento', 16.1, 8, 2),
('2026-03-15', 56.6, 1.66, 45.0, 'Dinheiro', 'Plano de evolução física', 17.2, 9, 3),
('2026-03-22', 57.9, 1.73, 45.0, 'Pix', 'Avaliação inicial', 18.3, 10, 4),
('2026-03-29', 59.2, 1.8, 50.0, 'Cartão', 'Reavaliação de acompanhamento', 19.4, 11, 5),
('2026-04-05', 60.5, 1.87, 45.0, 'Dinheiro', 'Plano de evolução física', 20.5, 12, 6),
('2026-04-12', 61.8, 1.54, 45.0, 'Pix', 'Avaliação inicial', 21.6, 13, 7),
('2026-04-19', 63.1, 1.61, 45.0, 'Cartão', 'Reavaliação de acompanhamento', 22.7, 14, 8),
('2026-04-26', 64.4, 1.68, 50.0, 'Dinheiro', 'Plano de evolução física', 23.8, 15, 9),
('2026-05-03', 65.7, 1.75, 45.0, 'Pix', 'Avaliação inicial', 24.9, 16, 1),
('2026-05-10', 67.0, 1.82, 45.0, 'Cartão', 'Reavaliação de acompanhamento', 26.0, 17, 2),
('2026-05-17', 68.3, 1.89, 45.0, 'Dinheiro', 'Plano de evolução física', 27.1, 18, 3),
('2026-05-24', 69.6, 1.56, 50.0, 'Pix', 'Avaliação inicial', 28.2, 19, 4),
('2026-05-31', 70.9, 1.63, 45.0, 'Cartão', 'Reavaliação de acompanhamento', 29.3, 20, 5),
('2026-06-07', 72.2, 1.7, 45.0, 'Dinheiro', 'Plano de evolução física', 30.4, 21, 6),
('2026-06-14', 73.5, 1.77, 45.0, 'Pix', 'Avaliação inicial', 15.5, 22, 7),
('2026-06-21', 74.8, 1.84, 50.0, 'Cartão', 'Reavaliação de acompanhamento', 16.6, 23, 8),
('2026-06-28', 76.1, 1.91, 45.0, 'Dinheiro', 'Plano de evolução física', 17.7, 24, 9),
('2026-07-05', 77.4, 1.58, 45.0, 'Pix', 'Avaliação inicial', 18.8, 25, 1),
('2026-07-12', 78.7, 1.65, 45.0, 'Cartão', 'Reavaliação de acompanhamento', 19.9, 26, 2),
('2026-07-19', 80.0, 1.72, 50.0, 'Dinheiro', 'Plano de evolução física', 21.0, 27, 3),
('2026-07-26', 81.3, 1.79, 45.0, 'Pix', 'Avaliação inicial', 22.1, 28, 4),
('2026-08-02', 82.6, 1.86, 45.0, 'Cartão', 'Reavaliação de acompanhamento', 23.2, 29, 5),
('2026-08-09', 83.9, 1.53, 45.0, 'Dinheiro', 'Plano de evolução física', 24.3, 30, 6),
('2026-08-16', 85.2, 1.6, 50.0, 'Pix', 'Avaliação inicial', 25.4, 31, 7),
('2026-08-23', 86.5, 1.67, 45.0, 'Cartão', 'Reavaliação de acompanhamento', 26.5, 32, 8),
('2026-08-30', 87.8, 1.74, 45.0, 'Dinheiro', 'Plano de evolução física', 27.6, 33, 9),
('2026-09-06', 89.1, 1.81, 45.0, 'Pix', 'Avaliação inicial', 28.7, 34, 1),
('2026-09-13', 90.4, 1.88, 50.0, 'Cartão', 'Reavaliação de acompanhamento', 29.8, 35, 2),
('2026-09-20', 91.7, 1.55, 45.0, 'Dinheiro', 'Plano de evolução física', 30.9, 36, 3);


-- PRODUTOS
INSERT INTO tb_produto (nomePR, valorPR, qnt_estoque, id_fornecedor)
VALUES
('Whey Protein', 120.00, 15, 1),
('Garrafa Fitness', 35.00, 3, 2),
('Luva de Treino', 55.00, 2, 2),
('Barra de Proteína', 12.00, 20, 1),
('Creatina Monohidratada 300g', 89.9, 18, 3),
('Whey Protein Concentrado 900g', 149.9, 12, 4),
('Coqueteleira 700ml', 29.9, 35, 5),
('Corda de Pular Ajustável', 39.9, 22, 6),
('Colchonete para Exercícios', 79.9, 14, 7),
('Luva para Musculação', 59.9, 16, 8),
('Munhequeira Esportiva', 34.9, 20, 9),
('Faixa Elástica Leve', 24.9, 28, 10),
('Faixa Elástica Forte', 34.9, 24, 3),
('Kit Mini Bands', 49.9, 17, 4),
('Garrafa Térmica 1L', 69.9, 19, 5),
('Camiseta Dry Fit', 79.9, 25, 6),
('Shorts de Treino', 89.9, 15, 7),
('Meia Esportiva', 19.9, 40, 8),
('Barra de Proteína', 9.9, 60, 9),
('Pasta de Amendoim 500g', 32.9, 21, 10),
('BCAA 120 cápsulas', 74.9, 10, 3),
('Ômega 3 120 cápsulas', 59.9, 13, 4),
('Cinto para Agachamento', 119.9, 8, 5),
('Strap para Levantamento', 39.9, 18, 6),
('Rolo de Liberação Miofascial', 69.9, 11, 7),
('Bola de Pilates 65cm', 54.9, 9, 8),
('Tapete de Yoga', 89.9, 12, 9),
('Bloco para Yoga', 29.9, 16, 10),
('Luva para Ciclismo Indoor', 49.9, 14, 3),
('Toalha Esportiva', 24.9, 30, 4),
('Shaker de Proteína', 34.9, 26, 5),
('Glutamina 300g', 79.9, 9, 6),
('Multivitamínico', 64.9, 18, 7),
('Kit de Halteres Emborrachados', 199.9, 6, 8);


-- VENDAS
INSERT INTO tb_venda (data_venda, forma_pag, total, id_funcionario)
VALUES
('2026-11-03', 'Pix', 190.00, 2),
('2026-11-04', 'Cartão', 230.00, 2),
('2026-11-05', 'Dinheiro', 24.00, 2),
('2026-08-01', 'Pix', 249.7, 12),
('2026-08-04', 'Cartão', 109.5, 14),
('2026-08-07', 'Débito', 94.8, 15),
('2026-08-10', 'Dinheiro', 239.6, 19),
('2026-08-13', 'Pix', 179.6, 12),
('2026-08-16', 'Cartão', 100.7, 14),
('2026-08-19', 'Débito', 519.7, 19),
('2026-08-22', 'Dinheiro', 199.5, 15),
('2026-08-25', 'Pix', 109.8, 12),
('2026-08-28', 'Cartão', 229.6, 14),
('2026-08-31', 'Débito', 329.6, 19),
('2026-09-03', 'Dinheiro', 89.7, 15),
('2026-09-06', 'Pix', 154.7, 12),
('2026-09-09', 'Cartão', 309.5, 14),
('2026-09-12', 'Débito', 119.8, 19),
('2026-09-15', 'Dinheiro', 135.6, 15),
('2026-09-18', 'Pix', 719.6, 12),
('2026-09-21', 'Cartão', 139.7, 14),
('2026-09-24', 'Débito', 169.7, 19),
('2026-09-27', 'Dinheiro', 264.5, 15),
('2026-09-30', 'Pix', 169.8, 12),
('2026-10-03', 'Cartão', 99.6, 14),
('2026-10-06', 'Débito', 214.6, 19),
('2026-10-09', 'Dinheiro', 169.7, 15),
('2026-10-12', 'Pix', 149.7, 12);

-- ITENS DOS PRODUTOS VENDIDOS
INSERT INTO tb_item_produto (id_produto, id_venda, preco_unico, quantidade)
VALUES
(1, 1, 120.00, 1),
(2, 1, 35.00, 2),

(1, 2, 120.00, 1),
(3, 2, 55.00, 2),

(4, 3, 12.00, 2),

(5, 4, 89.9, 1),
(16, 4, 79.9, 2),

(8, 5, 39.9, 2),
(19, 5, 9.9, 3),

(11, 6, 34.9, 1),
(22, 6, 59.9, 1),

(14, 7, 49.9, 2),
(25, 7, 69.9, 2),

(17, 8, 89.9, 1),
(28, 8, 29.9, 3),

(20, 9, 32.9, 2),
(31, 9, 34.9, 1),

(23, 10, 119.9, 1),
(34, 10, 199.9, 2),

(26, 11, 54.9, 2),
(7, 11, 29.9, 3),

(29, 12, 49.9, 1),
(10, 12, 59.9, 1),

(32, 13, 79.9, 2),
(13, 13, 34.9, 2),

(5, 14, 89.9, 1),
(16, 14, 79.9, 3),

(8, 15, 39.9, 2),
(19, 15, 9.9, 1),

(11, 16, 34.9, 1),
(22, 16, 59.9, 2),

(14, 17, 49.9, 2),
(25, 17, 69.9, 3),

(17, 18, 89.9, 1),
(28, 18, 29.9, 1),

(20, 19, 32.9, 2),
(31, 19, 34.9, 2),

(23, 20, 119.9, 1),
(34, 20, 199.9, 3),

(26, 21, 54.9, 2),
(7, 21, 29.9, 1),

(29, 22, 49.9, 1),
(10, 22, 59.9, 2),

(32, 23, 79.9, 2),
(13, 23, 34.9, 3),

(5, 24, 89.9, 1),
(16, 24, 79.9, 1),

(8, 25, 39.9, 2),
(19, 25, 9.9, 2),

(11, 26, 34.9, 1),
(22, 26, 59.9, 3),

(14, 27, 49.9, 2),
(25, 27, 69.9, 1),

(17, 28, 89.9, 1),
(28, 28, 29.9, 2);


DElIMITER $$
    CREATE FUNCTION listarNomeCliente()
    RETURNS VARCHAR(1000)
    READS SQL DATA
    BEGIN
        DECLARE resultado VARCHAR(1000);

        SELECT GROUP_CONCAT(nomeC ORDER BY nomeC ASC SEPARATOR '\n ')
        INTO resultado
        FROM tb_cliente;

        RETURN resultado;
    END$$
DElIMITER ;


DElIMITER $$
    CREATE FUNCTION clienteId(pessoa_id INT)
    RETURNS VARCHAR(1000)
    READS SQL DATA
    BEGIN
        DECLARE resultado VARCHAR(1000);

        SELECT GROUP_CONCAT(nomeC , '  |  ' , cpfC , '  |  ' , foneC , '  |  ' , email )
        INTO resultado
        FROM tb_cliente
        WHERE id_cliente = pessoa_id;

        RETURN resultado;
    END$$
DElIMITER ;

DElIMITER $$
    CREATE FUNCTION funcionarioCargo(cargo_fun VARCHAR(50))
    RETURNS VARCHAR(1000)
    READS SQL DATA
    BEGIN
        DECLARE resultado VARCHAR(1000);

        SELECT GROUP_CONCAT(nomeF ORDER BY nomeF ASC SEPARATOR '\n' )
        INTO resultado
        FROM tb_funcionario
        WHERE cargo = cargo_fun;

        RETURN resultado;
    END$$
DElIMITER ;

-- Clientes
SELECT * 
FROM tb_cliente;

-- Produtos
SELECT nomePR
FROM tb_produto;

-- Apenas o nome, telefone e e-mail dos clientes
SELECT nomeC AS 'CLIENTE', foneC AS 'TELEFONE', email AS 'EMAIL'
FROM tb_cliente
ORDER BY nomeC ASC;

-- Lista todos os nomes e salarios dos funcionarios em ordem crescente
SELECT nomeF, salario
FROM tb_funcionario
ORDER BY salario ASC;

-- Lista todos os funcionarios que trabalham como INSTRUTORES
SELECT nomeF AS 'INSTRUTORES'
FROm tb_funcionario
WHERE cargo = 'Instrutor';

-- Lista produtos com preço acima de R$50,00
SELECT nomePR AS 'PRODUTO'
FROM tb_produto
WHERE valorPR > 50;

-- Lista funcionarios que recebem entre R$2.500 e R$3.000
SELECT nomeF AS 'FUNCIONARIOS'
FROM tb_funcionario
WHERE salario  BETWEEN 2500 and 3000;

-- Liste o nome dos funcionarios que trabalham como ATENDENTE
SELECT nomeF AS 'ANTENDENTES'
FROM tb_funcionario
WHERE cargo in ('Atendente');

-- Lista os clientes que começam com a letra D
SELECT nomeC
FROM tb_cliente
WHERE nomeC LIKE 'D%';

-- Lista todos os produtos que são menor ou iguais a 5 unidades
SELECT nomePR AS 'PRODUTO'
FROM tb_produto
WHERE qnt_estoque BETWEEN 0 and 5;


-- Liste todos os funcionarios que recebem mais de R$2.500
SELECT nomeF AS 'FUNCIONARIOS'
FROM tb_funcionario
WHERE salario > 2500;

-- Lista clientes que possuem e-mail e telefone cadastrados
SELECT nomeC AS 'CLIENTE'
FROM tb_cliente
WHERE email IS NOT NULL
AND foneC IS NOT NULL;

-- Lista  o total de clientes
SELECT count(*) AS 'TOTAL DE CLIENTES'
FROM tb_cliente;

-- Calcular a media sálarial de totos os funcionairos 
SELECT cargo AS 'CARGO', ROUND(AVG(salario),2) AS 'SALÁRIO'
FROM tb_funcionario
GROUP BY cargo;

-- Lista o produto mais caro e o mais barato
SELECT nomePR AS 'PRODUTO', valorPR AS 'PREÇO'
FROM tb_produto
ORDER BY valorPR DESC LIMIT 1;

SELECT nomePR AS 'PRODUTO', valorPR AS 'PREÇO'
FROM tb_produto
ORDER BY valorPR ASC LIMIT 1;

-- Calcula o valor total de todos os produtos
SELECT SUM(valorPR) AS 'SOMA DE TODOS OS PRODUTOS'
FROM tb_produto
WHERE nomePR IS NOT NULL AND valorPR IS NOT NULL;

-- Lista quantos funcionários existem em cada cargo.
SELECT cargo AS 'CARGO', COUNT(*) AS 'TOTAL'
FROM tb_funcionario
GROUP BY cargo;

-- Calcule a média salarial de cada cargo.
SELECT cargo AS 'CARGO', ROUND(AVG(salario),2) AS 'SALARIO'
FROM tb_funcionario
GROUP BY cargo;

-- Lista quantas matrículas existem para cada status.
SELECT status AS 'STATUS', COUNT(status) AS 'TOTAL'
FROM tb_matricula
GROUP BY status;

-- Mostra o faturamento total agrupado por forma de pagamento
SELECT forma_pag, ROUND(SUM(valor),2)
FROM tb_pagamento
GROUP BY forma_pag;

-- Lista os clientes juntamente com os planos que contrataram
SELECT tb_cliente.nomeC AS 'CLINTE' ,tb_plano.nomeP AS 'PLANO'
FROM tb_cliente INNER JOIN tb_matricula
ON tb_cliente.id_cliente = tb_matricula.id_cliente
INNER JOIN tb_plano 
ON tb_matricula.id_plano = tb_plano.id_plano
ORDER BY tb_cliente.nomeC ASC;


-- Lista todos os instrutores, exibindo seus nomes, cargos e registros CREF
SELECT tb_funcionario.nomeF AS 'NOME', tb_funcionario.cargo AS 'CARGO', tb_instrutor.creF AS 'REGISTRO'
FROM tb_funcionario INNER JOIN tb_instrutor
ON tb_funcionario.id_funcionario = tb_instrutor.id_funcionario;

-- Mostra quais serviços estão disponíveis em cada plano.
SELECT tb_servico.nomeS AS 'SERVIÇO', tb_plano.nomeP AS 'PLANOS'
FROM tb_servico INNER JOIN tb_plano_servico 
ON tb_servico.id_servico = tb_plano_servico.id_servico
INNER JOIN tb_plano
ON tb_plano_servico.id_plano = tb_plano.id_plano;

-- Liste todas as turmas, mostrando o nome da turma, o serviço oferecido e o instrutor responsável
SELECT tb_turma.nomeT AS 'TURMA', tb_servico.nomeS AS 'SERVIÇO', tb_funcionario.nomeF
FROM tb_turma INNER JOIN tb_servico
ON tb_turma.id_servico = tb_servico.id_servico
INNER JOIN tb_instrutor
ON tb_turma.id_instrutor = tb_instrutor.id_instrutor
INNER JOIN tb_funcionario
ON tb_instrutor.id_funcionario = tb_funcionario.id_funcionario;

-- Mostra os clientes e o status de sua matrula
SELECT tb_cliente.nomeC AS 'NOME', tb_matricula.status AS 'STATUS'
FROM tb_cliente LEFT JOIN tb_matricula
ON tb_cliente.id_cliente = tb_matricula.id_cliente
ORDER BY tb_cliente.nomeC ASC;

-- Lista as vendas realizadas, exibindo o nome do funcionário responsável e o valor total de cada venda.
SELECT tb_venda.id_venda AS 'ID VENDA', tb_funcionario.nomeF AS 'FUNCIONARIO', tb_venda.total AS 'TOTAL'
FROM tb_funcionario INNER JOIN tb_venda
ON tb_funcionario.id_funcionario = tb_venda.id_funcionario;

-- FUNÇÕES

-- mostra o nome de todos os clientes
SELECT listarNomeCliente() AS 'CLIENTES';

-- Lista todas as informações do cliente aparti do ID
SELECT clienteId(3) AS 'CLIENTE';

-- Lista o nome do funcionario, de acordo com o cargo 
SELECT funcionarioCargo('Instrutor') AS 'INSTRUTOR';

-- TRIGGERS

-- Garante que os triggers sejam criados no mesmo banco das tabelas.
USE GiGa_GYM;

-- Permite executar novamente este bloco sem erro de trigger existente.
DROP TRIGGER IF EXISTS trg_item_bi_validar_estoque;
DROP TRIGGER IF EXISTS trg_item_ai_atualizar_estoque_total;
DROP TRIGGER IF EXISTS trg_item_bu_validar_alteracao;
DROP TRIGGER IF EXISTS trg_item_au_reajustar_estoque_total;
DROP TRIGGER IF EXISTS trg_item_ad_estornar_estoque_total;

DELIMITER $$

-- 1. Valida os dados e verifica se existe estoque antes da venda.

CREATE TRIGGER trg_item_bi_validar_estoque
BEFORE INSERT ON tb_item_produto
FOR EACH ROW
BEGIN
    DECLARE v_estoque INT DEFAULT NULL;
    DECLARE v_encontrado BOOLEAN DEFAULT TRUE;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_encontrado = FALSE;

    -- A quantidade deve ser um número inteiro maior que zero.
    IF NEW.quantidade IS NULL
       OR NEW.quantidade <= 0
       OR NEW.quantidade <> FLOOR(NEW.quantidade) THEN

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'Quantidade deve ser um numero inteiro maior que zero.';
    END IF;

    -- O preço unitário não pode ser nulo ou negativo.
    IF NEW.preco_unico IS NULL
       OR NEW.preco_unico < 0 THEN

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'Preco unitario nao pode ser nulo ou negativo.';
    END IF;

    -- Consulta o estoque do produto e bloqueia sua linha.
    SELECT qnt_estoque
      INTO v_estoque
      FROM tb_produto
     WHERE id_produto = NEW.id_produto
     FOR UPDATE;

    -- Impede a venda se o produto não existir ou não tiver estoque informado.
    IF v_encontrado = FALSE OR v_estoque IS NULL THEN

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'Produto inexistente ou estoque nao informado.';
    END IF;

    -- Impede a venda de uma quantidade maior que o estoque disponível.
    IF v_estoque < NEW.quantidade THEN

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'Estoque insuficiente para a quantidade solicitada.';
    END IF;

END$$


-- 2. Dá baixa no estoque e atualiza o total após inserir um item.

CREATE TRIGGER trg_item_ai_atualizar_estoque_total
AFTER INSERT ON tb_item_produto
FOR EACH ROW
BEGIN

    -- Diminui do estoque a quantidade de produtos vendidos.
    UPDATE tb_produto
       SET qnt_estoque = qnt_estoque - NEW.quantidade
     WHERE id_produto = NEW.id_produto;

    -- Soma os valores dos itens para atualizar o total da venda.
    UPDATE tb_venda
       SET total = (
           SELECT COALESCE(
               SUM(ip.preco_unico * ip.quantidade), 0
           )
             FROM tb_item_produto AS ip
            WHERE ip.id_venda = NEW.id_venda
       )
     WHERE id_venda = NEW.id_venda;

END$$


-- 3. Valida as alterações e verifica o estoque do produto informado.

CREATE TRIGGER trg_item_bu_validar_alteracao
BEFORE UPDATE ON tb_item_produto
FOR EACH ROW
BEGIN
    DECLARE v_estoque_novo INT DEFAULT NULL;
    DECLARE v_encontrado BOOLEAN DEFAULT TRUE;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_encontrado = FALSE;

    -- A nova quantidade deve ser um número inteiro maior que zero.
    IF NEW.quantidade IS NULL
       OR NEW.quantidade <= 0
       OR NEW.quantidade <> FLOOR(NEW.quantidade) THEN

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'A quantidade deve ser um numero inteiro maior que zero.';
    END IF;

    -- O novo preço não pode ser nulo ou negativo.
    IF NEW.preco_unico IS NULL
       OR NEW.preco_unico < 0 THEN

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'O preco unitario nao pode ser nulo ou negativo.';
    END IF;

    -- Verifica se o produto continua sendo o mesmo.
    IF NEW.id_produto <=> OLD.id_produto THEN

        -- Consulta o estoque atual do produto.
        SELECT qnt_estoque
          INTO v_estoque_novo
          FROM tb_produto
         WHERE id_produto = NEW.id_produto
         FOR UPDATE;

        -- Impede a alteração se o produto não for encontrado.
        IF v_encontrado = FALSE
           OR v_estoque_novo IS NULL THEN

            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT =
                'Produto nao encontrado ou estoque nao informado.';
        END IF;

        -- Considera a quantidade antiga antes de validar a nova.
        IF (v_estoque_novo + OLD.quantidade)
            < NEW.quantidade THEN

            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT =
                'Estoque insuficiente para aumentar a quantidade.';
        END IF;

    ELSE

        -- Se o produto mudou, consulta o estoque do novo produto.
        SET v_encontrado = TRUE;
        SET v_estoque_novo = NULL;

        SELECT qnt_estoque
          INTO v_estoque_novo
          FROM tb_produto
         WHERE id_produto = NEW.id_produto
         FOR UPDATE;

        -- Impede a alteração se o novo produto não existir.
        IF v_encontrado = FALSE
           OR v_estoque_novo IS NULL THEN

            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT =
                'Novo produto inexistente ou estoque nao informado.';
        END IF;

        -- Verifica se o novo produto possui estoque suficiente.
        IF v_estoque_novo < NEW.quantidade THEN

            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT =
                'Estoque insuficiente para o novo produto.';
        END IF;

    END IF;

END$$


-- 4. Ajusta o estoque e atualiza os totais após alterar um item.

CREATE TRIGGER trg_item_au_reajustar_estoque_total
AFTER UPDATE ON tb_item_produto
FOR EACH ROW
BEGIN

    -- Verifica se o produto do item continua sendo o mesmo.
    IF NEW.id_produto <=> OLD.id_produto THEN

        -- Atualiza o estoque considerando a diferença de quantidade.
        UPDATE tb_produto
           SET qnt_estoque =
               qnt_estoque + OLD.quantidade - NEW.quantidade
         WHERE id_produto = NEW.id_produto;

    ELSE

        -- Devolve ao estoque as unidades do produto anterior.
        UPDATE tb_produto
           SET qnt_estoque =
               qnt_estoque + OLD.quantidade
         WHERE id_produto = OLD.id_produto;

        -- Dá baixa nas unidades do novo produto.
        UPDATE tb_produto
           SET qnt_estoque =
               qnt_estoque - NEW.quantidade
         WHERE id_produto = NEW.id_produto;

    END IF;

    -- Recalcula o total da venda à qual o item pertencia.
    UPDATE tb_venda
       SET total = (
           SELECT COALESCE(
               SUM(ip.preco_unico * ip.quantidade), 0
           )
             FROM tb_item_produto AS ip
            WHERE ip.id_venda = OLD.id_venda
       )
     WHERE id_venda = OLD.id_venda;

    -- Atualiza também o total da nova venda, se houver transferência.
    IF NOT (NEW.id_venda <=> OLD.id_venda) THEN

        UPDATE tb_venda
           SET total = (
               SELECT COALESCE(
                   SUM(ip.preco_unico * ip.quantidade), 0
               )
                 FROM tb_item_produto AS ip
                WHERE ip.id_venda = NEW.id_venda
           )
         WHERE id_venda = NEW.id_venda;

    END IF;

END$$


-- 5. Devolve os produtos ao estoque e atualiza o total após excluir um item.

CREATE TRIGGER trg_item_ad_estornar_estoque_total
AFTER DELETE ON tb_item_produto
FOR EACH ROW
BEGIN

    -- Devolve ao estoque a quantidade do produto excluído.
    UPDATE tb_produto
       SET qnt_estoque =
           qnt_estoque + OLD.quantidade
     WHERE id_produto = OLD.id_produto;

    -- Recalcula o total da venda sem o item excluído.
    UPDATE tb_venda
       SET total = (
           SELECT COALESCE(
               SUM(ip.preco_unico * ip.quantidade), 0
           )
             FROM tb_item_produto AS ip
            WHERE ip.id_venda = OLD.id_venda
       )
     WHERE id_venda = OLD.id_venda;

END$$

DELIMITER ;


-- Mostra os cinco triggers cadastrados no banco.
SHOW TRIGGERS FROM GiGa_GYM;

-- Exibe os produtos e suas quantidades disponíveis em estoque.
SELECT
    id_produto,
    nomePR,
    qnt_estoque
FROM tb_produto
ORDER BY id_produto;

-- Exibe as vendas e seus respectivos valores totais.
SELECT
    id_venda,
    data_venda,
    total
FROM tb_venda
ORDER BY id_venda;

-- Compara o total registrado com a soma dos itens de cada venda.
SELECT
    v.id_venda,
    v.total AS total_atual,
    COALESCE(
        SUM(ip.preco_unico * ip.quantidade), 0
    ) AS total_calculado
FROM tb_venda AS v
LEFT JOIN tb_item_produto AS ip
    ON ip.id_venda = v.id_venda
GROUP BY
    v.id_venda,
    v.total
ORDER BY v.id_venda;