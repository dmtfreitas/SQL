-- CRIAR UM BANCO DE DADOS
CREATE DATABASE mydb;

-- SELECIONAR UM BANCO DE DADOS
USE mydb;

-- DELETAR UM BANCO DE DADOS
DROP DATABASE mydb;

CREATE DATABASE IF NOT EXISTS mydb;

-- CRIAR UMA TABELA COM COLUNAS E TIPOS DE DADOS
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE
);

-- RENOMEAR UMA TABELA
RENAME TABLE employees TO workers;
RENAME TABLE workers TO employees;

-- DELETAR UMA TABELA
DROP TABLE employees;

-- ALTERAR E ADICIONAR UMA NOVA COLUNA EM UMA TABELA
ALTER TABLE employees
ADD phone_number VARCHAR(15);

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

-- ALTERAR E RENOMEAR UMA COLUNA EM UMA TABELA
ALTER TABLE employees
RENAME COLUMN phone_number TO city;

-- ALTERAR E MODIFICAR O TIPO DE DADO DE UMA COLUNA
ALTER TABLE employees
MODIFY COLUMN city VARCHAR(10);

-- ALTERAR E MODIFICAR O TIPO DE DADO EM UMA COLUNA E ADICIONAR APÓS UMA OUTRA COLUNA
ALTER TABLE employees
MODIFY COLUMN city VARCHAR(100)
AFTER last_name;

-- ALTERAR E MODIFICAR O TIPO DE DADO EM UMA COLUNA E ADICIONAR COMO PRIMEIRA COLUNA
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(120)
FIRST;

-- ALTERAR E DELETAR UMA COLUNA
ALTER TABLE employees
DROP COLUMN email;
ALTER TABLE employees
DROP COLUMN city;

-- INSERIR DADOS EM UMA LINHA DE TODAS AS COLUNAS DE UMA TABELA
INSERT INTO employees
VALUES (1, "Eugene", "Krabs", 25.50, "2023-01-02");

-- INSERIR DIVERSOS DADOS EM VÁRIAS LINHAS EM TODAS AS COLUNAS DE UMA TABELA
INSERT INTO employees
VALUES (2, "Squidward", "Tentacles", 15.00, "2023-01-04"),
       (3, "Spongebob", "Squarepants", 12.50, "2023-01-04"),
       (4, "Patrick", "Star", 12.50, "2023-01-05"),
       (5, "Sandy", "Checks", 17.25, "2023-01-06");

-- INSERIR DADOS EM COLUNAS SELECIONADAS
INSERT INTO employees (employee_id, first_name, last_name)
VALUES (6, "Sheldon", "Plankton");

-- SELECIONAR COLUNAS ESPECÍFICAS
SELECT last_name, first_name
FROM employees;

-- SELECIONAR TODAS AS COLUNAS
SELECT *
FROM employees;

-- SELECIONAR TODAS AS COLUNAS COM UM FILTRO ESPECÍFICO
SELECT * 
FROM employees
WHERE employee_id = 1;

SELECT *
FROM employees
WHERE first_name = "Spongebob";

SELECT *
FROM employees
WHERE hourly_pay >= 15.00;

SELECT *
FROM employees
WHERE hire_date <= "2023-01-03";

SELECT *
FROM employees
WHERE employee_id != 1;

SELECT *
FROM employees
WHERE hire_date IS NULL;

SELECT *
FROM employees
WHERE hire_date IS NOT NULL;

-- ATUALIZAR UM DADO ESPECÍFICO EM UMA TABELA
UPDATE employees
SET hourly_pay = 10.25
WHERE employee_id = 6;

UPDATE employees
SET hourly_pay = 10.25,
    hire_date = "2023-01-07"
WHERE employee_id = 6;

UPDATE employees
SET hire_date = NULL
WHERE employee_id = 6;

-- DELETAR TODOS OS DADOS EM UMA TABELA
DELETE FROM employees;

-- DELETAR UM DADO ESPECÍFICO EM UMA TABELA
DELETE FROM employees
WHERE employee_id = 6;

-- CRIAR UMA TABELA COM COLUNAS E TIPOS DE DADOS
CREATE TABLE time (
    employees_date DATE,
	employees_time TIME,
    employees_datetime DATETIME
);

SET AUTOCOMMIT = OFF;

COMMIT;

ROLLBACK;

-- INSERIR DADOS EM TODAS AS COLUNAS DE UMA TABELA DE ACORDO COM SEUS RESPECTIVOS TIPOS
INSERT INTO time
VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW());
