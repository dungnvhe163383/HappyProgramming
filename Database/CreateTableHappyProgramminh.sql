
--drop database HappyProgramming
--create database HappyProgramming
use HappyProgramming
---------------------------------------------- Table roles -------------------------------

create table roles (
	ID int identity(1, 1) primary key,
	Name nvarchar(50)
)

---------------------------------------------- Table account -------------------------------

create table account (
ID int identity(1, 1) primary key,
AccountName varchar(50),
Password varchar(50),
RoleID int foreign key references Roles(ID)
)

---------------------------------------------- Table country-------------------------------


 create table country(
  ID int identity(1, 1) primary key,
  country nvarchar(250),
 )



 ---------------------------------------------- Table City -------------------------------

create table City (
	ID int identity(1, 1) primary key,
	city nvarchar(250),
	countryID int foreign key references Country(ID)
)

---------------------------------------------- Table Mentee -------------------------------


create table Mentee (
ID int foreign key references Account(ID) primary key,
CityID int foreign key references city(ID),
Email nvarchar(250) unique,
FullName nvarchar(250) ,
Phone nvarchar(250) ,
DateOfBirth Date ,
Sex nvarchar(250) ,
Avatar nvarchar(250),

)

---------------------------------------------- Table Profession(nghề nghiệp) -------------------------------

create table Profession(
ID int identity(1, 1) primary key,
profession nvarchar(250)
)

---------------------------------------------- Table Status(trạng thái của request) -------------------------------

create table Status(
	ID int identity(1, 1) primary key,
	Status nvarchar(250)
)

---------------------------------------------- Table Framework (framework thường dùng của mentor) -------------------------------

create table Framework(
	ID int identity(1, 1) primary key,
	framework nvarchar(250)
)

---------------------------------------------- Table Mentor -------------------------------


create table Mentor(
ID int foreign key references Account(ID) primary key,
CityID int foreign key references city(ID),
Email nvarchar(250) unique,
FullName nvarchar(250) ,
Phone nvarchar(250) ,
DateOfBirth Date ,
Sex nvarchar(250) ,
ServiceDesc nvarchar(250),
AchievementDesc nvarchar(250),
Avatar nvarchar(250),
costHire int
)

---------------------------------------------- Table MentorFramework((mentor có nhiều Framework và  1 Framework có nhiều mentor có) -------------------------------

create table MentorFramework(
	MentorID int foreign key references Mentor(ID),
	frameworkID int foreign key references Framework(ID),
	constraint primarykey primary key (MentorID, frameworkID)
)

---------------------------------------------- Table MentorProfesion(mentor có nhiều profesion và  1 profesion có nhiều mentor có)-------------------------------


create table MentorProfession(
	ProfessionID int foreign key references Profession(ID),
	MentorID int foreign key references Mentor(ID),
	Constraint PK Primary key (ProfessionID,MentorID)
)

---------------------------------------------- Table Request(các request do Mentee đưa ra) -------------------------------


create table Request (
ID int identity(1, 1) primary key,
Title nvarchar(250),
Content nvarchar(250),
MenteeID int foreign key references Mentee(ID),
DeadlineDate date,
statusID int foreign key references Status(ID)
)

---------------------------------------------- Table Invite(1 request thì gửi cho (mời) mentor nào trả lời)-------------------------------


create table Invite (
ReqID int foreign key references Request(ID),
MentorID int foreign key references Mentor(ID),
constraint pk1 primary key (ReqID,MentorID)
)

---------------------------------------------- Table Comment(mentee vote mentor) -------------------------------


create table Comment(
ID int identity(1,1) primary key,
RateStar int,
CommentDetail nvarchar(250),
MenteeID int foreign key references Mentee(ID),
MentorID int foreign key references Mentor(ID),
)

---------------------------------------------- Table Skill -------------------------------


create table Skill(
ID int identity(1, 1) primary key,
Name nvarchar(250),
)

---------------------------------------------- Table MentorSkill ( mentor có nhiều skill) -------------------------------


create table MentorSkill(
SkillID int foreign key references Skill(ID),
MentorID int foreign key references Mentor(ID),
primary key(SkillID, MentorID)
)

---------------------------------------------- Table Request Skill( câu hỏi yêu cầu những skill nào) -------------------------------

create table RequestSkill(
SkillID int foreign key references Skill(ID),
RequestID int foreign key references Request(ID),
primary key(SkillID, RequestID)
)

create table RequestHistoryMentee(
ID int identity(1, 1) primary key,
	Title nvarchar(250),
Content nvarchar(250),
MenteeID int foreign key references Mentee(ID),
DeadlineDate date
)

create table HireRequest (
ReqID int foreign key references Request(ID),
MentorID int foreign key references Mentor(ID),
constraint pk3 primary key (ReqID,MentorID)
)

create table MenteeHireMentor(
MenteeID int foreign key references Mentee(ID),
MentorID int foreign key references Mentor(ID),
constraint pk2 primary key (MenteeID,MentorID)
)

create table RejectInviteRequestMentor(
	ID int identity(1, 1) primary key,
	Title nvarchar(250),
Content nvarchar(250),
MenteeID int foreign key references Mentee(ID),
MentorID int foreign key references Mentor(ID),
DeadlineDate date
)