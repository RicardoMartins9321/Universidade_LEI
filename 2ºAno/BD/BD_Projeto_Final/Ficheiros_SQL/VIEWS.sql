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


DROP VIEW IF EXISTS AMS.vw_ClubStatistics;
GO
CREATE VIEW AMS.vw_ClubStatistics AS
SELECT
    c.ID AS ClubID,
    c.name AS ClubName,
    c.location AS Location,
    c.founding_date AS FoundingDate,
    cs.NumberOfAthletes,
    cs.NumberOfCoaches,
    cs.NumberOfPartners
FROM
    AMS.Club c
CROSS APPLY
    AMS.GetClubStatistics(c.ID) cs;
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
