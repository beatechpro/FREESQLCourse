
-- Create the database and tables
CREATE DATABASE MovieDB;
USE MovieDB;

-- Create the "directors" table
CREATE TABLE directors (
    DirectorID INT PRIMARY KEY,
    DirectorName NVARCHAR(100)
);

-- Create the "main_characters" table
CREATE TABLE main_characters (
    CharacterID INT PRIMARY KEY,
    CharacterName NVARCHAR(100)
);

-- Create the "movies" table
CREATE TABLE movies (
    MovieID INT PRIMARY KEY,
    Title NVARCHAR(100),
    ReleaseYear INT,
    DirectorID INT,
    CONSTRAINT FK_DirectorID FOREIGN KEY (DirectorID) REFERENCES directors (DirectorID)
);

-- Create the junction table "movie_characters" to establish the many-to-many relationship
CREATE TABLE movie_characters (
    MovieID INT,
    CharacterID INT,
    CONSTRAINT PK_movie_characters PRIMARY KEY (MovieID, CharacterID),
    CONSTRAINT FK_MovieID FOREIGN KEY (MovieID) REFERENCES movies (MovieID),
    CONSTRAINT FK_CharacterID FOREIGN KEY (CharacterID) REFERENCES main_characters (CharacterID)
);

-- Insert director data into the "directors" table
INSERT INTO directors (DirectorID, DirectorName)
VALUES
    (1, 'Jon Favreau'),
    (2, 'Louis Leterrier'),
    (3, 'Kenneth Branagh'),
    (4, 'Joss Whedon'),
    (5, 'James Gunn'),
    (6, 'Taika Waititi'),
    (7, 'Joe Russo'),
    (8, 'Scott Derrickson'),
    (9, 'Peyton Reed'),
    (10, 'Anthony Russo');

-- Insert main character data into the "main_characters" table
INSERT INTO main_characters (CharacterID, CharacterName)
VALUES
    (1, 'Tony Stark'),
    (2, 'Pepper Potts'),
    (3, 'Obadiah Stane'),
    (4, 'Bruce Banner'),
    (5, 'Betty Ross'),
    (6, 'Emil Blonsky'),
    (7, 'Thor'),
    (8, 'Jane Foster'),
    (9, 'Loki'),
    (10, 'Steve Rogers'),
    (11, 'Peggy Carter'),
    (12, 'Red Skull'),
    (13, 'Natasha Romanoff'),
    (14, 'Clint Barton'),
    (15, 'Bruce Wayne'),
    (16, 'Alfred Pennyworth'),
    (17, 'Diana Prince'),
    (18, 'Clark Kent'),
    (19, 'Lois Lane'),
    (20, 'Lex Luthor'),
    (21, 'Peter Parker'),
    (22, 'Mary Jane Watson'),
    (23, 'Harry Osborn'),
    (24, 'Norman Osborn'),
    (25, 'Gwen Stacy'),
    (26, 'Miles Morales'),
    (27, 'Black Widow'),
    (28, 'Hawkeye'),
    (29, 'Nick Fury'),
    (30, 'Maria Hill'),
    (31, 'Vision'),
    (32, 'Scarlet Witch'),
    (33, 'Ant-Man'),
    (34, 'Wasp'),
    (35, 'Black Panther'),
    (36, 'Doctor Strange'),
    (37, 'Thanos'),
    (38, 'Gamora'),
    (39, 'Star-Lord'),
    (40, 'Rocket Raccoon');

-- Insert movie data into the "movies" table and set the DirectorID
INSERT INTO movies (MovieID, Title, ReleaseYear, DirectorID)
VALUES
    (1, 'Iron Man', 2008, 1),
    (2, 'The Incredible Hulk', 2008, 2),
    (3, 'Iron Man 2', 2010, 1),
    (4, 'Thor', 2011, 3),
    (5, 'Captain America: The First Avenger', 2011, 4),
    (6, 'The Avengers', 2012, 4),
    (7, 'Iron Man 3', 2013, 1),
    (8, 'Thor: The Dark World', 2013, 3),
    (9, 'Captain America: The Winter Soldier', 2014, 7),
    (10, 'Guardians of the Galaxy', 2014, 5),
    (11, 'Doctor Strange', 2016, 8),
    (12, 'Ant-Man', 2015, 9),
    (13, 'Black Panther', 2018, 10),
    --(14, 'Spider-Man: Homecoming', 2017, 11), foreign key violation
    (15, 'Thor: Ragnarok', 2017, 6),
    (16, 'Guardians of the Galaxy Vol. 2', 2017, 5),
    (17, 'Avengers: Infinity War', 2018, 7),
    (18, 'Ant-Man and The Wasp', 2018, 9),
    (19, 'Captain Marvel', 2019, 10),
    (20, 'Avengers: Endgame', 2019, 7);

-- Insert movie characters into the "movie_characters" junction table
INSERT INTO movie_characters (MovieID, CharacterID)
VALUES
    (1, 1), (1, 2), (1, 3), (1, 7), (1, 13), -- Iron Man
    (2, 4), (2, 5), (2, 6), -- The Incredible Hulk
    (3, 1), (3, 2), (3, 7), (3, 14), (3, 13), -- Iron Man 2
    (4, 7), (4, 8), (4, 9), (4, 12), (4, 13), -- Thor
    (5, 10), (5, 11), (5, 12), (5, 13), -- Captain America: The First Avenger
    (6, 1), (6, 2), (6, 10), (6, 13), (6, 29), -- The Avengers
    (7, 1), (7, 2), (7, 3), (7, 14), (7, 13), -- Iron Man 3
    (8, 7), (8, 8), (8, 9), (8, 14), (8, 13), -- Thor: The Dark World
    (9, 10), (9, 11), (9, 13), (9, 27), (9, 30), -- Captain America: The Winter Soldier
    (10, 13), (10, 14), (10, 37), (10, 39), (10, 40), -- Guardians of the Galaxy
    (11, 36), (11, 31)


--SELECT *

SELECT * 
FROM movies m

SELECT *
FROM movie_characters mc
where MovieID in (1,2,3,4)

SELECT *
FROM main_characters mch 

SELECT *
FROM directors d

------------ SELECTS WITH WHERES AND ORDERS ------------

SELECT * 
FROM movies m
ORDER BY Title 

SELECT * 
FROM movies m
WHERE Title LIKE 'galaxy%'

SELECT * 
FROM movies m
WHERE DirectorID = 9

SELECT *
FROM movie_characters mc
where MovieID in (1,2,3,4)

------------ SELECTS WITH JOINS ------------

-- INNER JOIN
SELECT 
	m.*, 
	d.DirectorName
FROM movies m
INNER JOIN directors d on m.DirectorID = d.DirectorID
--WHERE M.DirectorID = 9

-- FULL OUTER JOIN
SELECT 
	m.*, 
	d.DirectorName
FROM movies m
FULL OUTER JOIN directors d on m.DirectorID = d.DirectorID

-- INNER one to many join with intersection 
SELECT 
	m.MovieID, 
	m.DirectorID, 
	MCH.CharacterID, 
	m.ReleaseYear, 
	m.Title, 
	mch.CharacterName
FROM movies m
JOIN movie_characters mc on m.MovieID = mc.MovieID
JOIN main_characters mch on mc.CharacterID = mch.CharacterID

-- LEFT one to many join with intersection 
SELECT 
	m.MovieID, 
	m.DirectorID, 
	MCH.CharacterID, 
	m.ReleaseYear, 
	m.Title, 
	mch.CharacterName
FROM movies m
LEFT JOIN movie_characters mc on m.MovieID = mc.MovieID
LEFT JOIN main_characters mch on mc.CharacterID = mch.CharacterID
where m.MovieID = 1
and mch.CharacterID = 7

------------ DELETE INCORRECT CHARACTER ------------

SELECT *
FROM movie_characters
WHERE MovieID = 1
AND CharacterID = 7

DELETE FROM movie_characters
WHERE MovieID = 1
AND CharacterID = 7

--Can't delete because of foreign key
DELETE FROM directors
WHERE DirectorID = 1

------------ INSERT NEW CHARACTER ------------

SELECT *
FROM main_characters

INSERT INTO main_characters(CharacterID, CharacterName)
VALUES(41, 'Groot') --No IDENTITY column so you need to manually enter the ID. Show IDENTITY later on.

INSERT INTO movie_characters(MovieID, CharacterID)
VALUES(10,41)


------------ CREATE vwMoviesAndCharacters VIEW ------------

CREATE VIEW dbo.vwMoviesAndCharacters
AS
SELECT 
	m.MovieID, 
	m.DirectorID, 
	m.ReleaseYear, 
	m.Title, 
	mch.CharacterName
FROM movies m
JOIN movie_characters mc on m.MovieID = mc.MovieID
JOIN main_characters mch on mc.CharacterID = mch.CharacterID
FOR XML PATH('')

SELECT *
FROM dbo.vwMoviesAndCharacters

------------ CREATE FindCharactersByMovieName PROC ------------

CREATE PROCEDURE dbo.FindCharactersByMovieName
	@Title VARCHAR(100)
AS
SELECT MCH.CharacterName
FROM movies m
JOIN movie_characters mc on m.MovieID = mc.MovieID
JOIN main_characters mch on mc.CharacterID = mch.CharacterID
WHERE M.Title = @Title

EXEC dbo.FindCharactersByMovieName 'Iron Man'

------------ CREATE FindCharactersByMovieNameUsingView PROC ------------

CREATE PROCEDURE dbo.FindCharactersByMovieNameUsingView
	@Title VARCHAR(100)
AS
SELECT CharacterName
FROM dbo.vwMoviesAndCharacters
WHERE Title = @Title

EXEC dbo.FindCharactersByMovieNameUsingView 'Iron Man'

------------ ALTER VIEW AND SHOW HOW IT AFFECTS THE PROC ------------

ALTER VIEW dbo.vwMoviesAndCharacters
AS
SELECT 
	m.MovieID, 
	m.DirectorID, 
	m.ReleaseYear, 
	m.Title, 
	mch.CharacterName
FROM movies m
JOIN movie_characters mc on m.MovieID = mc.MovieID
JOIN main_characters mch on mc.CharacterID = mch.CharacterID

------------ STRING_AGG  ------------

SELECT STRING_AGG(mch.CharacterName, ', ') 
FROM movies m
JOIN movie_characters mc on m.MovieID = mc.MovieID
JOIN main_characters mch on mc.CharacterID = mch.CharacterID

SELECT 
	Title, 
	STRING_AGG(mch.CharacterName, ', ') 
FROM movies m
JOIN movie_characters mc on m.MovieID = mc.MovieID
JOIN main_characters mch on mc.CharacterID = mch.CharacterID
GROUP BY Title

------------ CREATE FUNCTION  ------------

CREATE FUNCTION dbo.fnCharacters(@Title VARCHAR(1000))
RETURNS VARCHAR(2000)
AS
BEGIN
	DECLARE @CharacterNames VARCHAR(2000)

	SELECT @CharacterNames = STRING_AGG(mch.CharacterName, ', ') 
	FROM movies m
	JOIN movie_characters mc on m.MovieID = mc.MovieID
	JOIN main_characters mch on mc.CharacterID = mch.CharacterID
	WHERE m.Title = @Title

	RETURN @CharacterNames
END

SELECT dbo.fnCharacters('iron man')

------------ ALTER VIEW TO USE FUNCTION AND PUT ALL ACTORS ON SAME LINE ------------

ALTER VIEW dbo.vwMoviesAndCharacters
AS
SELECT 
	m.MovieID, 
	m.DirectorID, 
	m.ReleaseYear, 
	m.Title, 
	dbo.fnCharacters(m.Title) 'Characters'
FROM movies m

SELECT * FROM dbo.vwMoviesAndCharacters

------------ LEFT AND RIGHT ------------
SELECT 
	m.MovieID, 
	m.DirectorID, 
	m.ReleaseYear, 
	m.Title, 
	LEFT(m.Title,6), 
	RIGHT(m.Title,6)
FROM movies m

------------ SUBSTRING AND CHARINDEX ------------
SELECT 
	m.MovieID, 
	m.DirectorID, 
	m.ReleaseYear, 
	m.Title, 
	SUBSTRING(m.Title, 3,2), 
	CHARINDEX('THE',m.Title), 
	SUBSTRING(m.Title, CHARINDEX('THE',m.Title),LEN(m.Title))
FROM movies m
WHERE m.Title LIKE '%THE%'

------------ LEN ------------
SELECT m.MovieID, m.DirectorID, m.ReleaseYear, m.Title, LEN(m.Title)
FROM movies m

------------ COUNT ------------
SELECT M.ReleaseYear, COUNT(*)
FROM movies m
GROUP BY M.ReleaseYear

------------ MAX AND MIN WITH GROUP BY ------------
SELECT M.DirectorID, COUNT(*) TotalMovies, MAX(m.ReleaseYear) LatestMovie, MIN(m.ReleaseYear) FirstMovie
FROM movies m
GROUP BY M.DirectorID




