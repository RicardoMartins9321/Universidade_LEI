-- Indexes for AMS.[User] Table
CREATE INDEX idx_User_club_ID ON AMS.[User](club_ID);
CREATE INDEX idx_User_email ON AMS.[User](email);

-- Indexes for AMS.Club Table
CREATE INDEX idx_Club_acronym ON AMS.Club(acronym);

-- Indexes for AMS.Athlete Table
CREATE INDEX idx_Athlete_user_ID ON AMS.Athlete(user_ID);
