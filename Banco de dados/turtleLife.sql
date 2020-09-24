create database turtleLife;
use turtleLife;

create table dadosPf (
idDadosPf int primary key auto_increment,
emailPf varchar(100),
nomePf varchar(50),
telefonePf int,
enderecoPf varchar(60),
senhaPf varchar(50),
idade int,
cpf varchar(40)
);

insert into dadosPf (emailPf, nomePf, telefonePf, enderecoPf, senhaPf, idade, cpf) values 
	('lais.aranega@bandtec.com.br', 'lais tejon', 12345678, 'Rua 1', 'tartaruga1234', 19, '8462651982'),
	('caique.rodrigues@bandtec.com.br', 'caique rodrigues', 23456789, 'Rua 2', 'ursinhoted', 21, '893527500'),
	('thais.sousa@bandtec.com.br', 'thaís calazans', 34567890, 'Rua 3', 'mavis', 19, '8765437691'), 
	('felipe.mazurkieviz@bandtec.com.br', 'felipe mallasen', 13579246 , 'Rua 4', 'fut4526', 21, '8763245169'), 
	('beatriz.santos@bandtec.com.br', 'beatriz santos', 37481935 , 'Rua 5', 'barbie123', 19, '6754359862'), 
	('karla.moncayo@bandtec.com.br', 'karla moncayo', 93748104, 'Rua 6', 'flor45', 26, '765384952'),
	('andre.santos@bandtec.com.br', 'andre santos', 92750164, 'Rua 7', 'basquete65', 18, '7828328687'),
	('christian.almeida@bandtec.com.br','christian almeida', 83926013, 'Rua 8', 'skat67', 20, '97864209');
                      
                     					
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

insert into dadosPj (nomeEmpresa, emailPj, telefonePj, enderecoPj, senhaPj, tipoEmpresa, cnpj) values 
	();

create table pagamentos (
idPagamentos int primary key auto_increment,
dataReferencia varchar(8),
formaPagamento varchar(10),
numCartao int,
nomeCartao varchar(50),
cpfCartao varchar(11),
cnpjCartao varchar(40),
validadeCartao varchar(8),
cvcCartao int,
idDadosPj int,
constraint pk_pagamentos_dadosPj foreign key (idDadosPj) references dadosPj (idDadosPj)
);

    
create table periodoInc (
idCiclo int primary key,
descPeriodo varchar(40),
primeiroP_dias varchar(40),
primeioroP_temp varchar(40),
segundoP_dias varchar(40), 
segundoP_temp varchar (40), 
terceiroP_dias varchar(40),
tercceiroP_temp varchar(40)
);

insert into periodoInc values 
	(1,'macho','20 dias','24°','20 dias','24°até 26°','até 20 dias','temperatura ambiente'),
	(2,'femea','20 dias','31°','20 dias','31° até 33°','até 20 dias','temperatura ambiente');

create table cliente (
numPedido int primary key auto_increment,
idCliente int, 
nomeCliente varchar(40),
sexoPreferencia varchar(40),
idCiclo int,
constraint fk_cliente_periodoInc  FOREIGN KEY (idCiclo) REFERENCES periodoInc (idCiclo)
 );
 
insert into cliente (idCliente,nomeCliente,sexoPreferencia,idCiclo) values
	(111, 'Projeto tamar', 'macho', 1),
	(111, 'projeto tamar','femea', 2); 


create table incubacao(
idIncubacao int primary key auto_increment,
descIncubacao varchar(40),
matriz varchar(20),
nOvos int,
dataInicio varchar(20),
dataLimite varchar(20),
numPedido int,
idCiclo int,
constraint fk_incubacao_periodoInc FOREIGN KEY (idCiclo) REFERENCES periodoInc (idCiclo),
constraint fk_incubacao_cliente FOREIGN KEY (numPedido) REFERENCES cliente (numPedido) 
);

insert into incubacao (descIncubacao, matriz, nOvos, dataInicio, dataLimite, numPedido, idCiclo) 
values 
                             ('1º incubação de 2020','amélia',120,'24/07/2020','22/09/2020',1,2),
							 ('2º incubação de 2020', 'luara',120, '24/07/2020','22/09/2020',2,1);