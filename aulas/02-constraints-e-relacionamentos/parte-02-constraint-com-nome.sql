-- Aula 2.2: constraint com nome

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
