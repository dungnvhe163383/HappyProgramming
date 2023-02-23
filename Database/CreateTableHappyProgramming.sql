--drop database HappyProgramming
--create database HappyProgramming
use HappyProgramming
---------------------------------------------- Table roles -------------------------------

create table roles (
	id int identity(1, 1) primary key,
	[name] nvarchar(50)
)

---------------------------------------------- Table account -------------------------------

create table account (
	id int identity(1, 1) primary key,
	username varchar(50),
	[password] varchar(50),
	roleID int foreign key references Roles(ID)
)

---------------------------------------------- Table Mentee -------------------------------


create table mentee (
	id int foreign key references account(id) primary key,
	email nvarchar(250),
	phone nvarchar(250),
	birthday Date ,
	sex nvarchar(250) ,
	avatar nvarchar(250)
)



---------------------------------------------- Table Mentor -------------------------------
-- 1 bảng tách họ, tên đệm, tên
create table mentor(
	id int foreign key references Account(ID) primary key,
	email nvarchar(250) unique,
	phone nvarchar(250) ,
	birthday Date ,
	sex nvarchar(250) ,
	introduce nvarchar(250),
	achievement nvarchar(250),
	avatar nvarchar(250),
	costHire int
)

---------------------------------------------image-------------------------------------------
create table [Image](
	id int identity(1, 1) primary key,
	accountid int foreign key references account(id),
	[image] nvarchar(250),
)

create table [Name](
	id int foreign key references Account(ID) primary key,
	firstName nvarchar(250),
	lastName nvarchar(250),
)


create table profession(
	id int identity(1,1) primary key,
	profession nvarchar(250),
	professionIntroduce nvarchar(250),
	mentorid int foreign key references mentor(id)
)

create table [address](
	id int foreign key references Account(id) primary key,
	[address] nvarchar(250)
)
---------------------------------------------- Table Status -------------------------------

create table status(
	id int identity(1, 1) primary key,
	[Status] nvarchar(250)
)


---------------------------------------------- Table Request(các request do Mentee đưa ra) -------------------------------
create table request (
	id int identity(1, 1) primary key,
	title nvarchar(250),
	content nvarchar(250),	
	deadline date,
	menteeID int foreign key references mentee(id),
)


create table requestStatus(
	requestID int foreign key references request(id),
	statusID int foreign key references status(id),
	primary key (requestID, statusID)
)



create table Feedback(
	id int identity(1, 1) primary key,
	requestID int foreign key references request(id),
	mentorID int foreign key references mentor(id),
	rate int,
	commentDetail nvarchar(250),
)

---------------------------------------------- Table Skill -------------------------------


create table skill(
	id int identity(1, 1) primary key,
	[name] nvarchar(250),
)

create table requestSkill(
	skillID int foreign key references skill(id),
	requestID int foreign key references request(id),
	primary key(skillID, requestID)
)

create table mentorRequest(
	requestID int foreign key references request(id),
	mentorID int foreign key references mentor(id),
	primary key(requestID, mentorID)
)


create table historyRequest(
	id int identity(1, 1) primary key,
	title nvarchar(250),
	content nvarchar(250),
	deadline date,
	accountID int foreign key references Account(id),
	statusID int foreign key references Status(id)
)


create table hire(
-- bảng mentee gửi yêu cầu thuê mentor 
	mentorID int foreign key references mentor(id),
	menteeID int foreign key references mentee(id),
	primary key (mentorID,menteeID),
	content nvarchar(250),
	statusID int foreign key references Status(id) --(thuê, đã từng thuê, không thuê)
)

---------------------------------------------- Table MentorSkill ( mentor có nhiều skill) -------------------------------

create table mentorSkill(
	skillID int foreign key references skill(id),
	mentorID int foreign key references mentor(id),
	primary key(skillID, mentorID)
)


create table [following](
	mentorID int foreign key references mentor(id),
	menteeID int foreign key references mentee(id),
	primary key (mentorID,menteeID),
	statusID int foreign key references Status(id) --(follow, unfollow)
)

create table answerRequest(
	content nvarchar(250),
	requestID int foreign key references request(id),
	mentorid int foreign key references mentor(id),
	primary key (requestid,mentorid)
)


