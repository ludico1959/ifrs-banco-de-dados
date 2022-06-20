drop database cinema;
create database cinema;

\c cinema;

drop table if exists salas cascade;
drop table if exists diretores cascade;
drop table if exists filmes cascade;
drop table if exists premios cascade;
drop table if exists salas_filmes cascade;

-- criacao das tabelas
create table salas (
	numero int primary key,
	descricao varchar(100) not null,
	capacidade int not null
);

create table diretores (
	codigo serial primary key,
	nome varchar(100) not null
);

create table filmes (
	codigo serial primary key,
	nome varchar(200) not null,
	categoria varchar(50) not null,
	ano_lancamento integer not null,
	cod_diretor integer not null references diretores (codigo) on delete cascade
);

create table premios (
	codigo serial primary key,
	nome varchar(200) not null,
	ano_premiacao integer not null,
	cod_filme integer not null references filmes (codigo) on delete cascade
);

create table salas_filmes (
	numero_sala int not null references salas (numero) on delete cascade,
	cod_filme int not null references filmes (codigo) on delete cascade,
	data date not null,
	horario time not null,
	primary key(numero_sala, cod_filme)
);

-- inserções de dados
insert into salas (numero, descricao, capacidade) values 
(101, 'Sala 3D 1', 100),
(102, 'Sala 3D 2', 100),
(103, 'Sala Convencional 1', 150),
(201, 'Sala Convencional 2', 100),
(202, 'Sala 3D 3', 80);

insert into diretores (nome) values 
('Fulano de Tal da Silva'),
('Ciclana das Neves'),
('Josicreidson Seilaveski');

insert into filmes (nome, ano_lancamento, categoria, cod_diretor) values 
('Titanic', 1997, 'Drama', 1),
('Matrix', 2001, 'Ficção', 1),
('À Prova de Fogo', 2009, 'Romance', 2),
('Toy Story', 1998, 'Animação', 3),
('Shrek', 2000, 'Animação', 2);

insert into premios (nome, ano_premiacao, cod_filme) values 
('Oscar - Melhor Filme', 1997, 1),
('Oscar - Melhor Diretor', 1997, 1),
('Globo de Ouro - Melhor Filme', 1997, 1),
('Oscar - Efeitos Especiais', 2002, 2),
('Globo de Ouro - Melhor Animação', 1999, 4),
('Globo de Ouro - Melhor Animação', 2001, 5),
('Oscar - Melhor Atriz', 1997, 1);

insert into salas_filmes(numero_sala, cod_filme, data, horario) values
(101, 2, '2014-04-14', '20:00'),
(102, 1, '2014-04-10', '19:00'),
(103, 3, '2014-04-22', '16:00'),
(201, 4, '2014-04-14', '22:00'),
(201, 5, '2014-04-15', '20:00'),
(202, 3, '2014-04-21', '20:00'); 

-- Faça uma consulta que retorne o nome de todos os diretores cadastrados na base de dados. 
select nome as diretor from diretores;

-- Faça uma consulta de retorne o nome de todos os filmes da categoria “Animação”. 
select nome as "filme de animação" from filmes;

-- Atualize a base de dados de forma que a capacidade da sala de número 202 passe para 200 pessoas.
update salas set capacidade = 200 where numero = 202;
select * from salas;

--  Atualize a base de dados para que todos os filmes que seriam exibidos no dia 14/04/2014 sejam exibidos na sala 202.
update salas_filmes set numero_sala = 202 where data = '2014-04-14';
select * from salas_filmes;

-- Exclua o diretor de nome “Fulano de Tal da Silva ”. O que aconteceu? Como resolver o problema? 
-- Faça todas as exclusões necessárias para que o diretor possa ser excluído.
delete from diretores where nome = 'Fulano de Tal da Silva';

-- Encontre o nome e categoria de todos os filmes dirigidos pela diretora “Ciclana das Neves”.
select * from diretores;

select nome as filme, 
	   categoria 
	from filmes 
	where cod_diretor = 2;
	
-- Faça uma consulta que retorne os horários de exibição para o dia 15/04/2014.
select numero_sala as sala, cod_filme as "codigo do filme", horario from salas_filmes where data = '2014-04-15';

-- Faça uma consulta que retorne o nome e ano de todos os prêmios que o filme “Shrek” ganhou. 
select * from filmes;

select nome as premio, ano_premiacao as ano from premios where cod_filme = 5;

-- Faça uma consulta que retorne o código, nome e categoria de todos os filme lançados após o ano 2000. 
select codigo,
	   nome as filme,
	   categoria
	from filmes
	where ano_lancamento > 2000;
