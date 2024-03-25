
CREATE DATABASE sportsbook;
USE sportsbook;

CREATE TABLE Users (
UID SMALLINT UNSIGNED NOT NULL,
UName VARCHAR(40) NOT NULL,
UState VARCHAR(15),
Age SMALLINT UNSIGNED,
Rewards VARCHAR(10),
Balance DECIMAL(12,2),
PRIMARY KEY(UID)
);


CREATE TABLE Events (
EID SMALLINT UNSIGNED NOT NULL,
EType VARCHAR(20),
EDate Date,
HomeTeam VARCHAR(40),
AwayTeam VARCHAR(40),
PRIMARY KEY(EID)
);


CREATE TABLE Wagers (
WID SMALLINT UNSIGNED NOT NULL,
UID SMALLINT UNSIGNED NOT NULL,
EID SMALLINT UNSIGNED NOT NULL,
Amount DECIMAL (12,2),
WType ENUM('Moneyline', 'Spread', 'Total', 'SGP'),
Outcome ENUM('Win', 'Loss', 'Push', 'Pending'),
WDate DATE,
TeamBet VARCHAR(40),
PRIMARY KEY(WID),
FOREIGN KEY(UID) REFERENCES Users(UID),
FOREIGN KEY(EID) REFERENCES Events(EID)
);
  
INSERT INTO Users VALUES
(100, 'Mario Flego', 'NJ', 22, 'Diamond', 500000.00),
(101, 'Ryan Kozack', 'NJ', 24, 'Gold', 500.72),
(102, 'Jack Farrelo', 'SC', 25, 'Silver', 0.00),
(103, 'Kieran Leister', 'FL', 65, 'Platinum', 40000.00),
(104, 'Michael Sullivan', 'PA', 30, 'Silver', 20.20),
(105, 'Ryan Murphy', 'OH', 55, 'Gold', 1000.00),
(106, 'Jacob Ryerson', 'NY', 18, 'Bronze', 15.85),
(107, 'Frank Reynolds', 'NJ', 79, 'Diamond', 1000000.00),
(108, 'Charlie Kelly', 'PA', 48, 'Platinum', 75000.00),
(109, 'Mac MacDonald', 'CA', 45, 'Bronze', 0.00),
(110, 'Sidney Deane', 'CA', 52, 'Platinum', 25000.00),
(111, 'Brad Belick', 'MA', 62, 'Silver', 550.48),
(112, 'Cheeky McSnipes', 'NJ', 22, 'Diamond', 750000.00),
(113, 'Michael Scott', 'AZ', 33, 'Silver', 2000.40),
(114, 'Brian Goodridge', 'RI', 34, 'Gold', 65400.00),
(115, 'Dave Ainsele', 'RI', 58, 'Gold', 70800.00),
(116, 'Niall McStay', 'NY', 14, 'Silver', 250.00),
(117, 'John Powers', 'PA', 23, 'Gold', 800.70),
(118, 'Griffin Bailey', 'VA', 60, 'Gold', 125.80);

INSERT INTO Events VALUES
(200, 'Football', '2022-03-24','New York Jets','New England Patriots'),
(201, 'Basketball', '2022-07-15','New York Knicks','Boston Celtics'),
(202, 'Baseball', '2021-04-24','New York Yankees','Boston Red Sox'),
(203, 'Hockey', '2023-08-21','New York Rangers','Carolina Hurricanes'),
(204, 'College Basketball', '2024-03-07','Providence Friars','Uconn Huskies'),
(205, 'Football', '2022-09-14','Kansas City Chiefs','New Orleans Saints'),
(206, 'UFC', '2020-09-01','Conor McGregor','Michael Chandler'),
(207, 'Football', '2025-10-25','Philadelphia Eagles','Houston Texans'),
(208, 'Football', '2022-03-24','New York Jets','Miami Dolphins'),
(209, 'Baseball', '2022-03-24','Philadelphia Phillies','New York Mets'),
(210, 'College Basketball', '2023-03-09','North Carolina Tarheels','Duke Blue Devils'),
(211, 'Basketball', '2022-06-08','Los Angeles Lakers','San Antonio Spurs'),
(212, 'Rugby', '2024-03-20','Ireland','England'),
(213, 'Baseball', '2024-05-20','San Diego Padres','Los Angeles Dodgers'),
(214, 'College Basketball', '2024-11-10','Kentucky Wildcats','Alabama Crimson Tide'),
(215, 'Basketball', '2020-02-22','Idiana Pacers','Chicago Bulls');

INSERT INTO Wagers VALUES
(300, 107, 208, 10000000.00, 'Moneyline', 'Win', '2022-03-24', 'New York Jets'),
(301, 100, 203, 500000.00, 'Spread', 'Win', '2023-08-20', 'New York Rangers'),
(302, 108, 210, 2000.00, 'Moneyline', 'Loss', '2023-03-09', 'Duke Blue Devils'),
(303, 104, 209, 40.50, 'SGP', 'Loss', '2022-03-24', NULL),
(304, 103, 206, 50000.00, 'Moneyline', 'Win', '2020-09-01', 'Conor McGregor'),
(305, 114, 209, 50.00, 'Spread', 'Push', '2022-03-24', 'New York Mets'),
(306, 110, 206, 40.80, 'Moneyline', 'Win', '2021-09-01', 'Conor McGregor'),
(307, 111, 201, 450.00, 'SGP', 'Loss', '2022-07-14', NULL),
(308, 116, 212, 50.00, 'Moneyline', 'Win', '2024-03-20', 'Ireland'),
(309, 113, 207, 100.00, 'Spread', 'Pending', '2024-07-12', 'Houston Texans'),
(310, 105, 205, 42.68, 'Spread', 'Loss', '2022-09-12', 'Kansas City Chiefs'),
(311, 101, 200, 200.00, 'Moneyline', 'Win', '2022-03-21', 'New York Jets'),
(312, 102, 202, 10.42, 'Spread', 'Win', '2021-04-24', 'New York Yankees'),
(313, 106, 201, 40.00, 'Total', 'Push', '2022-07-13', 'New York Knicks'),
(314, 109, 204, 555.00, 'Moneyline', 'Loss', '2024-03-05', 'Uconn Huskies'),
(315, 112, 203, 45000.00, 'SGP', 'Win', '2023-08-21', NULL),
(316, 100, 208, 50000.00, 'Spread', 'Push', '2022-03-24', 'New York Jets'),
(317, 117, 214, 11.00, 'Total', 'Loss', '2024-11-10', 'Alabama Crimson Tide'),
(318, 118, 200, 40.00, 'Moneyline', 'Loss', '2022-03-20', 'New England Patriots'),
(319, 107, 206, 400000.00, 'Moneyline', 'Loss', '2020-09-01', 'Michael Chandler'),
(320, 107, 200, 550000.00, 'Spread', 'Win', '2022-03-24', 'New York Jets');

-- Show all names of Users and their State
SELECT UName, UState 
FROM Users;

-- How many Users in each State
SELECT UState, COUNT(*) AS NumUsers
FROM Users
GROUP BY UState
ORDER BY NumUsers DESC;

-- Average Age of users from each state
SELECT UState, AVG(Age) AS AvgAge
FROM Users
GROUP BY Ustate
ORDER BY AvgAge DESC;

-- List Users by Age (oldest to youngest)
SELECT UName, Age
FROM Users
ORDER BY Age DESC;

-- Show all Users under 30
SELECT *
FROM Users
WHERE Age<30;

-- How many Users at each rewards level
SELECT Rewards, COUNT(*) AS NumUsers
FROM Users
GROUP BY Rewards
ORDER BY NumUsers DESC;

-- Show all users that have an empty Balance
SELECT *
FROM Users
WHERE Balance=0.00;

-- Show Total Balance of each rewards level
SELECT Rewards, SUM(Balance) AS TotalBalance
FROM Users
GROUP BY Rewards
ORDER BY TotalBalance DESC;

-- Show Users with top 5 total wager amounts
SELECT Users.UID, Users.UName, SUM(Wagers.Amount) AS TotalAmtWagered
FROM Users, Wagers
WHERE Users.UID=Wagers.UID
GROUP BY Users.UID, Users.UName
ORDER BY TotalAmtWagered DESC
LIMIT 5;

-- Show all active bets
SELECT *
FROM Wagers
WHERE Outcome='Pending';

-- What was the most amount each User wagered
SELECT UName, MAX(Amount)
FROM Users, Wagers
WHERE Wagers.UID=Users.UID
GROUP BY UName;

-- What was the most popular wager type
SELECT WType, COUNT(*) AS NumWagers
FROM Wagers
GROUP BY WType
ORDER BY NumWagers DESC
LIMIT 1;

-- Show how many times each result occurred for wagers $500 and over
SELECT Outcome , COUNT(*) AS NumWagers
FROM Wagers
WHERE Amount>=500
GROUP BY Outcome;

-- How many bets were placed before January 1st 2023
SELECT COUNT(*) AS NumWagers
FROM Wagers
WHERE WDate<('2023-01-01');


-- How many times was each team bet
SELECT TeamBet, COUNT(*) AS NumWagers
FROM Wagers
GROUP BY TeamBet
ORDER BY NumWagers DESC;


-- Which team had the most wagers placed on them
SELECT TeamBet, COUNT(*) AS NumWagers
FROM Wagers
GROUP BY TeamBet
ORDER BY NumWagers DESC
LIMIT 1;

-- How much total money did Frank Reynolds wager
SELECT SUM(Amount) AS TotalAmtWagered
FROM Wagers, Users
WHERE Wagers.UID=Users.UID AND Users.UName='Frank Reynolds';

-- What Sport did Gold Rewards members bet the most on
SELECT Events.EType, COUNT(*) NumWagers
FROM Users, Wagers, Events
WHERE Users.UID=Wagers.UID AND Wagers.EID=Events.EID AND Users.Rewards='Gold'
GROUP BY EType
ORDER BY NumWagers DESC
LIMIT 1;

-- Which events had the top 5 amounts wager
SELECT Events.EID, Events.HomeTeam, Events.AwayTeam, SUM(Wagers.Amount) AS TotalWagerAmount
FROM Events
JOIN Wagers ON Events.EID = Wagers.EID
GROUP BY Events.EID, Events.HomeTeam, Events.AwayTeam
ORDER BY TotalWagerAmount DESC
LIMIT 5;

-- Were there any games that no one bet on
SELECT *
FROM Events
WHERE NOT EXISTS(SELECT *																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																												
                 FROM Wagers
                 WHERE Wagers.EID=Events.EID);
                 