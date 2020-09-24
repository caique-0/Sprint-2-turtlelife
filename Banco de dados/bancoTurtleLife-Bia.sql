create database bdturtleLife;
use bdturtleLife;

create table tbPessoaf (
idPessoaf int primary key auto_increment,
nome varchar(60),
email varchar(100),
senha varchar(30),
telefone int,
idade int,
cpf varchar(11)
);

insert into tbPessoaf (nome, email, senha, telefone, idade, cpf)
	values	('Laís Tejon','lais.aranega@bandtec.com.br', 'tatasLa',12345678, 19,'8462651982'),
			('Caique Rodrigues','caique.rodrigues@bandtec.com.br', 'caique5434', 23456789, 21, '893527500'),
			('Thaís Calazans','thais.sousa@bandtec.com.br', 'thamavis', 32433445, 19, '8765437691'), 
			('Kelipe Mazurkieviz','felipe.mazurkieviz@bandtec.com.br', 'felipe123', 13579246 , 19, '8763245169'), 
			('Beatriz Campos','beatriz.santos@bandtec.com.br', 'beabea1211', 37481935 , 19, '6754359862'), 
			('Karla Moncayo','karla.moncayo@bandtec.com.br', 'kamoncayo123', 93748104, 26, '765384952'),
			('André Santos','andre.santos@bandtec.com.br', 'andre40028922', 92750164, 18,  '7828328687'),
			('Christian Raines','christian.almeida@bandtec.com.br','christian almeida', 83926013, 20, '97864209');
                      					
create table tbPessoaJ (
idPessoaJ int primary key auto_increment,
nome varchar(60),
email varchar(100),
senha varchar(30),
telefone int,
idade int,
cnpj varchar(20)
);

create table periodoIncubacao (
idCiclo int primary key,
descPeriodo varchar(30),
primeiroD varchar(30),
primeiroT varchar(30),
segundoD varchar(30), 
segundoT varchar (30), 
terceiroD varchar(30),
terceiroT varchar(30)
);

insert into periodoIncubacao (idCiclo, descPeriodo, primeiroD, primeiroT, segundoD, segundoT, terceiroD, terceiroT)
	values	(1,'macho','20 dias','24°','20 dias','24°até 26°','até 20 dias','temperatura ambiente'),
			(2,'femea','20 dias','31°','20 dias','31° até 33°','até 20 dias','temperatura ambiente');

create table cliente (
idCliente int primary key auto_increment,
numPedido int,
nomeCliente varchar(40),
sexoPreferencia varchar(40),
idCiclo int,
constraint fk_cliente_periodoIncubacao  FOREIGN KEY (idCiclo) REFERENCES periodoIncubacao (idCiclo)
 );
 
insert into cliente (idCliente,numPedido,nomeCliente,sexoPreferencia,idCiclo)
	values	(110, '01', 'Projeto tamar', 'macho', 1),
			(111, '02', 'projeto tamar','femea', 2); 
            
create table incubacao(
idIncubacao int primary key auto_increment,
descIncubacao varchar(40),
matriz varchar(20),
nOvos int,
dataInicio varchar(20),
dataLimite varchar(20),
idCliente int,
constraint fk_incubacao_cliente FOREIGN KEY (idCliente) REFERENCES cliente (idCliente), 
idCiclo int,
constraint fk_incubacao_periodoIncubacao FOREIGN KEY (idCiclo) REFERENCES periodoIncubacao (idCiclo)
);

insert into incubacao (descIncubacao, matriz, nOvos, dataInicio, dataLimite, idCliente, idCiclo) 
		values ('1º incubação de 2020','amélia',120,'24/07/2020','22/09/2020',110,2),
				('2º incubação de 2020', 'luara',120, '24/07/2020','22/09/2020',111,1);