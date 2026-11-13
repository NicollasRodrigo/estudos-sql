-- Exercício: Loja Virtual
-- Prática de criação, alteração e manipulação de tabelas.

-- Questão 1

create database loja_virtual;

use loja_virtual;

create table clientes (
    id_cliente int primary key,
    nome varchar(100) not null,
    email varchar(100) not null unique
);

create table produtos (
    id_produto int primary key,
    nome_produto varchar(100) not null,
    preco decimal(10,2) not null check (preco > 0)
);

create table pedidos (
    id_pedido int primary key,
    data_pedido datetime default current_timestamp,
    id_cliente int,
    foreign key (id_cliente) references clientes(id_cliente)
);

-- Questão 2

alter table clientes
add column cpf varchar(14) not null unique;

-- Questão 3

alter table produtos
add constraint chk_preco_teto check (preco <= 50000.00);

-- Questão 4

alter table pedidos
add column status_pedido varchar(20) not null default 'Pendente';

-- Questão 5

alter table produtos
modify column nome_produto varchar(180) not null;

-- Questão 6

alter table produtos
drop check chk_preco_teto;

-- Questão 7 - insert

insert into clientes (id_cliente, nome, email, cpf) values
(1, 'Ana Silva', 'ana@email.com', '123.456.789-00'),
(2, 'Bruno Souza', 'bruno@email.com', '987.654.321-00');

insert into produtos (id_produto, nome_produto, preco) values
(1, 'Notebook', 3500.00),
(2, 'Mouse', 80.00);

insert into pedidos (id_pedido, id_cliente) values
(1, 1),
(2, 2);

-- Questão 7 - update

update pedidos
set status_pedido = 'Pago'
where id_pedido = 1;

-- Questão 7 - delete

delete from produtos
where id_produto = 2;

-- Questão 7 - select

select * from clientes;

select * from produtos;

select * from pedidos;

-- Esta consulta não retorna registros, pois o produto 2 foi excluído acima.
select * from produtos where id_produto = 2;
