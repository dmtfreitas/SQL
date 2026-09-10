DROP DATABASE IF EXISTS library;

CREATE DATABASE IF NOT EXISTS library;

USE library;

CREATE TABLE autor (
    IdAutor SMALLINT IDENTITY,
    NomeAutor VARCHAR(50) NOT NULL,
    SobrenomeAutor VARCHAR(60) NOT NULL,
    CONSTRAINT pk_id_autor PRIMARY KEY(IdAutor)
);

CREATE TABLE editora (
    IdEditora SMALLINT PRIMARY KEY IDENTITY,
    NomeEditora VARCHAR(50) NOT NULL
);

CREATE TABLE assunto (
    IdAssunto TINYINT PRIMARY KEY IDENTITY,
    NomeAssunto VARCHAR(25) NOT NULL
);

CREATE TABLE livro (
    IdLivro SMALLINT NOT NULL PRIMARY KEY IDENTITY(100,1),
    NomeLivro VARCHAR(70) NOT NULL,
    ISBN13 CHAR(13) UNIQUE NOT NULL,
    DataPub DATE,
    PrecoLivro MONEY NOT NULL,
    NumeroPaginas SMALLINT NOT NULL,
    IdEditora SMALLINT NOT NULL,
    IdAssunto TINYINT NOT NULL,
    CONSTRAINT fk_id_editora FOREIGN KEY(IdEditora) REFERENCES editora(IdEditora) ON DELETE CASCADE,
    CONSTRAINT fk_id_assunto FOREIGN KEY(IdAssunto) REFERENCES assunto(IdAssunto) ON DELETE CASCADE,
    CONSTRAINT verifica_preco CHECK(PrecoLivro >= 0)
);

CREATE TABLE livroautor (
    IdLivro SMALLINT NOT NULL,
    IdAutor SMALLINT NOT NULL,
    CONSTRAINT fk_id_livro FOREIGN KEY(IdLivro) REFERENCES livro(IdLivro),
    CONSTRAINT fk_id_autor FOREIGN KEY(IdAutor) REFERENCES autor(IdAutor)
);

sp_help autor;
sp_help editora;
sp_help assunto;
sp_help livro;
sp_help livroautor;

SELECT name FROM biblioteca.sys.tables;

INSERT INTO autor (NomeAutor, SobrenomeAutor) VALUES
('George', 'Orwell'),
('J.K.', 'Rowling'),
('J.R.R.', 'Tolkien'),
('Machado', 'de Assis'),
('Clarice', 'Lispector'),
('Stephen', 'King'),
('Dan', 'Brown'),
('Agatha', 'Christie'),
('Paulo', 'Coelho'),
('Yuval', 'Harari'),
('Arthur', 'Conan Doyle'),
('Rick', 'Riordan'),
('Suzanne', 'Collins'),
('C.S.', 'Lewis'),
('Jane', 'Austen'),
('Victor', 'Hugo'),
('Fiódor', 'Dostoiévski'),
('Mary', 'Shelley'),
('Bram', 'Stoker'),
('Neil', 'Gaiman');

INSERT INTO editora (NomeEditora) VALUES
('Companhia das Letras'),
('Rocco'),
('HarperCollins'),
('Intrinseca'),
('Sextante'),
('Saraiva'),
('Atlas'),
('Penguin'),
('Record'),
('DarkSide'),
('Globo Livros'),
('Aleph'),
('Nova Fronteira'),
('Leya'),
('Planeta'),
('Objetiva'),
('Arqueiro'),
('Martin Claret'),
('Civilizacao Brasileira'),
('Bookman');

INSERT INTO assunto (NomeAssunto) VALUES
('Fantasia'),
('Romance'),
('Suspense'),
('Terror'),
('Ficcao'),
('Historia'),
('Tecnologia'),
('Filosofia'),
('Aventura'),
('Drama'),
('Investigacao'),
('Distopia'),
('Biografia'),
('Mitologia'),
('Educacao'),
('Autoajuda'),
('Religiao'),
('Politica'),
('Psicologia'),
('Ciencia');

INSERT INTO livro (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdEditora, IdAssunto) VALUES
('1984', '9788535914849', '1949-06-08', 39.90, 328, 1, 12),
('Harry Potter e a Pedra Filosofal', '9788532511010', '1997-06-26', 59.90, 264, 2, 1),
('O Senhor dos Aneis', '9788533613379', '1954-07-29', 89.90, 1200, 3, 1),
('Dom Casmurro', '9788572326971', '1899-01-01', 24.90, 256, 18, 10),
('A Hora da Estrela', '9788532520661', '1977-10-01', 29.90, 96, 1, 10),
('It: A Coisa', '9788556510785', '1986-09-15', 79.90, 1104, 10, 4),
('O Codigo Da Vinci', '9788575421130', '2003-03-18', 44.90, 480, 17, 3),
('Assassinato no Expresso Oriente', '9788525432964', '1934-01-01', 34.90, 240, 9, 11),
('O Alquimista', '9788576653721', '1988-01-01', 29.90, 208, 5, 16),
('Sapiens', '9788525432186', '2011-01-01', 69.90, 472, 15, 6),
('Sherlock Holmes: Um Estudo em Vermelho', '9788594318602', '1887-01-01', 27.90, 224, 18, 11),
('Percy Jackson e o Ladrao de Raios', '9788598078397', '2005-06-28', 39.90, 400, 2, 14),
('Jogos Vorazes', '9788579800245', '2008-09-14', 49.90, 400, 14, 12),
('As Cronicas de Narnia', '9788578270698', '1956-10-16', 59.90, 752, 3, 1),
('Orgulho e Preconceito', '9788544001820', '1813-01-28', 32.90, 424, 18, 2),
('Os Miseraveis', '9788544001059', '1862-01-01', 74.90, 1512, 18, 10),
('Crime e Castigo', '9788573266462', '1866-01-01', 49.90, 592, 18, 8),
('Frankenstein', '9788594318237', '1818-01-01', 28.90, 288, 10, 4),
('Dracula', '9788544002100', '1897-01-01', 36.90, 418, 18, 4),
('Deuses Americanos', '9788551001288', '2001-06-19', 54.90, 576, 3, 14),
('A Revolucao dos Bichos', '9780451526342', '1945-08-17', 34.90, 152, 1, 12),
('Na Pior em Paris e Londres', '9780156628709', '1933-01-09', 42.90, 213, 1, 10),
('Harry Potter e a Camara Secreta', '9788532512062', '1998-07-02', 64.90, 288, 2, 1),
('Harry Potter e o Prisioneiro de Azkaban', '9788532512079', '1999-07-08', 69.90, 348, 2, 1),
('Animais Fantasticos', '9781338132311', '2001-03-01', 39.90, 128, 2, 1),
('O Hobbit', '9780261103344', '1937-09-21', 49.90, 310, 3, 1),
('Silmarillion', '9780618391110', '1977-09-15', 59.90, 365, 3, 1),
('Memorias Postumas de Bras Cubas', '9788572329996', '1881-01-01', 29.90, 224, 18, 10),
('Perto do Coracao Selvagem', '9788532505552', '1943-12-01', 31.90, 208, 1, 10),
('Agua Viva', '9788532508904', '1973-01-01', 27.90, 96, 1, 10),
('O Iluminado', '9780307743657', '1977-01-28', 49.90, 447, 10, 4),
('Cemiterio Maldito', '9780307743671', '1983-11-14', 54.90, 374, 10, 4),
('Carrie', '9780307743664', '1974-04-05', 39.90, 199, 10, 4),
('Doutor Sono', '9781476727653', '2013-09-24', 59.90, 531, 10, 4),
('Anjos e Demonios', '9781416524793', '2000-05-01', 44.90, 616, 17, 3),
('Inferno', '9781400079155', '2013-05-14', 49.90, 480, 17, 3),
('Morte no Nilo', '9780062073556', '1937-11-01', 36.90, 333, 9, 11),
('E Nao Sobrou Nenhum', '9780062073488', '1939-11-06', 38.90, 264, 9, 11),
('Brida', '9780061762703', '1990-01-01', 29.90, 288, 5, 16),
('O Cao dos Baskervilles', '9788572327428', '1902-01-01', 32.90, 256, 18, 11),
('Mar de Monstros', '9781423103349', '2006-04-01', 42.90, 320, 2, 14),
('A Maldicao do Tita', '9781423101482', '2007-05-01', 44.90, 312, 2, 14),
('Em Chamas', '9780439023498', '2009-09-01', 54.90, 391, 14, 12),
('O Leao, a Feiticeira e o Guarda-Roupa', '9780064471046', '1950-10-16', 39.90, 208, 3, 1),
('Principe Caspian', '9780064471053', '1951-10-15', 41.90, 240, 3, 1),
('Razao e Sensibilidade', '9780141439662', '1811-01-01', 34.90, 368, 18, 2),
('O Corcunda de Notre-Dame', '9780140443530', '1831-01-14', 64.90, 940, 18, 10),
('O Idiota', '9780140447927', '1869-01-01', 57.90, 656, 18, 8),
('O Ultimo Homem', '9780486440972', '1826-01-01', 43.90, 512, 10, 4),
('A Joia das Sete Estrelas', '9781909436497', '1903-01-01', 35.90, 320, 18, 4),
('Coraline', '9780380807345', '2002-08-04', 33.90, 192, 3, 14),
('Lugar Nenhum', '9780380789016', '1996-09-16', 47.90, 370, 3, 14);

INSERT INTO livroautor (IdLivro, IdAutor) VALUES
(100, 1),
(101, 2),
(102, 3),
(103, 4),
(104, 5),
(105, 6),
(106, 7),
(107, 8),
(108, 9),
(109, 10),
(110, 11),
(111, 12),
(112, 13),
(113, 14),
(114, 15),
(115, 16),
(116, 17),
(117, 18),
(118, 19),
(119, 20);
(120, 1),
(121, 1),
(122, 2),
(123, 2),
(124, 2),
(125, 3),
(126, 3),
(127, 4),
(128, 5),
(129, 5),
(130, 6),
(131, 6),
(132, 6),
(133, 6),
(134, 7),
(135, 7),
(136, 8),
(137, 8),
(138, 9),
(139, 11),
(140, 12),
(141, 12),
(142, 13),
(143, 14),
(144, 14),
(145, 15),
(146, 16),
(147, 17),
(148, 18),
(149, 19),
(150, 20),
(151, 20);

SELECT editora.NomeEditora,
    assunto.NomeAssunto
FROM livro
INNER JOIN editora ON editora.IdEditora = livro.IdEditora
INNER JOIN assunto ON assunto.IdAssunto = livro.IdAssunto;

SELECT AUTOR.NomeAutor,
    LIVRO.NomeLivro 
FROM livroautor AS LIVROAUTOR
INNER JOIN livro AS LIVRO ON LIVRO.IdLivro = LIVROAUTOR.IdLivro
INNER JOIN autor AS AUTOR ON AUTOR.IdAutor = LIVROAUTOR.IdAutor;

SELECT TOP 100 AUTOR.NomeAutor,
    LIVRO.NomeLivro
FROM livroautor AS LIVROAUTOR
INNER JOIN livro AS LIVRO ON LIVRO.IdLivro = LIVROAUTOR.IdLivro
INNER JOIN autor AS AUTOR ON AUTOR.IdAutor = LIVROAUTOR.IdAutor;

DECLARE @QUANTITY INT = 100;
SELECT TOP (@QUANTITY) AUTOR.NomeAutor,
    LIVRO.NomeLivro
FROM livroautor AS LIVROAUTOR
INNER JOIN livro AS LIVRO ON LIVRO.IdLivro = LIVROAUTOR.IdLivro
INNER JOIN autor AS AUTOR ON AUTOR.IdAutor = LIVROAUTOR.IdAutor;

DECLARE @QUANTITY INT = 100;
SELECT TOP (@QUANTITY) AUTOR.NomeAutor,
	SUM(LIVRO.NumeroPaginas) AS TotalPaginas
FROM livroautor AS LIVROAUTOR
INNER JOIN livro AS LIVRO ON LIVRO.IdLivro = LIVROAUTOR.IdLivro
INNER JOIN autor AS AUTOR ON AUTOR.IdAutor = LIVROAUTOR.IdAutor
GROUP BY AUTOR.IdAutor, AUTOR.NomeAutor
ORDER BY AUTOR.IdAutor ASC;