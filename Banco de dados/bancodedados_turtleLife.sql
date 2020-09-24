-- criação de banco de dados turtleLive

create database turtle_life;

use turtle_life; -- selecionei o banco de dados turtle_live

-- criação da tabela de cadastro 
 
 create table cadastro(
id_cadastro int primary key auto_increment,
email varchar (100),
nome varchar  (50),
senha varchar (50),
idade int,
cpf varchar (40)
);

-- inserir dados na tabela cadastro 

insert into cadastro (email,nome,senha,idade,cpf)
 values 
							 ('lais.aranega@bandtec.com.br', 'lais tejon','tartaruga1234', 19,8462651982),
                             ('caique.rodrigues@bandtec.com.br', 'caique rodrigues','ursinhoted',21,893527500),
                             ('thais.sousa@bandtec.com.br', 'thaís calazans', 'mavis', 19,8765437691), 
							 ('felipe.mazurkieviz@bandtec.com.br', 'felipe mallasen', 'fut4526',21,8763245169), 
                             ('beatriz.santos@bandtec.com.br', 'beatriz santos', 'barbie123',19,6754359862), 
                             ('karla.moncayo@bandtec.com.br', 'karla moncayo', 'flor45',26,765384952),
                             ('andre.santos@bandtec.com.br', 'andre santos', 'basquete65',18,7828328687),
							 ('christian.almeida@bandtec.com.br','christian almeida','skat67',20,97864209);

-- exibir tabela cadastro

select * from cadastro;
-- exibir apenas a coluna e-mail
select email from cadastro;
-- exibir apenas coluna nome
select nome from cadastro ;
-- exibir apenas a coluna senha
select senha from cadastro;
-- exibir apenas a coluna idade 
select idade from cadastro;
-- exibir apenas a coluna cpf
select cpf from cadastro;
-- exibir apenas email e senha 
select email, senha from cadastro;

-- criação da tabela periodo

create table periodo(
 id_ciclo int primary key,
descricao varchar(40),
PrimeiroP_dias varchar (40),
PrimeioroP_temp varchar(40),
SegundoP_dias varchar(40), 
SegundoP_temp varchar (40), 
TerceiroP_dias varchar(40),
TercceiroP_temp varchar(40)
);
 
 -- inserir dados na tabela 

insert into periodo values (1,'macho','20 dias','24°','20 dias','24°até 26°','até 20 dias','temperatura ambiente'),
						   (2,'femea','20 dias','31°','20 dias','31° até 33°','até 20 dias','temperatura ambiente');

 -- selecionar todas as colunas da tabela 

select*from periodo;
-- criação da tabela cliente 

create table cliente(
id_pedido int primary key auto_increment,
id_cliente int, 
nome varchar(40),
sexoPreferencia varchar(40),
id_ciclo int,
constraint fk_cliente_periodo  FOREIGN KEY (id_ciclo) REFERENCES periodo (id_ciclo)  -- chave estrangeira para conectar as tabelas 
 );

-- insirir dados na tabela 

insert into cliente (id_cliente,nome,sexoPreferencia,id_ciclo)
values
                         (111, 'Projeto tamar', 'macho', 1),
						 (111, 'projeto tamar','femea', 2); 

 -- selecionar todas as colunas da tabela 
 
 select * from cliente;
 -- selecionar apenas a coluna id_pedido 
 select id_pedido from cliente;
 -- selecionar apenas a coluna id_cliente
select id_cliente from cliente;
-- selecionar apenas a coluna nome
select nome from cliente;
-- selecionar apenas a coluna sexoPreferencia
select sexoPreferencia from cliente; 
-- selecionar apenas a coluna id_ciclo 
select id_ciclo from cliente;

-- criação da tabela incubação 	
				
create table incubacao(
id_incubacao int primary key auto_increment,
descricao varchar (40),
matriz varchar (20),
N_ovos int,
data_inicio varchar (20),
data_limite varchar (20),
id_pedido int,
id_ciclo int,
constraint fk_incubacao_periodo FOREIGN KEY (id_ciclo) REFERENCES periodo (id_ciclo), -- chave estrangeira 
constraint fk_incubacao_pedido FOREIGN KEY (id_pedido) REFERENCES cliente (id_pedido)  -- chave estrangeira 
);

-- inserir dados na tabela 

insert into incubacao (descricao, matriz,N_ovos,data_inicio,data_limite,id_pedido,id_ciclo) 
values 
                             ('1º incubacao de 2020','amélia',120,'24/07/2020','22/09/2020',1,2),
							 ('2º incubacao de 2020', 'luara',120, '24/07/2020','22/09/2020',2,1);

-- selecionar todas as colunas da tabela 

select * from incubacao;
                             