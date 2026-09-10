DROP DATABASE IF EXISTS hospital;

CREATE DATABASE IF NOT EXISTS hospital;

USE hospital;

DROP TABLE IF EXISTS enfermeiro;
CREATE TABLE enfermeiro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    coren VARCHAR(20) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS triagem;
CREATE TABLE triagem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    peso DECIMAL(5,2),
    pressao VARCHAR(10),
    temperatura DECIMAL(4,1),
    id_paciente INT NOT NULL,
    id_enfermeiro INT NOT NULL,
    FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id)
);

DROP TABLE IF EXISTS especialidade;
CREATE TABLE especialidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS medico;
CREATE TABLE medico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    crm VARCHAR(20) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS medico_especialidade;
CREATE TABLE medico_especialidade (
    id_medico INT NOT NULL,
    id_especialidade INT NOT NULL,
    PRIMARY KEY (id_medico, id_especialidade),
    FOREIGN KEY (id_medico) REFERENCES medico(id),
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id)
);

DROP TABLE IF EXISTS consulta;
CREATE TABLE consulta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    id_medico INT NOT NULL,
    id_triagem INT NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES medico(id),
    FOREIGN KEY (id_triagem) REFERENCES triagem(id)
);

DROP TABLE IF EXISTS farmaceutico;
CREATE TABLE farmaceutico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cpf CHAR(11) UNIQUE NOT NULL,
    crf VARCHAR(20),
    nome VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS remedio;
CREATE TABLE remedio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    dosagem VARCHAR(50),
    apresentacao VARCHAR(50)
);

DROP TABLE IF EXISTS quarto;
CREATE TABLE quarto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(10) NOT NULL
);

DROP TABLE IF EXISTS internacao;
CREATE TABLE internacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATE NOT NULL,
    data_saida DATE,
    id_quarto INT NOT NULL,
    id_consulta INT NOT NULL,
    FOREIGN KEY (id_quarto) REFERENCES quarto(id),
    FOREIGN KEY (id_consulta) REFERENCES consulta(id)
);

DROP TABLE IF EXISTS evolucao;
CREATE TABLE evolucao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao TEXT,
    data DATE NOT NULL,
    id_internacao INT NOT NULL,
    id_medico INT NOT NULL,
    FOREIGN KEY (id_internacao) REFERENCES internacao(id),
    FOREIGN KEY (id_medico) REFERENCES medico(id)
);

DROP TABLE IF EXISTS receita;
CREATE TABLE receita (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    id_farmaceutico INT NOT NULL,
    id_consulta INT NOT NULL,
    id_enfermeiro INT NOT NULL,
    id_evolucao INT,
    FOREIGN KEY (id_farmaceutico) REFERENCES farmaceutico(id),
    FOREIGN KEY (id_consulta) REFERENCES consulta(id),
    FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id),
    FOREIGN KEY (id_evolucao) REFERENCES evolucao(id)
);

DROP TABLE IF EXISTS receita_remedio;
CREATE TABLE receita_remedio (
    id_receita INT NOT NULL,
    id_remedio INT NOT NULL,
    como_tomar VARCHAR(255),
    PRIMARY KEY (id_receita, id_remedio),
    FOREIGN KEY (id_receita) REFERENCES receita(id),
    FOREIGN KEY (id_remedio) REFERENCES remedio(id)
);
