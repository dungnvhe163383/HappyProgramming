insert into Roles values ('Mentee');
insert into Roles values ('Mentor');
insert into Roles values ('Admin');

insert into Account values ('mentee1', 'mentee', 1);
insert into Account values ('mentee2', 'mentee', 1);
insert into Account values ('mentor1', 'mentor', 2);
insert into Account values ('mentor2', 'mentor', 2);
insert into Account values ('admin1', 'admin', 3);

insert into Country values (N'VIệT NAM');
insert into Country values (N'Anh');
insert into Country values (N'Mỹ');

insert into city values (N'HÀ NỘI',1);
insert into city values (N'HỒ CHÍ MINH',1);
insert into city values (N'London',2);
insert into city values (N'Washington D.C',3);

insert into Mentee values  (1,1, 'mentee@email1', 'Nguyen Duy Manh', '0123456789','11-03-2002', 'M', 'avatar3.jpg')
insert into Mentee values  (2,2, 'mentee@email2', 'Nguyen Vu Dung', '0987654321','11-04-2002', 'F', 'avatar4.jpg')


insert into Profession values ('Software Engineer');
insert into Profession values ('Tester');

insert into Status values ('Accept');
insert into Status values ('Not yet');
insert into Status values ('Done');
insert into Status values ('Reject');



insert into Framework values ('React Native');
insert into Framework values ('Flutter ');
insert into Framework values ('Xamarin ');
insert into Framework values ('PhoneGap ');


insert into Mentor values (3,3, 'okanhchaphet7@gmail.com', 'Pham Anh Tuan', '0887654321','11-05-2002', 'M', 'Will teach how to code','PhD', 'avatar1.jpg',300);
insert into Mentor values (4,4, 'nguyenvudung96@gmail.com', 'Nguyen Hoang Long', '0787654321','11-06-2002', 'M', 'Will teach how to test','Master', 'avatar2.jpg',400);


insert into MentorFramework values (3,2);
insert into MentorFramework values (3,3);
insert into MentorFramework values (4,3);
insert into MentorFramework values (4,1); 


insert into MentorProfession values (1,3);
insert into MentorProfession values (2,3);
insert into MentorProfession values (1,4);
insert into MentorProfession values (2,4);

insert into Request values ('Teach me java', 'I wanna learn java', 1, '11-02-2023', 2);
insert into Request values ('Teach me mockito', 'I wanna learn mockito', 2, '10-02-2023', 2);
insert into Request values ('Teach me C', 'I wanna learn C', 2, '12-02-2023', 2);
insert into Request values ('Teach me C++', 'I wanna learn C++', 1, '11-02-2023', 2);
insert into Request values ('Teach me C#', 'I wanna learn C#', 1, '10-02-2023', 2);
insert into Request values ('Teach me Python', 'I wanna learn Python', 2, '11-02-2023', 2);
insert into Request values ('Teach me R', 'I wanna learn R', 2, '10-02-2023', 2);
insert into Request values ('Teach me PhoneGap', 'I wanna learn PhoneGap', 1, '11-02-2023', 2);


insert into Invite values(1,3)
insert into Invite values(2,4)

insert into comment values(4,'nice', 1,3)
insert into comment values(4,'nice2', 2,3)
insert into comment values(4,'nice3', 1,4)
insert into comment values(4,'nice4', 2,4)

insert into Skill values('Java')
insert into Skill values('Python')
insert into Skill values('C++')
insert into Skill values('C#')

insert into MentorSkill values(1,3)
insert into MentorSkill values(2,3)
insert into MentorSkill values(3,3)
insert into MentorSkill values(1,4)
insert into MentorSkill values(4,4)
insert into MentorSkill values(2,4)

insert into RequestSkill values(1,1)
insert into RequestSkill values(2,2)
insert into RequestSkill values(3,1)
insert into RequestSkill values(4,2)
insert into RequestSkill values(4,1)


insert into RequestHistoryMentee values('Learn C','I wanna learn C',1,'12-02-2023')
insert into RequestHistoryMentee values('Learn C++','I wanna learn C++',1,'11-02-2023')

insert into HireRequest values (3,3)
insert into HireRequest values (4,4)
insert into HireRequest values (5,4)
insert into HireRequest values (6,3)
insert into HireRequest values (7,4)
insert into HireRequest values (8,3)

insert into MenteeHireMentor values (1,3)
insert into MenteeHireMentor values (1,4)
insert into MenteeHireMentor values (2,3)


insert into RejectInviteRequestMentor values('roadmap','I wan to know roadmap for back-end developer',1,3,'12-02-2023')
insert into RejectInviteRequestMentor values('github','I want to know how to push code to git hub',2,4,'12-02-2023')