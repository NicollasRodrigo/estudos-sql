-- Aula 2.3: chave estrangeira com ON DELETE RESTRICT

create database aula2_3;

use aula2_3;

create table departamento (
    id int not null,
    nome varchar(20) not null,
    primary key (id)
);

create table funcionario (
    codigo int,
    nome varchar(20) not null,
    coddep int,
    primary key (codigo),
    foreign key (coddep)
        references departamento(id) on delete restrict
);

-- Inserindo dados

insert into departamento values (1, 'venda');
insert into departamento values (2, 'Ti');
insert into departamento values (3, 'RH');
insert into departamento values (4, 'Contábil');

insert into funcionario values (101, 'Maria', 1);
insert into funcionario values (102, 'José', 2);
insert into funcionario values (103, 'Ana', 1);
insert into funcionario values (104, 'Pedro', 3);

-- Consultando os dados

select * from departamento;

select * from funcionario;

-- Esta exclusão será impedida, pois existem funcionarios vinculados
-- ao departamento de id 1.
delete from departamento
where id = 1;

-- Esta exclusão poderá ser realizada, pois o departamento de id 4
-- não possui funcionarios vinculados.
delete from departamento
where id = 4;
