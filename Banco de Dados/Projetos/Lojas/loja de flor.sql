CREATE DATABASE IF NOT EXISTS loja_bigger_flowers;
USE loja_bigger_flowers;

CREATE TABLE Produto (
idProduto INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
estoque INT NOT NULL DEFAULT 0
);

CREATE TABLE ItensVenda (
idItem INT AUTO_INCREMENT PRIMARY KEY,
idProduto INT NOT NULL,
quantidade INT NOT NULL,
FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

INSERT INTO Produto (idProduto, nome, preco, estoque) VALUES
(1, 'Notebook', 3500.00, 10),
(2, 'Mouse', 80.00, 20),
(3, 'Teclado', 150.00, 15);

DROP TRIGGER IF EXISTS trg_atualizar_estoque;

DELIMITER $$
CREATE TRIGGER trg_atualizar_estoque
BEFORE INSERT ON ItensVenda
FOR EACH ROW

BEGIN
IF NEW.quantidade <= 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Quantidade invalida';
END IF;

UPDATE Produto
SET estoque = estoque - NEW.quantidade
WHERE idProduto = NEW.idProduto
AND estoque >= NEW.quantidade;

IF ROW_COUNT() = 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Estoque insuficiente';
END IF;
END $$
DELIMITER ;

Select *
From produto;

-- Venda permitida: mouse (20 unidades iniciais)
INSERT INTO ItensVenda (idProduto, quantidade)
VALUES (2, 8);

INSERT INTO ItensVenda (idProduto, quantidade)
VALUES (1, 7);

INSERT INTO ItensVenda (idProduto, quantidade)
VALUES (3, 12);

-- Venda rejeitada: teclado tem apenas 15 unidades
INSERT INTO ItensVenda (idProduto, quantidade)
VALUES (3, 50);

INSERT INTO ItensVenda (idProduto, quantidade)
VALUES (3, -20);

SELECT idProduto, nome, estoque
FROM Produto;