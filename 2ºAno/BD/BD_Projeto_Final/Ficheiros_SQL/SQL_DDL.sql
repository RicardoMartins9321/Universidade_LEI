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
    password 	    VARBINARY(500) 	NOT NULL,
    salary 	        DECIMAL(10,2),
    Imagem 	        VARBINARY(MAX),     -- Para armazenar a imagem de perfil do utilizador
    club_ID 	    INT, 				-- Referência para o clube ao qual o utilizador pertence, se aplicavel
    email_checked 	BIT,

    CONSTRAINT FK_User_Club FOREIGN KEY (club_ID) REFERENCES AMS.Club(ID)
);

ALTER TABLE AMS.[User]
ALTER COLUMN password VARBINARY(500);
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
    --status: ativo dentro do clube ou ent�o inativo porque já saiu do clube, ou então pendente de ter o seu registe aceite
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
