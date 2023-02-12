
--drop database HappyProgramming
--create database HappyProgramming
use HappyProgramming
---------------------------------------------- Table roles -------------------------------

create table roles (
	id int identity(1, 1) primary key,
	name nvarchar(50)
)

---------------------------------------------- Table account -------------------------------

create table account (
id int identity(1, 1) primary key,
username varchar(50),
password varchar(50),
roleID int foreign key references Roles(ID)
)


---------------------------------------------- Table Mentee -------------------------------


create table mentee (
id int foreign key references account(id) primary key,
address nvarchar(250),
email nvarchar(250),
name nvarchar(250) ,
phone nvarchar(250),
birthday Date ,
sex nvarchar(250) ,
avatar nvarchar(250)
)

---------------------------------------------- Table Status -------------------------------

create table status(
	ID int identity(1, 1) primary key,
	Status nvarchar(250)
)


---------------------------------------------- Table Mentor -------------------------------


create table mentor(
id int foreign key references Account(ID) primary key,
address nvarchar(250),
email nvarchar(250) unique,
name nvarchar(250) ,
phone nvarchar(250) ,
birthday Date ,
sex nvarchar(250) ,
introduce nvarchar(250),
profession nvarchar(250),
professionIntroduce nvarchar(250),
Achievement nvarchar(250),
avatar nvarchar(250),
costHire int
)


---------------------------------------------- Table Request(các request do Mentee đưa ra) -------------------------------
create table request (
id int identity(1, 1) primary key,
title nvarchar(250),
content nvarchar(250),
menteeID int foreign key references mentee(id),
deadline date,
statusID int foreign key references status(id),
)



create table rate(
id int identity(1, 1) primary key,
requestID int foreign key references request(id),
rate int
)
---------------------------------------------- Table Skill -------------------------------


create table skill(
id int identity(1, 1) primary key,
name nvarchar(250),
)

create table historyMenteeRequest(
	id int identity(1, 1) primary key,
	title nvarchar(250),
	content nvarchar(250),
	menteeID int foreign key references mentee(id),
	deadline date,
)

create table historyMentorRequest(
	id int identity(1, 1) primary key,
	title nvarchar(250),
	content nvarchar(250),
	mentorID int foreign key references mentor(id),
	deadline date,
)

create table hire(
	mentorID int foreign key references mentor(id),
	menteeID int foreign key references mentee(id),
	primary key (mentorID,menteeID),
	content nvarchar(250),
	statusID int foreign key references status(id)
)

---------------------------------------------- Table Invite(1 request thì gửi cho (mời) mentor nào trả lời)-------------------------------


create table inviteRequest (
ReqID int foreign key references Request(ID),
MentorID int foreign key references Mentor(ID),
primary key (ReqID,MentorID),
	statusID int foreign key references status(id)

)

create table hireRequest (
ReqID int foreign key references Request(ID),
MentorID int foreign key references Mentor(ID),
primary key (ReqID,MentorID),
	statusID int foreign key references status(id)

)

---------------------------------------------- Table MentorSkill ( mentor có nhiều skill) -------------------------------


create table mentorSkill(
skillID int foreign key references skill(id),
mentorID int foreign key references mentor(id),
primary key(skillID, mentorID)
)

---------------------------------------------- Table Comment(mentee vote mentor) -------------------------------


create table Comment(
ID int identity(1,1) primary key,
CommentDetail nvarchar(250),
requestID int foreign key references request(id)
)


---------------------------------------------- Table MentorSkill ( mentor có nhiều skill) -------------------------------


create table requestSkill(
skillID int foreign key references skill(id),
requestID int foreign key references request(id),
primary key(skillID, requestID)
)

---------------------------------------------- Table MentorSkill ( mentor có nhiều skill) -------------------------------


create table mentorRequest(
requestID int foreign key references request(id),
mentorID int foreign key references mentor(id),
primary key(requestID, mentorID)
)
create table following(
	mentorID int foreign key references mentor(id),
	menteeID int foreign key references mentee(id),
	primary key (mentorID,menteeID),
)

create table historyHire(
	mentorID int foreign key references mentor(id),
	menteeID int foreign key references mentee(id),
	primary key (mentorID,menteeID),
	content nvarchar(250)
)

create table historyFollow(
	mentorID int foreign key references mentor(id),
	menteeID int foreign key references mentee(id),
	primary key (mentorID,menteeID),
)

create table answerRequest(
	id int identity(1,1) primary key,
	content nvarchar(250),
	requestID int foreign key references request(id),
	mentorid int foreign key references mentor(id)
)

