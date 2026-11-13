-- Aula 1: criacao de tabelas e constraints
-- Exemplos com as tabelas paciente e medico.

-- create database teste;
-- create database projeto;
-- create database aula1;

create database aula;

use aula;

create table paciente (
    codigo int not null,
    nome varchar(50) not null,
    cpf char(11) not null,
    data_nasc date not null,
    plano_saude varchar(25) null,
    primary key (codigo),
    unique (cpf)
);

create table medico (
    crm int,
    nome varchar(35) not null,
    sexo char(1),
    especialidade varchar(20) default 'clínico',
    primary key (crm),
    check (sexo in ('m', 'f')),
    check (especialidade in ('Cardio', 'Oftalmo', 'Clínico'))
);
