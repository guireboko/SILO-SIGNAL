CREATE DATABASE siloSignal;
USE siloSignal;

CREATE TABLE cadastroClientes (
id_cadastro INT PRIMARY KEY AUTO_INCREMENT,
nome_empresa VARCHAR(40) NOT NULL,
representante_empresa VARCHAR(70),
cnpj VARCHAR(14) NOT NULL,
email VARCHAR(40) NOT NULL,
telefone VARCHAR(15),
uf CHAR(2) NOT NULL,
municipio VARCHAR(40),
senha VARCHAR(30) NOT NULL
);

INSERT INTO cadastroClientes VALUES
(DEFAULT, 'Amaggi', 'Eduardo Campos', '01234567000123', 'contato@amaggi.com.br', '(65) 3119-3600', 'MT', 'Sorriso', '#5041'),
(DEFAULT, 'SLC Agrícola', 'Juliana Pereira', '02345678000134', 'contato@slcagricola.com.br', '(54) 3345-1141', 'RS', 'Santana do Livramento', '@432378'),
(DEFAULT, 'Grupo Bom Futuro', 'Rodrigo Ferreira', '03456789000145', 'contato@bomfuturo.com.br', '(66) 3178-2452', 'MT', 'Lucas do Rio Verde', '902356@'),
(DEFAULT, 'AgroSB', 'Paula Ribeiro', '04567890000156', 'contato@agrosb.com.br', '(19) 3047-3214', 'SP', 'Campinas', '12Agrosb#'),
(DEFAULT, 'Cerrado Agro', 'Felipe Santos', '05678901000167', 'contato@cerradoagro.com.br', '(62) 3656-2198', 'GO', 'Aparecida de Goiânia', '08cerrado*'),
(DEFAULT, 'Vanguarda Agro', 'Carla Martins', '06789012000178', 'contato@vanguardaagro.com.br', '(68) 3567-3241', 'AC', 'Rio Branco', '34781223');

SELECT * FROM cadastroClientes;

SELECT nome_empresa, cnpj FROM cadastroClientes;

SELECT * FROM cadastroClientes
	WHERE uf = 'MT';


CREATE TABLE dados(
id_dados INT PRIMARY KEY AUTO_INCREMENT,
dados_dia FLOAT(3,1),
data_hora DATETIME,
status_ VARCHAR(15) CONSTRAINT chk_status
	CHECK(status_ IN('estável','risco baixo','risco alto', 'risco altíssimo'))
);

INSERT INTO dados (dados_dia, data_hora, status_) VALUES
(0.5, '2024-03-01 09:00:00', 'estável'),
(2.9, '2024-03-02 13:00:00', 'estável'),
(5.1, '2024-03-03 13:00:00', 'risco baixo'),
(6, '2024-03-07 17:00:00', 'risco baixo'),
(6.3, '2024-03-04 21:00:00', 'risco baixo'),
(8.3, '2024-03-09 08:00:00', 'risco alto'),
(9, '2024-03-05 14:00:00', 'risco alto'),
(13, '2024-03-06 14:00:00', 'risco altíssimo'),
(15, '2024-03-08 11:00:00', 'risco altíssimo'),
(3.0, '2024-03-10 15:00:00', 'estável');

SELECT * FROM dados;

SELECT dados_dia, data_hora FROM dados
	WHERE status_ = 'estável';
    
SELECT * FROM dados
	WHERE dados_dia >= 6.5;
    
    
CREATE TABLE silos (
id_silos INT PRIMARY KEY AUTO_INCREMENT,
nome_empresa VARCHAR(40) NOT NULL,
tipo_silo VARCHAR(10) CONSTRAINT chk_tipo_silo
	CHECK(tipo_silo IN('metálico', 'concreto')),
quantidade_de_silo INT,
capacidade_silo1 INT,
capacidade_silo2 INT,
capacidade_silo3 INT,
capacidade_silo4 INT,
capacidade_silo5 INT,
capacidade_silo6 INT
);

INSERT INTO silos (nome_empresa, tipo_silo, quantidade_de_silo, capacidade_silo1, capacidade_silo2, capacidade_silo3, capacidade_silo4, capacidade_silo5, capacidade_silo6) VALUES
('Amaggi', 'metálico', 6, 45000, 42000, 38000, 38000, 20000, 13300),
('SLC Agrícola', 'concreto', 4, 20000, 20000, 20000, 5000, NULL, NULL),
('Grupo Bom Futuro', 'metálico', 5, 55000, 53300, 53000, 19000, 6000, NULL),
('AgroSB', 'concreto', 3, 24000, 18000, 18000, NULL, NULL, NULL),
('Cerrado Agro', 'metálico', 2, 40000, 40000, NULL, NULL, NULL, NULL),
('Vanguarda Agro', 'concreto', 5, 50000, 42500, 30000, 30000, 9000, NULL);

SELECT * FROM silos;

SELECT nome_empresa, id_silos FROM silos
	WHERE quantidade_de_silo > 3;
    
SELECT * FROM silos
	WHERE tipo_silo = 'metálico';