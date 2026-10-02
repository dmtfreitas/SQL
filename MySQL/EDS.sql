DROP DATABASE IF EXISTS EDS;

CREATE DATABASE IF NOT EXISTS EDS;

USE EDS;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    image VARCHAR(255),
    date_publication DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

DROP TABLE IF EXISTS courses_users;
CREATE TABLE courses_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    progress ENUM('0', '25', '50', '75', '100') NOT NULL DEFAULT '0',
	observation ENUM('not started', 'started', 'half the course', 'almost complete', 'complete') NOT NULL DEFAULT 'not started',
    CONSTRAINT courses_users_ibfk_1 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT courses_users_ibfk_2 FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
	CONSTRAINT courses_users_ibfk_3 UNIQUE (user_id, course_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO courses (title, description, image, date_publication) VALUES
('Lógica de Programação Computacional', 'Curso introdutório de pensamento lógico digital', 'images/pensamento_logico.png', CURRENT_DATE()),
('Programação em Python, variáveis, listas, estruturas condicionais', 'Aprenda os conceitos fundamentais de Python', 'images/programacao_python.png', CURRENT_DATE()),
('Defesa Cibernética', 'Como se proteger e como lidar com ameaças digitais', 'images/defesa_cibernetica.png', CURRENT_DATE()),
('HTML e CSS para Iniciantes', 'Aprenda a criar páginas web utilizando HTML e CSS', 'images/html_css.png', CURRENT_DATE()),
('JavaScript Básico', 'Introdução à programação utilizando JavaScript', 'images/javascript.png', CURRENT_DATE()),
('Banco de Dados MySQL', 'Aprenda conceitos fundamentais de bancos de dados relacionais', 'images/mysql.png', CURRENT_DATE()),
('SQL para Iniciantes', 'Aprenda comandos básicos para consultar e manipular dados', 'images/sql.png', CURRENT_DATE()),
('Git e GitHub', 'Aprenda controle de versão e colaboração utilizando Git e GitHub', 'images/git_github.png', CURRENT_DATE()),
('Lógica de Programação Avançada', 'Aprofunde seus conhecimentos em algoritmos e estruturas lógicas', 'images/logica_avancada.png', CURRENT_DATE()),
('Estruturas de Dados', 'Introdução a listas, filas, pilhas e outras estruturas de dados', 'images/estruturas_dados.png', CURRENT_DATE()),
('Programação Orientada a Objetos', 'Aprenda os conceitos de classes, objetos, herança e encapsulamento', 'images/poo.png', CURRENT_DATE()),
('Desenvolvimento Web', 'Conheça os principais conceitos do desenvolvimento para a web', 'images/desenvolvimento_web.png', CURRENT_DATE()),
('Introdução à Inteligência Artificial', 'Conceitos básicos de inteligência artificial e aprendizado de máquina', 'images/inteligencia_artificial.png', CURRENT_DATE()),
('Redes de Computadores', 'Aprenda conceitos fundamentais sobre redes e comunicação de dados', 'images/redes.png', CURRENT_DATE()),
('Segurança da Informação', 'Conceitos fundamentais de segurança e proteção de informações', 'images/seguranca_informacao.png', CURRENT_DATE()),
('Linux para Iniciantes', 'Conheça os principais comandos e conceitos do sistema Linux', 'images/linux.png', CURRENT_DATE()),
('Algoritmos e Estruturas de Repetição', 'Aprenda a desenvolver algoritmos utilizando estruturas de repetição', 'images/algoritmos.png', CURRENT_DATE()),
('Desenvolvimento de APIs', 'Introdução ao desenvolvimento e consumo de APIs', 'images/apis.png', CURRENT_DATE()),
('Introdução ao Desenvolvimento Mobile', 'Conheça conceitos básicos do desenvolvimento de aplicativos mobile', 'images/mobile.png', CURRENT_DATE()),
('Boas Práticas de Programação', 'Aprenda técnicas para escrever códigos mais organizados e eficientes', 'images/boas_praticas.png', CURRENT_DATE());

INSERT INTO users (name, email, password) VALUES
('Ana Silva', 'ana.silva@email.com', 'senha123'),
('Bruno Santos', 'bruno.santos@email.com', 'senha456'),
('Carlos Oliveira', 'carlos.oliveira@email.com', 'senha789'),
('Daniel Almeida', 'daniel.almeida@email.com', 'daniel123'),
('Eduarda Costa', 'eduarda.costa@email.com', 'eduarda456'),
('Fernanda Souza', 'fernanda.souza@email.com', 'fernanda789'),
('Gabriel Lima', 'gabriel.lima@email.com', 'gabriel123'),
('Helena Martins', 'helena.martins@email.com', 'helena456'),
('Igor Pereira', 'igor.pereira@email.com', 'igor789'),
('Juliana Rocha', 'juliana.rocha@email.com', 'juliana123');

INSERT INTO courses_users (user_id, course_id, progress, observation) VALUES
(1, 1, '100', 'complete'),
(1, 2, '75', 'almost complete'),
(1, 3, '50', 'half the course'),
(1, 4, '25', 'started'),
(1, 5, '0', 'not started'),
(2, 1, '50', 'half the course'),
(2, 3, '100', 'complete'),
(2, 6, '75', 'almost complete'),
(2, 7, '25', 'started'),
(2, 8, '0', 'not started'),
(3, 2, '100', 'complete'),
(3, 4, '75', 'almost complete'),
(3, 5, '50', 'half the course'),
(3, 9, '25', 'started'),
(3, 10, '0', 'not started'),
(4, 1, '25', 'started'),
(4, 3, '75', 'almost complete'),
(4, 6, '100', 'complete'),
(4, 11, '50', 'half the course'),
(4, 12, '0', 'not started'),
(5, 2, '50', 'half the course'),
(5, 4, '100', 'complete'),
(5, 7, '75', 'almost complete'),
(5, 13, '25', 'started'),
(5, 14, '0', 'not started'),
(6, 1, '75', 'almost complete'),
(6, 5, '100', 'complete'),
(6, 8, '50', 'half the course'),
(6, 10, '25', 'started'),
(6, 15, '0', 'not started'),
(7, 3, '25', 'started'),
(7, 6, '50', 'half the course'),
(7, 9, '100', 'complete'),
(7, 12, '75', 'almost complete'),
(7, 16, '0', 'not started'),
(8, 2, '75', 'almost complete'),
(8, 4, '50', 'half the course'),
(8, 7, '100', 'complete'),
(8, 11, '25', 'started'),
(8, 17, '0', 'not started'),
(9, 1, '0', 'not started'),
(9, 5, '25', 'started'),
(9, 8, '75', 'almost complete'),
(9, 13, '100', 'complete'),
(9, 18, '50', 'half the course'),
(10, 3, '50', 'half the course'),
(10, 6, '0', 'not started'),
(10, 9, '75', 'almost complete'),
(10, 14, '100', 'complete'),
(10, 19, '25', 'started');