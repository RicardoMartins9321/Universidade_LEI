GO

--- Apaga as tabelas se já existirem
IF OBJECT_ID('Conferencia_Comprovativo', 'U') IS NOT NULL 
	DROP TABLE Conferencia_Comprovativo;
IF OBJECT_ID('Conferencia_Estudante', 'U') IS NOT NULL 
	DROP TABLE Conferencia_Estudante;
IF OBJECT_ID('Conferencia_NaoEstudante', 'U') IS NOT NULL 
	DROP TABLE Conferencia_NaoEstudante;
IF OBJECT_ID('Conferencia_Participantes', 'U') IS NOT NULL 
	DROP TABLE Conferencia_Participantes;
IF OBJECT_ID('Conferencia_Artigo', 'U') IS NOT NULL 
	DROP TABLE Conferencia_Artigo;
IF OBJECT_ID('Conferencia_Autor', 'U') IS NOT NULL 
	DROP TABLE Conferencia_Autor;
IF OBJECT_ID('Conferencia_Instituicao', 'U') IS NOT NULL 
	DROP TABLE Conferencia_Instituicao;


CREATE TABLE Conferencia_Instituicao (
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(100) NOT NULL,

    PRIMARY KEY(Nome)
);

CREATE TABLE Conferencia_Autor (
    Email VARCHAR(100) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    NomeInstituicao VARCHAR(100) NOT NULL,

    PRIMARY KEY(Nome),
    FOREIGN KEY(NomeInstituicao) REFERENCES Conferencia_Instituicao(Nome)
);

CREATE TABLE Conferencia_Artigo (
    NumeroRegisto INT NOT NULL,
    Titulo VARCHAR(50) NOT NULL,
    NomeAutor VARCHAR(100) NOT NULL,

    PRIMARY KEY(NumeroRegisto),
    FOREIGN KEY(NomeAutor) REFERENCES Conferencia_Autor(Nome)
);

CREATE TABLE Conferencia_Participantes (
    Nome VARCHAR(100) NOT NULL,
    Morada VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DataInscricao DATE NOT NULL,
    NomeInstituicao VARCHAR(100) NOT NULL,

    PRIMARY KEY(Nome),
    FOREIGN KEY(NomeInstituicao) REFERENCES Conferencia_Instituicao(Nome)
);

CREATE TABLE Conferencia_NaoEstudante (
    Nome VARCHAR(100) NOT NULL PRIMARY KEY REFERENCES Conferencia_Participantes(Nome),
    Referencia VARCHAR(100) NOT NULL,
    NomeInstituicao VARCHAR(100) NOT NULL,

    FOREIGN KEY(NomeInstituicao) REFERENCES Instituicao(Nome)
);

CREATE TABLE Conferencia_Estudante (
    Nome VARCHAR(100) NOT NULL,
    NomeInstituicao VARCHAR(100) NOT NULL,

    PRIMARY KEY (Nome),
    FOREIGN KEY (Nome) REFERENCES Conferencia_Participantes(Nome),
    FOREIGN KEY (NomeInstituicao) REFERENCES Conferencia_Instituicao(Nome)
);

CREATE TABLE Conferencia_Comprovativo (
    Localizacao VARCHAR(100) NOT NULL,
    NomeInstituicao VARCHAR(100) NOT NULL,
    NomeEstudante VARCHAR(100) NOT NULL,

    PRIMARY KEY (Localizacao),
    FOREIGN KEY (NomeInstituicao) REFERENCES Conferencia_Instituicao(Nome),
    FOREIGN KEY (NomeEstudante) REFERENCES Conferencia_Estudante(Nome)
);