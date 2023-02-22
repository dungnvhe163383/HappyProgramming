insert into Roles values ('Mentee');
insert into Roles values ('Mentor');
insert into Roles values ('Admin');

insert into Account values ('mentee1', 'mentee', 1);
insert into Account values ('mentee2', 'mentee', 1);
insert into Account values ('mentor1', 'mentor', 2);
insert into Account values ('mentor2', 'mentor', 2);
insert into Account values ('admin1', 'admin', 3);


insert into Mentee values  (1,'Nghe an','manhndhe161791@fpt.edu.vn', 'Nguyen Duy Manh', '0123456789','11-03-2002', 'M', 'avatar3.jpg')
insert into Mentee values  (2,'Ha Noi', 'longnhhe164030@fpt.edu.vn', 'Nguyen Vu Dung', '0987654321','11-04-2002', 'F', 'avatar4.jpg')


insert into Mentor values (3,'Ho Chi Minh', 'okanhchaphet7@gmail.com', 'Pham Anh Tuan', '0887654321','11-05-2002', 'M', 
'toi la mot nguoi co trach nhiem va muon mang den cho ban nhieu kien thức','Developer','toi code phan mem và xay dung ke hoach kinh phat trien phan mem','tot nghiep dai hoc fpt', 'avatar1.jpg',300);
insert into Mentor values (4,'Ha Noi', 'nguyenvudung96@gmail.com', 'Nguyen Hoang Long', '0887654321','10-05-2002', 'M', 
'toi la mot nguoi co trach nhiem va muon mang den cho ban nhieu kien thức','Developer','toi code phan mem và xay dung ke hoach kinh phat trien phan mem','tot nghiep dai hoc fpt', 'avatar2.jpg',400);


insert into Status values ('must do');--kiểu request ( bắt phải làm hay có thể từ chối)
insert into Status values ('invite');
insert into Status values ('hire');--mentee thuê mentor
insert into Status values ('Hired');
insert into Status values ('unhire');
insert into Status values ('follow');--mentee follow mentor
insert into Status values ('unfollow');
insert into Status values ('answered');--request
insert into Status values ('accept');--chấp nhận thuê hay ko
insert into Status values ('reject');
insert into Status values ('not yet');


insert into Request values ('Teach me java', 'I wanna learn java','02-25-2023', 2);
insert into Request values ('Teach me mockito', 'I wanna learn mockito','02-26-2023', 1);
insert into Request values ('Teach me C', 'I wanna learn C','02-25-2023', 2);
insert into Request values ('Teach me C++', 'I wanna learn C++','02-25-2023', 1);
insert into Request values ('Teach me C#', 'I wanna learn C#','02-26-2023', 1);
insert into Request values ('Teach me Python', 'I wanna learn Python', '02-26-2023', 2);
insert into Request values ('Teach me R', 'I wanna learn R','02-25-2023', 1);
insert into Request values ('Teach me PhoneGap', 'I wanna learn PhoneGap','02-25-2023', 2);


insert into requestStatus values (9,11)
insert into requestStatus values (9,2)
insert into requestStatus values (10,8)
insert into requestStatus values (10,1)
insert into requestStatus values (11,11)
insert into requestStatus values (11,2)
insert into requestStatus values (12,8)
insert into requestStatus values (12,1)
insert into requestStatus values (5,11)
insert into requestStatus values (5,2)
insert into requestStatus values (6,8)
insert into requestStatus values (6,1)
insert into requestStatus values (7,11)
insert into requestStatus values (7,2)
insert into requestStatus values (8,8)
insert into requestStatus values (8,1)

insert mentorRequest values (5,3)
insert mentorRequest values (6,3)
insert mentorRequest values (7,3)
insert mentorRequest values (8,3)
insert mentorRequest values (9,3)
insert mentorRequest values (10,3)
insert mentorRequest values (5,4)
insert mentorRequest values (6,4)
insert mentorRequest values (7,4)
insert mentorRequest values (11,4)
insert mentorRequest values (12,4)



insert into feedback values (10,3,5,'good1')
insert into feedback values (6,4,5,'good2')
insert into feedback values (12,4,5,'good3')
insert into feedback values (6,3,5,'good4')
insert into feedback values (8,3,5,'good5')



insert into Skill values('Java')
insert into Skill values('Python')
insert into Skill values('C++')
insert into Skill values('C#')


insert into requestSkill values(1,5)
insert into requestSkill values(2,12)
insert into requestSkill values(3,6)
insert into requestSkill values(4,6)
insert into requestSkill values(4,7)
insert into requestSkill values(3,8)
insert into requestSkill values(2,9)
insert into requestSkill values(1,10)
insert into requestSkill values(3,11)

insert into historyRequest values('want to know javax', 'I wanna learn javax','02-13-2023',1,11)
insert into historyRequest values('want to know css', 'I wanna learn css','02-25-2023',2,8)
insert into historyRequest values('want to know spring', 'I wanna learn spring','02-12-2023',3,11)
insert into historyRequest values('want to know boostrap', 'I wanna learn boostrap','02-25-2023',4,8)
insert into historyRequest values('want to know R', 'I wanna learn R','02-20-2023',4,11)




insert into hire values(3,1,'can I hire you',3)
insert into hire values(4,1,'can I hire you1',4)
insert into hire values(3,2,'can I hire you2',5)

insert into mentorSkill values(1,3)
insert into mentorSkill values(2,3)
insert into mentorSkill values(3,3)
insert into mentorSkill values(1,4)
insert into mentorSkill values(4,4)
insert into mentorSkill values(2,4)

insert into following values (4,2,7)


insert into answerRequest values ('join A link to know ',10,3)
insert into answerRequest values ('join B link to know ',6,4)
insert into answerRequest values ('join C link to know ',12,4)
insert into answerRequest values ('join D link to know ',6,3)
insert into answerRequest values ('join E link to know ',8,3)