
-- EXERCÍCIO PROCEDIMENTO/FUNCTION
-- 1) Testar função soma de 2 números
-- 2) Gerar o Procedimento para verPreco do livro
-- 3) Criar uma função que calcule o aumento do livro em 10%

-- CREATE DATABASE db_bibliotecas;
-- USE db_bibliotecas;

CREATE TABLE livro (
    codlivro INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(45) NOT NULL,
    PRIMARY KEY (codlivro)
);

INSERT INTO livro (titulo)
VALUES ('Red Queen'), ('PJO'), ('Anomalous');

CREATE TABLE autor (
    mat INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY (mat)
);

INSERT INTO autor (nome)
VALUES ('Victoria'), ('Rick Riordan'), ('Daniele');

CREATE TABLE autor_livro (
    codlivro INT NOT NULL,
    mat INT NOT NULL,
    FOREIGN KEY (codlivro) REFERENCES livro(codlivro),
    FOREIGN KEY (mat) REFERENCES autor(mat)
);

INSERT INTO autor_livro (codlivro, mat)
VALUES (1, 1), (2, 2), (3, 3);

-- CONSULTA 1: Ver todos os livros
SELECT * FROM livro;

-- CONSULTA 2: Ver todos os autores
SELECT * FROM autor;

-- CONSULTA 3: Ver os livros e seus autores usando JOIN
SELECT livro.titulo as 'Titulo', autor.nome as 'Autor'
FROM livro
JOIN autor_livro
    ON livro.codlivro = autor_livro.codlivro
JOIN autor
    ON autor_livro.mat = autor.mat;

-- CONSULTA 4: Relacionar as tabelas usando WHERE
SELECT livro.titulo as 'Titulo', autor.nome as 'Autor'
FROM livro, autor_livro, autor
WHERE livro.codlivro = autor_livro.codlivro
AND autor_livro.mat = autor.mat;

-- CONSULTA 5: Consulta usando subconsulta
SELECT livro.titulo as 'Titulo', autor.nome as 'Autor'
FROM livro, autor
WHERE livro.codlivro IN (
    SELECT autor_livro.codlivro
    FROM autor_livro
    WHERE autor_livro.mat = autor.mat
);

-- Somar 2 números
DELIMITER $$

CREATE FUNCTION soma(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a + b;
END $$

DELIMITER ;

-- TESTE 1: Testar a função soma
SELECT soma(10, 20) AS resultado;

-- TESTE 2: Somar outros números
SELECT soma(50, 30) AS resultado;

-- Adicionar coluna preço
ALTER TABLE livro
ADD COLUMN preco DECIMAL(10,2) NOT NULL DEFAULT 0.00;

-- Atualizar preços dos livros
UPDATE livro SET preco = 100.00 WHERE codlivro = 1;
UPDATE livro SET preco = 150.00 WHERE codlivro = 2;
UPDATE livro SET preco = 80.00 WHERE codlivro = 3;

-- CONSULTA 6: Ver todos os livros e seus preços
SELECT * FROM livro;

-- CONSULTA 7: Ver somente título e preço
SELECT titulo, preco
FROM livro;

-- Ver Preço
DELIMITER $$

CREATE PROCEDURE verPreco(IN p_codlivro INT)
BEGIN
    SELECT titulo, preco
    FROM livro
    WHERE codlivro = p_codlivro;
END $$

DELIMITER ;

-- TESTE 3: Ver preço do livro de código 1
CALL verPreco(1);

-- TESTE 4: Ver preço do livro de código 2
CALL verPreco(2);

-- TESTE 5: Ver preço do livro de código 3
CALL verPreco(3);

-- Adicionar 10% ao preço
DELIMITER $$

CREATE FUNCTION aumentoLivro(preco DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN preco * 1.10;
END $$

DELIMITER ;

-- TESTE 6: Mostrar preço com aumento de 10%
SELECT titulo as 'Titulo', preco as 'Preço',
aumentoLivro(preco) AS 'Preço com Aumento'
FROM livro;

-- CONSULTA 8: Mostrar somente livros com preço acima de 90
SELECT titulo as 'Titulo', preco as 'Preço'
FROM livro
WHERE preco > 90;

-- CONSULTA 9: Mostrar livros em ordem crescente de preço
SELECT titulo as 'Titulo', preco as 'Preço'
FROM livro
ORDER BY preco ASC;

-- CONSULTA 10: Mostrar o maior preço
SELECT MAX(preco) AS 'Maior Preco'
FROM livro;

-- CONSULTA 11: Mostrar o menor preço
SELECT MIN(preco) AS 'Menor Preco'
FROM livro;

-- CONSULTA 12: Mostrar a média dos preços
SELECT AVG(preco) AS 'Media Precos'
FROM livro;
