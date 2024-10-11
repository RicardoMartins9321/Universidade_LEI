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
