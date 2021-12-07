drop table if exists tp3;
create database tp3;
use tp3;

drop table if exists cliente;
drop table if exists pedido;

create table cliente (
  id int  NOT NULL auto_increment,
  nombre VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE pedido (
  id int NOT NULL auto_increment,
  id_cliente int NOT NULL,
  comentario text NOT NULL,
  fecha datetime NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  PRIMARY KEY (id)
  );
  
  insert into cliente (nombre) values
  ('Marta'),('Sandra'),
  ('Rodolfo'),('Mario'),
  ('Martin');
  insert into cliente (nombre) values
  ('Susana');
  insert into cliente (nombre) values
  ('Marta'),('Sandra');
  insert into cliente (nombre) values
  ('Jose'),('Sanchez');
 select * from cliente;
  insert into pedido(id_cliente,comentario,fecha)values
  (1,'Compro una remera',curdate()),
  (2,'Compro un pantalon','2021/05/22'),
  (3,'Compro una buzo','2020/01/29'),
  (4,'Compro una remera','2019/12/14'),
  (5,'Compro una campera','2020/11/10');
insert into pedido(id_cliente,comentario,fecha)values
    (6,'Compro unas zapatillas','2021/12/25');
insert into pedido(id_cliente,comentario,fecha)values
  (1,'Compro una remera','2021/12/20'),
  (2,'Compro una campera','2021/12/10'),
  (2,'Compro una zapatillas','2021/12/10');
  insert into pedido(id_cliente,comentario,fecha)values
  (2,'Compro una coca','2021/12/10'),
  (2,'Compro un buzo','2021/12/10'),
  (2,'Compro unas empanadas','2021/12/10'),
  (2,'Compro un colchon','2021/12/10'),
  (2,'Compro unas verdudas','2021/12/10'),
  (2,'Compro muchos regalos','2021/12/10'),
  (2,'Compro una ps3','2021/12/10'),
  (2,'Compro una xbox','2021/12/10'),
  (2,'Compro una computadora','2021/12/10'),
  (2,'Compro un celular nuevo','2021/12/10');
  
  select p.comentario,p.fecha,
  c.nombre
   from pedido p  inner join cliente c
   on p.id_cliente=c.id
   where p.fecha>date("2021/12/1");
   
select p.comentario,date(p.fecha) fecha,
  c.nombre
   from pedido p  inner join cliente c
   on p.id_cliente=c.id
   where p.fecha>=curdate();
   
select  distinct (id_cliente)CantidadPedidos,(fecha)Mes,
nombre Nombre
from pedido p  join cliente c
on p.id_cliente=c.id
group by month(fecha),nombre
order by mes,nombre;

select count(id_cliente)CantidadPedidos,
c.nombre
from pedido p inner join cliente c on 
p.id_cliente=c.id 
group  by  c.nombre
having count(p.id_cliente)>0
order by count(p.id_cliente) ,c.nombre;










