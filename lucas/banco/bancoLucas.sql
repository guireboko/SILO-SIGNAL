-- Criação da base de dados do projeto

create database SilosSignal;

use SilosSignal;
-- Criação da tabela de usuarios(empresas)

create table usuarios
(
id int primary key auto_increment,
nome varchar(50),
cnpj varchar(18),
email varchar(30),
senha varchar(60),
estado char(2),
constraint chckEstado check(estado in (
'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 
'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 
'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 
'RO', 'RR', 'SC', 'SE', 'SP', 'TO'))
);

-- Criação da tabela de silos responsável pelo mapeamento dos silos registrados no nosso sistema

create table silos
(
id int primary key auto_increment,
cnpjEmpresa varchar(18),
capacidade float(6,2)
);

-- Criação da tabela de historico de detecção de gás
create table historicoGas
(
cnpj varchar(18),
porcentagem varchar(6),
instanteDetectado varchar(13),
idSilo int primary key auto_increment,
perigo varchar(6),
constraint chckPerigo check(perigo in ('ALTO', 'BAIXO'))
);

-- Inserção de dados nas tabelas

insert into usuarios (nome,cnpj, email, senha, estado) values
('AgroLove', '12.443.257/0001-05', 'agrolove@gmail.com', 'agro123', 'SP'),
('Agrenco' , '12.505.741/0001-03', 'agranco@gmail.com', 'agrenco123', 'MG'),
('Cotrim', '64.035.252/0001-39', 'cotrim@gmail.com', 'cotrim123', 'ES'),
('Syngenta', '64.337.227/0001-00', 'syngenta@gmail.com', 'syngenta098', 'SP'),
('Monsanto', '81.977.065/0001-93', 'monsanto@gmail.com', 'monsanto897', 'CE');	

insert into silos (cnpjEmpresa, capacidade) values
('12.443.257/0001-05', 1000.00),
('12.505.741/0001-03', 800.00),
('64.035.252/0001-39', 1000.00),
('64.337.227/0001,-00', 600.00),
('81.977.065/0001-93', 1000.00),
('81.977.065/0001-93', 800.00);


insert into historicoGas (cnpj, horario, perigo) values
('12.443.257/0001-05','200m³' ,'2022-02-10: 14:30', 'ALTO'),
('12.505.741/0001-03','50m³','2024-10-08: 20:20', 'BAIXO'),
('64.035.252/0001-39','250m³' ,'2021-03-26: 10:30', 'ALTO'),
('64.337.227/0001-00','300m³','2024-08-09: 14:50', 'ALTO'),
('81.977.065/0001-93', '50m³','2023-01-01: 00:00',, 'BAIXO');																																																																							

-- Consulta de dados

select * from usuarios where estado = 'SP';

select * from silos where capacidade = 1000.00;

select * from silos where cnpjEmpresa = '81.977.065/0001-93';

select * from historicoGas where cnpj = '81.977.065/0001-93' and perigo = 'ALTO';

select * from historicoGas where idSilo = 1;

select * from historicoGas where perigo = 'ALTO';