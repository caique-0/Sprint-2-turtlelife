-- criação de banco de dados turtleLive
create database turtle_live;
use turtleLive; -- selecionei o banco de dados turtle_live
create table incubação(
idIncubação int primary key,
matriz varchar (40),
cliente varchar (40),
nOvos int,
ciclo1  varchar (40),
ciclo2  varchar (40),
ciclo3 varchar (40),
sexo varchar (40)
); 

-- exibir os dados da tabela
select * from incubação;
-- exibir apenas a coluna idincubação 
select idincubação from incubação;
-- exibir apenas a coluna matriz 
select matriz from incubação;
-- exibir apenas a coluna cliente 
select cliente from incubação;
-- exibir apenas coluna nOvos
select nOvos from incubação;  
-- exibir apenas as colunas c1,c2 e c3 
select ciclo1, ciclo2, ciclo3 from incubação;
-- exibir apenas sexo 
select sexo from incubação;

insert into incubação values(016239, 'Amelía', 'tamar', 120, '24° a 25°', '24° a 26°', 'temperatura ambiente', 'masculino'),
						(016240, 'rosa', 'tamar', 120, '30° a 33°', '30 a 33', 'temperatura ambiente', 'feminino');
 
 
 -- criar tabela de cadastro
 create table cadastro(
email varchar (100) primary key,
nome varchar  (50),
senha varchar (50),
idade int,
cpf int
);

-- exibir tabela cadasro
select * from cadastro;
-- exibir apenas a coluna email
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

insert into cadastro values ('lais.aranega@bandtec.com.br', 'lais tejon',  'tartaruga1234', 19, 87626519823),
                             ('caique.rodrigues@bandtec.com.br', 'caique rodrisgues','ursinhoted',21,87352753872),
                             ('thais.sousa@bandtec.com.br', 'thaís calazans', 'mavis', 19,87654376910), 
							 ('felipe.mazurkieviz@bandtec.com.br', 'felipe mallasen', 'fut4526', 21,87632451609), 
                             ('beatriz.santos@bandtec.com.br', 'beatriz santos', 'barbie123', 19 ,67543598626), 
                             ('karla.moncayo@bandtec.com.br', 'karla moncayo', 'flor45', 26,7653849527),
                             ('andre.santos@bandtec.com.br', 'andre santos', 'basquete65',18,76283286876),
							 ('christian.almeida@bandtec.com.br', 'christian almeida','skat67',21,978642092);
drop table cadastro;
 create table cadastro(
email varchar (100) primary key,
nome varchar  (50),
senha varchar (50),
idade int,
cpf int
);


 




 

 

