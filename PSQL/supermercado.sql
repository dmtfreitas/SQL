DROP DATABASE IF EXISTS supermercado;

CREATE DATABASE supermercado;

DROP TABLE IF EXISTS financeiro;
DROP TABLE IF EXISTS itens_pedidos;
DROP TABLE IF EXISTS entregas;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS estoques;
DROP TABLE IF EXISTS itens_compras;
DROP TABLE IF EXISTS compras;
DROP TABLE IF EXISTS itens_vendas;
DROP TABLE IF EXISTS caixa;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS fornecedores;
DROP TABLE IF EXISTS funcionarios;

CREATE TABLE categorias (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE fornecedores (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    contato VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco TEXT
);

CREATE TABLE funcionarios (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) UNIQUE,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_contratacao DATE
);

CREATE TABLE clientes (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf_cnpj CHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco TEXT
);

CREATE TABLE produtos (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    categoria_id BIGINT,
    fornecedor_id BIGINT,
    estoque_atual INT DEFAULT 0,
    estoque_minimo INT DEFAULT 0,
    unidade_medida VARCHAR(20),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id)
);

CREATE TABLE caixa (
    id BIGSERIAL PRIMARY KEY,
    data TIMESTAMP NOT NULL,
    id_funcionario BIGINT NOT NULL,
    total_venda DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(50),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);

CREATE TABLE itens_vendas (
    id BIGSERIAL PRIMARY KEY,
    id_caixa BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_caixa) REFERENCES caixa(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE compras (
    id BIGSERIAL PRIMARY KEY,
    data TIMESTAMP NOT NULL,
    id_fornecedor BIGINT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id)
);

CREATE TABLE itens_compras (
    id BIGSERIAL PRIMARY KEY,
    id_compra BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES compras(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE estoques (
    id BIGSERIAL PRIMARY KEY,
    id_produto BIGINT NOT NULL,
    quantidade INT NOT NULL,
    tipo_movimento VARCHAR(20) NOT NULL,
    data TIMESTAMP NOT NULL,
    id_funcionario BIGINT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);

CREATE TABLE pedidos (
    id BIGSERIAL PRIMARY KEY,
    id_cliente BIGINT NOT NULL,
    data TIMESTAMP NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE entregas (
    id BIGSERIAL PRIMARY KEY,
    id_pedido BIGINT NOT NULL,
    data_entrega DATE,
    status VARCHAR(50),
    transportadora VARCHAR(100),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id)
);

CREATE TABLE itens_pedidos (
    id BIGSERIAL PRIMARY KEY,
    id_pedido BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE financeiro (
    id BIGSERIAL PRIMARY KEY,
    descricao TEXT,
    tipo VARCHAR(20) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data TIMESTAMP NOT NULL,
    id_funcionario BIGINT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);
