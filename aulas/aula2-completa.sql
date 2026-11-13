-- Aula 2: constraints, delecao de itens referenciados e alter
-- Script organizado na ordem das seis partes da aula.
-- Execute cada parte na ordem e apenas uma vez em cada banco de dados.
-- Este arquivo reúne os conteúdos que também estão disponíveis em arquivos separados.

-- =========================================================
-- PRIMEIRA PARTE - CONSTRAINTS
-- =========================================================

create database aula2_1;
use aula2_1;

create table departamento (
    id int not null,
    nome varchar(30) not null,
    primary key (id)
);

create table funcionario (
    codigo int,
    nome varchar(40),
    coddep int,
    primary key (codigo),
    foreign key (coddep) references departamento(id)
);


-- =========================================================
-- SEGUNDA PARTE - CONSTRAINT COM NOME
-- =========================================================

create database aula2_2;
use aula2_2;

create table departamento (
    id int not null,
    nome varchar(30) not null,
    primary key (id)
);

create table funcionario (
    codigo int,
    nome varchar(40),
    coddep int,
    primary key (codigo),
    constraint seu_filho foreign key (coddep)
        references departamento(id)
);


-- =========================================================
-- TERCEIRA PARTE - ON DELETE RESTRICT
-- Impede excluir um departamento que tenha funcionarios ligados a ele.
-- =========================================================

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

-- Inserindo departamentos
insert into departamento values (1, 'venda');
insert into departamento values (2, 'Ti');
insert into departamento values (3, 'RH');
insert into departamento values (4, 'Contabil');

-- Inserindo funcionarios
insert into funcionario values (101, 'Maria', 1);
insert into funcionario values (102, 'Jose', 2);
insert into funcionario values (103, 'Ana', 1);
insert into funcionario values (104, 'Pedro', 3);

select * from departamento;
select * from funcionario;

-- Este delete deve ser impedido, pois existem funcionarios no departamento 1.
-- Execute esta linha separadamente para observar a restricao.
delete from departamento where id = 1;

-- Este delete deve funcionar, pois o departamento 4 nao possui funcionarios.
delete from departamento where id = 4;


-- =========================================================
-- QUARTA PARTE - ON DELETE SET NULL
-- Ao excluir o departamento, coddep dos funcionarios fica null.
-- =========================================================

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

-- Inserindo departamentos
insert into departamento values (1, 'venda');
insert into departamento values (2, 'Ti');
insert into departamento values (3, 'RH');
insert into departamento values (4, 'Contabil');

-- Inserindo funcionarios
insert into funcionario values (101, 'Maria', 1);
insert into funcionario values (102, 'Jose', 2);
insert into funcionario values (103, 'Ana', 1);
insert into funcionario values (104, 'Pedro', 3);

select * from departamento;
select * from funcionario;

delete from departamento where id = 1;

-- Conferindo: Maria e Ana continuam, mas coddep fica null.
select * from funcionario;


-- =========================================================
-- QUINTA PARTE - ON DELETE CASCADE
-- Ao excluir o departamento, os funcionarios ligados a ele tambem sao excluidos.
-- =========================================================

create database aula2_5;
use aula2_5;

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
        references departamento(id) on delete cascade
);

-- Inserindo departamentos
insert into departamento values (1, 'venda');
insert into departamento values (2, 'Ti');
insert into departamento values (3, 'RH');
insert into departamento values (4, 'Contabil');

-- Inserindo funcionarios
insert into funcionario values (101, 'Maria', 1);
insert into funcionario values (102, 'Jose', 2);
insert into funcionario values (103, 'Ana', 1);
insert into funcionario values (104, 'Pedro', 3);

select * from departamento;
select * from funcionario;

delete from departamento where id = 1;

-- Conferindo: Maria e Ana tambem foram excluidas.
select * from departamento;
select * from funcionario;


-- =========================================================
-- SEXTA PARTE - DDL (ALTER TABLE)
-- Primeiro criamos as tabelas; depois adicionamos as constraints com alter.
-- =========================================================

create database aula2_6;
use aula2_6;

create table departamento (
    codigo int not null,
    nome varchar(80) not null,
    primary key (codigo)
);

create table funcionario (
    codigo int not null,
    nome varchar(50) not null,
    cpf char(12) not null,
    salario numeric(5,2),
    coddep int
);

-- Adicionando a chave primaria da tabela funcionario.
alter table funcionario
    add constraint pk_funcionario primary key (codigo);

-- Adicionando a chave estrangeira que liga funcionario a departamento.
alter table funcionario
    add constraint fk_funcionario_departamento
    foreign key (coddep) references departamento(codigo);

-- Conferindo a estrutura das tabelas.
describe departamento;
describe funcionario;
