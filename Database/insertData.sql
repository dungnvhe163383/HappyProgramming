insert into Roles values ('Mentee');
insert into Roles values ('Mentor');
insert into Roles values ('Admin');

insert into Account values ('mentee1', 'mentee', 1,'manhndhe161791@fpt.edu.vn');
insert into Account values ('mentee2', 'mentee', 1,'longnhhe164030@fpt.edu.vn');
insert into Account values ('mentor1', 'mentor', 2,'okanhchaphet7@gmail.com');
insert into Account values ('mentor2', 'mentor', 2,'nguyenvudung96@gmail.com');
insert into Account values ('admin1', 'admin', 3,'');

insert into Mentee values  (1,N'Nguyễn Duy Mạnh',N'43 Nguyễn Chí Thanh, Hà Nội','0123456789','11-03-2002', 'M', 'mentee1.jpg', N'tôi là người năng động')
insert into Mentee values  (2,N'Nguyễn Hoàng Long',N'43 Nguyễn Chí Thanh, Hồ Chí Minh','0987654321','11-04-2002', 'F', 'mentee2.jpg', N'tôi là người cầu toàn')


insert into Mentor values (3,N'Phạm Anh Tuấn', N'43 Nguyễn Chí Thanh, Lạng Sơn','0887654321','11-05-2002', 'M', 
N'tôi là một người yêu thích học tập, du lịch và khám phá những điều mới',N'tốt nghiệp loại giỏi đại học FPT', 'mentor1.jpg',300);
insert into Mentor values (4,N'Nguyễn Vũ Dũng', N'43 Nguyễn Chí Thanh, Phú Thọ', '0887654321','10-05-2002', 'M', 
N'tôi là một người tốt bụng và bạn bè tôi đánh giá tôi rất siêng năng ',N'tốt nghiệp loại giỏi đại học FPT', 'mentor2.jpg',400);

insert into [Image] values (1,'mentee11.jpg')
insert into [Image] values (1,'mentee12.jpg')
insert into [Image] values (2,'mentee21.jpg')
insert into [Image] values (2,'mentee22.jpg')
insert into [Image] values (3,'mentee31.jpg')
insert into [Image] values (3,'mentee32.jpg')
insert into [Image] values (4,'mentee41.jpg')
insert into [Image] values (4,'mentee42.jpg')


insert into job values ('Developer',N'tôi code back-end và front-end để phát triển phần mềm')
insert into job values ('Tester',N'tôi kiểm thử phần mềm')
insert into job values ('BA',N'tôi thu thập yêu cầu khách hàng và phân tích chúng')

insert into Skill values('Java')
insert into Skill values('Python')
insert into Skill values('C++')
insert into Skill values('C#')

insert into mentorSkill values(1,1)
insert into mentorSkill values(1,2)
insert into mentorSkill values(1,3)
insert into mentorSkill values(2,4)
insert into mentorSkill values(2,1)
insert into mentorSkill values(2,2)

insert into mentorJob values(1,1)
insert into mentorJob values(1,2)
insert into mentorJob values(2,2)
insert into mentorJob values(2,3)

insert into codeRequest values ('Teach me java', 'I wanna learn java','02-25-2023', 2);
insert into codeRequest values ('Teach me mockito', 'I wanna learn mockito','02-26-2023', 1);
insert into codeRequest values ('Teach me C', 'I wanna learn C','02-25-2023', 2);
insert into codeRequest values ('Teach me C++', 'I wanna learn C++','02-25-2023', 1);
insert into codeRequest values ('Teach me C#', 'I wanna learn C#','02-26-2023', 1);
insert into codeRequest values ('Teach me Python', 'I wanna learn Python', '02-26-2023', 2);
insert into codeRequest values ('Teach me R', 'I wanna learn R','02-25-2023', 1);
insert into codeRequest values ('Teach me PhoneGap', 'I wanna learn PhoneGap','02-25-2023', 2);


insert into feedback values (1,4,'good1')
insert into feedback values (1,5,'good2')
insert into feedback values (2,3,'good3')
insert into feedback values (2,2,'good4')
insert into feedback values (1,1,'good5')

insert into coderequestskill values (1,1)
insert into coderequestskill values (1,2)
insert into coderequestskill values (2,1)
insert into coderequestskill values (2,3)
insert into coderequestskill values (3,1)
insert into coderequestskill values (3,4)
insert into coderequestskill values (4,2)
insert into coderequestskill values (4,3)
insert into coderequestskill values (5,3)
insert into coderequestskill values (5,4)
insert into coderequestskill values (6,2)
insert into coderequestskill values (6,4)
insert into coderequestskill values (7,1)
insert into coderequestskill values (7,3)
insert into coderequestskill values (8,2)
insert into coderequestskill values (8,3)

insert into mentorcoderequest values (1,1)
insert into mentorcoderequest values (1,2)
insert into mentorcoderequest values (2,1)
insert into mentorcoderequest values (3,2)
insert into mentorcoderequest values (3,1)
insert into mentorcoderequest values (4,2)
insert into mentorcoderequest values (5,1)
insert into mentorcoderequest values (5,2)
insert into mentorcoderequest values (6,1)
insert into mentorcoderequest values (7,2)
insert into mentorcoderequest values (7,1)
insert into mentorcoderequest values (8,2)

insert into answer values (1,N'bạn có thể học ở codelearn1.com')
insert into answer values (2,N'bạn có thể học ở codelearn2.com')
insert into answer values (3,N'bạn có thể học ở codelearn3.com')
insert into answer values (6,N'bạn có thể học ở codelearn4.com')
insert into answer values (7,N'bạn có thể học ở codelearn5.com')
insert into answer values (8,N'bạn có thể học ở codelearn6.com')
insert into answer values (11,N'bạn có thể học ở codelearn7.com')
insert into answer values (12,N'bạn có thể học ở codelearn8.com')

insert into feedbackanswer values(1,1)
insert into feedbackanswer values(2,4)
insert into feedbackanswer values(3,3)
insert into feedbackanswer values(4,6)
insert into feedbackanswer values(5,7)

insert into [status] values ('accept');
insert into [status] values ('reject');
insert into [status] values ('not yet');


insert into HireRelationship values (1,1)
insert into HireRelationship values (1,2)
insert into HireRelationship values (2,1)

insert into historyHireRelationship values (2,2,'3-10-2023')

insert into hirerequest values (2,2,N'yêu cầu thuê1',N'tôi muốn thuê bạn kèm 1 vs 1 cho tôi tiến bộ hơn',3)
insert into hirerequest values (1,1,N'yêu cầu thuê2',N'tôi muốn thuê bạn kèm 1 vs 1 cho tôi tiến bộ hơn',2)
insert into hirerequest values (1,2,N'yêu cầu thuê3',N'tôi muốn thuê bạn kèm 1 vs 1 cho tôi tiến bộ hơn',2)
insert into hirerequest values (2,1,N'yêu cầu thuê4',N'tôi muốn thuê bạn kèm 1 vs 1 cho tôi tiến bộ hơn',2)



insert into MentorCodeRequestStatus values (1,1)
insert into MentorCodeRequestStatus values (2,1)
insert into MentorCodeRequestStatus values (3,1)
insert into MentorCodeRequestStatus values (4,3)
insert into MentorCodeRequestStatus values (5,1)
insert into MentorCodeRequestStatus values (6,1)
insert into MentorCodeRequestStatus values (7,1)
insert into MentorCodeRequestStatus values (8,1)
insert into MentorCodeRequestStatus values (9,1)
insert into MentorCodeRequestStatus values (10,1)
insert into MentorCodeRequestStatus values (11,1)
insert into MentorCodeRequestStatus values (12,1)
