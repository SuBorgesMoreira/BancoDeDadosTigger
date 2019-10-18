use master;
drop database banco;
go

create database banco;
go

use banco;

create table cliente(
	idCliente int primary key not null identity(1,1),
	nomeCliente varchar(50)
);
go

create table clientesComData(
	idClienteData int primary key not null identity(1,1),
	idCliente int not null,
	nomeCliente varchar(100),
	data datetime,
);
go

create trigger tgrData
on cliente
for insert
as
begin
	declare @id int
	declare @nome varchar(100)
	declare @data datetime
	
	select @id=idCliente, @nome=nomeCliente from inserted i
	insert into clientesComData values (@id,@nome,getdate());
end
go

insert into cliente values ('Maria');
insert into cliente values ('Pedro');
insert into cliente values ('Ana');
insert into cliente values ('João');
go

select * from cliente;
select * from clientesComData;