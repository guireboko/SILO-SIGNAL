TABELAS BANCO DE DADOS 
ENTREGAVEIS DE P.I 
GUILHERME REBOUÇAS FERREIRA 
01242053 -- PRIMEIRA: 
create database SilosSignal; 
use SilosSignal; 
create table cadastrados 
( 
id int primary key auto_increment, 
nome varchar(30), 
cnpj varchar(30), 
email varchar(30), 
senha varchar(30), 
estado char(2), 
constraint chckEstado check(estado in ( 
'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF',  
'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA',  
'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS',  
'RO', 'RR', 'SC', 'SE', 'SP', 'TO')) 
); 
insert into cadastrados (nome, cnpj, email, senha, estado) values 
('AgroSense', '12.573.257/0001-05', 'agrosense@gmail.com', 'senseagro2024', 'MG'), 
('Soya' , '12.992.741/0001-03', 'soyal@gmail.com', 'soyasensor1224', 'SC'), 
('Montim', '64.418.252/0001-39', 'montim@gmail.com', '123Montim', 'GO'), 
('SuperSoja', '64.892.227/0001-00', 'supersoya@gmail.com', 'supersoja098', 'PI'), 
('Valle', '81.124.065/0001-93', 'vallesense@gmail.com', 'vallesense97', 'DF');  
select * from cadastrados where estado = 'SC'; 
select * from cadastrados where nome like '%e'; 
drop table cadastrados; -- SEGUNDA 
create table valorSilos 
( 
id int primary key auto_increment, 
cnpj varchar(18), 
precoSilo float(8,2) 
); 
insert into valorSilos (cnpj, precoSilo) values 
('59.526.253/0001-46', 400000.00), 
('59.741.753/0001-09', 500000.00), 
('36.061.838/0001-32', 200000.00), 
('22.276.721/0001-61', 300000.00), 
('56.504.949/0001-83', 500000.00), 
('67.336.478/0001-68', 600000.00); 
select * from valorSilos where precoSilo = 600000.00; 
select * from valorSilos where cnpj like '5%'; 
drop table valorSilos; -- TERCEIRA 
create table gas 
( 
cnpj varchar(18), 
concentracao varchar(20), 
horario varchar(20), 
silo int primary key auto_increment, 
alerta varchar(8), 
constraint chckAlerta check(alerta in ('ESTAVEL', 'INSTAVEL')) 
); 
insert into gas (cnpj, concentracao, horario, alerta) values 
('70.631.103/0001-35','200m³' ,'2008-10-17: 14:30', 'INSTAVEL'), 
('53.230.507/0001-06','80m³','2017-02-24: 20:20', 'ESTAVEL'), 
('88.628.255/0001-44','210m³' ,'2000-06-30: 10:30', 'INSTAVEL'), 
('21.742.518/0001-70','360³','1993-01-06: 14:50', 'INSTAVEL'), 
('74.450.594/0001-79', '90m³','1987-01-09: 00:00', 'ESTAVEL'); 
select * from gas where silo = 3; 
select * from gas where alerta = 'ESTAVEL'; 
drop table gas; 