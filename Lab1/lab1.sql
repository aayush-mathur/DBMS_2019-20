create database db212BITSStream;

create table Albums (
AlbumID INT,
AlbumName VARCHAR(30) NOT NULL, 
ArtistName VARCHAR(30) NOT NULL,
HoursStreamed INT DEFAULT 0,
Label VARCHAR(30),
Genre VARCHAR(30),
ReleaseDate DATE NOT NULL,
PRIMARY KEY(AlbumID)
);

create table Artists (
ArtistID INT,
Name VARCHAR(30) NOT NULL,
ActiveSince DATE NOT NULL,
RetirementDate DATE,
NumberOfFollowers INT NOT NULL,
Nationality VARCHAR(30) NOT NULL,
PRIMARY KEY(ArtistID)
);


create table Users (
UserID INT,
UserName VARCHAR(30),
EmailID VARCHAR(30),
MembershipCategory ENUM('P', 'F'),
CONSTRAINT UC_Users UNIQUE (EmailID),
PRIMARY KEY (UserID, UserName)
);

alter table Users change MembershipCategory AccountType ENUM('P', 'F'); 

alter table Artists drop column Nationality;

alter table Albums modify HoursStreamed DECIMAL(6,2);

INSERT INTO Albums VALUES (
39391, 
'A Thousand Suns', 
'Linkin Park', 
128,
'Warner Bros',
'Rock',
'2016-06-17'
);

INSERT INTO Albums VALUES (
14573, 
'Overexposed',
'Maroon 5',  
452, 
'A&M', 
'Funk', 
'2016-11-11'
);

INSERT INTO Albums VALUES (
24573, 
'Overexposed',
'Maroon',  
400, 
'A&M', 
'Funk', 
'2016-11-30'
);

INSERT INTO Artists VALUES (
100,
'Maroon 5', 
'2007/11/13', 
NULL,
16000123
);

INSERT INTO Artists VALUES (
101, 
'Linkin Park', 
'2000/02/14', 
'2017/07/20', 
21174672
);

INSERT INTO Artists VALUES (
102, 
'Eminem', 
'2001/01/15', 
NULL, 
14093412
);

INSERT INTO Artists VALUES (
103, 
'Coldplay', 
'2002/05/13', 
NULL, 
18000992
);

INSERT INTO Users VALUES (
10003, 
'Anurag Dwivedi', 
'adwivedi@gmail.com', 
'F'
);

INSERT INTO Users VALUES (
10004, 
'Sana Kothari', 
'sana123@gmail.com', 
'P'
);

INSERT INTO Users (UserID, UserName, EmailID) VALUES (
10005, 
'Vishal Ghosh', 
'vishy@gmail.com'
);

SELECT DISTINCT Label FROM Albums;

SELECT * FROM Users WHERE AccountType = 'P';

SELECT * FROM Albums WHERE ArtistName = 'Maroon 5' AND Genre = "Rock";

UPDATE Albums SET HoursStreamed = HoursStreamed + 200 WHERE Genre = "Rock"; 
SELECT * FROM Albums;

ALTER TABLE Artists ADD Duration DECIMAL(6,2) NOT NULL;

DELETE FROM Albums WHERE HoursStreamed > 400;

SELECT HoursStreamed*1.2, AlbumName FROM Albums;

UPDATE Artists SET NumberOfFollowers = NumberOfFollowers + 200 WHERE ArtistID = 100;

UPDATE Artists SET Duration = datediff(curdate(), ActiveSince);

SELECT curdate();

-- Do this in terminal
-- mysqldump -u root -p db212BITSStream >  db212BITSStream.sql;

drop table Artists;
drop table Users;
drop table Albums;
drop database db212BITSStream;

create database db212BITSGaana;

select AlbumName from Albums WHERE Genre = 'Rock' or Genre = 'Funk';

