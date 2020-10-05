create database turtleLife;
use turtleLife;
                                         					
create table dadosPj (
idDadosPj int primary key auto_increment,
nomeEmpresa varchar(50),
emailPj varchar(100),
telefonePj int,
enderecoPj varchar(60),
senhaPj varchar(50),
tipoEmpresa varchar(60),
cnpj int(40)
);

insert into dadosPJ (nomeEmpresa, emailPJ, telefonePJ, enderecoPJ, senhaPJ, tipoEmpresa, cnpj) values 
	('Tejon','lais.aranega@bandtec.com.br', 12345678, 'Rua 1', 'tartaruga1234', 'Pesca', '8462651982'),
	('Rodrigues','caique.rodrigues@bandtec.com.br', 23456789, 'Rua 2', 'ursinhoted', 'Ambiental', '893527500'),
	('Calazans','thais.sousa@bandtec.com.br', 34567890, 'Rua 3', 'mavis', 'Pesca', '8765437691'), 
	('Mallasen','felipe.mazurkieviz@bandtec.com.br', 13579246 , 'Rua 4', 'fut4526', 'Ambiental', '8763245169'), 
	('Santos','beatriz.santos@bandtec.com.br', 37481935 , 'Rua 5', 'barbie123', 'Pesca', '6754359862'), 
	('Moncayo','karla.moncayo@bandtec.com.br', 93748104, 'Rua 6', 'flor45', 'Ambiental', '765384952'),
	('Dedé','andre.santos@bandtec.com.br', 92750164, 'Rua 7', 'basquete65', 'Pesca', '7828328687'),
	('Almeida','christian.almeida@bandtec.com.br', 83926013, 'Rua 8', 'skat67', 'Ambiental', '97864209');

create table pagamentos (
idPagamentos int primary key auto_increment,
dataReferencia date,
formaPagamento varchar(10),
numCartao int,
nomeCartao varchar(50),
cpfCartao varchar(11),
cnpjCartao varchar(40),
validadeCartao date,
cvcCartao int,
constraint fk_pagamentos_dadosPj foreign key (idDadosPj) references dadosPj (idDadosPj),
idDadosPj int
);
    
create table periodoInc (
idCiclo int primary key,
descPeriodo varchar(40),
primeiroP_dias varchar(40),
primeioroP_temp float,
segundoP_dias varchar(40), 
segundoP_temp float, 
terceiroP_dias varchar(40),
terceiroP_temp float
);

insert into periodoInc values 
	(1,'macho','20 dias','24°','20 dias','24°até 26°','até 20 dias','temperatura ambiente'),
	(2,'femea','20 dias','31°','20 dias','31° até 33°','até 20 dias','temperatura ambiente');

create table cliente (
numPedido int primary key auto_increment,
idCliente int,
nomeCliente varchar(40),
sensores varchar(20), 
sexoPreferencia char(1),
constraint fk_cliente_periodoInc  FOREIGN KEY (idCiclo) REFERENCES periodoInc (idCiclo),
idCiclo int
 );
 
insert into cliente (idCliente,nomeCliente,sexoPreferencia,idCiclo) values
	(111, 'Projeto tamar','Sensor 1', 'macho', 1),
	(111, 'projeto tamar','Sensor 2', 'femea', 2); 


create table incubacao(
idIncubacao int primary key auto_increment,
descIncubacao varchar(40),
matriz varchar(20),
nOvos int,
dataInicio date,
dataLimite date,
constraint fk_incubacao_periodoInc FOREIGN KEY (idCiclo) REFERENCES periodoInc (idCiclo),
constraint fk_incubacao_cliente FOREIGN KEY (numPedido) REFERENCES cliente (numPedido),
numPedido int,
idCiclo int 
);

insert into incubacao (descIncubacao, matriz, nOvos, dataInicio, dataLimite, numPedido, idCiclo) 
values 
                             ('1º incubação de 2020','amélia',120,'24/07/2020','22/09/2020',1,2),
							 ('2º incubação de 2020', 'luara',120, '24/07/2020','22/09/2020',2,1);