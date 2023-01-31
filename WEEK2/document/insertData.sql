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

insert into company values ('A');
insert into company values ('B');
insert into company values ('C');

insert into city values (N'HÀ NỘI',1);
insert into city values (N'HỒ CHÍ MINH',1);
insert into city values (N'Đà Nẵng',2);
insert into city values (N'Cần Thơ',3);

insert into Mentee values  (1,1, 'mentee@email1', 'Le Nam Phu', '0123456789','11-03-2002', 'M', 'avatar3.jpg')
insert into Mentee values  (2,2, 'mentee@email2', 'Le Tri Quyen', '0987654321','11-04-2002', 'F', 'avatar4.jpg')


insert into Profession values ('Software Engineer');
insert into Profession values ('Tester');

insert into Status values ('accept');
insert into Status values ('Not yet');



insert into Framework values ('React Native');
insert into Framework values ('Flutter ');
insert into Framework values ('Xamarin ');
insert into Framework values ('PhoneGap ');


insert into Mentor values (3,3, 'okanhchaphet7@gmail.com', 'Le Dang Truong', '0887654321','11-05-2002', 'M', 'Will teach how to code','PhD', 'avatar1.jpg',1);
insert into Mentor values (4,4, 'nguyenvudung96@gmail.com', 'Le Phuc Thien', '0787654321','11-06-2002', 'M', 'Will teach how to test','Master', 'avatar2.jpg',2);


insert into MentorFramework values (3,2);
insert into MentorFramework values (3,3);
insert into MentorFramework values (4,3);
insert into MentorFramework values (4,1); 


insert into MentorProfession values (1,3);
insert into MentorProfession values (2,3);
insert into MentorProfession values (1,4);
insert into MentorProfession values (2,4);

insert into Request values ('Teach me java', 'I wanna learn java', 1, '11-09-2022', 2);
insert into Request values ('Teach me mockito', 'I wanna learn mockito', 2, '11-10-2022', 2);

insert into Invite values(1,3)
insert into Invite values(1,4)
insert into Invite values(2,3)
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


insert into menteediscuss values(1,'I think she is goods')
insert into menteediscuss values(2,'No, I do not think so')
insert into menteediscuss values(1,'I think she is goods hehe')


insert into mentordiscuss values(3,'it is good question')
insert into mentordiscuss values(4,'yah')
insert into mentordiscuss values(4,'yah')
















