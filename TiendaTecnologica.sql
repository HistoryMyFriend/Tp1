drop database if exists tienda_tecnologia;
create database tienda_tecnologia;
use tienda_tecnologia;

drop table if exists articulos;
drop table if exists clientes;
drop table if exists factura;
drop table if exists  empleados;

create table clientes (
id int auto_increment,
nombre varchar(25) not null,
apellido varchar(25) not null,
dni int(13) not null, 
direccion varchar(50)not null,
primary key (id)
);
create table empleados(
id int auto_increment,
nombre varchar(25) not null,
apellido varchar(25) not null,
primary key (id)
);

create table articulos(
id int auto_increment,
nombre varchar(50) not null,
precio double not null,
stock int not null,
primary key (id)

);

create table facturas(
letra char(1),
numero int,
fecha date,
monto double,
primary key (letra,numero)
);



