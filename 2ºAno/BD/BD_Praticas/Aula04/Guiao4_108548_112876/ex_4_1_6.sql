GO

--- Apaga as tabelas se já existirem

IF OBJECT_ID('ATL_Atividade', 'U') IS NOT NULL
    DROP TABLE ATL_Atividade;
IF OBJECT_ID('ATL_Turma', 'U') IS NOT NULL
    DROP TABLE ATL_Turma;
IF OBJECT_ID('ATL_Autorizacao', 'U') IS NOT NULL
    DROP TABLE ATL_Autorizacao;
IF OBJECT_ID('ATL_Adulto_Relacionado', 'U') IS NOT NULL
    DROP TABLE ATL_Adulto_Relacionado;
IF OBJECT_ID('ATL_Aluno', 'U') IS NOT NULL
    DROP TABLE ATL_Aluno;
IF OBJECT_ID('ATL_Professor', 'U') IS NOT NULL
    DROP TABLE ATL_Professor;


CREATE TABLE ATL_Professor (
    Num_func    int             NOT NULL    PRIMARY KEY,
    CC          int             NOT NULL,
    Nome        varchar(128)    NOT NULL,
    Email       varchar(128)    NOT NULL,
    Morada      varchar(128)    NOT NULL,
    Telefone    int             NOT NULL,
    Data_Nasc   date            NOT NULL,
    Turma       int             NOT NULL,
);

CREATE TABLE ATL_Aluno (
    CC          int             NOT NULL    PRIMARY KEY,
    Nome        varchar(128)    NOT NULL,
    Morada      varchar(128)    NOT NULL,
    Data_Nasc   date            NOT NULL,
);

CREATE TABLE ATL_Adulto_Relacionado (
    CC          int             NOT NULL    PRIMARY KEY,
    Nome        varchar(128)    NOT NULL,
    Email       varchar(128)    NOT NULL,
    Telefone    int             NOT NULL,
    Data_Nasc   date            NOT NULL,
    Aluno       int             NOT NULL    REFERENCES ATL_Aluno(CC),
);

CREATE TABLE ATL_Autorizacao (
    Adult_Relac int             NOT NULL    REFERENCES ATL_Adulto_Relacionado(CC),
    Aluno       int             NOT NULL    REFERENCES ATL_Aluno(CC),
);

CREATE TABLE ATL_Turma (
    ID          int             NOT NULL    PRIMARY KEY,
    Designacao  varchar(128)    NOT NULL,
    Ano_lec     int             NOT NULL,
    Max_alunos  int             NOT NULL,
    Aluno       int             NOT NULL    REFERENCES ATL_Aluno(CC),
    Professor   int             NOT NULL    REFERENCES ATL_Professor(Num_func),
);

CREATE TABLE ATL_Atividade (
    ID          int             NOT NULL    PRIMARY KEY,
    Designacao  varchar(128)    NOT NULL,
    Custo       int             NOT NULL,
    Turma       int             NOT NULL    REFERENCES ATL_Turma(ID),
);
