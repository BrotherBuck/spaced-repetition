CREATE DATABASE SpacedRepetition_db;
USE SpacedRepetition_db;

CREATE TABLE students
(
   userId integer primary key auto_increment,
   username varchar(100) unique,
   password varchar(100)
);

CREATE TABLE subjects
(
    subjectID int NOT NULL AUTO_INCREMENT,
    subject varchar(255) NOT NULL,
	  PRIMARY KEY (subjectID),
    userId INT NOT NULL
);

ALTER TABLE subjects
    ADD FOREIGN KEY (userId) REFERENCES students(userId);

CREATE TABLE decks
(
    deckID int NOT NULL AUTO_INCREMENT,
    deckName varchar(255) NOT NULL,
    userId INT NOT NULL,
    subjectID INT NOT NULL,
    PRIMARY KEY (deckID),
    dateCreated datetime NOT NULL DEFAULT current_timestamp,
    lastAccess datetime NOT NULL DEFAULT current_timestamp,
    CounterofAccess INT NOT NULL

);


ALTER TABLE decks
	ADD FOREIGN KEY (userId) REFERENCES students(userId);

ALTER TABLE decks
    ADD FOREIGN KEY (subjectID) REFERENCES subjects(subjectID);

CREATE TABLE cards
(
    cardID int NOT NULL AUTO_INCREMENT,
    front varchar(1000) NOT NULL,
    back varchar(1000) NOT NULL,
    userId INT NOT NULL,
    subjectID INT NOT NULL,
	  deckID INT NOT NULL,
    PRIMARY KEY (cardID)
);

ALTER TABLE cards
    ADD FOREIGN KEY (userId) REFERENCES students(userId);

ALTER TABLE cards
    ADD FOREIGN KEY (subjectID) REFERENCES subjects(subjectID);

ALTER TABLE cards
    ADD FOREIGN KEY (deckID) REFERENCES decks(deckID);
