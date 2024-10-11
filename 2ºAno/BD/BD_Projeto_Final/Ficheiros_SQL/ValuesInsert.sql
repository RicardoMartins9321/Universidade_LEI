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
('Renato', 'Abrantes', '1985-05-15', 'M', 'emailtest1.@gmail.com', AMS.fnEncryptPassword('password456'), 400.00, 1, 0),
('Maria', 'Ferreira', '1975-03-23', 'F', 'maria.ferreira@gmail.com', AMS.fnEncryptPassword('password654'), 500.00, 2, 1),
('Pedro', 'Almeida', '1990-11-12', 'M', 'pedro.almeida@gmail.com', AMS.fnEncryptPassword('password321'), 420.00, 3, 0),
('Artur', 'Silva', '1970-04-22', 'M', 'artur.silva@gmail.com', AMS.fnEncryptPassword('password666'), 600.00, 4, 1),
('Vera', 'Mendes', '1982-07-19', 'F', 'vera.mendes@gmail.com', AMS.fnEncryptPassword('password777'), 620.00, 5, 0),
('Rui', 'Costa', '1978-01-15', 'M', 'rui.costa@gmail.com', AMS.fnEncryptPassword('password888'), 590.00, 6, 1),
('Paula', 'Sousa', '1983-09-09', 'F', 'paula.sousa@gmail.com', AMS.fnEncryptPassword('password999'), 610.00, 7, 0),
('Nuno', 'Ramos', '1975-12-12', 'M', 'nuno.ramos@gmail.com', AMS.fnEncryptPassword('password000'), 580.00, 8, 1),
('Isabel', 'Pereira', '1979-03-03', 'F', 'isabel.pereira@gmail.com', AMS.fnEncryptPassword('password1234'), 600.00, 9, 0),
('Hugo', 'Fernandes', '1980-11-11', 'M', 'hugo.fernandes@gmail.com', AMS.fnEncryptPassword('password5678'), 615.00, 10, 1),
('Teresa', 'Oliveira', '1984-06-06', 'F', 'teresa.oliveira@gmail.com', AMS.fnEncryptPassword('password9101'), 620.00, 11, 0),
('Carlos', 'Ferreira', '1976-02-02', 'M', 'carlos.ferreira@gmail.com', AMS.fnEncryptPassword('password1112'), 590.00, 12, 1),
('Ana', 'Rodrigues', '1985-05-05', 'F', 'ana.rodrigues@gmail.com', AMS.fnEncryptPassword('password1314'), 600.00, 13, 0),
('Jorge', 'Martins', '1981-08-08', 'M', 'jorge.martins@gmail.com', AMS.fnEncryptPassword('password1516'), 605.00, 14, 1),
('Marta', 'Silva', '1974-09-09', 'F', 'marta.silva@gmail.com', AMS.fnEncryptPassword('password1718'), 610.00, 15, 0),

-- The users to be athletes
('Ricardo', 'Martins', '2004-08-04', 'M', 'ricardomartins9321@gmail.com', AMS.fnEncryptPassword('password123'), 0.00, 1, 1),
('Beatriz', 'Santos', '2005-05-07', 'M', 'emailtest2.@gmail.com', AMS.fnEncryptPassword('password789'), 150.00, 2, 0),
('Ana', 'Costa', '2003-02-15', 'F', 'ana.costa@gmail.com', AMS.fnEncryptPassword('password123'), 0.00, 3, 1),
('João', 'Pereira', '2002-06-18', 'M', 'joao.pereira@gmail.com', AMS.fnEncryptPassword('password456'), 0.00, 4, 0),
('Sofia', 'Nunes', '2001-09-21', 'F', 'sofia.nunes@gmail.com', AMS.fnEncryptPassword('password789'), 0.00, 5, 1),
('Carlos', 'Oliveira', '1999-12-30', 'M', 'carlos.oliveira@gmail.com', AMS.fnEncryptPassword('password012'), 0.00, 6, 0),
('Inês', 'Rodrigues', '2004-11-01', 'F', 'ines.rodrigues@gmail.com', AMS.fnEncryptPassword('password345'), 0.00, 7, 1),
('André', 'Sousa', '2000-01-01', 'M', 'andre.sousa@gmail.com', AMS.fnEncryptPassword('password1920'), 0.00, 8, 1),
('Catarina', 'Neves', '2001-02-02', 'F', 'catarina.neves@gmail.com', AMS.fnEncryptPassword('password2122'), 0.00, 9, 0),
('Bruno', 'Marques', '2002-03-03', 'M', 'bruno.marques@gmail.com', AMS.fnEncryptPassword('password2324'), 0.00, 10, 1),
('Joana', 'Carvalho', '2003-04-04', 'F', 'joana.carvalho@gmail.com', AMS.fnEncryptPassword('password2526'), 0.00, 11, 0),
('Luís', 'Correia', '2004-05-05', 'M', 'luis.correia@gmail.com', AMS.fnEncryptPassword('password2728'), 0.00, 12, 1),
('Raquel', 'Lima', '2005-06-06', 'F', 'raquel.lima@gmail.com', AMS.fnEncryptPassword('password2930'), 0.00, 13, 0),
('Tiago', 'Alves', '2006-07-07', 'M', 'tiago.alves@gmail.com', AMS.fnEncryptPassword('password3132'), 0.00, 14, 1),
('Patrícia', 'Ribeiro', '2007-08-08', 'F', 'patricia.ribeiro@gmail.com', AMS.fnEncryptPassword('password3334'), 0.00, 15, 0),
('Gonçalo', 'Matos', '2008-09-09', 'M', 'goncalo.matos@gmail.com', AMS.fnEncryptPassword('password3536'), 0.00, 1, 1),
('Rita', 'Fernandes', '2009-10-10', 'F', 'rita.fernandes@gmail.com', AMS.fnEncryptPassword('password3738'), 0.00, 2, 0),
('Miguel', 'Cunha', '1999-11-11', 'M', 'miguel.cunha@gmail.com', AMS.fnEncryptPassword('password3940'), 0.00, 3, 1),
('Sofia', 'Gomes', '1998-12-12', 'F', 'sofia.gomes@gmail.com', AMS.fnEncryptPassword('password4142'), 0.00, 4, 0),
('Ricardo', 'Barros', '1997-01-13', 'M', 'ricardo.barros@gmail.com', AMS.fnEncryptPassword('password4344'), 0.00, 5, 1),
('Helena', 'Sousa', '1996-02-14', 'F', 'helena.sousa@gmail.com', AMS.fnEncryptPassword('password4546'), 0.00, 6, 0),
('Vasco', 'Fernandes', '1995-03-15', 'M', 'vasco.fernandes@gmail.com', AMS.fnEncryptPassword('password4748'), 0.00, 7, 1),
('Ana', 'Carvalho', '1994-04-16', 'F', 'ana.carvalho@gmail.com', AMS.fnEncryptPassword('password4950'), 0.00, 8, 0),
('Daniel', 'Silva', '1993-05-17', 'M', 'daniel.silva@gmail.com', AMS.fnEncryptPassword('password5152'), 0.00, 9, 1),
('Teresa', 'Martins', '1992-06-18', 'F', 'teresa.martins@gmail.com', AMS.fnEncryptPassword('password5354'), 0.00, 10, 0),
('Diogo', 'Rodrigues', '1991-07-19', 'M', 'diogo.rodrigues@gmail.com', AMS.fnEncryptPassword('password5556'), 0.00, 11, 1),
('Marta', 'Costa', '1990-08-20', 'F', 'marta.costa@gmail.com', AMS.fnEncryptPassword('password5758'), 0.00, 12, 0),
('António', 'Neves', '1989-09-21', 'M', 'antonio.neves@gmail.com', AMS.fnEncryptPassword('password5960'), 0.00, 13, 1),
('Clara', 'Silva', '1988-10-22', 'F', 'clara.silva@gmail.com', AMS.fnEncryptPassword('password6162'), 0.00, 14, 0),
('Henrique', 'Lopes', '1987-11-23', 'M', 'henrique.lopes@gmail.com', AMS.fnEncryptPassword('password6364'), 0.00, 15, 1),
('Vânia', 'Pereira', '1986-12-24', 'F', 'vania.pereira@gmail.com', AMS.fnEncryptPassword('password6566'), 0.00, 1, 0),
('Nuno', 'Sousa', '1985-01-25', 'M', 'nuno.sousa@gmail.com', AMS.fnEncryptPassword('password6768'), 0.00, 2, 1),
('Ana', 'Fernandes', '1984-02-26', 'F', 'ana.fernandes@gmail.com', AMS.fnEncryptPassword('password6970'), 0.00, 3, 0),
('Joaquim', 'Ramos', '1983-03-27', 'M', 'joaquim.ramos@gmail.com', AMS.fnEncryptPassword('password7172'), 0.00, 4, 1),
('Laura', 'Pires', '1982-04-28', 'F', 'laura.pires@gmail.com', AMS.fnEncryptPassword('password7374'), 0.00, 5, 0),
('Paulo', 'Gonçalves', '1981-05-29', 'M', 'paulo.goncalves@gmail.com', AMS.fnEncryptPassword('password7576'), 0.00, 6, 1),
('Célia', 'Rodrigues', '1980-06-30', 'F', 'celia.rodrigues@gmail.com', AMS.fnEncryptPassword('password7778'), 0.00, 7, 0),
('Pedro', 'Sousa', '1979-07-01', 'M', 'pedro.sousa@gmail.com', AMS.fnEncryptPassword('password7980'), 0.00, 8, 1),
('Rita', 'Lima', '1978-08-02', 'F', 'rita.lima@gmail.com', AMS.fnEncryptPassword('password8182'), 0.00, 9, 0),
('José', 'Pereira', '1977-09-03', 'M', 'jose.pereira@gmail.com', AMS.fnEncryptPassword('password8384'), 0.00, 10, 1),
('Fernanda', 'Matos', '1976-10-04', 'F', 'fernanda.matos@gmail.com', AMS.fnEncryptPassword('password8586'), 0.00, 11, 0),
-- The users to be partners
('Helena', 'Marques', '1988-04-22', 'F', 'helena.marques@gmail.com', AMS.fnEncryptPassword('password111'), 150.00, 2, 1),
('Miguel', 'Teixeira', '1985-05-14', 'M', 'miguel.teixeira@gmail.com', AMS.fnEncryptPassword('password222'), 150.00, 1, 0),
('Sara', 'Lopes', '1992-08-19', 'F', 'sara.lopes@gmail.com', AMS.fnEncryptPassword('password333'), 150.00, 2, 1),
('Diogo', 'Faria', '1987-10-05', 'M', 'diogo.faria@gmail.com', AMS.fnEncryptPassword('password444'), 150.00, 1, 0),
('Rita', 'Gomes', '1991-01-29', 'F', 'rita.gomes@gmail.com', AMS.fnEncryptPassword('password555'), 150.00, 2, 1),
('Manuel', 'Monteiro', '1975-11-05', 'M', 'manuel.monteiro@gmail.com', AMS.fnEncryptPassword('password8788'), 150.00, 1, 0),
('Helena', 'Pinto', '1988-12-06', 'F', 'helena.pinto@gmail.com', AMS.fnEncryptPassword('password8990'), 150.00, 2, 1),
('Miguel', 'Silva', '1985-01-07', 'M', 'miguel.silva@gmail.com', AMS.fnEncryptPassword('password9192'), 150.00, 1, 0),
('Sofia', 'Santos', '1992-02-08', 'F', 'sofia.santos@gmail.com', AMS.fnEncryptPassword('password9394'), 150.00, 2, 1),
('João', 'Nunes', '1987-03-09', 'M', 'joao.nunes@gmail.com', AMS.fnEncryptPassword('password9596'), 150.00, 1, 0);


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
