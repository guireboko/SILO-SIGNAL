 -- Tabela 1
 create database SilosTech;
 use SilosTech;
 
 create table cadastrados (
 id int primary key auto_increment,
 nome varchar (50) not null,
 email varchar (255) not null,
 senha varchar (50) not null,
 cnpj varchar (50) not null,
 estado varchar (50) not null);

insert into cadastrados (nome,email,senha,cnpj,estado) values
('Roberto Abreu', 'RobertoAbreu01@gmail.com', 'Roberto010203', '12.345.678/0001-90', 'São Paulo'),
('Regina Gomes','ReginaGomes02@gmail.com', 'Regina0202**','23.456.789/0001-01','Rio de Janeiro'),
('Elen Fortes', 'ElenFortes007@gmail.com', 'Elen01Fortes', '19.22.998/0001-90', 'São Paulo'),
('Pedro Henrique','PedroHenrique@gmail.com', 'Pedro543**','85.434.123/0343-19','Acre'),
('Ana Carolina', 'AnaCarolina@gmail.com', 'AnaCarolina123**', '12.345.678/0001-23', 'São Paulo'),
('João Paulo', 'JoaoPaulo@gmail.com', 'JoaoPaulo456**', '23.456.789/0001-34', 'Rio de Janeiro'),
('Maria Clara', 'MariaClara@gmail.com', 'MariaClara789**', '34.567.890/0001-45', 'Minas Gerais'),
('Lucas Silva', 'LucasSilva@gmail.com', 'LucasSilva012**', '45.678.901/0001-56', 'Espírito Santo'),
('Beatriz Almeida', 'BeatrizAlmeida@gmail.com', 'BeatrizAlmeida345**', '56.789.012/0001-67', 'Paraná'),
('Carlos Eduardo', 'CarlosEduardo@gmail.com', 'CarlosEduardo678**', '67.890.123/0001-78', 'Santa Catarina'),
('Fernanda Souza', 'FernandaSouza@gmail.com', 'FernandaSouza901**', '78.901.234/0001-89', 'Rio Grande do Sul'),
('Ricardo Lima', 'RicardoLima@gmail.com', 'RicardoLima234**', '89.012.345/0001-90', 'Bahia'),
('Juliana Costa', 'JulianaCosta@gmail.com', 'JulianaCosta567**', '90.123.456/0001-01', 'Pernambuco'),
('Gabriel Oliveira', 'GabrielOliveira@gmail.com', 'GabrielOliveira890**', '01.234.567/0001-12', 'Ceará');

select* from Cadastrados
where estado = 'São Paulo';

select (nome) from Cadastrados
where nome like '%Fortes';

drop table Cadastrados;

-- Tabela 2
create table empresas (
id_empresa int primary key auto_increment,
Nome_empresa varchar (50) not null,
cnpj varchar (50) not null,
telefone varchar (19) not null,
email varchar (30) not null);

insert into empresas (Nome_empresa, cnpj , telefone , email) values 
('Agro Tech','01.234.567/0001-89', '11-96032-2234', 'agrotech@gmail.com'),
('Armazech','21.233.989/0001-89', '11-94092-2234', 'armazech@gmail.com'),
('Cuia tech','01.234.567/0001-89', '11-93913-9123', 'cuiatech@gmail.com'),
('Agro soja','91.112.900/0009-99', '41-92193-9875', 'agrosoja@gmail.com'),
('Sojas silos','11.222.991/0001-89', '11-98182-2112', 'sojassilos@gmail.com');

select (Nome_empresa) from empresas;

select (email) from empresas
where email like 'agro%';

drop table empresas;
-- Tabela 3
create table Sensor_Gás (
cnpj varchar (20) not null,
Estado varchar (20) not null,
Município varchar (25) not null,
Porcentagem_de_Gás varchar (10) not null,
Alerta varchar (10) not null);

alter table Sensor_Gás
add constraint check (alerta in ('Seguro','Inseguro'));

insert into Sensor_Gás values
('01.234.567/0001-89','São Paulo','São Paulo', '28.91%','Inseguro'),
('01.234.567/0001-89','Ceará','Limoeiro do Norte','2.39%','Seguro'),
('09.231.743/0009-23','Rio Grande do Norte','Goianinha', '5.91%','Seguro'),
('04.332.212/0001-23','Acre','Boca do Acre','43.39%','Inseguro'),
('09.435.921/0006-12','Minas Gerais','Unaí', '9.92%','Seguro'),
('03.883.212/0002-99','Amazonas','Manacapuru','34.82%','Inseguro');

select * from Sensor_Gás;