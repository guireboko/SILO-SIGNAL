-- CRIAÇÃO DA BASE DE DADOS DO PROJETO
CREATE DATABASE SilosSignal;

USE SilosSignal;

-- CRIAÇÃO DA TABELA DE USUÁRIOS (EMPRESAS)
CREATE TABLE empresas
(
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cnpj VARCHAR(18),
    email VARCHAR(30),
    senha VARCHAR(60),
    estado CHAR(2),
    CONSTRAINT chckEstado CHECK(estado IN (
        'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 
        'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SE', 'SP', 'TO'))
);

CREATE TABLE usuariosEmpresa
(
    idUsuarioEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    senha VARCHAR(30),
    nomeEmpresa VARCHAR(60)
);

-- CRIAÇÃO DA TABELA DE SILOS RESPONSÁVEL PELO MAPEAMENTO DOS SILOS REGISTRADOS NO NOSSO SISTEMA
CREATE TABLE silos
(
    idSilo INT PRIMARY KEY AUTO_INCREMENT,
    capacidadeMaxima INT,
    capacidadeArmazenada INT
);

-- CRIAÇÃO DA TABELA DE HISTÓRICO DE DETECÇÃO DE GÁS
CREATE TABLE historicoGas
(
    idHistoricoGas INT PRIMARY KEY AUTO_INCREMENT,
    porcentagem INT,
    instanteDetectado DATETIME,
    perigo VARCHAR(6),
    CONSTRAINT chckPerigo CHECK(perigo IN ('ALTO', 'MEDIO','BAIXO'))
);

-- INSERÇÃO DE DADOS NAS TABELAS
INSERT INTO empresas (nome, cnpj, email, senha, estado) VALUES
    ('AgroLove', '12.443.257/0001-05', 'agrolove@gmail.com', 'agro123', 'SP'),
    ('Agrenco', '12.505.741/0001-03', 'agranco@gmail.com', 'agrenco123', 'MG'),
    ('Cotrim', '64.035.252/0001-39', 'cotrim@gmail.com', 'cotrim123', 'ES'),
    ('Syngenta', '64.337.227/0001-00', 'syngenta@gmail.com', 'syngenta098', 'MT'),
    ('Monsanto', '81.977.065/0001-93', 'monsanto@gmail.com', 'monsanto897', 'CE');

INSERT INTO usuariosEmpresa (email, senha, nomeEmpresa) VALUES
("lucas@gmail.com", "123", "Agrenco"),
("fabiam@gmail.com", "fabiam2001", "Syngenta"),
("guilherme@outlook.com", "reboucas009", "Monsanto"),
("danilo@hotmail.com", "0912901", "Agrenco"),
("pedro@gmail.com", "1290129012", "AgroLove");


INSERT INTO silos (capacidadeMaxima,  capacidadeArmazenada) VALUES
    (1000, 800),
    (4000, 800),
    (3000, 1000),
    (1200, 600),
    (7400, 1000),
    (2600, 800);

INSERT INTO historicoGas (porcentagem, instanteDetectado,perigo) VALUES
    (20, '2022-02-10 14:30', 'ALTO'),
    (2, '2024-10-08 20:20', 'BAIXO'),
    (11, '2021-03-26 10:30', 'MEDIO'),
    (22, '2024-08-09 14:50', 'ALTO'),
    (5, '2023-01-01 00:00', 'BAIXO');

-- CONSULTA DE DADOS
SELECT CONCAT('Empresas parceiras localizadas em Mato Grosso: ', nome, ' ', cnpj) AS informacao FROM empresas WHERE estado = 'MT';

SELECT nome FROM usuariosEmpresa WHERE nomeEmpresa = "Cotrim"; 
    
SELECT nomeEmpresa FROM usuariosEmpresa WHERE nome LIKE "&Lucas&";

SELECT * FROM silos WHERE capacidadeMaxima = 1000;

SELECT * FROM silos where capacidadeArmazenada > 500;

SELECT * FROM historicoGas WHERE porcentagem = 10;

SELECT * FROM historicoGas WHERE perigo != 'BAIXO';
