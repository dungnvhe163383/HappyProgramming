insert into Roles values ('Mentee');
insert into Roles values ('Mentor');
insert into Roles values ('Admin');

insert into Account values ('mentee1', 'mentee', 1);
insert into Account values ('mentee2', 'mentee', 1);
insert into Account values ('mentor1', 'mentor', 2);
insert into Account values ('mentor2', 'mentor', 2);
insert into Account values ('admin1', 'admin', 3);


insert into Mentee values  (1,'Nghe an','mentee@email1', 'Nguyen Duy Manh', '0123456789','11-03-2002', 'M', 'avatar3.jpg')
insert into Mentee values  (2,'Ha Noi', 'mentee@email2', 'Nguyen Vu Dung', '0987654321','11-04-2002', 'F', 'avatar4.jpg')


insert into Status values ('Accept');
insert into Status values ('Not yet');
insert into Status values ('Done');
insert into Status values ('Reject');
insert into Status values ('Hired');
insert into Status values ('not hire');



insert into Mentor values (3,'Ho Chi Minh', 'okanhchaphet7@gmail.com', 'Pham Anh Tuan', '0887654321','11-05-2002', 'M', 
'toi la mot nguoi co trach nhiem va muon mang den cho ban nhieu kien thức','Developer','toi code phan mem và xay dung ke hoach kinh phat trien phan mem','tot nghiep dai hoc fpt', 'avatar1.jpg',300);
insert into Mentor values (4,'Ha Noi', 'nguyenvudung96@gmail.com', 'Nguyen Hoang Long', '0887654321','10-05-2002', 'M', 
'toi la mot nguoi co trach nhiem va muon mang den cho ban nhieu kien thức','Developer','toi code phan mem và xay dung ke hoach kinh phat trien phan mem','tot nghiep dai hoc fpt', 'avatar2.jpg',400);


insert into Request values ('Teach me java', 'I wanna learn java', 1, '11-02-2023', 2);
insert into Request values ('Teach me mockito', 'I wanna learn mockito', 2, '10-02-2023', 2);
insert into Request values ('Teach me C', 'I wanna learn C', 2, '12-02-2023', 2);
insert into Request values ('Teach me C++', 'I wanna learn C++', 1, '11-02-2023', 2);
insert into Request values ('Teach me C#', 'I wanna learn C#', 1, '10-02-2023', 2);
insert into Request values ('Teach me Python', 'I wanna learn Python', 2, '11-02-2023', 2);
insert into Request values ('Teach me R', 'I wanna learn R', 2, '10-02-2023', 2);
insert into Request values ('Teach me PhoneGap', 'I wanna learn PhoneGap', 1, '11-02-2023', 2);

insert into rate values (5,5)
insert into rate values (6,4)
insert into rate values (7,4)



insert into Skill values('Java')
insert into Skill values('Python')
insert into Skill values('C++')
insert into Skill values('C#')

insert into historyMenteeRequest values('want to know javax', 'I wanna learn javax', 1, '11-02-2023')
insert into historyMenteeRequest values('want to know css', 'I wanna learn css', 1, '11-02-2023')
insert into historyMenteeRequest values('want to know spring', 'I wanna learn spring', 2, '11-02-2023')


insert into historyMentorRequest values('want to know spring', 'I wanna learn spring', 3, '11-02-2023')
insert into historyMentorRequest values('want to know springs', 'I wanna learn springs', 3, '11-02-2023')
insert into historyMentorRequest values('want to learn html', 'I wanna learn html', 4, '11-02-2023')


insert into hire values(3,1,'can I hire you',5)
insert into hire values(4,1,'can I hire you1',6)
insert into hire values(3,2,'can I hire you2',5)

insert into inviteRequest values(1,3,4)
insert into inviteRequest values(2,4,1)
insert into inviteRequest values(4,3,4)

insert into hireRequest values(3,3,2)
insert into hireRequest values(5,4,3)
insert into hireRequest values(6,3,3)
insert into hireRequest values(7,4,3)
insert into hireRequest values(8,3,2)



insert into mentorSkill values(1,3)
insert into mentorSkill values(2,3)
insert into mentorSkill values(3,3)
insert into mentorSkill values(1,4)
insert into mentorSkill values(4,4)
insert into mentorSkill values(2,4)

insert into comment values ('good',5)
insert into comment values ('good1',6)
insert into comment values ('good2',7)



insert into requestSkill values(1,1)
insert into requestSkill values(2,2)
insert into requestSkill values(3,1)
insert into requestSkill values(4,3)
insert into requestSkill values(4,4)
insert into requestSkill values(3,5)
insert into requestSkill values(2,6)
insert into requestSkill values(1,7)
insert into requestSkill values(3,8)


insert into mentorRequest values (1,3)
insert into mentorRequest values (1,4)
insert into mentorRequest values (2,3)
insert into mentorRequest values (3,4)
insert into mentorRequest values (4,3)
insert into mentorRequest values (5,3)
insert into mentorRequest values (6,4)
insert into mentorRequest values (7,3)
insert into mentorRequest values (8,4)

insert into following values (4,1)
insert into following values (4,2)
insert into following values (3,1)

insert into historyHire values (4,2,'can I hire you please')

insert into historyFollow values (3,2)

insert into answerRequest values ('go to link to know detail',5,3)
insert into answerRequest values ('go to link1 to know detail',5,4)
insert into answerRequest values ('go to link2 to know detail',6,4)
insert into answerRequest values ('go to link3 to know detail',7,4)