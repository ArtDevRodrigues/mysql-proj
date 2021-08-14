create database bdalve;
use bdalve;

create table cliente(
id_cliente int auto_increment,
nome_cliente varchar(50)not null,
cpf char(11)not null,
endereco varchar(100),
sexo char(1),
telefone char(9),
primary key(id_cliente)

);

create table modelo(
id_modelo int auto_increment,
marca varchar(15) not null,
descricao varchar(20)not null,
ano char(4) not null,
completo boolean,
v_diaria decimal(6,2),
primary key(id_modelo)

);

create table veiculo(
cod_veiculo int,
id_modelo int auto_increment,
placa char(7),
alugado boolean,
constraint fk_id_modelo foreign key(id_modelo) references modelo(id_modelo),
primary key(cod_veiculo)

);

create table aluguel(
id_aluquel int auto_increment,
id_cliente int not null,
cod_veiculo int not null,
data_aluguel datetime,
qtde_diaria int,
valor decimal(6,2),
data_devo datetime,
constraint fk_id_cliente foreign key (id_cliente) references cliente(id_cliente),
constraint fk_cod_veiculo foreign key (cod_veiculo) references veiculo(cod_veiculo),
primary key(id_aluquel)

);

insert into cliente values(1,"Joao Pedro Sousa","00687664323","Rua Val,31.Bairro Cristo Rei.Pedro II- PI ",'M',"994323421");

insert into modelo values(1,"Renalt","Sandero",'2011',true,200);
insert into modelo values(2,"Fiat","Uno",'2010',false,120);

insert into veiculo values(1,1,'JHM6754',false);
insert into veiculo values(2,2,'AMH2345',false);

insert into aluguel values(1,1,1,'2014-03-10',3,600,'2014-03-13');

-- select * from modelo;
-- letra :A
select nome_cliente,marca,descricao from cliente natural join modelo natural join aluguel where sexo = 'F' 
and data_aluguel between '2014-01-01'
and '2015-01-01' order by nome_cliente ;
-- letra:B
select nome_cliente,marca,descricao from  cliente natural join modelo natural join aluguel where endereco like"%centro%" 
order by nome_cliente;
-- letra:C
select nome_cliente,(valor * 1.10) as 'aluquel com almento'from cliente natural join aluguel;
-- letra:D
select max(valor) from aluguel;
-- letra:E
select nome_cliente,;
-- letra:F
select nome_cliente,cpf,min(valor)from cliente natural join aluguel;
-- letra:G
select avg(valor) 'media dos valores' from aluguel where year(data_aluguel) = 2014 ;
-- letra:H
select distinct nome_cliente, avg(valor) from cliente natural join aluguel where year(data_aluguel) = 2014 group by nome_cliente;
-- letra:i
select sum(valor) from aluguel where year(data_aluguel)= 2014;
-- letra:j
select nome_cliente, avg(valor), sum(valor) from cliente natural join aluguel where year(data_aluguel)= 2014 group by nome_cliente ;
-- letra:k
select cod_veiculo, placa, alugado, marca, descricao, data_aluguel,valor from modelo natural join veiculo natural left join aluguel where 
year(data_aluguel)= 2014 and  data_aluguel between '01-01-2014' and '31-01-2014' or data_aluguel is null ;
-- letra:l
select marca, descricao from modelo natural join veiculo natural left join aluguel where data_aluguel;
-- letra:m
select nome_cliente, cpf, count(id_aluguel) from modelo natural join veiculo natural left join aluguel natural join cliente group by nome_cliente;
-- letra:n *duvida*
select nome_cliente, cpf, endereco, count(id_alugue), from cliente natural left join aluguel where endereco like '%PedroII%' and 
year(data_aluguel)= 2014 or data_aluguel is null group by nome_cliente order by id_aluguel desc  ;
-- letra:o
select nome_cliente, cpf, max(valor) from cliente natural join aluguel;










