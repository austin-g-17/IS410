-- Create tables

CREATE TABLE Player 
    (
        Player_ID       int      	NOT NULL,
        Player_Name     varchar(25) 	NOT NULL,
        Email           varchar(25) 	NOT NULL,
        DOB             date      	NOT NULL,
        Gender          varchar(1) 	NOT NULL
        	CHECK (Gender IN ('M', 'F', 'O')),
        Phone           int     	NOT NULL,
        Banned          int     	NOT NULL,
        
        PRIMARY KEY (Player_ID)
    );
    
CREATE TABLE Platform
	(
		Platform_ID    	int		NOT NULL,
		Platform_Name   varchar(15)	NOT NULL,
		Platform_Year	int		NOT NULL,
		Version_Number	varchar(5)	NOT NULL,
		Support_Email	varchar(25)	NOT NULL,
		
		PRIMARY KEY (Platform_ID)
	);
	
CREATE TABLE Game
    (
        Game_ID         int			NOT NULL,
        Game_Name       varchar(25)		NOT NULL,
        Genre           varchar(15) 		NOT NULL,
	Game_Year	int			NOT NULL,
	Rating		varchar(5)		NOT NULL,
	Platform_ID  	REFERENCES Platform(Platform_ID),

        PRIMARY KEY (Game_ID)
    );
	
CREATE TABLE Machine
    (
        Machine_ID      int			NOT NULL,
        Last_Use        date			NOT NULL,
        Damaged         int			NOT NULL,
        Platform_ID     REFERENCES Platform(Platform_ID),
    
        PRIMARY KEY (Machine_ID)
    );

CREATE TABLE Userdata
    (
        Account_ID      varchar(7)	NOT NULL,
        Username        varchar(10)	NOT NULL,
        Last_Login      date		NOT NULL,
	Register_Year	int		NOT NULL,
	Verified	varchar(1)	NOT NULL
			CHECK (Verified IN ('Y', 'N')),
        Player_ID       REFERENCES Player(Player_ID),
        Platform_ID     REFERENCES Platform(Platform_ID),
        Machine_ID      REFERENCES Machine(Machine_ID),
    
        PRIMARY KEY (Account_ID)
    );

CREATE TABLE Eula
    (
        Eula_ID         int			NOT NULL,
        Game_ID         REFERENCES Game(Game_ID),
        Account_ID      REFERENCES Userdata(Account_ID),
        
        PRIMARY KEY (Eula_ID)
    );
    
-- insert values

INSERT INTO Player VALUES (900000, 'Crow, Jane', 'jcrow@mail.com', '1981-10-31', 'F', 4105557295, 0);
INSERT INTO Player VALUES (900001, 'Lee, Stagger', 'staggerl@mail.com', '1972-02-12', 'M', 4105557892, 0);
INSERT INTO Player VALUES (900002, 'Finn, John', 'jfinn@mail.com', '1984-04-19', 'M', 4105554563, 0);
INSERT INTO Player VALUES (900003, 'West, Vincent', 'wvince@mail.com', '1988-03-03', 'M', 4105554125, 0);
INSERT INTO Player VALUES (900004, 'Day, Elisa', 'elisad@mail.com', '1983-05-26', 'F', 4105555236, 0);
INSERT INTO Player VALUES (900005, 'Holmes, Richard', 'holmr@mail.com', '1985-07-15', 'M', 4105553574, 0);
INSERT INTO Player VALUES (900006, 'Davenport, Henry', 'havenport@mail.com', '1984-10-21', 'M', 4105558569, 0);
INSERT INTO Player VALUES (900007, 'Carpenter, Kathleen', 'carpek@mail.com', '1985-09-18', 'F', 4105550291, 0);
INSERT INTO Player VALUES (900008, 'Bellows, Mary', 'bellm@mail.com', '1989-01-01', 'F', 4105551006, 0);
INSERT INTO Player VALUES (900009, 'Blake, Bill', 'blakeb@mail.com', '1975-12-10', 'M', 4105558246, 0);

INSERT INTO Platform VALUES (21, 'Aine', 1998, '8.3', 'support@aine.com');
INSERT INTO Platform VALUES (22, 'Besica', 1995, '9.1', 'help@besica.com');
INSERT INTO Platform VALUES (23, 'Cardcom', 1989, '14.3', 'fixit@card.com');

INSERT INTO Game VALUES (4001, 'Karting AX', 'Racing', 1999, 'EVERY', 21);
INSERT INTO Game VALUES (4002, 'Dance Fever', 'Rhythm', 2001, 'TEEN', 21);
INSERT INTO Game VALUES (4003, 'Bongo Heart', 'Rhythm', 2005, 'EVERY', 21);
INSERT INTO Game VALUES (4004, 'Blue Gear', 'Fighting', 2008, 'TEEN', 22);
INSERT INTO Game VALUES (4005, 'Blocks and Blobs', 'Puzzle', 2014, 'EVERY', 22);
INSERT INTO Game VALUES (4006, 'Time Debacle', 'Shooter', 1998, 'MATUR', 22);
INSERT INTO Game VALUES (4007, 'Kung Fugen', 'Fighting', 2003, 'TEEN', 23);
INSERT INTO Game VALUES (4008, 'Fighting Street', 'Fighting', 1991, 'TEEN', 23);
INSERT INTO Game VALUES (4009, 'DJ Extreme', 'Rhythm', 2009, 'TEEN', 23);

INSERT INTO Machine VALUES (101, '2021-05-08', 0, 21);
INSERT INTO Machine VALUES (102, '2021-05-07', 0, 21);
INSERT INTO Machine VALUES (103, '2021-05-07', 0, 21);
INSERT INTO Machine VALUES (104, '2021-05-08', 0, 22);
INSERT INTO Machine VALUES (105, '2021-05-07', 0, 22);
INSERT INTO Machine VALUES (106, '2021-05-07', 0, 22);
INSERT INTO Machine VALUES (107, '2021-05-08', 0, 23);
INSERT INTO Machine VALUES (108, '2021-05-08', 0, 23);
INSERT INTO Machine VALUES (109, '2021-05-06', 1, 23);

INSERT INTO Userdata VALUES ('A000000', 'TheCrow', '2021-05-08', 2011, 'Y', 900000, 21, 101);
INSERT INTO Userdata VALUES ('B000000', 'TheCrow', '2021-05-08', 2011, 'Y', 900000, 22, 104);
INSERT INTO Userdata VALUES ('C000001', 'LeStag', '2021-05-06', 2016, 'Y', 900001, 23, 109);
INSERT INTO Userdata VALUES ('A000010', 'Sharkfin', '2021-04-19', 2013, 'Y', 900002, 21, 102);
INSERT INTO Userdata VALUES ('B000011', 'Westward', '2021-05-07', 2015, 'Y', 900003, 22, 105);
INSERT INTO Userdata VALUES ('C000100', 'GoodDay', '2021-05-08', 2018, 'Y', 900004, 23, 107);
INSERT INTO Userdata VALUES ('A000100', 'GoodDay', '2021-05-07', 2017, 'Y', 900004, 21, 103);
INSERT INTO Userdata VALUES ('B000101', 'Homeboy', '2021-05-01', 2012, 'Y', 900005, 22, 106);
INSERT INTO Userdata VALUES ('C000101', 'Homeboy', '2021-05-08', 2012, 'Y', 900005, 23, 108);
INSERT INTO Userdata VALUES ('A000110', 'Porty', '2021-05-05', 2008, 'Y', 900006, 21, 101);
INSERT INTO Userdata VALUES ('B000110', 'Pouty', '2021-05-06', 2009, 'Y', 900006, 22, 105);
INSERT INTO Userdata VALUES ('C000110', 'Pointy', '2021-05-05', 2010, 'Y', 900006, 23, 107);
INSERT INTO Userdata VALUES ('A000111', 'Karpet', '2021-05-07', 2015, 'Y', 900007, 21, 102);
INSERT INTO Userdata VALUES ('B001000', 'WindyMary', '2021-05-07', 2014, 'Y', 900008, 22, 106);
INSERT INTO Userdata VALUES ('C001001', 'Balakey', '2021-04-28', 2017, 'Y', 900009, 23, 109);

INSERT INTO Eula VALUES (88880001, 4001, 'A000000');
INSERT INTO Eula VALUES (88880002, 4004, 'B000000');
INSERT INTO Eula VALUES (88880003, 4006, 'B000000');
INSERT INTO Eula VALUES (88880004, 4007, 'C000001');
INSERT INTO Eula VALUES (88880005, 4008, 'C000001');
INSERT INTO Eula VALUES (88880006, 4002, 'A000010');
INSERT INTO Eula VALUES (88880007, 4003, 'A000010');
INSERT INTO Eula VALUES (88880008, 4005, 'B000011');
INSERT INTO Eula VALUES (88880009, 4009, 'C000100');
INSERT INTO Eula VALUES (88880010, 4003, 'A000100');
INSERT INTO Eula VALUES (88880011, 4006, 'B000101');
INSERT INTO Eula VALUES (88880012, 4008, 'C000101');
INSERT INTO Eula VALUES (88880013, 4001, 'A000110');
INSERT INTO Eula VALUES (88880014, 4004, 'B000110');
INSERT INTO Eula VALUES (88880015, 4009, 'C000110');
INSERT INTO Eula VALUES (88880016, 4002, 'A000111');
INSERT INTO Eula VALUES (88880017, 4005, 'B001000');
INSERT INTO Eula VALUES (88880018, 4007, 'C001001'); 

-- 2 Select Statements

-- Check gender demographics

SELECT Player.Gender, COUNT(Player.Gender) 
FROM Player 
GROUP BY Player.Gender;

-- Check machine status

SELECT Machine.Machine_ID, Platform.Platform_Name, Machine.Damaged
FROM Machine
INNER JOIN Platform ON Machine.Platform_ID = Platform.Platform_ID;

-- 2 Join Queries with Group By

-- Check how many of each platform are installed and running

SELECT Platform.Platform_Name, COUNT(Platform.Platform_Name)
FROM Machine
LEFT JOIN Platform ON Machine.Platform_ID = Platform.Platform_ID
WHERE Machine.Damaged = 0
GROUP BY Platform.Platform_Name;

-- Check popular genres to plan event

SELECT Game.Genre, COUNT(Game.Genre)
FROM Eula
LEFT JOIN Game ON Eula.Game_ID = Game.Game_ID
GROUP BY Game.Genre;

-- 4 Additional Join Queries 

-- Send email to players interested in fighting games

SELECT DISTINCT Player.Email
FROM Player
INNER JOIN Userdata ON Player.Player_ID = Userdata.Player_ID
INNER JOIN Eula ON Userdata.Account_ID = Eula.Account_ID
INNER JOIN Game ON Eula.Game_ID = Game.Game_ID
WHERE Game.Genre = 'Fighting';

-- Find out who damaged the machine

SELECT Userdata.Username, Userdata.Account_ID , Machine.Last_Use, Userdata.Last_Login, Userdata.Machine_ID, Machine.Damaged
FROM Userdata
INNER JOIN Machine ON Machine.Machine_ID = Userdata.Machine_ID
WHERE Machine.Damaged = 1;

-- See if there were any witnesses that day

SELECT Userdata.Username, Userdata.Account_ID, Userdata.Last_Login, Userdata.Machine_ID
FROM Userdata
INNER JOIN Machine ON Machine.Last_Use = Userdata.Last_Login
WHERE Machine.Damaged = 1;

-- Find the contact info of player who broke the machine

SELECT Player.*, Userdata.Account_ID 
FROM Player
INNER JOIN Userdata
ON Player.Player_ID = Userdata.Player_ID
WHERE Userdata.Account_ID = 'C000001';

-- 2 Update Statements

-- Ban the player who broke the machine

UPDATE Player
SET Banned = 1
WHERE Player_ID = 900001;

-- Fix the machine

UPDATE Machine
SET Damaged = 0
WHERE Machine_ID = 109;

-- Display update results

SELECT Player.*, Userdata.Account_ID, Userdata.Machine_ID, Machine.Damaged
FROM Player
INNER JOIN Userdata ON Player.Player_ID = Userdata.Player_ID
INNER JOIN Machine ON Userdata.Machine_ID = Machine.Machine_ID
WHERE Userdata.Account_ID = 'C000001';
