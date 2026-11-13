-- DML: INSERT, UPDATE e DELETE
-- Exemplos de manipulacao de dados no MySQL.

create database exemplo;

use exemplo;

create table pessoa (
    id int not null,
    nome varchar(40) not null,
    sexo char(1) not null,
    nasc date null,
    cidade varchar(10),
    cpf char(11) not null,
    primary key (id),
    unique (cpf),
    check (sexo in ('m', 'f'))
);

create table produto (
    cod int,
    descricao varchar(10) not null,
    preco decimal(5,2),
    id_pessoa int,
    primary key (cod),
    foreign key (id_pessoa) references pessoa(id)
);

-- Inserir dados: INSERT

insert into pessoa (id, nome, sexo, nasc, cidade, cpf)
values (1, 'Maria', 'f', '1980-01-20', 'J. Pessoa', '11122233344');

insert into pessoa
values (2, 'João', 'm', '1992-02-29', 'Coxixola', '22233344455');

insert into pessoa (id, nome, sexo, cpf)
values (3, 'Maria', 'f', '11122233355');

insert into pessoa (nome, cpf, sexo, id, nasc)
values ('Pedim', '99988877766', 'm', 4, '1999-10-31');

insert into pessoa (id, nome, sexo, cpf)
values
    (5, 'Sophia', 'm', '88877766655'),
    (6, 'Daniela', 'f', '00099988877'),
    (7, 'Davi', 'm', '77788877766');

select * from pessoa;

select * from produto;

insert into produto
values (101, 'feijão', 999.99, 5);

insert into produto (cod, descricao, preco)
values (200, 'arroz', 5.89);

-- Atualizar dados: UPDATE

select * from pessoa;

-- Atualiza o sexo de todas as pessoas cadastradas.
update pessoa
set sexo = 'm';

update pessoa
set sexo = 'f'
where id = 5;

update pessoa
set cidade = 'Recife'
where id = 6;

-- Apagar dados: DELETE

select * from produto;

select * from pessoa;

-- Este comando gera erro enquanto o produto 101 referencia a pessoa de id 5.
delete from pessoa
where id = 5;

-- Para excluir a pessoa de id 5, apague primeiro o produto relacionado:
-- delete from produto where cod = 101;
-- delete from pessoa where id = 5;

delete from pessoa
where id = 1;
