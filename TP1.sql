drop database if exists casa_empanada;
create database casa_empanada;
use casa_empanada;

drop table if exists Venta;
drop table if exists TipoEmpanada;

create table Venta(
id_venta int auto_increment primary key,
fecha_venta datetime  not null,
id_tipo_empanada int  not null,
cantidad_vendida int   not null,
precio_facturacion_final double not null
);

create table TipoEmpanada(
id_tipo_empanada int auto_increment primary key,
nombre varchar(45) not null,
id_gusto int not null,
descripcion varchar(180)
);

alter table Venta
add constraint FK_Venta_id_tip_empanada_TipoEmpanada
foreign key(id_tipo_empanada)
references TipoEmpanada(id_tipo_empanada);

select *  from TipoEmpanada;
insert into TipoEmpanada(nombre,id_gusto,descripcion) values
('Empanada Salteña',1,' La empanada contiene aceitunas'),
('Empanada Tucucama',10,'Esta empanada de pollo esta rica'),
('Empanada Catamarqueñas',7,'Esta empanmada es de jamon y queso'),
('Empanada Jujenas',4,'Esta empanada es de Queso con cebolla'),
('Empanada Catamarqueñas',10,'Empanada de humita');
insert into TipoEmpanada(nombre,id_gusto,descripcion) values
('Empanada Tucucama',6,'Rica');

insert into Venta(fecha_venta,id_tipo_empanada,cantidad_vendida,precio_facturacion_final)values
('2020/08/30',1,50,1200),
('2021/12/05',3,100,1500),
(curdate(),2,25,1800),
(curdate(),5,150,2500),
('2021/03/15',4,75,5000);
insert into Venta(fecha_venta,id_tipo_empanada,cantidad_vendida,precio_facturacion_final)values
(curdate(),5,1500,10000);
insert into Venta(fecha_venta,id_tipo_empanada,cantidad_vendida,precio_facturacion_final)values
(curdate(),6,1500,10000);
select id_venta,precio_facturacion_final
from Venta as v
join TipoEmpanada as tp
on tp.codigo=v.codigo
group by tp.nombre;

select v.id_venta,v.precio_facturacion_final,v.cantidad_vendida,
te.nombre TipoDeEmpanada
from Venta v join TipoEmpanada te on  v.id_tipo_empanada=te.id_tipo_empanada
where v.cantidad_vendida  between 1000 and 2000 
group by te.id_tipo_empanada;