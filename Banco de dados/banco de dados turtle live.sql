-- criação de banco de dados turtleLive
create database turtle_live;
use turtleLive; -- selecionei o banco de dados turtle_live
-- criação da tabela de cadastro 
 create table cadastro(
email varchar (100) primary key,
nome varchar  (50),
senha varchar (50),
idade int,
cpf varchar (50)
);
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
-- inserir dados na tabela cadastro 
insert into cadastro values ('lais.aranega@bandtec.com.br', 'lais tejon',  'tartaruga1234', 19, 8462651982),
                             ('caique.rodrigues@bandtec.com.br', 'caique rodrigues','ursinhoted',21,893527500),
                             ('thais.sousa@bandtec.com.br', 'thaís calazans', 'mavis', 19,8765437691), 
							 ('felipe.mazurkieviz@bandtec.com.br', 'felipe mallasen', 'fut4526',21,8763245169), 
                             ('beatriz.santos@bandtec.com.br', 'beatriz santos', 'barbie123',19,6754359862), 
                             ('karla.moncayo@bandtec.com.br', 'karla moncayo', 'flor45',26,765384952),
                             ('andre.santos@bandtec.com.br', 'andre santos', 'basquete65',18,7828328687),
							 ('christian.almeida@bandtec.com.br', 'christian almeida','skat67',20,97864209);

-- criação da tabela cliente 
create table cliente(
id_pedido int primary key,
id_cliente int, 
nome varchar(40),
sexoPreferencia varchar(40),
id_ciclo int,
constraint fk_cliente_periodo  FOREIGN KEY (id_ciclo) REFERENCES periodo (id_ciclo)  -- chave estrangeira para conectar as tabelas 
 );
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
-- insirir dados na tabela 
insert into cliente values(360,111, 'Projeto tamar', 'macho', 1),
						 (361,111, 'projeto tamar','femea', 2); 


-- criação da tabela periodo
create table periodo(
 id_ciclo int primary key,
descrição varchar(40),
PrimeiroP_dias int,
PrimeioroP_temp varchar(40),
SegundoP_dias int, 
SegundoP_temp varchar (40), 
TerceiroP_dias int,
TercceiroP_temp varchar(40)
);
 
-- selecionar todas as colunas da tabela 
select*from periodo;
 -- inserir dados na tabela 
insert into periodo values (1,'macho',20,'24°',20,'24°até 26°',20,'temperatura ambiente'),
						   (2,'femea',20,'31°',20,'31° até 33°', 20,'temperatura ambiente');


-- criação da tabela incubação 					
create table incubação(
id_incubação int primary key,
matriz varchar (20),
N_ovos int,
data_inicio varchar (20),
data_limite varchar (20),
id_pedido int,
id_ciclo int,
constraint fk_incubação_periodo FOREIGN KEY (id_ciclo) REFERENCES periodo (id_ciclo), -- chave estrangeira 
constraint fk_incubação_pedido FOREIGN KEY (id_pedido) REFERENCES cliente (id_pedido)  -- chave estrangeira 
);
-- selecionar todas as colunas da tabela 
select * from incubação;
-- inserir dados na tabela 
insert into incubação values (1010,'amélia',120,'24/07/2020','22/09/2020',361,2),
							 (1011,'luara',120, '24/07/2020','22/09/2020',360,1),
                             (0192,'lola',120,'09/12/1221','12/12/121', 360, 1);


