-- Aula 2.6: alter table e constraints

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
