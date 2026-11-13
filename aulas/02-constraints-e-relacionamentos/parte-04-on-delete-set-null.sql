-- Aula 2.4: chave estrangeira com ON DELETE SET NULL

create database aula2_4;

use aula2_4;

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
        references departamento(id) on delete set null
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

-- Ao excluir o departamento de id 1,
-- o coddep dos funcionarios vinculados a ele será definido como NULL.

delete from departamento
where id = 1;
