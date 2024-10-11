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

DROP FUNCTION IF EXISTS AMS.fnEncryptPassword;
GO
-- Encrypt Password Function
CREATE FUNCTION AMS.fnEncryptPassword(@plainTextPassword NVARCHAR(128))
RETURNS VARBINARY(500)
AS
BEGIN
    DECLARE @Passphrase NVARCHAR(128) = 'ThePassphrase';
    RETURN EncryptByPassPhrase(@Passphrase, @plainTextPassword);
END;
GO

DROP FUNCTION IF EXISTS AMS.fnDecryptPassword;
GO
-- Decrypt Password Function
CREATE FUNCTION AMS.fnDecryptPassword(@encryptedPassword VARBINARY(500))
RETURNS NVARCHAR(128)
AS
BEGIN
    DECLARE @Passphrase NVARCHAR(128) = 'ThePassphrase';
    RETURN CONVERT(NVARCHAR(128), DecryptByPassPhrase(@Passphrase, @encryptedPassword));
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

-- Drop function if exists and create GetClubStatistics
DROP FUNCTION IF EXISTS AMS.GetClubStatistics;
GO
CREATE FUNCTION AMS.GetClubStatistics(@clubID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        c.ID AS ClubID,
        c.name AS ClubName,
        c.location AS Location,
        c.founding_date AS FoundingDate,
        (SELECT COUNT(*) FROM AMS.Athlete a JOIN AMS.[User] u ON a.user_ID = u.ID WHERE u.club_ID = c.ID) AS NumberOfAthletes,
        (SELECT COUNT(*) FROM AMS.Coach co JOIN AMS.[User] u ON co.user_ID = u.ID WHERE u.club_ID = c.ID) AS NumberOfCoaches,
        (SELECT COUNT(*) FROM AMS.Partner p JOIN AMS.[User] u ON p.user_ID = u.ID WHERE u.club_ID = c.ID) AS NumberOfPartners
    FROM
        AMS.Club c
    WHERE
        c.ID = @clubID
);
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