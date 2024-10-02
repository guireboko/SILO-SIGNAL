create database agro;

use agro;

create table silosignal(
idSensor int primary key auto_increment,
dtRegistro date,
hora time,
silo varchar(20),
gas varchar(20),
valorDeSaida int,
porcentagem float(4,2)
);

create table cadastro(
idCadastro int primary key auto_increment,
nome varchar (45),
email varchar (45),
cnpj char (14),
cpf char (11),
fazenda varchar(30),
endereço varchar (50),
qtdsilos int
);

create table silos(
idSilo int primary key auto_increment,
nomeSilo varchar(30),
TipoSilo varchar(20) constraint chktipo
check (tiposilo in ('concreto', 'metal')),
grao varchar(20),
capacidade int,
fazenda varchar(30),
dtUltimaLimpeza date
);

insert into silosignal (dtRegistro, hora, silo, gas, valorDeSaida, porcentagem) values
('2024-08-01', '08:30:00', 'Silo A', 'CH4', 450, 85.50),
('2024-08-02', '09:15:00', 'Silo B', 'C3H8', 300, 60.75),
('2024-08-03', '10:00:00', 'Silo C', 'C2H4', 550, 92.30),
('2024-08-04', '11:45:00', 'Silo A', 'CH4', 480, 88.20),
('2024-08-05', '12:30:00', 'Silo B', 'C3H8', 320, 65.40);

insert into cadastro (nome, email, cnpj, cpf, fazenda, endereço, qtdsilos) values
('José da Silva', 'jose.silva@email.com', '12345678000195', '12345678901', 'Fazenda Santa Maria', 'Estrada Rural 123, SP', 3),
('Maria Oliveira', 'maria.oliveira@email.com', '23456789000186', '23456789012', 'Fazenda Boa Vista', 'Rodovia 456, MG', 5),
('Carlos Santos', 'carlos.santos@email.com', '34567890000177', '34567890123', 'Fazenda Esperança', 'Estrada Vicinal 789, PR', 2),
('Ana Pereira', 'ana.pereira@email.com', '45678901000168', '45678901234', 'Fazenda Nova Era', 'Rodovia BR-101, RJ', 4),
('João Souza', 'joao.souza@email.com', '56789012000159', '56789012345', 'Fazenda Bela Vista', 'Estrada Municipal 321, RS', 6);

insert into silos (nomeSilo, TipoSilo, grao, capacidade, fazenda, dtultimalimpeza) values
('Silo A', 'concreto', 'Soja', 20000, 'Fazenda Santa Maria', '2024-07-15'),
('Silo B', 'metal', 'Milho', 15000, 'Fazenda Boa Vista', '2024-06-30'),
('Silo C', 'concreto', 'Trigo', 18000, 'Fazenda Esperança', '2024-07-20'),
('Silo D', 'metal', 'Soja', 22000, 'Fazenda Nova Era', '2024-08-05'),
('Silo E', 'concreto', 'Milho', 25000, 'Fazenda Bela Vista', '2024-07-10');


