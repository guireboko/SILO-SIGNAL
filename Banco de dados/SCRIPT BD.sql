CREATE DATABASE silosignal;

USE silosignal;

CREATE TABLE empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeFantasia VARCHAR(45),
    cnpj CHAR(14),
    email VARCHAR(45),
    cep CHAR(9),
    cidade VARCHAR(45),
    numEnd CHAR(5),
    telComercial CHAR(11)
);

INSERT INTO empresa (nomeFantasia, cnpj, email, cep, cidade, numEnd, telComercial) VALUES
('SPTech Soja', '14523544265001', 'sptechsoja@gmail.com', '1414001', 'São Paulo', '1030', '11974093996'),
('Soja Forte LTDA', '13478900251001', 'sojaforte@gmail.com', '1356000', 'Campinas', '533', '1932324455'),
('SiloMax Armazenagem', '24578300987001', 'silomax@gmail.com', '1404003', 'Ribeirão Preto', '97', '1623429874'),
('Soja Brás Comércio', '14528234495001', 'sojabras@gmail.com', '1423004', 'Araraquara', '223', '1633445566');

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fk_supervisor INT,
    fk_empresa INT,
    nome VARCHAR(45),
    cargo VARCHAR(45),
    telPessoal CHAR(11),
    telComercial CHAR(10),
    email VARCHAR(45),
    senha VARCHAR(45),
    CONSTRAINT fkUsuarioSupervisor FOREIGN KEY (fk_supervisor)
        REFERENCES usuario (idUsuario),
    CONSTRAINT fkEmpresa FOREIGN KEY (fk_empresa)
        REFERENCES empresa (idEmpresa)
);

INSERT INTO usuario VALUES
(DEFAULT, 1, 1, 'Claudio Frizzarini', 'Gerente de Silo', '11973458648', '11365478236', 'claudio.frizzarini@sptech.school' , md5('Frizza2024@')),
(DEFAULT, 1, 1, 'Lucas Oliveira', 'Assistente de Silo', '11987654321', '11998765432', 'lucas.oliveira@sptech.school', md5('OlivSPTech21')),
(DEFAULT, 3, 2, 'Felipe Santos', 'Operador de Silo', '1133998877', '11987659876', 'felipe.santos@sojaforte.com', md5('Paralelepipedo@2022')),
(DEFAULT, 3, 2, 'Juliana Costa', 'Coordenadora de Armazenagem', '1133556677', '11987555678', 'juliana.costa@sojaforte.com', md5('JUERtu265_')),
(DEFAULT, 5, 3, 'Paulo Henrique', 'Gerente de Operações', '1144556688', '11998877654', 'paulo.henrique@silomax.com', md5('MCR_2008')),
(DEFAULT, 5, 3, 'Renata Almeida', 'Técnica de Manutenção', '1144332255', '11987653456', 'renata.almeida@silomax.com', md5('Abcde1234@')),
(DEFAULT, 7, 4, 'José Pereira', 'Engenheiro de Produção', '1144772233', '11987651234', 'jose.pereira@agrosilva.com', md5('Pereira2102@'));

ALTER TABLE empresa ADD COLUMN fk_responsavel INT;

ALTER TABLE empresa ADD CONSTRAINT fkResponsavelEmpresa 
FOREIGN KEY (fk_responsavel) REFERENCES usuario(idUsuario);

UPDATE empresa SET fk_responsavel = 1
WHERE idEmpresa = 1;

UPDATE empresa SET fk_responsavel = 3
WHERE idEmpresa = 2;

UPDATE empresa SET fk_responsavel = 5
WHERE idEmpresa = 3;

UPDATE empresa SET fk_responsavel = 7
WHERE idEmpresa = 4;

CREATE TABLE silo (
    idSilo INT PRIMARY KEY AUTO_INCREMENT,
    statusFuncionamento VARCHAR(45),
    qtdAtual DECIMAL(9 , 2 ),
    capacidadeMaxima DECIMAL(9 , 2 ),
    fk_empresa INT,
    CONSTRAINT fkEmpresaResponsavelSilo FOREIGN KEY (fk_empresa)
        REFERENCES empresa (idEmpresa),
	CONSTRAINT chkFuncionamentoSilo 
		CHECK (statusFuncionamento IN ('Ativo','Inativo'))
);

INSERT INTO silo VALUES
(DEFAULT, 'Ativo', '1500', '3000', 1),
(DEFAULT, 'Ativo', '1200', '2500', 1),
(DEFAULT, 'Ativo', '1400', '3200', 2),
(DEFAULT, 'Ativo', '1300', '2900', 2),
(DEFAULT, 'Ativo', '1500', '3500', 3),
(DEFAULT, 'Ativo', '1600', '3100', 3),
(DEFAULT, 'Inativo', '1700', '3300', 4),
(DEFAULT, 'Ativo', '1800', '3700', 4);

CREATE TABLE sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    dtImplementacao DATE,
    porcentagemDetec DECIMAL(4 , 2 ),
    instanteDetec DATETIME,
    perigoBandeira VARCHAR(8),
    dispararAlerta CHAR(3),
    statusFuncionamento VARCHAR(45),
    dtUltimaManutencao DATE,
    fk_silo INT,
    CONSTRAINT ckhBandeira 
		CHECK (perigoBandeira IN ('Verde' , 'Amarela', 'Vermelha')),
    CONSTRAINT ckhAlerta 
		CHECK (dispararAlerta IN ('Sim' , 'Não')),
	CONSTRAINT chkFuncionamentoSensor 
		CHECK (statusFuncionamento IN ('Ativo','Inativo')),
    CONSTRAINT fkSiloSensor FOREIGN KEY (fk_silo)
        REFERENCES silo (idSilo)
);

INSERT INTO sensores VALUES
(DEFAULT, '2023-12-22', '5.12', '2024-02-04 14:25:33', 'Amarela', 'Sim', 'Ativo', '2024-05-13', 1),
(DEFAULT, '2023-12-22', '4.15', '2024-02-05 10:30:45', 'Verde', 'Não', 'Ativo', '2024-05-13', 1),
(DEFAULT, '2023-12-23', '11.20', '2024-02-06 08:20:10', 'Vermelha', 'Sim', 'Ativo', '2023-12-23', 2),
(DEFAULT, '2023-12-24', '1.30', '2024-02-07 09:15:25', 'Verde', 'Não', 'Ativo', '2023-12-24', 3),
(DEFAULT, '2023-12-25', '0.00', '2024-02-08 12:40:00', 'Verde', 'Não', 'Inativo', '2023-12-25', 3),
(DEFAULT, '2023-12-26', '6.13', '2024-02-09 11:05:33', 'Amarela', 'Sim', 'Ativo', '2024-09-22', 4),
(DEFAULT, '2023-12-27', '0.60', '2024-02-10 13:25:47', 'Verde', 'Não', 'Ativo', '2024-03-24', 5),
(DEFAULT, '2023-12-28', '1.12', '2024-02-11 14:50:55', 'Verde', 'Não', 'Ativo', '2024-01-12', 6),
(DEFAULT, '2023-12-29', '0.20', '2024-02-12 16:10:12', 'Verde', 'Não', 'Ativo', '2024-01-12', 6),
(DEFAULT, '2023-12-30', '0.00', '2024-01-13 17:35:27', 'Verde', 'Não', 'Inativo', '2023-12-30', 7),
(DEFAULT, '2023-12-31', '4.10', '2024-02-14 18:45:18', 'Verde', 'Não', 'Ativo', '2024-07-10', 8),
(DEFAULT, '2023-12-31', '6.14', '2024-02-15 19:55:45', 'Amarela', 'Sim', 'Ativo', '2024-07-10', 8);

-- ideias de select:
-- select com empresa, usuário, silos da empresa, sensor do silo e bandeiras  
select e.nome as 'Nome da empresa', e.cnpj as 'CNPJ',
u.nome as 'Usuários da Empresa', u.email as 'E-mail',
silo.idSilo as 'Indentificador Silo',
sensor.idSensores as 'Indentificador Sensor', sensor.perigoBandeira as 'Bandeira de Perigosidade'
from usuario as u
join empresa as e		
on e.idEmpresa = u.fkEmpresa	-- esse select não funciona adequadamente devido a modelagem que optamos fazer, tem duas opções: mudar a modelagem pra ficar certinho ou desistir desse mesmo	
join silo 
on silo.fk_empresa = e.idEmpresa
join sensores as sensor
on sensor.fk_silo = silo.idSilo 
where fk_empresa = 1 order by u.nome;

-- select com só empresa do frizza, sensores, ultima detecção, %gas, bandeira
