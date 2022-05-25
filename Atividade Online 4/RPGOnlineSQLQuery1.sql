--DDL
CREATE DATABASE RpgOnlineFst1
GO

USE RpgOnlineFst1
GO

CREATE LOGIN aluno
WITH PASSWORD = '1234'

CREATE USER aluno FOR LOGIN aluno

GRANT SELECT TO aluno

CREATE TABLE Usuarios(
	UsuarioId INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(50) NOT NULL
)
GO

CREATE TABLE Classes(
	ClasseId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)
GO

CREATE TABLE Personagens(
	PersonagemId INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(30) UNIQUE NOT NULL,
	UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseiD)
)
GO

CREATE TABLE Habilidades(
	HabilidadeId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL
)
GO

CREATE TABLE ClasseHabilidade(
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId),
	HabilidadeId INT FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
)


--DML
INSERT INTO Usuarios VALUES ('email@email.com', '123456')
INSERT INTO Classes VALUES ('Bárbaro', 'Descrição do Bárbaro')
INSERT INTO Habilidades VALUES ('Lança Mortal'), ('Escudo Supremo')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('DeuBug', 1, 1)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (1,1), (1,2)

INSERT INTO Usuarios VALUES ('email2@email.com', '123456')
INSERT INTO Classes VALUES ('Monge', 'Descrição do Monge')
INSERT INTO Habilidades VALUES ('Recuperar Vida')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('BitBug', 2, 2)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (2,2), (2,3)

select * from classes


select U.Email, P.NomePersonagem, C.Nome, H.Nome
from Usuarios as U join Personagens as P  on U.UsuarioId = P.PersonagemId
join Classes as C on P.PersonagemId = C.ClasseId
join ClasseHabilidade as CH on C.ClasseId = CH.ClasseId
join Habilidades as H on H.HabilidadeId = CH.HabilidadeId

select * from Usuarios

insert into Usuarios values ('louiskrad@email.com', '987654')
insert into Personagens (NomePersonagem, UsuarioId, ClasseId) values ('LouisKrad', 3, 1)
insert into ClasseHabilidade (ClasseId, HabilidadeId) values (1,1), (1,3)







UPDATE Usuarios
SET Senha = '654321'
WHERE UsuarioId = 1

update Habilidades
set Nome = 'Lança Mortal'
where HabilidadeId = 1

select Personagens.NomePersonagem from Personagens where Personagens.UsuarioId = 3

select Personagens.NomePersonagem, Habilidades.Nome from Personagens join Habilidades on ClasseId = 1

select Personagens.NomePersonagem, Habilidades.Nome from Personagens join Habilidades on Habilidades.HabilidadeId = 3

--DQL
SELECT P.NomePersonagem, C.Nome 'Nome da Classe', C.Descricao, Habilidades.Nome, U.Email
FROM Personagens AS P
JOIN Classes AS C ON P.ClasseId = C.ClasseId
JOIN Usuarios as U on P.UsuarioId = U.UsuarioId
join Habilidades on P.UsuarioId = U.UsuarioId

select Personagens.NomePersonagem, Habilidades.Nome from Personagens join Habilidades on PersonagemId = UsuarioId

select Habilidades.Nome from Habilidades join Personagens on Personagens.PersonagemId = 1


