CREATE DATABASE SiloSignal;

USE SiloSignal;

CREATE TABLE cadastro (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(30),
    email varchar(60),
    senha VARCHAR(20),
    dataInscricao DATE,
    nomeEmpresa VARCHAR(50),
    cnpj VARCHAR(18),
    qtdSilo INT
);

CREATE TABLE silosUsuarios (
	idSilo INT PRIMARY KEY AUTO_INCREMENT,
    capacidade INT, -- em toneladas
    tipoSilo VARCHAR(8),
		CONSTRAINT chkTipoSilo
        CHECK (tipoSilo in('Concreto','Metal')),
    dataInsercao DATE,
    nomeEmpresa VARCHAR(50), -- mesmo da tabela cadastro
    cnpj VARCHAR(18) -- mesmo da tabela cadastro
);

CREATE TABLE dadosCaptados (
	idDado INT PRIMARY KEY AUTO_INCREMENT,
    horaCaptura DATETIME , -- DATE COM HORA
    porcentagemGas INT,
    nomeEmpresa VARCHAR(50)
);

INSERT INTO cadastro (usuario, email, senha, dataInscricao, nomeEmpresa, cnpj, qtdSilo) VALUES
	('SoyProductions', 'admin@SProd.com', 'S0IPro1268ns', '2024-09-04', 'Soy Productions LTDA', '59.031.211/0001-34', '12'),
	('AgroTech', 'info@agrotech.com.br', 'AgriT2024!', '2024-09-06', 'AgroTech Ltda', '12.345.678/0001-56', '6'),
    ('GrainMaster', 'support@grainmasters.com', 'GrainM7890$', '2024-09-07', 'Grain Masters Ltda', '34.567.890/0001-23', '3'),
    ('Harvesters', 'admin@harvesters.com', 'Hrvst2024!', '2024-09-08', 'Harvesters Inc.', '56.789.012/0001-34', '9'),
    ('SeedPower', 'contact@seedpower.com', 'SeedP2024@', '2024-09-09', 'Seed Power LTDA', '78.901.234/0001-45', '16');

INSERT INTO silosUsuarios (capacidade, tipoSilo, dataInsercao, nomeEmpresa, cnpj) VALUES
	(30000, 'Metal', '2024-09-04', 'Soy Productions LTDA', '59.031.211/0001-34'),
	(35000, 'Metal', '2024-09-04', 'Soy Productions LTDA', '59.031.211/0001-34'),
    (25000, 'Metal', '2024-09-04', 'Soy Productions LTDA', '59.031.211/0001-34'),
    (2000, 'Concreto', '2024-09-06', 'AgroTech Ltda', '12.345.678/0001-56'),
    (1000, 'Concreto', '2024-09-06', 'AgroTech Ltda', '12.345.678/0001-56');

INSERT INTO dadosCaptados (horaCaptura, porcentagemGas, nomeEmpresa) VALUES
	('2024-09-05 14:30:00', '2', 'Soy Productions LTDA'),
    ('2024-09-05 14:30:00', '2.5', 'Soy Productions LTDA'),
    ('2024-09-05 14:30:00', '2.9', 'Soy Productions LTDA'),
    ('2024-09-07 14:30:00', '12', 'AgroTech Ltda'),
    ('2024-09-07 14:30:00', '14', 'AgroTech Ltda');
    
SELECT * FROM cadastro;

SELECT nomeEmpresa as 'Empresa', dataInscricao as 'Data Inscrição', qtdSilo as 'Quantidade de Silos' FROM cadastro
	WHERE dataInscricao > '2024-09-03' AND qtdSilo > 10;

SELECT capacidade, tipoSilo FROM silosUsuarios
	WHERE cnpj = '12.345.678/0001-56';
    
SELECT horaCaptura, porcentagemGas FROM dadosCaptados
	WHERE nomeEmpresa = 'Soy Productions LTDA';
    