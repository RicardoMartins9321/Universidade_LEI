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

DROP PROCEDURE IF EXISTS AMS.CreateClubAndAssignAdmin
GO
-- Stored Procedure to Create Club and Assign User as Admin
CREATE PROCEDURE AMS.CreateClubAndAssignAdmin
    @Name NVARCHAR(50),
    @Acronym NVARCHAR(10),
    @Location NVARCHAR(100),
    @FoundingDate DATE,
    @NumOfAthletes INT,
    @PhotoGallery VARBINARY(MAX),
    @Resources NVARCHAR(MAX),
    @UserID INT
AS
BEGIN
    DECLARE @ClubID INT;
    BEGIN TRY
    BEGIN TRANSACTION;
        -- Insert the new club
        INSERT INTO AMS.Club (name, acronym, location, founding_date, num_of_athletes, photo_gallery, resources)
        VALUES (@Name, @Acronym, @Location, @FoundingDate, @NumOfAthletes, @PhotoGallery, @Resources);
        
        -- Get the ID of the newly created club
        SET @ClubID = SCOPE_IDENTITY();

        -- Assign the user as admin of the new club
        INSERT INTO AMS.User_club_relation (user_ID, club_ID, role, status)
        VALUES (@UserID, @ClubID, 'admin', 'active');

        -- Update user permissions to admin
        INSERT INTO AMS.User_permissions (user_ID, user_type)
        VALUES (@UserID, 'Admin');


        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;

DROP PROCEDURE IF EXISTS AMS.JoinClubAndUpdateRole
GO
-- Stored Procedure to Join a Club and Update Role to Athlete
CREATE PROCEDURE AMS.JoinClubAndUpdateRole
    @UserID INT,
    @ClubID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Update user-club relation
        UPDATE AMS.User_club_relation
        SET club_ID = @ClubID, role = 'athlete', status = 'active'
        WHERE user_ID = @UserID;

        -- Update user permissions
        UPDATE AMS.User_permissions
        SET user_type = 'Athlete'
        WHERE user_ID = @UserID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
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

DROP PROCEDURE IF EXISTS AMS.adicionarAlterarUser;
GO
CREATE PROCEDURE AMS.adicionarAlterarUser
    @ID INT,
    @FirstName VARCHAR(20),
    @LastName VARCHAR(20),
    @BirthDate DATE,
    @Sex CHAR(1),
    @Email VARCHAR(100),
    @Password VARCHAR(80),
    @Salary DECIMAL(10, 2) = NULL,
    @Imagem VARBINARY(MAX) = NULL,
    @ClubID INT = NULL,
    @EmailChecked BIT = 0,
    @Command VARCHAR(10),
    @Role VARCHAR(10) = NULL,
	@Height DECIMAL(5, 2) = NULL,  -- Added height parameter
    @Weight DECIMAL(5, 2) = NULL   -- Added weight parameter
AS
BEGIN
    -- Validate positive salary
    IF @Salary < 0
    BEGIN
        RAISERROR('Salary must be a positive value.', 16, 1);
        RETURN;
    END
    -- Validate email format
    IF @Email NOT LIKE '%@%.%'
    BEGIN
        RAISERROR('Invalid email format.', 16, 1);
        RETURN;
    END
    -- Validate club_ID
    IF @ClubID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM AMS.Club WHERE ID = @ClubID)
    BEGIN
        RAISERROR('Invalid club ID.', 16, 1);
        RETURN;
    END

    -- Check for duplicate emails
    IF EXISTS (SELECT 1 FROM AMS.[User] WHERE Email = @Email AND ID != @ID)
    BEGIN
        RAISERROR('Email already exists!', 16, 1);
        RETURN;
    END

    DECLARE @Columns NVARCHAR(MAX) = 'ID, FirstName, LastName, BirthDate, Sex, Email, Password, Salary, Imagem, ClubID, EmailChecked';
    DECLARE @Values NVARCHAR(MAX) = '@ID, @FirstName, @LastName, @BirthDate, @Sex, @Email, @Password, @Salary, @Imagem, @ClubID, @EmailChecked';
    DECLARE @SetClause NVARCHAR(MAX) = 'FirstName = @FirstName, LastName = @LastName, BirthDate = @BirthDate, Sex = @Sex, Email = @Email, Password = @Password, Salary = @Salary, Imagem = @Imagem, ClubID = @ClubID, EmailChecked = @EmailChecked';
    DECLARE @WhereClause NVARCHAR(MAX) = 'ID = @ID';
    DECLARE @ErrorMessage NVARCHAR(4000) = CASE WHEN @Command = 'adicionar' THEN 'User not inserted! Some data is incorrect' ELSE 'User not updated! Some data is incorrect' END;

    EXEC AMS.ExecuteSQL @Command, 'AMS.[User]', @Columns, @Values, @SetClause, @WhereClause, @ErrorMessage;

    IF @Command = 'adicionar'
    BEGIN
        IF @Role = 'Athlete'
        BEGIN

            -- Validate height and weight
            IF @Height <= 0 OR @Weight <= 0
            BEGIN
                RAISERROR('Height and weight must be positive values.', 16, 1);
                RETURN;
            END

            DECLARE @AthleteColumns NVARCHAR(MAX) = 'user_ID, CC, height, weight';
            DECLARE @AthleteValues NVARCHAR(MAX) = '@ID, @CC, @Height, @Weight';
            DECLARE @AthleteSetClause NVARCHAR(MAX) = 'CC = @CC, height = @Height, weight = @Weight';
            DECLARE @AthleteWhereClause NVARCHAR(MAX) = 'user_ID = @ID';
            DECLARE @AthleteErrorMessage NVARCHAR(4000) = 'Athlete not inserted! Some data is incorrect';

            EXEC AMS.ExecuteSQL 'adicionar', 'AMS.Athlete', @AthleteColumns, @AthleteValues, @AthleteSetClause, @AthleteWhereClause, @AthleteErrorMessage;
        END
        ELSE IF @Role = 'Coach'
        BEGIN
            DECLARE @CoachColumns NVARCHAR(MAX) = 'user_ID, qualifications';
            DECLARE @CoachValues NVARCHAR(MAX) = '@ID, @Qualifications';
            DECLARE @CoachSetClause NVARCHAR(MAX) = 'qualifications = @Qualifications';
            DECLARE @CoachWhereClause NVARCHAR(MAX) = 'user_ID = @ID';
            DECLARE @CoachErrorMessage NVARCHAR(4000) = 'Coach not inserted! Some data is incorrect';

            EXEC AMS.ExecuteSQL 'adicionar', 'AMS.Coach', @CoachColumns, @CoachValues, @CoachSetClause, @CoachWhereClause, @CoachErrorMessage;
        END
        ELSE IF @Role = 'Admin'
        BEGIN
            DECLARE @AdminColumns NVARCHAR(MAX) = 'user_ID, qualifications';
            DECLARE @AdminValues NVARCHAR(MAX) = '@ID, @Qualifications';
            DECLARE @AdminSetClause NVARCHAR(MAX) = 'qualifications = @Qualifications';
            DECLARE @AdminWhereClause NVARCHAR(MAX) = 'user_ID = @ID';
            DECLARE @AdminErrorMessage NVARCHAR(4000) = 'Admin not inserted! Some data is incorrect';

            EXEC AMS.ExecuteSQL 'adicionar', 'AMS.Admin', @AdminColumns, @AdminValues, @AdminSetClause, @AdminWhereClause, @AdminErrorMessage;
        END
    END
END;
GO
