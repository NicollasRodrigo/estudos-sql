-- Aula 2.1: criação de tabelas e chave estrangeira

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
