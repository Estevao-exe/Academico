
CREATE TABLE tb_paises (
    codigoP INT PRIMARY KEY,
    nomeP VARCHAR(100) NOT NULL
);

CREATE TABLE tb_equipes (
    sigla VARCHAR(10) PRIMARY KEY,
    nomeE VARCHAR(100) NOT NULL,
    cod_pais INT,
    FOREIGN KEY (cod_pais) REFERENCES tb_paises(codigoP)
);

CREATE TABLE tb_pilotos (
    numero INT PRIMARY KEY,
    nomePI VARCHAR(100) NOT NULL,
    cod_pais INT,
    sigla_equipe VARCHAR(10),
    salario DECIMAL(10,2), -- JA CRIADO AQUI PRA RESOLVER A QUESTAO 8
    FOREIGN KEY (cod_pais) REFERENCES tb_paises(codigoP),
    FOREIGN KEY (sigla_equipe) REFERENCES tb_equipes(sigla)
);

CREATE TABLE tb_corridas (
    sigla_gp VARCHAR(10) PRIMARY KEY,
    nome_gp VARCHAR(100) NOT NULL,
    cod_pais INT,
    qtd_voltas INT,
    FOREIGN KEY (cod_pais) REFERENCES tb_paises(codigoP)
);

CREATE TABLE tb_participantes (
    sigla_gp VARCHAR(10),
    num_piloto INT,
    posicao_largada INT,
    PRIMARY KEY (sigla_gp, num_piloto),
    FOREIGN KEY (sigla_gp) REFERENCES tb_corridas(sigla_gp),
    FOREIGN KEY (num_piloto) REFERENCES tb_pilotos(numero)
);

-- 2. POPULE TODAS AS TABELAS

INSERT INTO tb_paises (codigoP, nomeP) VALUES
(55, 'Brasil'),
(64, 'Italia'),
(67, 'Franca'),
(45, 'Inglaterra'),
(13, 'Holanda'),
(49, 'Alemanha'),
(81, 'Japao'),
(1, 'Estados Unidos');

INSERT INTO tb_equipes (sigla, nomeE, cod_pais) VALUES
('RDR', 'Red Bull Racing', 13),
('GDR', 'Guarana Driver Racing', 55),
('MCL', 'Mclaren', 45),
('FER', 'Ferrari', 64),
('WIL', 'Wilians', 67),
('MER', 'Mercedes', 49);

-- 1. 5 DO BRASIL, 3 DA ITALIA, 2 DA FRANCA - OBRIGATORIO
-- BRASIL = codigo 55
-- ITALIA = codigo 64
-- FRANCA = codigo 67

INSERT INTO tb_pilotos (numero, nomePI, cod_pais, sigla_equipe, salario) VALUES
-- 5 DO BRASIL
(1, 'Gabriel Bortoleto', 55, 'GDR', 95000.00),
(16, 'Jair Bolsonaro', 55, 'GDR', 70000.00),
(8, 'Enzo Fittipaldi', 55, 'GDR', 82000.00),
(27, 'Felipe Drugovich', 55, 'GDR', 110000.00),
(33, 'Pietro Fittipaldi', 55, 'GDR', 68000.00),
-- 3 DA ITALIA
(13, 'Gomersindo Oliveira Pinto', 64, 'FER', 80000.00),
(55, 'Carlo Ancelot', 64, 'FER', 85000.00),
(12, 'Antonio Giovinazzi', 64, 'FER', 78000.00),
-- 2 DA FRANCA
(81, 'Jailson Mendes', 67, 'WIL', 65000.00),
(21, 'Lomaine Ylamao', 67, 'WIL', 75000.00),
-- EXTRAS
(44, 'Adalberto Ferreira Junior', 13, 'RDR', 120000.00),
(4, 'Fred Merculis', 49, 'MER', 100000.00);

INSERT INTO tb_corridas (sigla_gp, nome_gp, cod_pais, qtd_voltas) VALUES
('BRA', 'GP do Brasil', 55, 71),
('ITA', 'GP da Italia', 64, 53),
('FRA', 'GP da Franca', 67, 53),
('*****', 'GP do Japao', 81, 53);

INSERT INTO tb_participantes (sigla_gp, num_piloto, posicao_largada) VALUES
('BRA', 1, 1),
('BRA', 16, 2),
('BRA', 13, 3),
('BRA', 44, 4),
('ITA', 55, 1),
('ITA', 12, 2),
('ITA', 8, 3),
('FRA', 81, 1),
('FRA', 21, 2);


-- 3. Liste o nome dos países que começam com a letra B e terminam com a letra L.
SELECT nomeP as 'Pais'
FROM tb_paises 
WHERE nomeP LIKE 'B%L';

-- 4. Liste o nome dos pilotos que são dos países BRASIL, ITÁLIA e FRANÇA
SELECT nomePI as 'Pilotos'
FROM tb_pilotos WHERE cod_pais IN (55, 64, 67);

-- 5. Liste o nome dos pilotos.
SELECT nomePI as 'Pilotos'
FROM tb_pilotos;

-- 6. Liste o nome dos gp e a quantidade de voltas (use ALIAS)
SELECT nome_gp AS 'Grande Premio', qtd_voltas AS 'Voltas' 
FROM tb_corridas;

-- 7. Liste o nome dos pilotos e seus países
SELECT pi.nomePI AS 'Pilotos', pa.nomeP AS 'Pais'
FROM tb_pilotos pi
JOIN tb_paises pa ON pi.cod_pais = pa.codigoP;

-- 8. Insira o atributo salário na tabela piloto. (JA FEITO NO CREATE, mas se precisar fazer separado:)
-- ALTER TABLE tb_pilotos ADD COLUMN salario DECIMAL(10,2);

-- 9. Popule o atributo salário da tabela piloto. (JA FEITO NO INSERT ACIMA)

-- 10. Liste o nome dos pilotos cujos salários sejam entre 70 e 100 mil.
SELECT nomePI as 'Pilotos', salario as 'Salario' 
FROM tb_pilotos 
WHERE salario BETWEEN 70000 AND 100000;

-- 11. Retorne para cada cod_pais, a média salarial dos empregados.
SELECT cod_pais as 'Pais', AVG(salario) AS 'Media Salarial' 
FROM tb_pilotos 
GROUP BY cod_pais;

-- 11 com nome do país
SELECT pa.nomeP AS 'Pais', AVG(pi.salario) AS 'Media Salarial'
FROM tb_pilotos pi
JOIN tb_paises pa ON pi.cod_pais = pa.codigoP
GROUP BY pa.nomeP, pi.cod_pais;

-- 12. Exiba todos os diferentes valores dos salários contidos na tabela pilotos ordenados em ordem crescente de valor.
SELECT DISTINCT salario 
FROM tb_pilotos 
ORDER BY salario ASC;