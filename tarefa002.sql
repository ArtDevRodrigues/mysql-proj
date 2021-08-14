use mydb;
-- a
select * from pedido where situacao_atual="registrado";
-- select * from pedido where situacao_atual<>"registrado";

-- ============================================================================================================
-- b
select (i.quantidade * i.valor_item) from item_pedido i;
-- c 
select count(1) as quantiade, f.nome  from funcionario f, pedido p 
where p.idfuncionario=f.idfuncionario group by f.nome  ;

-- d 
select p.sabor, p.ingredientes, c.preco_p, c.preco_m,c.preco_g, c.descricao 
from pizza p, categoria c order by c.idcategoria;

-- e 
create view cardapio as select i.idpedido, i.quantidade , sabor , preco_p , preco_m, preco_g
 from item_pedido i natural join categoria, pizza;
select * from cardapio;

create view quante_pedidos as select count(idpedido) quantidade,sabor from item_pedido natural join pizza 
natural join pedido where situacao_atual = 'entregue' group by sabor;
select * from quante_pedidos;
-- drop view cardapio; 

-- f
delimiter $ 
create procedure adiciona_pedido(in idpedido int, in data_pedido datetime,in endereco varchar(45),
 in idcliente int, in idfuncionario int)
begin 
	insert into pedido(idpedido, data_pedido, endereco, cliente_idcliente, idfuncionario,
    situacao_atual, data_situacao)values (idpedido, data_pedido, endereco, idcliente, idfuncionario,
    "registrado", data_pedido);
    insert into situacao(data_hora,pedido_idpedido,tipo_status_idtipo_status)
    values (data_pedido, idpedido, 1);
END $
delimiter ;
drop procedure adiciona_pedido;

call adiciona_pedido(2,'2016-07-10 17:30:00',"Rua manga, bairro ass",3,1);
-- ====================================================================================================
delimiter $ 
create procedure atualiza_pedido(in idpedido int, in data_situacao datetime,in situacao_atual varchar(45)
 )
begin 
	update pedido p set p.idpedido = idpedido ,p.data_situacao = data_situacao ,
    p.situacao_atual = situacao_atual where p.idpedido = idpedido;
  
END $
delimiter ;
drop procedure atualiza_pedido;

call atualiza_pedido(1,'2016-05-10 11:35:00',"entregue");

-- g

DELIMITER $

CREATE TRIGGER calitem AFTER INSERT
ON pedido
FOR EACH ROW
BEGIN
	
    
END$


