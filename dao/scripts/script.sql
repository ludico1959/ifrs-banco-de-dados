drop database if exists dao;
create database dao;

\c dao;

drop table if exists pessoa;
create table pessoa (
  id serial primary key,
  cpf varchar(14),
  nome varchar(150)
);

insert into pessoa (cpf, nome) values
('059.654.120-10', 'Lui Natal Cantanhede'),
('825.808.930-75', 'Andriy Reino Quaresma'),
('565.598.840-23', 'Emilly Mota Aragão'),
('440.691.940-61', 'Sancho Fidalgo Carvalhal'),
('361.477.100-87', 'Luciano Quinterno Catela'),
('792.967.890-36', 'Concha Fortes Ximenes'),
('376.883.080-20', 'Mohammed Cabral Pessoa');

select * from pessoa;