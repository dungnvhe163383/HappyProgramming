use master
drop database HappyProgramming
create database HappyProgramming
use HappyProgramming
---------------------------------------------- Table roles -------------------------------
--có 3 role là admin, mentee, mentor

create table roles (
	id int identity(1, 1) primary key,
	[name] nvarchar(50)
)

---------------------------------------------- Table account -------------------------------

create table account (
	id int identity(1, 1) primary key,
	accountname varchar(50) not null,
	[password] varchar(50) not null,
	roleid int foreign key references Roles(ID),
	email varchar(250)
)

---------------------------------------------- Table Mentee -------------------------------


create table mentee (
	id int identity(1, 1) primary key,
	accountid int foreign key references account(id),
	[name] nvarchar(250) not null,
	[address] nvarchar(250),
	phone nvarchar(250),
	birthday Date ,
	sex nvarchar(250) ,
	avatar nvarchar(250),
	introduce nvarchar(250)
)



---------------------------------------------- Table Mentor -------------------------------
create table mentor(
	id int identity(1, 1) primary key,
	accountid int foreign key references account(id),
	[name] nvarchar(250),
	[address] nvarchar(250),
	phone nvarchar(250) ,
	birthday Date ,
	sex nvarchar(250) ,
	introduce nvarchar(250),
	achievement nvarchar(250),
	avatar nvarchar(250),
	costHire float not null
)

---------------------------------------------image-------------------------------------------
--1 account có nhiều ảnh
create table [Image](
	id int identity(1, 1) primary key,
	accountid int foreign key references account(id),
	[image] nvarchar(250),
)

---------------------------------------------Job-------------------------------------------

create table job(
	id int identity(1,1) primary key,
	jobname nvarchar(250),
	introduce nvarchar(250)
)

---------------------------------------------Skill-------------------------------------------

create table skill(
	id int identity(1, 1) primary key,
	[name] nvarchar(250),
)
---------------------------------------------MentorSkill-------------------------------------------
--1 mentor có nhiều skill và 1 skill có ở nhiều mentor

create table mentorskill(
	id int identity(1,1),
	mentorid int foreign key references mentor(id),
	skillid int foreign key references skill(id),
	primary key (mentorid, skillid) 
)

---------------------------------------------MentorJob-------------------------------------------
--1 mentor có nhiều job và 1 job có ở nhiều mentor

create table mentorjob(
	id int identity(1,1),
	mentorid int foreign key references mentor(id),
	jobid int foreign key references job(id),
	primary key (mentorid, jobid) 
)


---------------------------------------------- Table CodeRequest -------------------------------
create table coderequest (
	id int identity(1, 1) primary key,
	title nvarchar(250),
	content nvarchar(250),	
	deadline date,
	menteeID int foreign key references mentee(id),
)

---------------------------------------------- Table Feedback -------------------------------


create table Feedback(
	id int identity(1, 1) primary key,
	menteeid int foreign key references mentee(id),
	star int,
	comment nvarchar(250),
)

---------------------------------------------- Table CodeRequestSkill -------------------------------
--1 code request yêu cầu nhiều skill và 1 skill có trong nhiều request

create table coderequestskill(
	id int identity(1, 1),
	coderequestid int foreign key references coderequest(id),
	skillid int foreign key references skill(id),
	primary key (coderequestid, skillid)
)


---------------------------------------------- Table MentorCodeRequest -------------------------------
--1 code request yêu cầu nhiều mentor và 1 mentor có trong nhiều request

create table mentorcoderequest(
	id int identity(1, 1) primary key,
	coderequestid int foreign key references coderequest(id),
	mentorid int foreign key references mentor(id),
)


---------------------------------------------- Table Answer -------------------------------
--1 answer chỉ có 1 feedback và 1 answer có 1 cặp request mentor riêng
--muốn đặt status (trả lời hay chưa) thì lấy request với mentor id check trong bảng answer
--nếu có thì để answed, nếu ko có thì để not answer)
create table answer(
	id int identity(1,1) primary key,
	mentorcoderequestid int foreign key references mentorcoderequest(id),
	content nvarchar(250)
	)

----------------------------------------------Table FeedbackAnswer-------------------------
--không để feedbackid trong bảng anser do có anser nhưng ch có feed back
create table feedbackanswer(
	id int identity(1,1) primary key,
	feedbackid int foreign key references feedback(id),
	answerid int foreign key references answer(id)
)
---------------------------------------------- Table Status -------------------------------
--chỉ bao gồm các status(accept, reject,not yet)
create table [status](
	id int identity(1, 1) primary key,
	[Status] nvarchar(50)
)


---------------------------------------------- Table MenteeMentorRelationship -------------------------------
--mentee thuê mentor (mặc định status của bảng này là hire)
create table HireRelatitonship(
	id int identity(1,1) ,
	menteeid int foreign key references mentee(id),
	mentorid int foreign key references mentor(id),
	primary key(menteeid,mentorid)
)

---------------------------------------------- Table HistoryMenteeMentorRelationship -------------------------------
--mentee đã từng thuê mentor
create table historyHireRelationship(
	id int identity(1,1),
	menteeid int foreign key references mentee(id),
	mentorid int foreign key references mentor(id),
	closedate date, --ngày hủy thuê hoặc ngày reject yêu cầu thuê
	primary key(menteeid,mentorid)
)

---------------------------------------------- Table HireRequest -------------------------------
--mentee gửi yêu cầu thuê cho mentor
create table hirerequest(
	id int identity(1,1) primary key,
	menteeid int foreign key references mentee(id),
	mentorid int foreign key references mentor(id),
	tital nvarchar(250),
	content nvarchar(250),
	statusid int foreign key references [status](id) -- chỉ có (accept,reject,not yet)
)

---------------------------------------------- Table MentorCodeRequestStatus -------------------------------
--1 cặp request mentor thì có status là (accept,reject,not yet. nếu yêu cầu từ mentor đã thuê thì để accept)

create table MentorCodeRequestStatus(
	id int identity(1,1) primary key,
	mentorcoderequestid int foreign key references mentorcoderequest(id),
	statusid int foreign key references [status](id)
)
