create database silosignal;

use silosignal;

CREATE TABLE usuario (
    idusuario INT PRIMARY KEY AUTO_INCREMENT,
    fkResponsavel INT,
    fkEmpresa INT, -- precisa colocar a foreign key depois quw a tabela empresa for criada,
    nome VARCHAR(45), -- então terá que colocar em um alter table
    cargo VARCHAR(45),
    whatsapp CHAR(11),
    telComercial CHAR(13),
    email VARCHAR(45),
    CONSTRAINT fk_usuario_responsavel
        FOREIGN KEY (fkResponsavel) REFERENCES usuario(idusuario)
);

create table empresa (
	idEmpresa int primary key auto_increment,
    nome varchar(45),
    cnpj char(14),
    cep char(9),
    cidade varchar(45),
    numero char(8),
    fk_responsavel int,
    constraint fkResposavelEmpresa 
		foreign key (fk_responsavel) references usuario(idusuario)
);

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

create table sensores (
	idSensores int primary key auto_increment,
    dtImplementacao date,
    dtUltimaManutencao date,
    responsavelManutencao varchar(45),
    porcentagemDetec float (3, 1),
    instanteDetec datetime,
    perigoBandeira varchar(8),
    constraint ckhBandeira check (perigoBandeira in('Verde', 'Amarela', 'Vermelha')),
    fk_silo int, 
    constraint fkSiloSensor 
		foreign key (fk_silo) references silo(idSilo)
);