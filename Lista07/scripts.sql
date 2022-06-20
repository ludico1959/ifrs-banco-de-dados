drop database noveleiros;
create database noveleiros;

\c noveleiros;

drop table novelas_personagens;
drop table personagens;
drop table atores;
drop table capitulos;
drop table novelas;

-- criação das tabelas
create table novelas (
	codigo serial primary key,
	nome varchar(100) not null,
	data_primeiro_capitulo date not null,
	data_ultimo_capitulo date not null,
	horario_exibicao time
);

create table atores (
	codigo serial primary key,
	nome varchar(150) not null,
	idade integer not null,
	cidade varchar(80) not null,
	salario real not null,
	sexo char(1) not null check(sexo = 'M' or sexo = 'F' or sexo = 'X')
);

create table personagens (
	codigo serial primary key,
	nome varchar(150) not null,
	idade integer not null,
	situacao_financeira char(1) not null check(situacao_financeira = 'A' or situacao_financeira = 'B' or situacao_financeira = 'C'),
	cod_ator integer not null references atores (codigo)
);

create table novelas_personagens (
	cod_novela integer not null references novelas (codigo),
	cod_personagem integer not null references personagens (codigo),
	primary key (cod_novela, cod_personagem)
);

create table capitulos (
	codigo serial primary key,
	nome varchar(150) not null,
	data_exibicao date not null,
	cod_novela integer not null references novelas (codigo)
);

-- inserção dos dados nas tabelas
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao) 
VALUES ('Mulheres de Areia', '1990-01-01', '1990-06-01', '21:00:00');

INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao) 
VALUES ('Mistérios de uma Vida', '2022-01-01', '2022-04-11', '21:00:00');

INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao) 
VALUES ('Vida da gente', '2010-01-01', '2010-04-11', '18:00:00');

INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao) 
VALUES ('Quanto mais vida melhor', '2010-01-01', '2010-04-11', '18:00:00');

INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao) 
VALUES ('Convida a gente', '2010-01-01', '2010-04-11', '18:00:00');

INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao) 
VALUES ('vida', '2010-01-01', '2010-04-11', '18:00:00');

INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao) 
VALUES ('O Clone', '2022-01-01', '2022-04-11', NULL);

INSERT INTO atores (nome, idade, cidade, salario, sexo) VALUES ('Gloria Pires', 50, 'Rio de Janeiro', 50000, 'F');

INSERT INTO atores (nome, idade, cidade, salario, sexo) VALUES ('Antonio Fagundes', 65, 'Marau', 150000, 'M');

INSERT INTO atores (nome, idade, cidade, salario, sexo) VALUES ('Marcos Frota', 65, 'Floripa', 300, 'M');

INSERT INTO atores (nome, idade, cidade, salario, sexo) VALUES ('Alexandre Frota', 50, 'Salvador', 150000, 'M');

INSERT INTO personagens (nome, idade, situacao_financeira, cod_ator) VALUES ('Ruth', 50, 'C', 1);
INSERT INTO personagens (nome, idade, situacao_financeira, cod_ator) VALUES ('Tonho da Lua', 30, 'C', 3);

INSERT INTO novelas_personagens (cod_novela, cod_personagem) VALUES (1, 1);

-- Faça uma consulta que encontre a data de exibição do último capítulo para a novela “Mistérios de uma Vida”. 
select data_ultimo_capitulo from novelas where nome = 'Mistérios de uma Vida';

-- Faça uma consulta que encontre todas as novelas que tenham o valor do horário de exibição vazio (NULL).
select * from novelas where horario_exibicao is null;

-- Faça uma consulta que encontre o nome de todos os atores que morem em cidades que comecem com a letra “M”.
select nome as ator from atores where cidade like 'M%';

-- Faça uma consulta que encontre a quantidade de novelas que tenham como parte do nome a palavra “vida”.
select count(*) as quantidade from novelas where nome ilike '% vida %' or nome ilike 'vida %' or nome ilike '% vida'; 

-- Faça uma consulta que encontre a quantidade de novelas que tenham como parte do nome a palavra “vida”.
select count(*) as "numero de novelas"
	from novelas
	inner join novelas_personagens on (novelas.codigo = novelas_personagens.cod_novela)
	inner join personagens on (personagens.codigo = novelas_personagens.cod_personagem)
	inner join atores on (personagens.cod_ator = atores.codigo)
	where atores.nome = 'Gloria Pires';
	
-- Faça uma consulta que selecione todos os campos da tabela personagens ordenados por nome em ordem crescente.
select * from personagens order by nome asc;

-- Faça uma consulta que selecione todos os campos da tabela personagens ordenados pela idade em ordem decrescente. 
select * from personagens order by idade desc;

-- Faça uma consulta que selecione quantos atores existem cadastrados. 
select count(*) from atores;

-- Faça uma consulta que selecione quantas novelas existem cadastradas. 
select count(*) from novelas;

-- Faça uma consulta que selecione quantos atores são do sexo feminino.
select count(*) from atores where sexo = 'F';

-- Faça uma consulta que retorne a idade média dos personagens.
select avg(idade) from personagens;

-- Faça uma consulta que selecione quantos personagens têm menos de 15 anos. 
select count(*) from personagens where idade < 15;

-- Faça uma consulta que selecione o nome dos atores que têm a mesma idade do seu personagem. 
select atores.nome as ator
	from atores 
	inner join personagens on (personagens.cod_ator = atores.codigo)
	where atores.idade = personagens.idade; 

-- Faça uma consulta que encontre o valor do maior salário de atores.
select max(salario) from atores;

-- Faça uma consulta que encontre o valor do menor salário de atores. 
select min(salario) from atores;

-- Faça uma consulta que encontre o valor do somatório de todos os salários. 
select sum(salario) from atores;