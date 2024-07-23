CREATE DATABASE Games;
USE Games;

CREATE TABLE Game
(   id int NOT NULL IDENTITY(1, 1),
	name varchar(50),
	PRIMARY KEY(id)
);
CREATE TABLE Trainer
(
    surname varchar(16),
	name varchar(16),
	experience int,
	PRIMARY KEY(surname)
)
CREATE TABLE Team
(
	id int NOT NULL IDENTITY(1, 1),
	name varchar(16),
	game_id int,
	trainer varchar(16),
	PRIMARY KEY(id), FOREIGN KEY (game_id) REFERENCES Game(id), FOREIGN KEY (trainer) REFERENCES Trainer(surname)
);
CREATE TABLE Player
(
	id int NOT NULL IDENTITY(1, 1),
	name varchar(25),
	surname varchar(25),
	birth_date date,
	age AS DATEDIFF(YEAR, birth_date, GETDATE()),
	team_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (team_id) REFERENCES Team(id)
);

CREATE TABLE Match
(
	id int NOT NULL IDENTITY(1, 1),
	data date,
	team1 int,
	team2 int,
	score varchar(6),

	PRIMARY KEY (id),
	FOREIGN KEY (team1) REFERENCES Team(id),FOREIGN KEY (team2) REFERENCES Team(id)
);
INSERT INTO Game (name)
VALUES
('������'), ('��������'), ('������');

INSERT INTO Trainer(surname,name,experience)
VALUES
('��������','��������',45),
('�������','�������',38),
('������','�������',76),
('�������','����',48),
('����������','������',50),
('�������','����',29),
('���������','����� ',77),
('��������','�������',47),
('����������','�����',90),
('�����������','������',47);

INSERT INTO Team(name, game_id, trainer)
VALUES
('�������',1,'��������'),
('�����',1,'�������'),
('������',1,'������'),
('�����',2,'������� '),
('������',2,'����������'),
('������',2,'�������'),
('���',3,'���������'),
('��������',3,'��������'),
('�������',3,'����������'),
('�������',3,'�����������');

INSERT INTO Player(name,surname,birth_date,team_id)
VALUES
('�����','�����������','1996-04-14',1),
('������','�����','2004-02-22',1),
('������','��������','2001-08-18',1),
('������','�����','1990-12-12',1),
('�����','������','1993-04-12',2),
('������','������','1992-02-04',2),
('�������','�������','1993-05-14',2),
('������','���������','1985-01-28',2),
('��������','������','1995-05-27',6),
('�����','��������','1995-01-29',6),
('��������','�������','1990-06-08',6),
('�������','����������','1990-03-23',8),
('��������','����','1985-09-28',8),
('�����','�����','1980-03-28',8),
('������','������','1995-12-08',8),
('������','������','1980-05-28',7),
('������','�������','1999-11-16',7),
('�������','��������','2000-10-14',7),
('�����','��������','1996-09-03',7),
('�������','�������','1986-10-03',3),
('�����','����������','1996-09-10',4),
('������','��������','2000-07-23',5),
('�������','�������','1999-11-13',9),
('�����','��������','1999-04-11',10);

INSERT INTO Match(data, team1, team2, score)
VALUES
('2022-12-23',1,2,'0:2')
('2021-12-22',1,3,'4:3'),
('2022-11-05',2,3,'1:2'),
('2022-05-12',4,5,'40:30'),
('2022-10-24',6,5,'15:30'),
('2022-01-22',7,10,'5:2'),
('2019-01-10',7,8,'1:0'),
('2019-04-02',9,8,'0:0'),
('2019-12-04',8,10,'3:5'),
('2019-05-21',9,7,'0:2');
