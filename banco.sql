-- CRIAÇÃO DA BASE DE DADOS DO PROJETO
CREATE DATABASE SilosSignal;

USE SilosSignal;

-- CRIAÇÃO DA TABELA DE USUÁRIOS (EMPRESAS)
CREATE TABLE empresas
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cnpj VARCHAR(18),
    email VARCHAR(30),
    senha VARCHAR(60),
    estado CHAR(2),
    CONSTRAINT chckEstado CHECK(estado IN (
        'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 
        'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SE', 'SP', 'TO'))
);

-- CRIAÇÃO DA TABELA DE SILOS RESPONSÁVEL PELO MAPEAMENTO DOS SILOS REGISTRADOS NO NOSSO SISTEMA
CREATE TABLE silos
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    cnpjEmpresa VARCHAR(18),
    capacidade INT
);

-- CRIAÇÃO DA TABELA DE HISTÓRICO DE DETECÇÃO DE GÁS
CREATE TABLE historicoGas
(
    cnpj VARCHAR(18),
    porcentagem INT,
    instanteDetectado DATETIME,
    idSilo INT PRIMARY KEY AUTO_INCREMENT,
    perigo VARCHAR(6),
    CONSTRAINT chckPerigo CHECK(perigo IN ('ALTO', 'BAIXO'))
);

-- INSERÇÃO DE DADOS NAS TABELAS
INSERT INTO empresas (nome, cnpj, email, senha, estado) VALUES
    ('AgroLove', '12.443.257/0001-05', 'agrolove@gmail.com', 'agro123', 'SP'),
    ('Agrenco', '12.505.741/0001-03', 'agranco@gmail.com', 'agrenco123', 'MG'),
    ('Cotrim', '64.035.252/0001-39', 'cotrim@gmail.com', 'cotrim123', 'ES'),
    ('Syngenta', '64.337.227/0001-00', 'syngenta@gmail.com', 'syngenta098', 'SP'),
    ('Monsanto', '81.977.065/0001-93', 'monsanto@gmail.com', 'monsanto897', 'CE');

INSERT INTO silos (cnpjEmpresa, capacidade) VALUES
    ('12.443.257/0001-05', 1000),
    ('12.505.741/0001-03', 800),
    ('64.035.252/0001-39', 1000),
    ('64.337.227/0001-00', 600),
    ('81.977.065/0001-93', 1000),
    ('81.977.065/0001-93', 800);

INSERT INTO historicoGas (cnpj, porcentagem, instanteDetectado, perigo) VALUES
    ('12.443.257/0001-05', 20, '2022-02-10 14:30', 'ALTO'),
    ('12.505.741/0001-03', 2, '2024-10-08 20:20', 'BAIXO'),
    ('64.035.252/0001-39', 22, '2021-03-26 10:30', 'ALTO'),
    ('64.337.227/0001-00', 20, '2024-08-09 14:50', 'ALTO'),
    ('81.977.065/0001-93', 5, '2023-01-01 00:00', 'BAIXO');

-- CONSULTA DE DADOS
SELECT * FROM empresas WHERE estado = 'SP';

SELECT * FROM silos WHERE capacidade = 1000;

SELECT * FROM silos WHERE cnpjEmpresa = '81.977.065/0001-93';

SELECT * FROM historicoGas WHERE cnpj = '81.977.065/0001-93' AND perigo = 'ALTO';

SELECT * FROM historicoGas WHERE idSilo = 1;

SELECT * FROM historicoGas WHERE perigo = 'ALTO';
