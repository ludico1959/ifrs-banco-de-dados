create database seguradora;

drop table acidente;
drop table carro;
drop table cliente;

-- ex1.
create table cliente (
	cpf char(11) primary key,
	cnh char(11) not null,
	nome varchar(100) not null,
	telefone char(11),
	endereco text
);

create table carro (
	chassi char(17) primary key,
	placa char(7) not null,
	descricao varchar(200),
	km_rodados real not null,
	cpf_cliente char(11) not null references cliente (cpf)
);

create table acidente (
	id serial primary key,
	local varchar(100) not null,
	data date not null,
	hora time,
	valor real not null,
	descricao varchar(200),
	chassi_carro char(17) not null references carro (chassi)
);

insert into cliente (cpf, cnh, nome, telefone, endereco) values 
('10090764005', '38483613289', 'Lucas Dias Coelho', '53977771111', 'CEP 89234-195, 100. Joinville/SC'),
('63272974040', '35800705295', 'Matheus da Silva Ferreira', '53911112222', 'CEP 69023-132, 12. Manaus/AM'),
('58867332058', '86580119520', 'Rodrigo Moraes de Boer', '53988884444', 'CEP 35700-027, 234A. Sete Lagoas/MG');

insert into carro (chassi, placa, descricao, km_rodados, cpf_cliente) values
('11111111111111111', 'LZP6624', 'Mitsubishi. L200 T. Savana 3.2 CD TB Int. Dies. Aut.', 17893, '10090764005'),
('22222222222222222', 'AJR1905', 'Land Hover. Defender 110 TDI SW Diesel', 190123, '10090764005'),
('33333333333333333', 'KRO1068', 'Rover. Mini Cooper 1.3', 180123, '63272974040'),
('44444444444444444', 'HZY6199', 'Volvo. S40 T-4', 345666, '63272974040'),
('55555555555555555', 'HZQ5942', 'Jaguar. S-Type 3.0/ 3.0 SE V6', 95345, '58867332058');

insert into acidente (local, data, hora, valor, descricao, chassi_carro) values
('Entrada de Joinville', '2011-12-24', '17:32', 43200, 'Batida frontal em uma árvore', '11111111111111111'),
('Ponte de Florianópolis', '2007-06-06', '03:55', 97100, 'Queda da ponte', '22222222222222222'),
('Floresta Amazônica', '2017-11-23', '17:00', 5600, 'Atropelamento de um peixe-boi', '44444444444444444');

select * from cliente;
select * from carro;
select * from acidente;

-- ex2.
select acidente.local, 
	   acidente.hora,
	   acidente.data,
	   acidente.descricao
	from acidente 
	inner join carro on (acidente.chassi_carro = carro.chassi)
	inner join cliente on (carro.cpf_cliente = cliente.cpf)
	where cliente.nome = 'Lucas Dias Coelho';
	
-- ex3.
select count(*) from acidente where data between '2010-01-01' and '2020-12-31';

-- ex4.
delete from acidente where data < current_date-cast('5 YEAR' as interval);
select * from acidente;

-- ex5.
select cliente.nome, 
	   sum(acidente.valor)
	from cliente 
	inner join carro on (carro.cpf_cliente = cliente.cpf)
	inner join acidente on (carro.chassi = acidente.chassi_carro)
	where extract(year from acidente.data) = 2007
	group by cliente.nome; 
	
-- ex6.
select cliente.nome,
	   sum(acidente.valor)
	from cliente 
	inner join carro on (carro.cpf_cliente = cliente.cpf)
	inner join acidente on (acidente.chassi_carro = carro.chassi)
	where (extract(year from acidente.data) between 2005 and 2015) and acidente.valor > 40000
	group by cliente.nome;
	
-- ex7.
select carro.placa,
	   carro.descricao,
	   sum(acidente.valor)
   from carro
   inner join acidente on (acidente.chassi_carro = carro.chassi)
   where extract(year from acidente.data) = 2007
   group by carro.placa, carro.descricao;