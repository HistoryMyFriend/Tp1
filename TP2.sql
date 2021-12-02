drop table if exists panaderia;
create database panaderia;
use panaderia;

drop table if exists Venta;
drop table if exists Postre;

create table Venta(
id_venta int not null primary key auto_increment,
fecha_venta datetime not null,
cantidad_vendida int not null,
precio_facturacion_final double not null,
id_postre int not null references Postre
);

create table Postre(
id_postre int not null auto_increment,
nombre varchar(45) not null,
descripcion varchar(180),
precio_unitario double not null, 
primary key(id_postre,precio_unitario)
);

alter table Venta
add constraint FK_Venta_idpostre_Postre
foreign key(id_postre)
references Postre(id_postre);

describe Venta;
describe Postre;

insert into Postre(nombre,descripcion,precio_unitario) values
('Pasta Frola','Con pasas de uvas',5000);
select * from Postre;
insert into Postre(nombre,descripcion,precio_unitario) values
('Budin','Con chispitas de chocolate',3200),
('Rosca de pascua','Con crema pastelera incluida y almendras',6000),
('Pan dulce','No contiene nada',1500);

insert into Venta(fecha_venta,cantidad_vendida,precio_facturacion_final,id_postre) values
('2020/05/12',5,10000,1);
select * from Venta;
insert into Venta(fecha_venta,cantidad_vendida,precio_facturacion_final,id_postre) values
('2021/10/30',2,5000,4),
('2021/06/07',9,7000,3),
(curdate(),20,9500,2);


select v.id_venta,v.precio_facturacion_final,
p.nombre Postre
from Venta v join Postre p on  v.id_postre=p.id_postre
where v.precio_facturacion_final between 1 and 100000
group by postre ;