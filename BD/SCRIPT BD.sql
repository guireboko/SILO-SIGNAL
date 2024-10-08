create database silosignal;

use silosignal;

create table empresa (
	idEmpresa int primary key auto_increment,
    nome varchar(45),
    cnpj char(14),
    cep char(9),
    cidade varchar(45),
    numero char(11)
    );

INSERT INTO empresa (nome, cnpj, cep, cidade, numero) VALUES
('SPTech Soja', '14523544265001', '1414001', 'São Paulo', '11974093996'),
('Soja Forte LTDA', '13478900251001', '1356000', 'Campinas', '1932324455'),
('SiloMax Armazenagem', '24578300987001', '1404003', 'Ribeirão Preto', '1623429874'),
('Soja Brás Comércio', '14528234495001', '1423004', 'Araraquara', '1633445566');

CREATE TABLE usuario (
    idusuario INT PRIMARY KEY AUTO_INCREMENT,
    fkResponsavel INT,
    fkEmpresa INT,
    nome VARCHAR(45), 
    cargo VARCHAR(45),
    whatsapp CHAR(11),
    telComercial CHAR(13),
    email VARCHAR(45),
    CONSTRAINT fk_usuario_responsavel
        FOREIGN KEY (fkResponsavel) REFERENCES usuario(idusuario),
	CONSTRAINT fk_empresa
    FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

INSERT INTO usuario VALUES
(DEFAULT, 1, 1, 'Claudio Frizzarini', 'Gerente de Silo', '11973458648', '11365478236', 'claudio.frizzarini@sptech.school'),
(DEFAULT, 1, 1, 'Lucas Oliveira', 'Assistente de Silo', '11987654321', '11998765432', 'lucas.oliveira@sptech.school'),
(DEFAULT, 3, 2, 'Felipe Santos', 'Operador de Silo', '1133998877', '11987659876', 'felipe.santos@sojaforte.com'),
(DEFAULT, 3, 2, 'Juliana Costa', 'Coordenadora de Armazenagem', '1133556677', '11987555678', 'juliana.costa@sojaforte.com'),
(DEFAULT, 5, 3, 'Paulo Henrique', 'Gerente de Operações', '1144556688', '11998877654', 'paulo.henrique@silomax.com'),
(DEFAULT, 5, 3, 'Renata Almeida', 'Técnica de Manutenção', '1144332255', '11987653456', 'renata.almeida@silomax.com'),
(DEFAULT, 7, 4, 'José Pereira', 'Engenheiro de Produção', '1144772233', '11987651234', 'jose.pereira@agrosilva.com');

ALTER TABLE empresa ADD COLUMN fkResponsavel INT;

ALTER TABLE empresa ADD CONSTRAINT fkResponsavelEmpresa 
FOREIGN KEY (fkResponsavel) REFERENCES usuario(fkResponsavel);

UPDATE empresa SET fkResponsavel = 1
WHERE idEmpresa = 1;

UPDATE empresa SET fkResponsavel = 3
WHERE idEmpresa = 2;

UPDATE empresa SET fkResponsavel = 5
WHERE idEmpresa = 3;

UPDATE empresa SET fkResponsavel = 7
WHERE idEmpresa = 4;

create table silo (
	idSilo int primary key auto_increment,
    qtdAtual decimal (9, 2),
    capacidadeMaxima decimal (9, 2),
    responsavelVistoria varchar(45),
    dtUltimaVistoria date, 
    fk_empresa int,
    constraint fkEmpresaResponsavelSilo
		foreign key (fk_empresa) references empresa(idEmpresa) 
);

INSERT INTO silo VALUES
(DEFAULT, '1500', '3000', 'Guilherme de Azevedo', '2024-06-09', 1),
(DEFAULT, '1200', '2500', 'Shirley Ferreira', '2024-05-15', 1),
(DEFAULT, '1400', '3200', 'Cleber Machado', '2024-04-20', 2),
(DEFAULT, '1300', '2900', 'Beatriz Santos', '2024-07-01', 2),
(DEFAULT, '1500', '3500', 'Rodrigo Souza', '2024-03-10', 3),
(DEFAULT, '1600', '3100', 'Larissa Oliveira', '2024-08-22', 3),
(DEFAULT, '1700', '3300', 'Marcos Lima', '2024-02-28', 4),
(DEFAULT, '1800', '3700', 'Ana Paula Costa', '2024-01-14', 4);

create table sensores (
	idSensores int primary key auto_increment,
    dtImplementacao date,
    dtUltimaManutencao date,
    responsavelManutencao varchar(45),
    porcentagemDetec dec (4, 2),
    instanteDetec datetime,
    perigoBandeira varchar(8),
    constraint ckhBandeira check (perigoBandeira in('Verde', 'Amarela', 'Vermelha')),
    fk_silo int, 
    constraint fkSiloSensor 
		foreign key (fk_silo) references silo(idSilo)
);

INSERT INTO sensores VALUES
(DEFAULT, '2023-12-22', '2024-02-04', 'Guilherme Antonio', '0.12', '2024-02-04 14:25:33', 'Amarela', 1),
(DEFAULT, '2023-12-22', '2024-02-05', 'Mariana Silva', '0.15', '2024-02-05 10:30:45', 'Vermelha', 1),
(DEFAULT, '2023-12-23', '2024-02-06', 'Lucas Oliveira', '0.20', '2024-02-06 08:20:10', 'Vermelha', 2),
(DEFAULT, '2023-12-24', '2024-02-07', 'Felipe Santos', '0.30', '2024-02-07 09:15:25', 'Verde', 3),
(DEFAULT, '2023-12-25', '2024-02-08', 'Juliana Costa', '0.80', '2024-02-08 12:40:00', 'Verde', 3),
(DEFAULT, '2023-12-26', '2024-02-09', 'Paulo Henrique', '0.13', '2024-02-09 11:05:33', 'Amarela', 4),
(DEFAULT, '2023-12-27', '2024-02-10', 'Renata Almeida', '0.60', '2024-02-10 13:25:47', 'Verde', 5),
(DEFAULT, '2023-12-28', '2024-02-11', 'José Pereira', '0.12', '2024-02-11 14:50:55', 'Amarela', 6),
(DEFAULT, '2023-12-29', '2024-02-12', 'Camila Rocha', '0.20', '2024-02-12 16:10:12', 'Verde', 6),
(DEFAULT, '2023-12-30', '2024-02-13', 'Fernando Almeida', '0.28', '2024-02-13 17:35:27', 'Vermelha', 7),
(DEFAULT, '2023-12-31', '2024-02-14', 'Beatriz Santos', '0.10', '2024-02-14 18:45:18', 'Verde', 8),
(DEFAULT, '2023-12-31', '2024-02-15', 'Rodrigo Souza', '0.14', '2024-02-15 19:55:45', 'Amarela', 8);
