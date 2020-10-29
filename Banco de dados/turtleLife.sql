create database turtleLife;
use turtleLife;
                                         					
create table cadastro (
idcadastro int primary key auto_increment,
nomeEmpresa varchar(45),
email varchar(45),
telefone char(10),
endereco varchar(60),
senha varchar(45),
tipoEmpresa varchar(45),
cnpj char(14)
);

insert into dados (nomeEmpresa, email, telefone, endereco, senha, tipoEmpresa, cnpj) values 
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
fk_idcadastro int, 
foreign key (fk_idcadastro) references cadastro (idcadastro)

);
    
create table Ciclo (
idCiclo int primary key,
descricao varchar(40),
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

create table pedido (
idPedido int primary key auto_increment,
fk_idcadastro int,
foreign key ( fk_idcadastro)  REFERENCES cadastro (idCadastro),
fk_idciclo int, 
foreign key ( fk_idciclo)  REFERENCES ciclo (idCiclo)
);

insert into pedido  (fk_idcadastro,fk_idciclo) values
	(1,1),
	(2,2); 

create table sensor(
 idsensor int primary key auto_increment,
 incubadora varchar (40)
 );
 
insert into sensor (incubadora) value('001m');
											
create table incubacao(
idIncubacao int primary key auto_increment,
matriz varchar(20),
nOvos int,
dataInicio date,
dataLimite date,
fk_idpedido int, FOREIGN KEY (fk_idpedido) REFERENCES pedido (idpedido),
fk_idsensor int, FOREIGN KEY (fk_idsensor) REFERENCES sensor (idsensor)
);

insert into incubacao (descIncubacao, matriz, nOvos, dataInicio, dataLimite, numPedido, idCiclo) 
values 
                             ('amélia',120,'2020-04-10','2020-10-06',1,2),
							 ('luara',120, '2020-04-10','2020-10-06',2,1);
                             
create table leitura_dados(
idleitura int primary key auto_increment,
temperatura float,
data_horario datetime,
fk_idsensor	int, FOREIGN KEY (fk_idsensor) REFERENCES sensor (idsensor)
);