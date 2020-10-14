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
cnpj varchar(20)
);

insert into dadosPJ (nomeEmpresa, emailPJ, telefonePJ, enderecoPJ, senhaPJ, tipoEmpresa, cnpj) values 
	('Tejon','lais.aranega@bandtec.com.br', 12345678, 'Rua 1', 'tartaruga1234', 'Pesca', '8462651982'),
	('Rodrigues','caique.rodrigues@bandtec.com.br', 23456789, 'Rua 2', 'ursinhoted', 'Ambiental', '893527500'),
	('Amancio','leonardo.asilva@bandtec.com.br', 34567890, 'Rua 3', 'tec1234', 'Pesca', '8765437691'), 
	('Fabiano','jose.csilva@bandtec.com.br', 40405859 , 'Rua 4', 'fut4526', 'Ambiental', '8763245169'), 
	('Herrera','rafael.herrera@bandtec.com.br', 37481935 , 'Rua 5', 'rafa123', 'Pesca', '6754359862'), 
	('Felix','lucas.felix@bandtec.com.br', 93748104, 'Rua 6', 'osda1070', 'Ambiental', '765384952');
	

create table pagamentos (
idPagamentos int primary key auto_increment,
dataReferencia date,
formaPagamento varchar(10),
numCartao int,
nomeCartao varchar(50),
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
terceiroP_temp varchar(40)
);

insert into periodoInc values 
	(1,'macho','20 dias', 24,'20 dias',24,'até 20 dias','temperatura ambiente'),
	(2,'femea','20 dias', 31 ,'20 dias',31,'até 20 dias','temperatura ambiente');

create table cliente (
numPedido int primary key auto_increment,
idCliente int,
nomeCliente varchar(40),
sexoPreferencia varchar(10),
constraint fk_cliente_periodoInc  FOREIGN KEY (idCiclo) REFERENCES periodoInc (idCiclo),
idCiclo int
 );

insert into cliente (idCliente,nomeCliente,sexoPreferencia,idCiclo) values
	(111, 'Projeto tamar','macho', 1),
	(111, 'projeto tamar','femea', 2); 


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
                             ('1º incubação de 2020','amélia',120,'2020-04-10','2020-10-06',1,2),
							 ('2º incubação de 2020', 'luara',120, '2020-04-10','2020-10-06',2,1);
                             
                             
 create table sensor(
 idsensor int primary key auto_increment,
 temperatura float,
 constraint Fk_sensor_incubacao FOREIGN KEy (idIncubacao) REFERENCES incubacao (idIncubacao),
 idIncubacao int);

insert into sensor (temperatura,idIncubacao) value

                                 (33,1),
								 (24,2); 