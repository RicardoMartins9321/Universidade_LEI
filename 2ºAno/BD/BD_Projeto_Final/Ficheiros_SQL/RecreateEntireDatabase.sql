/* Depois de criado a base de dados e o schema pela primeira vez comentar as linhas de código correspondentes,
    caso queira voltar a recriar e colocar as tabelas, valores bases e objetos SQL.*/
USE master
GO
if exists (select * from sysdatabases where name='Project')
		drop database Project
go

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE Project
  ON PRIMARY (NAME = N''Project'', FILENAME = N''' + @device_directory + N'Project.mdf'')
  LOG ON (NAME = N''Project_log'',  FILENAME = N''' + @device_directory + N'Project.ldf'')')
go


USE Project
GO
-- Apagar o AMS schema se já existir
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'AMS')
BEGIN
    DROP SCHEMA AMS;
END;
GO

-- Criar o schema AMS
CREATE SCHEMA AMS;
GO

-- Apagar os constraints das foreign keys para cada tabela para depois poder apagar as tabelas em si
IF OBJECT_ID('AMS.User_club_relation', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.User_club_relation DROP CONSTRAINT IF EXISTS FK_AMS_User_club_relation_User;
    ALTER TABLE AMS.User_club_relation DROP CONSTRAINT IF EXISTS FK_AMS_User_club_relation_Club;
END
IF OBJECT_ID('AMS.Athlete_Competition', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.Athlete_Competition DROP CONSTRAINT IF EXISTS FK_AMS_Athlete_Competition_Athlete;
    ALTER TABLE AMS.Athlete_Competition DROP CONSTRAINT IF EXISTS FK_AMS_Athlete_Competition_Competition;
    ALTER TABLE AMS.Athlete_Competition DROP CONSTRAINT IF EXISTS FK_AMS_Athlete_Competition_Club;
END
IF OBJECT_ID('AMS.Coach_Athlete', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.Coach_Athlete DROP CONSTRAINT IF EXISTS FK_AMS_Coach_Athlete_Coach;
    ALTER TABLE AMS.Coach_Athlete DROP CONSTRAINT IF EXISTS FK_AMS_Coach_Athlete_Athlete;
END
IF OBJECT_ID('AMS.Session_Series', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.Session_Series DROP CONSTRAINT IF EXISTS FK_AMS_Session_Series_Session;
    ALTER TABLE AMS.Session_Series DROP CONSTRAINT IF EXISTS FK_AMS_Session_Series_Series;
END
IF OBJECT_ID('AMS.Series', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.Series DROP CONSTRAINT IF EXISTS FK_AMS_Series_Session;
END
IF OBJECT_ID('AMS.Training_sessions', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.Training_sessions DROP CONSTRAINT IF EXISTS FK_AMS_Training_sessions_Athlete;
    ALTER TABLE AMS.Training_sessions DROP CONSTRAINT IF EXISTS FK_AMS_Training_sessions_Club;
END
IF OBJECT_ID('AMS.Invitations', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.Invitations DROP CONSTRAINT IF EXISTS FK_AMS_Invitations_User;
    ALTER TABLE AMS.Invitations DROP CONSTRAINT IF EXISTS FK_AMS_Invitations_Club;
END
IF OBJECT_ID('AMS.User_permissions', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.User_permissions DROP CONSTRAINT IF EXISTS FK_AMS_User_permissions_User;
    ALTER TABLE AMS.User_permissions DROP CONSTRAINT IF EXISTS FK_AMS_User_permissions_Permissions;
END
IF OBJECT_ID('AMS.Athlete', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.Athlete DROP CONSTRAINT IF EXISTS FK_AMS_Athlete_User;
END
IF OBJECT_ID('AMS.Coach', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.Coach DROP CONSTRAINT IF EXISTS FK_AMS_Coach_User;
END
IF OBJECT_ID('AMS.Admin', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.Admin DROP CONSTRAINT IF EXISTS FK_AMS_Admin_User;
END
IF OBJECT_ID('AMS.Partner', 'U') IS NOT NULL
BEGIN
    ALTER TABLE AMS.Partner DROP CONSTRAINT IF EXISTS FK_AMS_Partner_User;
END

-- Apagar as tabelas
IF OBJECT_ID('AMS.User_club_relation', 'U') IS NOT NULL
    DROP TABLE AMS.User_club_relation;
IF OBJECT_ID('AMS.Invitations', 'U') IS NOT NULL
    DROP TABLE AMS.Invitations;
IF OBJECT_ID('AMS.Athlete_Competition', 'U') IS NOT NULL
    DROP TABLE AMS.Athlete_Competition;
IF OBJECT_ID('AMS.Calendar_events', 'U') IS NOT NULL
    DROP TABLE AMS.Calendar_events;
IF OBJECT_ID('AMS.Coach_Athlete', 'U') IS NOT NULL
    DROP TABLE AMS.Coach_Athlete;
IF OBJECT_ID('AMS.User_permissions', 'U') IS NOT NULL
    DROP TABLE AMS.User_permissions;
IF OBJECT_ID('AMS.Session_Series', 'U') IS NOT NULL
    DROP TABLE AMS.Session_Series;
IF OBJECT_ID('AMS.Series', 'U') IS NOT NULL
    DROP TABLE AMS.Series;
IF OBJECT_ID('AMS.Training_sessions', 'U') IS NOT NULL
    DROP TABLE AMS.Training_sessions;
IF OBJECT_ID('AMS.Competition', 'U') IS NOT NULL
    DROP TABLE AMS.Competition;
IF OBJECT_ID('AMS.Athlete', 'U') IS NOT NULL
    DROP TABLE AMS.Athlete;
IF OBJECT_ID('AMS.Coach', 'U') IS NOT NULL
    DROP TABLE AMS.Coach;
IF OBJECT_ID('AMS.Admin', 'U') IS NOT NULL
    DROP TABLE AMS.Admin;
IF OBJECT_ID('AMS.Partner', 'U') IS NOT NULL
    DROP TABLE AMS.Partner;
IF OBJECT_ID('AMS.[User]', 'U') IS NOT NULL
    DROP TABLE AMS.[User];
IF OBJECT_ID('AMS.Club', 'U') IS NOT NULL
    DROP TABLE AMS.Club;
IF OBJECT_ID('AMS.Permissions', 'U') IS NOT NULL
    DROP TABLE AMS.Permissions;


CREATE TABLE AMS.Club (
    ID					INT				IDENTITY(1,1)   PRIMARY KEY,
    name		        VARCHAR(100)	NOT NULL,
    acronym		        VARCHAR(20)	    NOT NULL	    UNIQUE,
    location 		    VARCHAR(100)	NOT NULL,
    founding_date	    DATE		    NOT NULL,
    num_of_athletes	    INT		        NOT NULL,
    membership_requests INT,
    photo_gallery       VARBINARY(MAX),             -- Para armazenar imagem do clube
    resources 		    VARCHAR(MAX)	 			-- Para armazenar URLs de recursos compartilhados como videos, instragram reels, facebook posts
);


CREATE TABLE AMS.[User] (
    ID		        INT 		    IDENTITY(1,1)	PRIMARY KEY,
    first_name	    VARCHAR(20)	    NOT NULL		CHECK (LEN(first_name) > 0),
    last_name	    VARCHAR(20)	    NOT NULL		CHECK (LEN(last_name) > 0),
    birth_date	    DATE 		    NOT NULL,
    sex 	        CHAR(1) 	    NOT NULL,
    email 	        VARCHAR(100) 	NOT NULL        UNIQUE,
    password 	    VARBINARY(128) 	NOT NULL,
    salary 	        DECIMAL(10,2),
    Imagem 	        VARBINARY(MAX),     -- Para armazenar a imagem de perfil do utilizador
    club_ID 	    INT, 				-- Referência para o clube ao qual o utilizador pertence, se aplicavel
    email_checked 	BIT,

    CONSTRAINT FK_User_Club FOREIGN KEY (club_ID) REFERENCES AMS.Club(ID)
);

CREATE TABLE AMS.Athlete (
    user_ID 		INT 		    PRIMARY KEY,
    CC			    INT		        NOT NULL    UNIQUE  CHECK (CC > 0 AND LEN(CC) = 8),
    height 	        DECIMAL(5, 2)   NOT NULL            CHECK (height > 0),
    weight 	        DECIMAL(5, 2)   NOT NULL            CHECK (weight > 0),

    CONSTRAINT FK_Athlete_User FOREIGN KEY (user_ID) REFERENCES AMS.[User](ID)
);

CREATE TABLE AMS.Coach (
    user_ID		    INT 		PRIMARY KEY,
    qualifications	TEXT		NOT NULL,

    CONSTRAINT FK_Coach_User FOREIGN KEY (user_ID) REFERENCES AMS.[User](ID)
);

CREATE TABLE AMS.Admin (
    user_ID		    INT 		PRIMARY KEY,
    qualifications	TEXT		NOT NULL,

    CONSTRAINT FK_Admin_User FOREIGN KEY (user_ID) REFERENCES AMS.[User](ID)
);

CREATE TABLE AMS.Partner (
    user_ID 		INT 		PRIMARY KEY,
	Partner_number  int		NOT NULL    UNIQUE  CHECK (Partner_number > 0),

    CONSTRAINT FK_Partner_User FOREIGN KEY (user_ID) REFERENCES AMS.[User](ID)
);

CREATE TABLE AMS.Coach_Athlete (
    coach_ID    INT,
    athlete_ID  INT,
    PRIMARY KEY (coach_ID, athlete_ID),
    CONSTRAINT FK_Coach_Athlete_Coach FOREIGN KEY (coach_ID) REFERENCES AMS.Coach(user_ID),
    CONSTRAINT FK_Coach_Athlete_Athlete FOREIGN KEY (athlete_ID) REFERENCES AMS.Athlete(user_ID)
);


CREATE TABLE AMS.User_club_relation (
    user_ID 		INT 		    NOT NULL,
    club_ID 		INT 		    NOT NULL,
    role            VARCHAR(20)     NOT NULL CHECK (role IN ('admin', 'coach', 'athlete', 'partner')),
    --status: ativo dentro do clube ou ent o inativo porque já saiu do clube, ou então pendente de ter o seu registe aceite
    status          VARCHAR(20)     NOT NULL CHECK (status IN ('active', 'inactive', 'pending')),
    is_trusted      BIT     		NOT NULL DEFAULT 0, -- Indica se o utilizador é confiável, e se os seus dados devem ser introduzidos automaticamente ou esperar por aprovacao
    joined_date 	DATE,       				        -- Joined date for the user in the club
    left_date   	DATE,       				        -- Date when the user left the club

    PRIMARY KEY (user_ID, club_ID),
    CONSTRAINT FK_User_club_relation_User FOREIGN KEY (user_ID) REFERENCES AMS.[User](ID),
    CONSTRAINT FK_User_club_relation_Club FOREIGN KEY (club_ID) REFERENCES AMS.Club(ID)
);


-- Convites do lado do clube para o user
CREATE TABLE AMS.Invitations (
    ID 			    INT 		    IDENTITY(1,1)	PRIMARY KEY,
    sender_ID 		INT 		    NOT NULL, 	-- ID do utilizador que enviou o convite
    recipient_email VARCHAR(100) 	NOT NULL, 	-- Email do destinatario do convite
    club_ID 		INT 		    NOT NULL, 	-- ID do clube associado ao convite
    role 		    VARCHAR(15) 	NOT NULL    CHECK (role IN ('athlete', 'coach', 'admin', 'partner')), 	-- Papel proposto para o destinatario (atleta, treinador, etc.)
    status 		    VARCHAR(15) 	NOT NULL, 	CHECK (status IN ('pending', 'accepted', 'declined')),  -- Status do convite (pendente, aceito, recusado)

    CONSTRAINT FK_Invitations_User FOREIGN KEY (sender_ID) REFERENCES AMS.[User](ID),
    CONSTRAINT FK_Invitations_Club FOREIGN KEY (club_ID) REFERENCES AMS.Club(ID)
);

CREATE TABLE AMS.Permissions (
    user_type		    VARCHAR(15) PRIMARY KEY, -- 'Atleta', 'Treinador', 'Administrador', 'Espectador', 'Socio'
    manage_club_members	BIT,
    manage_competitions BIT,
    manage_requests 	BIT,
    manage_events	    BIT,
    manage_race_data	BIT
);

-- Relacionamento muitos para muitos entre Utilizador e Permissoes
CREATE TABLE AMS.User_permissions (
    user_ID		    INT,
    user_type		VARCHAR(15),

    PRIMARY KEY (user_ID, user_type),
    CONSTRAINT FK_User_permissions_User FOREIGN KEY (user_ID) REFERENCES AMS.[User](ID),
    CONSTRAINT FK_User_permissions_Permissions FOREIGN KEY (user_type) REFERENCES AMS.Permissions(user_type)
);

CREATE TABLE AMS.Training_sessions (
    session_ID      INT             IDENTITY(1,1)	PRIMARY KEY,
    athlete_ID      INT             NOT NULL,
    club_ID         INT             NOT NULL,
    date            DATE            NOT NULL,
    description     VARCHAR(255)    NOT NULL,   --explicar que series foram feitas e em que condicoes, por exemplo se forma feitas a chuva e vento ou durante um dia de sol, como e que o alteta se sentiu, etc.
    race_conditions VARCHAR(100),               -- podem ser favoraveis, neutras, desfavoraveis
    race_surface    VARCHAR(10),                -- e.g., estrada, cimento, erva, pista, areia

    CONSTRAINT FK_Training_sessions_Athlete FOREIGN KEY (athlete_ID) REFERENCES AMS.Athlete(user_ID),
    CONSTRAINT FK_Training_sessions_Club FOREIGN KEY (club_ID) REFERENCES AMS.Club(ID)
);

CREATE TABLE AMS.Series (
    series_ID       INT             IDENTITY(1,1)	PRIMARY KEY,
    distance        INT             NOT NULL,   -- Distancia em metros
    result_time     REAL,                       -- Tempo em segundos
    average_pace    VARCHAR(5),                 -- Minutes per km, ex: '04:22'
    heart_beats     INT,                        -- Opcional
    max_VO2         INT,                        -- Opcional
    splits          VARCHAR(100),               -- lista de valores separados com virgulas com informção detalhas dos splits das séries

);

CREATE TABLE AMS.Session_Series (
    session_ID      INT             NOT NULL,
    series_ID       INT             NOT NULL,

    PRIMARY KEY (session_ID, series_ID),
    CONSTRAINT FK_Session_Series_Session FOREIGN KEY (session_ID) REFERENCES AMS.Training_sessions(session_ID),
    CONSTRAINT FK_Session_Series_Series FOREIGN KEY (series_ID) REFERENCES AMS.Series(series_ID)
);


CREATE TABLE AMS.Competition (
    ID 			    INT 		    IDENTITY(1,1)	PRIMARY KEY,
    name 		    VARCHAR(100) 	NOT NULL,	    -- nome da competicao em que participaste, por exemplo "Campeonato distrital sub-20", "meeting rosa-mota"
    Data 		    DATE 		    NOT NULL,
    type 		    VARCHAR(50) 	NOT NULL,	    -- tipo especifico da modalidade que fizeste, ex: 400 metros, salto em comprimento, lancamento do peso ...
    location		VARCHAR(100)	NOT NULL,

);

CREATE TABLE AMS.Athlete_Competition (
    athlete_ID     INT,
    competition_ID INT,
    club_ID        INT,
    result_time    REAL,                  -- Resultado especifico do atleta nesta competicao
    place          INT,                   -- A posicao em que o atleta terminou na competicao
    wind_rating    DECIMAL(3, 2),         -- Classificacao do vento durante a performance do atleta

    PRIMARY KEY (athlete_ID, competition_ID),
    CONSTRAINT FK_Athlete_Competition_Athlete FOREIGN KEY (athlete_ID) REFERENCES AMS.Athlete(user_ID),
    CONSTRAINT FK_Athlete_Competition_Competition FOREIGN KEY (competition_ID) REFERENCES AMS.Competition(ID),
    CONSTRAINT FK_Athlete_Competition_Club FOREIGN KEY (club_ID) REFERENCES AMS.Club(ID)

);


CREATE TABLE AMS.Calendar_events (
    ID		 	    INT 		    IDENTITY(1,1)	PRIMARY KEY,
    name	 	    VARCHAR(100)	NOT NULL,
    date	 	    DATE		    NOT NULL,
    participants 	VARCHAR(MAX)	NOT NULL, 	    -- Assumindo que seja uma lista de valores separados por virgulas com os IDs do atletas
    files 	 	    TEXT, 				            -- Seria também uma lista com caminhos para os ficheiros associados, ex: regulamento do evento
    club_ID         INT         	NOT NULL,  	    -- Clube ao qual o evento esta associado

    CONSTRAINT FK_Calendar_events_Club FOREIGN KEY (club_ID) REFERENCES AMS.Club(ID)
);


-- Insert into AMS.[User] and capture IDs by creating a temporary table
DECLARE @UserIDs TABLE (ID INT);

-- Insert into AMS.Club and capture IDs by creating a temporary table
DECLARE @ClubIDs TABLE (ID INT);

-- Define the passphrase for encryption
DECLARE @Passphrase NVARCHAR(128) = 'ThePassphrase';

INSERT INTO AMS.Club (name, acronym, location, founding_date, num_of_athletes, resources)
OUTPUT INSERTED.ID INTO @ClubIDs
VALUES
('Clube Atletismo Oliveira do Bairro', 'CAOB-A', 'Aveiro', '2006-06-04', 50,'caob.atletismo@ua.pt'),
('Sporting Clube Portugal', 'SCP', 'Lisboa', '1906-06-01', 300, 'something'),
('Futebol Clube Porto', 'FCP', 'Porto', '2010-07-10', 120, 'tfcp.porto@ua.pt'),
('Benfica Atletismo', 'SLB', 'Lisboa', '1904-02-28', 280, 'benfica.atletismo@slb.pt'),
('Portimonense Sporting Club', 'PSC', 'Portimão', '1914-08-14', 70, 'psc.portimao@psc.pt'),
('SC Braga', 'SCB', 'Braga', '1921-01-19', 200, 'scb.braga@scb.pt'),
('Clube Desportivo Nacional', 'CDN', 'Funchal', '1910-11-08', 110, 'cdn.funchal@cdn.pt'),
('Académica de Coimbra', 'AAC', 'Coimbra', '1887-11-03', 60, 'aac.coimbra@aac.pt'),
('Boavista Futebol Clube', 'BFC', 'Porto', '1903-08-01', 130, 'bfc.porto@bfc.pt'),
('Clube Desportivo Trofense', 'CDT', 'Trofa', '1930-09-28', 50, 'cdt.trofa@cdt.pt'),
('Estoril Praia', 'GDEP', 'Estoril', '1939-05-17', 75, 'gdep.estoril@gdep.pt'),
('Gil Vicente FC', 'GVFC', 'Barcelos', '1924-05-03', 90, 'gvfc.barcelos@gvfc.pt'),
('Vitória Sport Clube', 'VSC', 'Guimarães', '1922-09-22', 140, 'vsc.guimaraes@vsc.pt'),
('Clube Futebol Os Belenenses', 'CFB', 'Lisboa', '1919-09-23', 100, 'cfb.lisboa@cfb.pt'),
('Clube Desportivo das Aves', 'CDA', 'Vila das Aves', '1930-11-12', 55, 'cda.aves@cda.pt')

INSERT INTO AMS.[User] (first_name, last_name, birth_date, sex, email, password, salary, club_ID, email_checked)
-- the output clause is used to capture the IDs of the inserted rows into the temporary table
OUTPUT INSERTED.ID INTO @UserIDs
VALUES
--The users to be coaches
('Renato', 'Abrantes', '1985-05-15', 'M', 'emailtest1.@gmail.com', EncryptByPassPhrase(@Passphrase, 'password456'), 400.00, 1, 0),
('Maria', 'Ferreira', '1975-03-23', 'F', 'maria.ferreira@gmail.com', EncryptByPassPhrase(@Passphrase, 'password654'), 500.00, 2, 1),
('Pedro', 'Almeida', '1990-11-12', 'M', 'pedro.almeida@gmail.com', EncryptByPassPhrase(@Passphrase, 'password321'), 420.00, 3, 0),
('Artur', 'Silva', '1970-04-22', 'M', 'artur.silva@gmail.com', EncryptByPassPhrase(@Passphrase, 'password666'), 600.00, 4, 1),
('Vera', 'Mendes', '1982-07-19', 'F', 'vera.mendes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password777'), 620.00, 5, 0),
('Rui', 'Costa', '1978-01-15', 'M', 'rui.costa@gmail.com', EncryptByPassPhrase(@Passphrase, 'password888'), 590.00, 6, 1),
('Paula', 'Sousa', '1983-09-09', 'F', 'paula.sousa@gmail.com', EncryptByPassPhrase(@Passphrase, 'password999'), 610.00, 7, 0),
('Nuno', 'Ramos', '1975-12-12', 'M', 'nuno.ramos@gmail.com', EncryptByPassPhrase(@Passphrase, 'password000'), 580.00, 8, 1),
('Isabel', 'Pereira', '1979-03-03', 'F', 'isabel.pereira@gmail.com', EncryptByPassPhrase(@Passphrase, 'password1234'), 600.00, 9, 0),
('Hugo', 'Fernandes', '1980-11-11', 'M', 'hugo.fernandes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password5678'), 615.00, 10, 1),
('Teresa', 'Oliveira', '1984-06-06', 'F', 'teresa.oliveira@gmail.com', EncryptByPassPhrase(@Passphrase, 'password9101'), 620.00, 11, 0),
('Carlos', 'Ferreira', '1976-02-02', 'M', 'carlos.ferreira@gmail.com', EncryptByPassPhrase(@Passphrase, 'password1112'), 590.00, 12, 1),
('Ana', 'Rodrigues', '1985-05-05', 'F', 'ana.rodrigues@gmail.com', EncryptByPassPhrase(@Passphrase, 'password1314'), 600.00, 13, 0),
('Jorge', 'Martins', '1981-08-08', 'M', 'jorge.martins@gmail.com', EncryptByPassPhrase(@Passphrase, 'password1516'), 605.00, 14, 1),
('Marta', 'Silva', '1974-09-09', 'F', 'marta.silva@gmail.com', EncryptByPassPhrase(@Passphrase, 'password1718'), 610.00, 15, 0),

-- The users to be athletes
('Ricardo', 'Martins', '2004-08-04', 'M', 'ricardomartins9321@gmail.com', EncryptByPassPhrase(@Passphrase, 'password123'), 0.00, 1, 1),
('Beatriz', 'Santos', '2005-05-07', 'M', 'emailtest2.@gmail.com', EncryptByPassPhrase(@Passphrase, 'password789'), 150.00, 2, 0),
('Ana', 'Costa', '2003-02-15', 'F', 'ana.costa@gmail.com', EncryptByPassPhrase(@Passphrase, 'password123'), 0.00, 3, 1),
('João', 'Pereira', '2002-06-18', 'M', 'joao.pereira@gmail.com', EncryptByPassPhrase(@Passphrase, 'password456'), 0.00, 4, 0),
('Sofia', 'Nunes', '2001-09-21', 'F', 'sofia.nunes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password789'), 0.00, 5, 1),
('Carlos', 'Oliveira', '1999-12-30', 'M', 'carlos.oliveira@gmail.com', EncryptByPassPhrase(@Passphrase, 'password012'), 0.00, 6, 0),
('Inês', 'Rodrigues', '2004-11-01', 'F', 'ines.rodrigues@gmail.com', EncryptByPassPhrase(@Passphrase, 'password345'), 0.00, 7, 1),
('André', 'Sousa', '2000-01-01', 'M', 'andre.sousa@gmail.com', EncryptByPassPhrase(@Passphrase, 'password1920'), 0.00, 8, 1),
('Catarina', 'Neves', '2001-02-02', 'F', 'catarina.neves@gmail.com', EncryptByPassPhrase(@Passphrase, 'password2122'), 0.00, 9, 0),
('Bruno', 'Marques', '2002-03-03', 'M', 'bruno.marques@gmail.com', EncryptByPassPhrase(@Passphrase, 'password2324'), 0.00, 10, 1),
('Joana', 'Carvalho', '2003-04-04', 'F', 'joana.carvalho@gmail.com', EncryptByPassPhrase(@Passphrase, 'password2526'), 0.00, 11, 0),
('Luís', 'Correia', '2004-05-05', 'M', 'luis.correia@gmail.com', EncryptByPassPhrase(@Passphrase, 'password2728'), 0.00, 12, 1),
('Raquel', 'Lima', '2005-06-06', 'F', 'raquel.lima@gmail.com', EncryptByPassPhrase(@Passphrase, 'password2930'), 0.00, 13, 0),
('Tiago', 'Alves', '2006-07-07', 'M', 'tiago.alves@gmail.com', EncryptByPassPhrase(@Passphrase, 'password3132'), 0.00, 14, 1),
('Patrícia', 'Ribeiro', '2007-08-08', 'F', 'patricia.ribeiro@gmail.com', EncryptByPassPhrase(@Passphrase, 'password3334'), 0.00, 15, 0),
('Gonçalo', 'Matos', '2008-09-09', 'M', 'goncalo.matos@gmail.com', EncryptByPassPhrase(@Passphrase, 'password3536'), 0.00, 1, 1),
('Rita', 'Fernandes', '2009-10-10', 'F', 'rita.fernandes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password3738'), 0.00, 2, 0),
('Miguel', 'Cunha', '1999-11-11', 'M', 'miguel.cunha@gmail.com', EncryptByPassPhrase(@Passphrase, 'password3940'), 0.00, 3, 1),
('Sofia', 'Gomes', '1998-12-12', 'F', 'sofia.gomes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password4142'), 0.00, 4, 0),
('Ricardo', 'Barros', '1997-01-13', 'M', 'ricardo.barros@gmail.com', EncryptByPassPhrase(@Passphrase, 'password4344'), 0.00, 5, 1),
('Helena', 'Sousa', '1996-02-14', 'F', 'helena.sousa@gmail.com', EncryptByPassPhrase(@Passphrase, 'password4546'), 0.00, 6, 0),
('Vasco', 'Fernandes', '1995-03-15', 'M', 'vasco.fernandes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password4748'), 0.00, 7, 1),
('Ana', 'Carvalho', '1994-04-16', 'F', 'ana.carvalho@gmail.com', EncryptByPassPhrase(@Passphrase, 'password4950'), 0.00, 8, 0),
('Daniel', 'Silva', '1993-05-17', 'M', 'daniel.silva@gmail.com', EncryptByPassPhrase(@Passphrase, 'password5152'), 0.00, 9, 1),
('Teresa', 'Martins', '1992-06-18', 'F', 'teresa.martins@gmail.com', EncryptByPassPhrase(@Passphrase, 'password5354'), 0.00, 10, 0),
('Diogo', 'Rodrigues', '1991-07-19', 'M', 'diogo.rodrigues@gmail.com', EncryptByPassPhrase(@Passphrase, 'password5556'), 0.00, 11, 1),
('Marta', 'Costa', '1990-08-20', 'F', 'marta.costa@gmail.com', EncryptByPassPhrase(@Passphrase, 'password5758'), 0.00, 12, 0),
('António', 'Neves', '1989-09-21', 'M', 'antonio.neves@gmail.com', EncryptByPassPhrase(@Passphrase, 'password5960'), 0.00, 13, 1),
('Clara', 'Silva', '1988-10-22', 'F', 'clara.silva@gmail.com', EncryptByPassPhrase(@Passphrase, 'password6162'), 0.00, 14, 0),
('Henrique', 'Lopes', '1987-11-23', 'M', 'henrique.lopes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password6364'), 0.00, 15, 1),
('Vânia', 'Pereira', '1986-12-24', 'F', 'vania.pereira@gmail.com', EncryptByPassPhrase(@Passphrase, 'password6566'), 0.00, 1, 0),
('Nuno', 'Sousa', '1985-01-25', 'M', 'nuno.sousa@gmail.com', EncryptByPassPhrase(@Passphrase, 'password6768'), 0.00, 2, 1),
('Ana', 'Fernandes', '1984-02-26', 'F', 'ana.fernandes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password6970'), 0.00, 3, 0),
('Joaquim', 'Ramos', '1983-03-27', 'M', 'joaquim.ramos@gmail.com', EncryptByPassPhrase(@Passphrase, 'password7172'), 0.00, 4, 1),
('Laura', 'Pires', '1982-04-28', 'F', 'laura.pires@gmail.com', EncryptByPassPhrase(@Passphrase, 'password7374'), 0.00, 5, 0),
('Paulo', 'Gonçalves', '1981-05-29', 'M', 'paulo.goncalves@gmail.com', EncryptByPassPhrase(@Passphrase, 'password7576'), 0.00, 6, 1),
('Célia', 'Rodrigues', '1980-06-30', 'F', 'celia.rodrigues@gmail.com', EncryptByPassPhrase(@Passphrase, 'password7778'), 0.00, 7, 0),
('Pedro', 'Sousa', '1979-07-01', 'M', 'pedro.sousa@gmail.com', EncryptByPassPhrase(@Passphrase, 'password7980'), 0.00, 8, 1),
('Rita', 'Lima', '1978-08-02', 'F', 'rita.lima@gmail.com', EncryptByPassPhrase(@Passphrase, 'password8182'), 0.00, 9, 0),
('José', 'Pereira', '1977-09-03', 'M', 'jose.pereira@gmail.com', EncryptByPassPhrase(@Passphrase, 'password8384'), 0.00, 10, 1),
('Fernanda', 'Matos', '1976-10-04', 'F', 'fernanda.matos@gmail.com', EncryptByPassPhrase(@Passphrase, 'password8586'), 0.00, 11, 0),
-- The users to be partners
('Helena', 'Marques', '1988-04-22', 'F', 'helena.marques@gmail.com', EncryptByPassPhrase(@Passphrase, 'password111'), 150.00, 2, 1),
('Miguel', 'Teixeira', '1985-05-14', 'M', 'miguel.teixeira@gmail.com', EncryptByPassPhrase(@Passphrase, 'password222'), 150.00, 1, 0),
('Sara', 'Lopes', '1992-08-19', 'F', 'sara.lopes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password333'), 150.00, 2, 1),
('Diogo', 'Faria', '1987-10-05', 'M', 'diogo.faria@gmail.com', EncryptByPassPhrase(@Passphrase, 'password444'), 150.00, 1, 0),
('Rita', 'Gomes', '1991-01-29', 'F', 'rita.gomes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password555'), 150.00, 2, 1),
('Manuel', 'Monteiro', '1975-11-05', 'M', 'manuel.monteiro@gmail.com', EncryptByPassPhrase(@Passphrase, 'password8788'), 150.00, 1, 0),
('Helena', 'Pinto', '1988-12-06', 'F', 'helena.pinto@gmail.com', EncryptByPassPhrase(@Passphrase, 'password8990'), 150.00, 2, 1),
('Miguel', 'Silva', '1985-01-07', 'M', 'miguel.silva@gmail.com', EncryptByPassPhrase(@Passphrase, 'password9192'), 150.00, 1, 0),
('Sofia', 'Santos', '1992-02-08', 'F', 'sofia.santos@gmail.com', EncryptByPassPhrase(@Passphrase, 'password9394'), 150.00, 2, 1),
('João', 'Nunes', '1987-03-09', 'M', 'joao.nunes@gmail.com', EncryptByPassPhrase(@Passphrase, 'password9596'), 150.00, 1, 0);


INSERT INTO AMS.User_club_relation (user_ID, club_ID, role, status, is_trusted, joined_date, left_date)
VALUES
(1, 1, 'admin', 'active', 1, '2015-06-01', NULL),
(2, 2, 'admin', 'active', 1, '2016-09-10', NULL),
(3, 3, 'admin', 'active', 1, '2017-01-15', NULL),
(4, 4, 'admin', 'active', 1, '2018-03-09', NULL),
(5, 5, 'admin', 'active', 1, '2019-12-12', NULL),
(6, 6, 'coach', 'active', 1, '2020-04-04', NULL),
(7, 7, 'coach', 'active', 1, '2021-09-09', NULL),
(8, 8, 'coach', 'active', 1, '2022-02-02', NULL),
(9, 9, 'coach', 'active', 1, '2023-07-07', NULL),
(10, 10, 'coach', 'active', 1, '2024-05-15', NULL),
(11, 11, 'coach', 'active', 1, '2025-08-20', NULL),
(12, 12, 'coach', 'active', 1, '2026-11-11', NULL),
(13, 13, 'coach', 'active', 1, '2027-03-03', NULL),
(14, 14, 'coach', 'active', 1, '2028-06-06', NULL),
(15, 15, 'coach', 'active', 1, '2029-01-01', NULL),
(16, 1, 'athlete', 'active', 1, '2020-01-01', NULL),
(17, 2, 'athlete', 'active', 1, '2020-02-01', NULL),
(18, 3, 'athlete', 'active', 1, '2020-03-01', NULL),
(19, 4, 'athlete', 'active', 1, '2020-04-01', NULL),
(20, 5, 'athlete', 'active', 1, '2020-05-01', NULL),
(21, 6, 'athlete', 'active', 1, '2020-06-01', NULL),
(22, 7, 'athlete', 'active', 1, '2020-07-01', NULL),
(23, 8, 'athlete', 'active', 1, '2020-08-01', NULL),
(24, 9, 'athlete', 'active', 1, '2020-09-01', NULL),
(25, 10, 'athlete', 'active', 1, '2020-10-01', NULL),
(26, 11, 'athlete', 'active', 1, '2020-11-01', NULL),
(27, 12, 'athlete', 'active', 1, '2020-12-01', NULL),
(28, 13, 'athlete', 'active', 1, '2021-01-01', NULL),
(29, 14, 'athlete', 'active', 1, '2021-02-01', NULL),
(30, 15, 'athlete', 'active', 1, '2021-03-01', NULL),
(31, 1, 'athlete', 'active', 1, '2021-04-01', NULL),
(32, 2, 'athlete', 'active', 1, '2021-05-01', NULL),
(33, 3, 'athlete', 'active', 1, '2021-06-01', NULL),
(34, 4, 'athlete', 'active', 1, '2021-07-01', NULL),
(35, 5, 'athlete', 'active', 1, '2021-08-01', NULL),
(36, 6, 'athlete', 'active', 1, '2021-09-01', NULL),
(37, 7, 'athlete', 'active', 1, '2021-10-01', NULL),
(38, 8, 'athlete', 'active', 1, '2021-11-01', NULL),
(39, 9, 'athlete', 'active', 1, '2021-12-01', NULL),
(40, 10, 'athlete', 'active', 1, '2022-01-01', NULL),
(41, 11, 'athlete', 'active', 1, '2022-02-01', NULL),
(42, 12, 'athlete', 'active', 1, '2022-03-01', NULL),
(43, 13, 'athlete', 'active', 1, '2022-04-01', NULL),
(44, 14, 'athlete', 'active', 1, '2022-05-01', NULL),
(45, 15, 'athlete', 'active', 1, '2022-06-01', NULL),
(46, 1, 'athlete', 'active', 1, '2022-07-01', NULL),
(47, 2, 'athlete', 'active', 1, '2022-08-01', NULL),
(48, 3, 'athlete', 'active', 1, '2022-09-01', NULL),
(49, 4, 'athlete', 'active', 1, '2022-10-01', NULL),
(50, 5, 'athlete', 'active', 1, '2022-11-01', NULL),
(51, 6, 'athlete', 'active', 1, '2022-12-01', NULL),
(52, 7, 'athlete', 'active', 1, '2023-01-01', NULL),
(53, 8, 'athlete', 'active', 1, '2023-02-01', NULL),
(54, 9, 'athlete', 'active', 1, '2023-03-01', NULL),
(55, 10, 'athlete', 'active', 1, '2023-04-01', NULL),
(56, 11, 'athlete', 'active', 1, '2023-05-01', NULL),
(57, 2, 'partner', 'active', 1, '2015-04-22', NULL),
(58, 1, 'partner', 'active', 1, '2016-05-14', NULL),
(59, 2, 'partner', 'active', 1, '2017-08-19', NULL),
(60, 1, 'partner', 'active', 1, '2018-10-05', NULL),
(61, 2, 'partner', 'active', 1, '2019-01-29', NULL),
(62, 1, 'partner', 'active', 1, '2020-11-05', NULL),
(63, 2, 'partner', 'active', 1, '2021-12-06', NULL),
(64, 1, 'partner', 'active', 1, '2022-01-07', NULL),
(65, 2, 'partner', 'active', 1, '2023-02-08', NULL),
(66, 1, 'partner', 'active', 1, '2024-03-09', NULL);


-- Insert new data into AMS.Admin
INSERT INTO AMS.Admin (user_ID, qualifications)
VALUES
(1, 'Certified Sports Administrator');

-- Insert new data into AMS.Partner
INSERT INTO AMS.Partner (user_ID, Partner_number)
VALUES
(57, 1001),
(58, 1002),
(59, 1003),
(60, 1004),
(61, 1005),
(62, 1006),
(63, 1007),
(64, 1008),
(65, 1009),
(66, 1010);

INSERT INTO AMS.Coach (user_ID, qualifications)
VALUES
(1, 'Level 2 Certified Coach'),
(2, 'Level 1 Certified Coach'),
(3, 'Level 3 Certified Coach'),
(4, 'Level 2 Certified Coach'),
(5, 'Level 2 Certified Coach'),
(6, 'Level 2 Certified Coach'),
(7, 'Level 1 Certified Coach'),
(8, 'Level 2 Certified Coach'),
(9, 'Level 2 Certified Coach'),
(10, 'Level 3 Certified Coach'),
(11, 'Level 1 Certified Coach'),
(12, 'Level 2 Certified Coach'),
(13, 'Level 2 Certified Coach'),
(14, 'Level 3 Certified Coach'),
(15, 'Level 2 Certified Coach');

INSERT INTO AMS.Athlete (user_ID, CC, height, weight)
VALUES
(16, 12345678, 1.73, 70.0),
(17, 98764321, 1.66, 50.0),
(18, 12346789, 1.70, 60.0),
(19, 98765321, 1.80, 75.0),
(20, 19283465, 1.65, 55.0),
(21, 56789123, 1.75, 70.0),
(22, 34567891, 1.60, 50.0),
(23, 45679012, 1.78, 72.0),
(24, 78901234, 1.70, 65.0),
(25, 89013456, 1.82, 80.0),
(26, 90123457, 1.68, 55.0),
(27, 12345680, 1.75, 68.0),
(28, 23439890, 1.74, 66.0),
(29, 34568901, 1.76, 70.0),
(30, 45689012, 1.72, 64.0),
(31, 56890123, 1.77, 71.0),
(32, 68901234, 1.73, 67.0),
(33, 89012345, 1.69, 63.0),
(34, 89012356, 1.78, 72.0),
(35, 90123567, 1.65, 60.0),
(36, 12345789, 1.70, 65.0),
(37, 23456890, 1.71, 66.0),
(38, 34567901, 1.72, 67.0),
(39, 45678012, 1.73, 68.0),
(40, 56789124, 1.74, 69.0),
(41, 67890125, 1.75, 70.0),
(42, 78901346, 1.76, 71.0),
(43, 89012457, 1.77, 72.0),
(44, 90123568, 1.78, 73.0),
(45, 12345790, 1.79, 74.0),
(46, 23456791, 1.80, 75.0),
(47, 34567802, 1.81, 76.0),
(48, 45678013, 1.82, 77.0),
(49, 56789024, 1.83, 78.0),
(50, 67890135, 1.84, 79.0),
(51, 78901347, 1.85, 80.0),
(52, 89012358, 1.86, 81.0),
(53, 90124569, 1.87, 82.0),
(54, 12346791, 1.88, 83.0),
(55, 23457892, 1.89, 84.0),
(56, 34578903, 1.90, 85.0);

-- Insert new data into AMS.Coach_Athlete
INSERT INTO AMS.Coach_Athlete (coach_ID, athlete_ID)
VALUES
(1, 16),
(2, 17),
(3, 18),
(4, 19),
(5, 20),
(6, 21),
(7, 22),
(8, 23),
(9, 24),
(10, 25),
(11, 26),
(12, 27),
(13, 28),
(14, 29),
(15, 30);

-- Insert into AMS.Club and capture IDs by creating a temporary table
DECLARE @InvitationsIDs TABLE (ID INT);

INSERT INTO AMS.Invitations (sender_ID, recipient_email, club_ID, role, status)
OUTPUT INSERTED.ID INTO @InvitationsIDs
VALUES
(1, 'new.user@example.com', 1, 'athlete', 'pending'),
(2, 'another.user@example.com', 2, 'coach', 'accepted');

INSERT INTO AMS.Permissions (user_type, manage_club_members, manage_competitions, manage_requests, manage_events, manage_race_data)
VALUES
('Athlete', 0, 0, 0, 1, 1),
('Coach', 1, 1, 1, 1, 1),
('Admin', 1, 1, 1, 1, 1),
('Spectator', 0, 0, 0, 0, 0),
('Partner', 0, 0, 0, 0, 1);

INSERT INTO AMS.User_permissions (user_ID, user_type)
VALUES
(1, 'Admin'),
(2, 'Admin'),
(3, 'Admin'),
(4, 'Admin'),
(5, 'Admin'),
(6, 'Coach'),
(7, 'Coach'),
(8, 'Coach'),
(9, 'Coach'),
(10, 'Coach'),
(11, 'Coach'),
(12, 'Coach'),
(13, 'Coach'),
(14, 'Coach'),
(15, 'Coach'),
(16, 'Athlete'),
(17, 'Athlete'),
(18, 'Athlete'),
(19, 'Athlete'),
(20, 'Athlete'),
(21, 'Athlete'),
(22, 'Athlete'),
(23, 'Athlete'),
(24, 'Athlete'),
(25, 'Athlete'),
(26, 'Athlete'),
(27, 'Athlete'),
(28, 'Athlete'),
(29, 'Athlete'),
(30, 'Athlete'),
(31, 'Athlete'),
(32, 'Athlete'),
(33, 'Athlete'),
(34, 'Athlete'),
(35, 'Athlete'),
(36, 'Athlete'),
(37, 'Athlete'),
(38, 'Athlete'),
(39, 'Athlete'),
(40, 'Athlete'),
(41, 'Athlete'),
(42, 'Athlete'),
(43, 'Athlete'),
(44, 'Athlete'),
(45, 'Athlete'),
(46, 'Athlete'),
(47, 'Athlete'),
(48, 'Athlete'),
(49, 'Athlete'),
(50, 'Athlete'),
(51, 'Athlete'),
(52, 'Athlete'),
(53, 'Athlete'),
(54, 'Athlete'),
(55, 'Athlete'),
(56, 'Athlete'),
(57, 'Partner'),
(58, 'Partner'),
(59, 'Partner'),
(60, 'Partner'),
(61, 'Partner'),
(62, 'Partner'),
(63, 'Partner'),
(64, 'Partner'),
(65, 'Partner'),
(66, 'Partner');

DECLARE @TrainingSessionIDs TABLE (ID INT);

INSERT INTO AMS.Training_sessions (athlete_ID, club_ID, date, description, race_conditions, race_surface)
OUTPUT INSERTED.session_ID INTO @TrainingSessionIDs
VALUES
(16, 1, '2024-05-15', '5x400m intervals with 1 min rest', 'neutral', 'track'),
(17, 2, '2024-05-16', '4km tempo run', 'favorable', 'road'),
(17, 2, '2023-05-16', '5km tempo run', 'favorable', 'road'),
(17, 2, '2022-05-16', '6km tempo run', 'favorable', 'road'),
(17, 2, '2021-05-16', '7km tempo run', 'favorable', 'road'),
(17, 2, '2020-05-16', '8km tempo run', 'favorable', 'road'),
(18, 3, '2024-05-17', '10km long run', 'neutral', 'road'),
(19, 4, '2024-05-18', '8x200m sprints with 30s rest', 'favorable', 'track'),
(20, 5, '2024-05-19', '5km tempo run', 'neutral', 'trail'),
(21, 6, '2024-05-20', '3x1600m with 3 min rest', 'unfavorable', 'track'),
(22, 7, '2024-05-21', '6km hill repeats', 'neutral', 'road'),
(23, 8, '2024-05-22', '4x800m with 2 min rest', 'favorable', 'track'),
(24, 9, '2024-05-23', '7km easy run', 'neutral', 'trail'),
(25, 10, '2024-05-24', '12x100m sprints with 20s rest', 'favorable', 'track');


DECLARE @SeriesIDs TABLE (ID INT);

INSERT INTO AMS.Series (distance, result_time, average_pace, heart_beats, max_VO2, splits)
OUTPUT INSERTED.series_ID INTO @SeriesIDs
VALUES
(400, 60.4, '02:30', 160, 50, '15.1,15.1,15.1,15.1'),
(4000, 1080.0, '04:00', 155, 55, '280,260,270,270'),
(10000, 2400.0, '04:00', 150, 55, '600,600,600,600,600,600,600,600,600,600'),
(200, 30.2, '01:30', 170, 60, '15.1,15.1,15.1,15.1,15.1,15.1,15.1,15.1'),
(5000, 1500.0, '05:00', 140, 50, '300,300,300,300,300,300,300,300,300,300'),
(1600, 320.0, '03:20', 165, 58, '80,80,80,80,80,80,80,80'),
(6000, 1440.0, '04:00', 155, 55, '360,360,360,360,360,360'),
(800, 160.0, '02:00', 160, 57, '40,40,40,40,40,40,40,40'),
(7000, 1680.0, '04:00', 150, 55, '420,420,420,420,420,420,420'),
(100, 15.1, '00:15', 180, 65, '7.5,7.5,7.5,7.5,7.5,7.5,7.5,7.5,7.5,7.5,7.5,7.5');

INSERT INTO AMS.Session_Series (session_ID, series_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

DECLARE @CompetitionIDs TABLE (ID INT);
INSERT INTO AMS.Competition (name, Data, type, location)
OUTPUT INSERTED.ID INTO @CompetitionIDs
VALUES
('District Championship U20', '2024-06-15', '400m sprint', 'New York, NY'),
('City Marathon', '2024-09-10', 'Marathon', 'Boston, MA'),
('National Championship', '2024-08-12', '1500m', 'Lisboa, PT'),
('Regional Cup', '2024-07-05', '800m', 'Porto, PT'),
('International Meet', '2024-09-25', '5000m', 'Faro, PT'),
('Club Championship', '2024-10-15', '3000m steeplechase', 'Braga, PT'),
('District Championship U20', '2024-06-15', '400m sprint', 'New York, NY');

-- Insert into AMS.Athlete_Competition
INSERT INTO AMS.Athlete_Competition (athlete_ID, competition_ID, club_ID, result_time, place, wind_rating)
VALUES
(16, 1, 1, 52.5, 1, -0.2),
(17, 2, 2, 10800.0, 5, 0.5),
(18, 3, 3, 240.0, 2, 0.1),
(19, 4, 4, 120.0, 3, -0.3),
(20, 5, 5, 900.0, 4, 0.2),
(21, 6, 6, 600.0, 6, 0.0),
(22, 1, 7, 53.0, 2, 0.1),
(23, 2, 8, 10700.0, 6, 0.3),
(24, 3, 9, 235.0, 1, -0.1),
(25, 4, 10, 118.0, 4, -0.4);

DECLARE @CalendarEventIDs TABLE (ID INT);
INSERT INTO AMS.Calendar_events (name, date, participants, files, club_ID)
OUTPUT INSERTED.ID INTO @CalendarEventIDs
VALUES
('Annual General Meeting', '2024-06-10', '1,2,3,4,5', 'http://example.com/file1', 1),
('Summer Training Camp', '2024-07-15', '6,7,8,9,10', 'http://example.com/file2', 2),
('Junior Athletics Meet', '2024-08-20', '11,12,13,14,15', 'http://example.com/file3', 3),
('Senior Track and Field Championship', '2024-09-25', '16,17,18,19,20', 'http://example.com/file4', 4),
('Autumn Cross Country', '2024-10-05', '21,22,23,24,25', 'http://example.com/file5', 5);


-- Drop function if exists and create fnIsUserAthlete
DROP FUNCTION IF EXISTS AMS.fnIsUserAthlete;
GO
CREATE FUNCTION AMS.fnIsUserAthlete (@UserID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsAthlete BIT = 0;

    -- Check if the user has an athlete role in the user-club relationship
    IF EXISTS (SELECT 1 FROM AMS.User_club_relation WHERE user_ID = @UserID AND role = 'athlete' AND status = 'active')
    BEGIN
        SET @IsAthlete = 1;
    END
    ELSE
    BEGIN
        -- Check if the user has athlete permissions in the user permissions table
        IF EXISTS (SELECT 1 FROM AMS.User_permissions WHERE user_ID = @UserID AND user_type = 'Athlete')
        BEGIN
            SET @IsAthlete = 1;
        END
    END

    RETURN @IsAthlete;
END;
GO

-- Drop function if exists and create fnIsUserAdmin
DROP FUNCTION IF EXISTS AMS.fnIsUserAdmin;
GO
CREATE FUNCTION AMS.fnIsUserAdmin (@UserID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsAdmin BIT = 0;

    IF EXISTS (SELECT 1 FROM AMS.User_club_relation WHERE user_ID = @UserID AND role = 'admin' AND status = 'active')
    BEGIN
        SET @IsAdmin = 1;
    END
    ELSE
    BEGIN
        IF EXISTS (SELECT 1 FROM AMS.User_permissions WHERE user_ID = @UserID AND user_type = 'Admin')
        BEGIN
            SET @IsAdmin = 1;
        END
    END

    RETURN @IsAdmin;
END;
GO

-- Drop function if exists and create fnIsUserCoach
DROP FUNCTION IF EXISTS AMS.fnIsUserCoach;
GO
CREATE FUNCTION AMS.fnIsUserCoach (@UserID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsCoach BIT = 0;

    IF EXISTS (SELECT 1 FROM AMS.User_club_relation WHERE user_ID = @UserID AND role = 'coach' AND status = 'active')
    BEGIN
        SET @IsCoach = 1;
    END
    ELSE
    BEGIN
        IF EXISTS (SELECT 1 FROM AMS.User_permissions WHERE user_ID = @UserID AND user_type = 'Coach')
        BEGIN
            SET @IsCoach = 1;
        END
    END

    RETURN @IsCoach;
END;
GO

-- Drop function if exists and create fnGetUserType
DROP FUNCTION IF EXISTS AMS.fnGetUserType;
GO
CREATE FUNCTION AMS.fnGetUserType(@userID INT)
RETURNS NVARCHAR(15)
AS
BEGIN
    DECLARE @userType NVARCHAR(15);

    IF EXISTS (SELECT 1 FROM AMS.Athlete WHERE user_ID = @UserID)
        SET @UserType = 'athlete';
    ELSE IF EXISTS (SELECT 1 FROM AMS.Coach WHERE user_ID = @UserID)
        SET @UserType = 'coach';
    ELSE IF EXISTS (SELECT 1 FROM AMS.Admin WHERE user_ID = @UserID)
        SET @UserType = 'admin';
    ELSE IF EXISTS (SELECT 1 FROM AMS.Partner WHERE user_ID = @UserID)
        SET @UserType = 'partner';
    ELSE
        SET @UserType = 'unknown';

    RETURN @UserType;
END;
GO

-- Drop function if exists and create GetTrainingSessionsByDate
DROP FUNCTION IF EXISTS AMS.GetTrainingSessionsByDate;
GO
CREATE FUNCTION AMS.GetTrainingSessionsByDate(@startDate DATE, @endDate DATE)
RETURNS TABLE
AS
RETURN
(
    SELECT
        ts.session_ID,
        ts.date,
        ts.description,
        ts.race_conditions,
        ts.race_surface,
        a.user_ID AS AthleteID,
        u.first_name,
        u.last_name,
        c.name AS ClubName
    FROM
        AMS.Training_sessions ts
    JOIN
        AMS.Athlete a ON ts.athlete_ID = a.user_ID
    JOIN
        AMS.[User] u ON a.user_ID = u.ID
    JOIN
        AMS.Club c ON ts.club_ID = c.ID
    WHERE
        ts.date BETWEEN @startDate AND @endDate
);
GO


DROP VIEW IF EXISTS AMS.vwUsersAndClubs;
GO
CREATE VIEW AMS.vwUsersAndClubs AS
SELECT
    U.ID AS UserID,
    U.first_name AS FirstName,
    U.last_name AS LastName,
    U.birth_date AS BirthDate,
    U.sex AS Gender,
    U.email AS Email,
    U.salary AS Salary,
    C.ID AS ClubID,
    C.name AS ClubName,
    C.acronym AS ClubAcronym,
    C.location AS ClubLocation
FROM AMS.[User] U
LEFT JOIN AMS.Club C ON U.club_ID = C.ID;
GO

DROP VIEW IF EXISTS AMS.vwTrainingSessionsAndSeries;
GO
CREATE VIEW AMS.vwTrainingSessionsAndSeries AS
SELECT
    TS.session_ID AS SessionID,
    U.first_name AS AthleteFirstName,
    U.last_name AS AthleteLastName,
    C.acronym AS ClubAcronym,
    TS.date AS Date,
    TS.description AS Description,
    TS.race_conditions AS RaceConditions,
    TS.race_surface AS RaceSurface,
    S.distance AS Distance,
    S.result_time AS ResultTime,
    S.average_pace AS AveragePace,
    S.heart_beats AS HeartBeats,
    S.max_VO2 AS MaxVO2,
    S.splits AS Splits
FROM AMS.Training_sessions TS
LEFT JOIN AMS.Session_Series SS ON TS.session_ID = SS.session_ID
LEFT JOIN AMS.Series S ON SS.series_ID = S.series_ID
LEFT JOIN AMS.[User] U ON TS.athlete_ID = U.ID
LEFT JOIN AMS.Club C ON TS.club_ID = C.ID;
GO


DROP VIEW IF EXISTS AMS.vwCompetitionsAndAthletes;
GO
CREATE VIEW AMS.vwCompetitionsAndAthletes AS
SELECT
    C.ID AS CompetitionID,
    C.name AS CompetitionName,
    C.Data AS CompetitionDate,
    C.type AS CompetitionType,
    C.location AS CompetitionLocation,
    AC.athlete_ID AS AthleteID,
    AC.result_time AS ResultTime,
    AC.place AS Place,
    AC.wind_rating AS WindRating,
    U.first_name AS AthleteFirstName,
    U.last_name AS AthleteLastName
FROM AMS.Competition C
LEFT JOIN AMS.Athlete_Competition AC ON C.ID = AC.competition_ID
LEFT JOIN AMS.[User] U ON AC.athlete_ID = U.ID;
GO

DROP VIEW IF EXISTS AMS.vwClubsAndEvents
GO
CREATE VIEW AMS.vwClubsAndEvents AS
SELECT
    C.ID AS ClubID,
    C.name AS ClubName,
    C.acronym AS ClubAcronym,
    C.location AS ClubLocation,
    C.founding_date AS FoundingDate,
    C.num_of_athletes AS NumberOfAthletes,
    C.membership_requests AS MembershipRequests,
    E.ID AS EventID,
    E.name AS EventName,
    E.date AS EventDate,
    E.participants AS Participants,
    E.files AS Files
FROM AMS.Club C
LEFT JOIN AMS.Calendar_events E ON C.ID = E.club_ID;
GO

DROP VIEW IF EXISTS AMS.vwUsersAndPermissions
GO
CREATE VIEW AMS.vwUsersAndPermissions AS
SELECT
    U.ID AS UserID,
    U.first_name AS FirstName,
    U.last_name AS LastName,
    P.user_type AS UserType,
    P.manage_club_members AS ManageClubMembers,
    P.manage_competitions AS ManageCompetitions,
    P.manage_requests AS ManageRequests,
    P.manage_events AS ManageEvents,
    P.manage_race_data AS ManageRaceData
FROM AMS.[User] U
LEFT JOIN AMS.User_permissions UP ON U.ID = UP.user_ID
LEFT JOIN AMS.Permissions P ON UP.user_type = P.user_type;
GO

DROP VIEW IF EXISTS AMS.vw_TrainingSessionsByDate;
GO
CREATE VIEW AMS.vw_TrainingSessionsByDate AS
SELECT
    ts.session_ID AS SessionID,
    ts.date AS TrainingDate,
    ts.description AS Description,
    ts.race_conditions AS RaceConditions,
    ts.race_surface AS RaceSurface,
    ts.AthleteID,
    ts.first_name AS AthleteFirstName,
    ts.last_name AS AthleteLastName,
    ts.ClubName
FROM
    AMS.GetTrainingSessionsByDate(NULL, NULL) ts;
GO


DROP PROCEDURE IF EXISTS AMS.DeleteUserAndRelatedTables
GO
CREATE PROCEDURE AMS.DeleteUserAndRelatedTables
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Delete from various tables based on user associations
		DELETE FROM AMS.Session_Series WHERE session_ID IN (SELECT session_ID FROM AMS.Training_sessions WHERE athlete_ID = @UserId);
        DELETE FROM AMS.Training_sessions WHERE athlete_ID = @UserId;
        DELETE FROM AMS.Coach_Athlete WHERE athlete_ID = @UserId OR coach_ID = @UserId;
		DELETE FROM AMS.Athlete_Competition WHERE athlete_ID = @UserId;
        DELETE FROM AMS.User_club_relation WHERE user_ID = @UserId;
        DELETE FROM AMS.Invitations WHERE sender_ID = @UserId;
        DELETE FROM AMS.User_permissions WHERE user_ID = @UserId;

        -- Delete from specific user type tables
        DELETE FROM AMS.Athlete WHERE user_ID = @UserId;
        DELETE FROM AMS.Coach WHERE user_ID = @UserId;
        DELETE FROM AMS.Admin WHERE user_ID = @UserId;
        DELETE FROM AMS.Partner WHERE user_ID = @UserId;

        -- Finally, delete the user
        DELETE FROM AMS.[User] WHERE ID = @UserId;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO

DROP PROCEDURE IF EXISTS AMS.DeleteClubAndRelatedTables
GO
CREATE PROCEDURE AMS.DeleteClubAndRelatedTables
    @ClubID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Delete from dependent tables first
		DELETE FROM AMS.Session_Series
        WHERE session_ID IN (SELECT session_ID FROM AMS.Training_sessions WHERE club_ID = @ClubID);

        DELETE FROM AMS.User_club_relation WHERE club_ID = @ClubID;
        DELETE FROM AMS.Invitations WHERE club_ID = @ClubID;
        DELETE FROM AMS.Training_sessions WHERE club_ID = @ClubID;
        DELETE FROM AMS.Calendar_events WHERE club_ID = @ClubID;

        -- Set the Club_ID to NULL in the Users table
        UPDATE AMS.[User]
        SET Club_ID = NULL
        WHERE Club_ID = @ClubID;
		UPDATE AMS.Athlete_Competition
        SET Club_ID = NULL
        WHERE Club_ID = @ClubID;

        -- Finally, delete the club
        DELETE FROM AMS.Club WHERE ID = @ClubID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO


-- Generic Helper Procedure with dynamic SQL to execute SQL commands (INSERT, UPDATE) in a transaction, reducing code repetition
DROP PROCEDURE IF EXISTS AMS.ExecuteSQL;
GO

CREATE PROCEDURE AMS.ExecuteSQL
    @Command NVARCHAR(10),          -- Command to execute ('adicionar' for insert, 'alterar' for update)
    @TableName NVARCHAR(128),       -- Name of the table to execute the command on
    @Columns NVARCHAR(MAX),         -- Comma-separated list of column names for INSERT
    @Values NVARCHAR(MAX),          -- Comma-separated list of values for INSERT
    @SetClause NVARCHAR(MAX),       -- SET clause for UPDATE
    @WhereClause NVARCHAR(MAX),     -- WHERE clause for UPDATE
    @ErrorMessage NVARCHAR(4000)    -- Custom error message to raise if an error occurs
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);

    -- Validate table name
    IF @TableName NOT IN ('AMS.[User]', 'AMS.Athlete', 'AMS.Club', 'AMS.Coach', 'AMS.Admin', 'AMS.Partner', 'AMS.Coach_Athlete', 'AMS.User_club_relation', 'AMS.Invitations', 'AMS.Permissions', 'AMS.User_permissions', 'AMS.Training_sessions', 'AMS.Series', 'AMS.Session_Series', 'AMS.Competition', 'AMS.Athlete_Competition', 'AMS.Calendar_events')
    BEGIN
        RAISERROR('Invalid table name', 16, 1);
        RETURN;
    END

    -- Build the SQL command based on the @Command parameter
    IF @Command = 'adicionar'
    BEGIN
        SET @SQL = N'INSERT INTO ' + QUOTENAME(@TableName) + ' (' + @Columns + ') VALUES (' + @Values + ');';
    END
    ELSE IF @Command = 'alterar'
    BEGIN
        SET @SQL = N'UPDATE ' + QUOTENAME(@TableName) + ' SET ' + @SetClause + ' WHERE ' + @WhereClause + ';';
    END

    BEGIN TRY
        BEGIN TRANSACTION;
            EXEC sp_executesql @SQL;    -- Execute the dynamic SQL command protecting against SQL injection
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMsg NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
		DECLARE @ErrorMessageConcat NVARCHAR(4000);
		SET @ErrorMessageConcat = @ErrorMessage + N' ' + @ErrorMsg;


        -- Get error details and raise a custom error message
        SELECT @ErrorMsg = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
		RAISERROR(@ErrorMessageConcat, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO

-- Triggers para atualizar o numero de atletas dentro de um clube para ambas as operações de Delelte e Join
DROP TRIGGER IF EXISTS AMS.trg_UpdateNumOfAthletes_Insert;
GO

CREATE TRIGGER AMS.trg_UpdateNumOfAthletes_Insert
ON AMS.Athlete
AFTER INSERT
AS
BEGIN
    UPDATE C
    SET num_of_athletes = num_of_athletes + 1
    FROM AMS.Club C
    INNER JOIN AMS.[User] U ON C.ID = U.club_ID
    INNER JOIN inserted I ON U.ID = I.user_ID;
END;
GO

DROP TRIGGER IF EXISTS AMS.trg_UpdateNumOfAthletes_Delete;
GO

CREATE TRIGGER AMS.trg_UpdateNumOfAthletes_Delete
ON AMS.Athlete
AFTER DELETE
AS
BEGIN
    UPDATE C
    SET num_of_athletes = num_of_athletes - 1
    FROM AMS.Club C
    INNER JOIN AMS.[User] U ON C.ID = U.club_ID
    INNER JOIN deleted D ON U.ID = D.user_ID;
END;
GO


-- Indexes for AMS.[User] Table
CREATE INDEX idx_User_club_ID ON AMS.[User](club_ID);
CREATE INDEX idx_User_email ON AMS.[User](email);

-- Indexes for AMS.Club Table
CREATE INDEX idx_Club_acronym ON AMS.Club(acronym);

-- Indexes for AMS.Athlete Table
CREATE INDEX idx_Athlete_user_ID ON AMS.Athlete(user_ID);
