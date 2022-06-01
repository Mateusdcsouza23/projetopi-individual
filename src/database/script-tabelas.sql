-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
CREATE DATABASE acquatec;

USE acquatec;
create database sccp;
use sccp;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fkVoto int,
    foreign key (fkVoto) references votos (id)
); 


create table votos (
id int primary key,
voto varchar (50)
);

insert into votos values 
('1', 'EMELEC 0X0 CORINTHIANS'),
('2', 'CORINTHIANS 3X0 EMELEC'),
('3', 'VASCO 0X0 CORINTHIANS'),
('4', 'CORINTHIANS 1X0 VASCO'),
('5', 'SANTOS 0X1 CORINTHIANS'),
('6', 'CORINTHIANS 1X1 SANTOS'),
('7', 'BOCA JUNIROS 1X1 CORINTHIANS'),
('8', 'CORINTHIANS 1X1 BOCA JUNIORS');

insert into usuario values 
(null, 'Mateus', 'mateus@sp.com', '1235',1),
(null, 'Lucas', 'lucas@sp.com', '1235',1),
(null, 'Rodrigo', 'rodrigo@sp.com', '1235',2),
(null, 'Marcos', 'marcos@sp.com', '123456789',2),
(null, 'Pedro', 'pedrin@sp.com', '12345678',3),
(null, 'Luigi', 'luigi@sp.com', '1234567',4),
(null, 'Edu', 'edu@sp.com', '123456',5),
(null, 'Larissa', 'larissa@sp.com', '12345',6),
(null, 'Joaquim', 'joca@sp.com', '1234',7),
(null, 'Wilker', 'wilker@sp.com', '121212',8),
(null, 'Marlom', 'marlom@sp.com', '121212',8),
(null, 'Petri', 'petri@sp.com', '121212',8);

select * from usuario, votos where fkVoto = votos.id; 
select * from usuario;


select votos.voto, count(usuario.id) from usuario join votos on usuario.fkVoto = votos.id group by votos.voto; 

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	temperatura DOUBLE,
	umidade DOUBLE,
	momento DATETIME,
	fk_aquario INT
);




/* para sql server - remoto - produção */

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	temperatura DECIMAL,
	umidade DECIMAL,
	momento DATETIME,
	fk_aquario INT
);


