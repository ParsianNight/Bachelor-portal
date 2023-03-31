





-------------------TESTS------------------------------------------






-- Testing 1-a with valid input;
-- try defensive programming.


declare @res_id int ,@password varchar(20);
EXECUTE UserRegister 'Company', 'komm', 'komm207GRGREGF88غاعgiuyuhالاع90@gmail.com', 't','ka', '1/2/2003', 2.5, 5,'obo'
,NULL, NULL, NULL,
NULL, NULL, '0126247919','Zbr'  ,@res_id OUTPUT,@password OUTPUT 
print @res_id


declare @res_id int ,@password varchar(20);
EXECUTE UserRegister 'Student', 'komm', 'komm20788غاعDFGDGFDVDSgiuyuhالاع90@gmail.com', 't','ka', '1/2/2003', 2.5, 5,'obo'
,NULL, NULL, NULL,
NULL, NULL, '0126247919','Zbr'  ,@res_id OUTPUT,@password OUTPUT 
print @res_id


declare @res_id int ,@password varchar(20);
EXECUTE UserRegister 'Coordinator', 'komm', 'komm20EFافاغتغEFEGDV788غاعgiuyuhالاع90@gmail.com', 't','ka', '1/2/2003', 2.5, 5,'obo'
,NULL, NULL, NULL,
NULL, NULL, '0126247919','Zbr'  ,@res_id OUTPUT,@password OUTPUT 
print @res_id


declare @res_id int ,@password varchar(20);
EXECUTE UserRegister 'Lecturer', 'komm', 'komm20SVFFDVXFDفافقاغفا788غاعgiuyuhالاع90@gmail.com', 't','ka', '1/2/2003', 2.5, 5,'obo'
,NULL, NULL, NULL,
NULL, NULL, '0126247919','Zbr'  ,@res_id OUTPUT,@password OUTPUT 
print @res_id



declare @res_id int ,@password varchar(20);
EXECUTE UserRegister 'External_Examiner', 'komm', 'DVCDVFغاغتىغBVFBgiuyuhالاع90@gmail.com', 't','ka', '1/2/2003', 2.5, 5,'obo'
,NULL, NULL, NULL,
NULL, NULL, '0126247919','Zbr'  ,@res_id OUTPUT,@password OUTPUT 
print @res_id


declare @res_id int ,@password varchar(20);
EXECUTE UserRegister 'Teaching_Assistant', 'komm', 'komm2غتغفالبرلللاDVDFBFDFV0788غاعgiuyuhالاع90@gmail.com', 't','ka', '1/2/2003', 2.5, 5,'obo'
,NULL, NULL, NULL,
NULL, NULL, '0126247919','Zbr'  ,@res_id OUTPUT,@password OUTPUT 
print @res_id




--2-a
declare @success BIT  ,@user_id int ;
EXECUTE UserLogin 'kom21@gmail.com','7G7M8K8@8%'  ,@success OUTPUT,@user_id OUTPUT -- valid mail
declare @success BIT  ,@user_id int ;
EXECUTE UserLogin 'kom21@gmail.com','7G7M8K8@8%'  ,@success OUTPUT,@user_id OUTPUT -- invalid mail


--2-b 
--EXECUTE ViewProfile  4 
-- valid userId
--2-C
/* 
Creating project for Testing 
Project id = 3, Created by 
*/









-- Testing 3-A


-- Takes Sid, Project code , pref num .. if the the pref num is taken it deletes the past one
EXECUTE MakePreferencesLocalProject 1,1,1 -- noice OMAR
EXECUTE MakePreferencesLocalProject 1,NULL,1 -- Catch the error please

-- Testing 3-B
-- Takes sid and shows the thesis 

EXECUTE ViewMyThesis 1,'Testing thesis' -- View the thesis 
EXECUTE ViewMyThesis 1,'Testing' -- View the thesis with wrong name -> no result

-- 3-C
EXECUTE SubmitMyThesis 1, 'Testing thesis', 'Testing who am i test test test' -- Submit the Thesis  (Yes omar beeh)
EXECUTE SubmitMyThesis 1, 'Testing', 'Testing who am i test test test' -- Wrong title and doesn't belong to user -> no affect.
-- 3- D 
EXECUTE ViewMyProgressReports 1,NULL -- without Date
EXECUTE ViewMyProgressReports 1,'1/2/2003' -- without Date
EXECUTE ViewMyProgressReports NULL,NULL -- without vaild sid
--3-E
EXECUTE ViewMyDefense 1 -- View Defense data
EXECUTE ViewMyDefense 2 -- View wrong  data
--3-F 
EXECUTE UpdateMyDefense 1,'Im trying to update me haha' -- Update Defense data
EXECUTE UpdateMyDefense 2,'Im trying to update me haha' -- Update Defense data for non valid user
--3-G 
declare @BachelorGrade DECIMAL(4,2);
EXECUTE ViewMyBachelorProjectGrade 1, @BachelorGrade -- NULL and it should give the correct value iguess :p 
--3-h
/*
The idea behind this is that if there's a meeting and a student hasn't booked  so it won't have meetingAttendats 
so we JOIN to find out which is the one we looking for 
*/
EXECUTE ViewNotBookedMeetings 9 -- 
--3-i
/*

*/
EXECUTE BookMeeting 9,2 -- Input: @sid int, @meeting_id in
EXECUTE BookMeeting 9,2 -- 

--3-j
EXECUTE ViewMeeting 2,1 -- DONE ;D  Input: @meeting_id int, @sid int
--
--3-k 
EXECUTE StudentAddToDo 2,'3awz anam fa45' -- Input: @meeting_id int, @to_do_list varchar(200




--4-a working  with definsive programming

declare @StaffID int , 
 @ComapnyID int  ,
 @password varchar(10)
EXECUTE AddEmployee 1,'cmod.gmadvfcdsn lkil.com','mohamed','0123032323','metal',@StaffID,@ComapnyID,@password
EXECUTE AddEmployee 3,'cmod.glmdvmcmail.com','mohamed','0123032323','metal',@StaffID,@ComapnyID,@password
EXECUTE AddEmployee 1,'cmod.gmail.com','mohamed','0123032323','metal',@StaffID,@ComapnyID,@password

--4-b working  with definsive programming

insert into  Major(Major_Code,Faculty_code,Major_Name) 
values(67,12,'cs')
EXECUTE CompanyCreateLocalProject 1,23,'cms','centarl managment system',67
EXECUTE CompanyCreateLocalProject 1,23,'cms','centarl managment system',678
EXECUTE CompanyCreateLocalProject 1,243,'portal','centarl managment system',67



--4-C working very good  with definsive programming

declare @StaffID int 

EXECUTE AssignEmployee 23,3,1,@StaffID --right way of insertion

EXECUTE AssignEmployee 2,3,1,@StaffID
EXECUTE AssignEmployee 23,43,1,@StaffID
EXECUTE AssignEmployee 23,3,121,@StaffID

EXECUTE AssignEmployee 23,23,1,@StaffID
EXECUTE AssignEmployee 23,43,12,@StaffID
EXECUTE AssignEmployee 233,3,121,@StaffID

EXECUTE AssignEmployee 233,43,31,@StaffID 

--4D) working  with definsive programming

insert into thesis (sid,Title,PDF_doc,Total_grade)
values (3,'mok','mofd',5.3)
EXECUTE CompanyGradeThesis 1,3,mok,5.62 --right way of insertion
EXECUTE CompanyGradeThesis 1,3,mogfd,5.2 --right way of insertion

EXECUTE CompanyGradeThesis 12,3,mogfd,5.2 
EXECUTE CompanyGradeThesis 1,34,mogfd,5.2 
EXECUTE CompanyGradeThesis 1,3,mogfd,5.2 
EXECUTE CompanyGradeThesis 1,3,mogdewfd,5.2 



--4-e working  with definsive programming

insert into Defense(sid,Location,Content)values(3,'cana','niki mana')

EXECUTE CompanyGradedefense 1,3,'cana',2.6--right insertion way

EXECUTE CompanyGradedefense 1,34,'cana',2.6

EXECUTE CompanyGradedefense 13,3,'cana',2.6
EXECUTE CompanyGradedefense 1,3,'cscana',2.6




--4-f WORKING  with definsive programming

EXECUTE CompanyGradePR 1,3,'2022-02-12 18:30:00' ,6.8
EXECUTE CompanyGradePR 1,3,'12/2/2020 12:00:00 AM' ,6.8





--5









--6-a working very good  with definsive programming

EXECUTE TACreatePR 2,3,'12/9/2021','de3dewfdw'
EXECUTE TACreatePR 2,3,'12/9/2023','de3dewfdw'

--6-b working very good with definsive programming

insert into Faculty(L_id,STime,ETime,Meeting_Point)values (4,'12:30:50','1:34:50','56')
insert into Meeting(L_id,STime,ETime,Meeting_Point)values (4,'12:30:50','1:34:50','56')
EXECUTE TAAddToDo 1,'I nead to show the lecture'


--7-a working very good with definsive programming
insert into Thesis(sid,Title,Deadline,PDF_doc,Total_grade)values(3,'mogfd',null,null,5.4)

EXECUTE EEGradeThesis 5,3,'mogfd',3.4
EXECUTE EEGradeThesis 52,3,'mogfd',3.4
EXECUTE EEGradeThesis 5,33,'mogfd',3.4


--7-b working very good
insert into Defense(sid,Location,Time,Date,Total_grade)
values(3,'mogfd',null,null,5.4)

EXECUTE EEGradedefense 5,3,'mogfd',3.4
EXECUTE EEGradedefense 35,3,'mogfd',3.4
EXECUTE EEGradedefense 5,43,'mogfd',3.4











--9-a working very good with definsive programming
insert into Employee(Staff_id,Company_id,Username,
Password,Email,Field,Phone)
values(3,1,'mohamed','wqnioqwnid','hniohnopij',
'scescesdc','scdsvds')

EXECUTE EmployeeGradeThesis 3,	3,'mogfd',5.4
EXECUTE EmployeeGradeThesis 3,	3,'moasfasgfd',5.4

--9-b working very good with definsive programming

EXECUTE EmployeeGradedefense 3,3,'mogfd',6.7
EXECUTE EmployeeGradedefense 3,3,'mosfdcegfd',6.7

--9-c working very good with definsive programming
EXECUTE EmployeeCreatePR 3,3,'12/2/2020','iernvsvkmepsdc,'
EXECUTE EmployeeCreatePR 3,3,'12/2/2021','iernvsvkmepsdc,'



----------------------END of TESTS-------------------------------------------------------








-------------------------------------------------------------------------------------------------------
--Users

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('ribeye','12345spid','johndoe@gmail.com','External supervisor','01177886655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('tenderloin','abcd3stu','deathdoor@gmail.com','Lecturer','01111223344')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('steak','1akjfjf','worldhunger@gmail.com','Student','01123186655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('muscles','sjghaksgh','slavery@gmail.com','Company','01198786655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('eggroll','dsjghhksa','jfkassasination@gmail.com','Teaching assistant','01123455585')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('sushi','skdlfjls','johajflk@gmail.com','External examiner','01169886655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('spaghetti','syphils','hunkye@gmail.com','Coordinator','01177666666')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('verna','bangbing','johnLOL@gmail.com','Coordinator','01177882315')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('carya3','cowburger','zaLecturer@gmail.com','Student','01177883455')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('maxwillh','nugemy','willsmith@gmail.com','External supervisor','01177996655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('kellyR','abtain','harrypotter@gmail.com','Company','01100886655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('ribS','thinOmar','johnd@gmail.com','Lecturer','01287886655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('eyeS','blackadams','ohndoey@gmail.com','Teaching assistant','01177666655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('ieye','than','fondou@yahoo.com','Lecturer','01177886455')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('winnerwinnerCHd','freakid','johndonut@gmail.com','External examiner','01177844655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('loserwinner','corny','moandonut@gmail.com','Company','01134544655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('qatar','wheaty','waffles@gmail.com','Teaching assistant','01134594655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('brazilL','wheaty','cadillac@gmail.com','External examiner','01135594655')

INSERT INTO Users(Username,Password,Email,Role,phone_number)
VALUES('coroatia','steamy','monster@gmail.com','Student','01135534655')

-------------------------------------------------------------------------------------------------------
--Bachelor Project

INSERT INTO Bachelor_Project
VALUES('BP101','water hose','kvecebftqsdctxwrcsbbbkkrmjpbwibhavvtwcywylbkjvifkd')
iNSERT INTO Bachelor_Project
VALUES('BP106','Car wash','dmdrvrdvxiwbsbnlqvdsisdjepejezwohlxbuthlxgnebstimi')
iNSERT INTO Bachelor_Project
VALUES('BP105','drone','wogqvwwiubmaiihndalplwjpzwiyobwkpeizimuehpokcbaadg')
-------------------------------------------------------------------------------------------------------
--Lecturer

INSERT INTO Lecturer
VALUES(2,'first format')
iNSERT INTO Lecturer
VALUES(12,'fifteenth format')
iNSERT INTO Lecturer
VALUES(14,'tenth format')

-------------------------------------------------------------------------------------------------------
--LecturerFields


INSERT INTO LecturerFields
VALUES(2,'programming')
iNSERT INTO LecturerFields
VALUES(12,'database')
iNSERT INTO LecturerFields
VALUES(14,'networks')
-------------------------------------------------------------------------------------------------------
--Company

INSERT INTO Company
VALUES(4,'Monsters INC','OMar','kkklll@yahoo.com','egypt')
iNSERT INTO Company
VALUES(11,'Mystrey INC','ehab','jjjppp@tor.com','usa')
iNSERT INTO Company
VALUES(16,'Slim INC','slim','slimslim@gmail.com','uk')

-------------------------------------------------------------------------------------------------------
--Employee


INSERT INTO Employee
VALUES(1,4,'OMarshady','popo','abcde@yahoo.com','HR','012345677810')
INSERT INTO Employee
VALUES(2,11,'ehabshady','pepe','justin@tor.com','literature','01294567910')
iNSERT INTO Employee
VALUES(3,16,'slimshady','meme','bieber@gmail.com','science','01274567910')


-------------------------------------------------------------------------------------------------------
--EE


INSERT INTO External_Examiner
VALUES(6,'sad schedule')
INSERT INTO External_Examiner
VALUES(15,'angry schedule')
INSERT INTO External_Examiner
VALUES(18,'fungus schedule')

-------------------------------------------------------------------------------------------------------
--TA


INSERT INTO Teaching_Assistant
VALUES(5,'fun schedule')
INSERT INTO Teaching_Assistant
VALUES(13,' teary schedule')
INSERT INTO Teaching_Assistant
VALUES(17,' fat schedule')
-------------------------------------------------------------------------------------------------------
--Coordinator


INSERT INTO Coordinator
VALUES(7)
INSERT INTO Coordinator
VALUES(8)
-------------------------------------------------------------------------------------------------------
--BachelorSubmittedMaterials


INSERT INTO BachelorSubmittedMaterials
VALUES('BP101','ceramic tears')
INSERT INTO BachelorSubmittedMaterials
VALUES('BP106','granite sya7')
INSERT INTO BachelorSubmittedMaterials
VALUES('BP105','opal')




-------------------------------------------------------------------------------------------------------
--Academic


INSERT INTO Academic
VALUES('BP101',2,5,6)
INSERT INTO Academic
VALUES('BP106',12,13,15)
INSERT INTO Academic
VALUES('BP105',14,17,18)
-------------------------------------------------------------------------------------------------------
--Industrial


INSERT INTO Industrial
VALUES('BP101',4,2,1)
INSERT INTO Industrial
VALUES('BP106',11,12,2)
INSERT INTO Industrial
VALUES('BP105',16,14,3)

-------------------------------------------------------------------------------------------------------
--Faculty


INSERT INTO Faculty
VALUES('CSEN101','security',2)
INSERT INTO Faculty
VALUES('FFEN106','bugs',12)
INSERT INTO Faculty
VALUES('ZORK103','informatics',14)
-------------------------------------------------------------------------------------------------------
--Major


INSERT INTO Major
VALUES('ECON101','CSEN101','argentine')
INSERT INTO Major
VALUES('AARCH106','FFEN106','dummy')
INSERT INTO Major
VALUES('FORK103','ZORK103','you are')
-------------------------------------------------------------------------------------------------------
--Meeting




INSERT INTO Meeting(L_id,STime,ETime,Date,Meeting_Point)
VALUES(2,'18:30:00', '20:00:00','2022-12-31 18:30:00','UNI')
INSERT INTO Meeting(L_id,STime,ETime,Date,Meeting_Point)
VALUES(12,'15:30:00', '18:00:00','2023-01-11 15:30:00','CLASS')
INSERT INTO Meeting(L_id,STime,ETime,Date,Meeting_Point)
VALUES(14,'10:00:00','12:00:00','2023-01-25 10:00:00','HOME')


-------------------------------------------------------------------------------------------------------
--ToDoList


INSERT INTO MeetingToDoList (Meeting_ID,ToDoList)
VALUES(4,'laugh laugh laugh laugh')
INSERT INTO MeetingToDoList(Meeting_ID,ToDoList)
VALUES(5,'cry cry cry cry')
INSERT INTO MeetingToDoList(Meeting_ID,ToDoList)
VALUES(6,'die die die die')
-------------------------------------------------------------------------------------------------------
--MeetingAttendents


INSERT INTO MeetingAttendents 
VALUES(1,1)
INSERT INTO MeetingAttendents
VALUES(2,2)
INSERT INTO MeetingAttendents
VALUES(3,3)
--- insert what both are identity primary keys 
-------------------------------------------------------------------------------------------------------
--Student


INSERT INTO 
Student(sid,first_name,last_name,Major_code,Date_Of_Birth,Address,Semester,GPA,Assigned_Project_code)
VALUES
(3,'ahmd','mohamed','ECON101','1999-01-01 00:00:00','ajfhakjjfakdhfjkakhfhjf',3,0.7,'BP101')
INSERT INTO 
Student(sid,first_name,last_name,Major_code,Date_Of_Birth,Address,Semester,GPA,Assigned_Project_code)
VALUES
(9,'black','white','AARCH106','2000-01-01 00:00:00','safkjhdjkasfhjf',3,3.9,'BP106')
INSERT INTO
Student(sid,first_name,last_name,Major_code,Date_Of_Birth,Address,Semester,GPA,Assigned_Project_code)
VALUES
(19,'christian','gray','FORK103','2001-01-01 00:00:00','sajlajfljadjkasfhjf',3,0.9,'BP105')

-------------------------------------------------------------------------------------------------------------------------

--Thesis


INSERT INTO 
Thesis(sid,Title,Deadline,PDF_doc,Total_grade)
VALUES
(3,'hydrodynamics','2023-12-11 23:59:59','ajfhakjjfakdhfjkakhfhjfno blah blah blah',80.0)
INSERT INTO 
Thesis(sid,Title,Deadline,PDF_doc,Total_grade)
VALUES
(9,'thermodynamics','2000-01-01 00:00:00','safkjhdjkasfhjfblah blah no blah',99.0)
INSERT INTO
Thesis(sid,Title,Deadline,PDF_doc,Total_grade)
VALUES
(19,'funkystatic','2001-01-01 00:00:00','sajlajfljadjkasfhjfblah no blah blah',89.0)

------------------------------------------------------------------------------------------------------

--Defense


INSERT INTO 
Defense(sid,Location,Content,Time , Date , Total_Grade)
VALUES
(3,'haven','aghakjhgkhafkjhgkafshkgjhakkaksjfhjkh','10:10:10','2023-12-01 13:10:00',80.0)
INSERT INTO 
Defense(sid,Location,Content,Time , Date , Total_Grade)
VALUES
(9,'hell','safkjhdjkasfhjfblah blah no blah','20:20:20','2023-10-03 15:10:00',99.0)
INSERT INTO
Defense(sid,Location,Content,Time , Date , Total_Grade)
VALUES
(19,'egypt','haskjfkahfjafa','17:30:30','2022-02-03 14:10:00',99.0)

----------------------------------------------------------------------------------------------------
--PR


INSERT INTO 
ProgressReport(sid,Date,Content, Grade , ComulativeProgressReportGrade )
VALUES
(3,'2023-02-03 14:10:00','aghakjhgkhafkjhgkafshkgjhakkaksjfhjkh',80.0,99.0)
INSERT INTO 
ProgressReport(sid,Date,Content, Grade , ComulativeProgressReportGrade )
VALUES
(9,'2022-02-03 15:10:00','safkjhdjkasfhjfblah blah no blah',78.0,89.9)
INSERT INTO
ProgressReport(sid,Date,Content, Grade , ComulativeProgressReportGrade )
VALUES
(19,'2023-12-01 13:10:00','haskjfkahfjafa',23.01,23.02)
------------------------------------------------------------------------------------------------------





INSERT INTO GradeIndustrialPR(C_id,sid,Date,Company_grade)
VALUES(4,3,'2023-02-03 14:10:00',3.23)
INSERT INTO GradeIndustrialPR(C_id,sid,Date,Company_grade)
VALUES(11,9,'2022-02-03 15:10:00',0.80)
INSERT INTO GradeIndustrialPR(C_id,sid,Date,Company_grade)
VALUES(16,19,'2023-12-01 13:10:00',0.90)


----------------------------------------------------------------------------------------------------------

--GAPR



INSERT INTO GradeAcademicPR(L_id,sid,Date,Lecturer_grade)
VALUES(2,3,'2023-02-03 14:10:00',3.24)
INSERT INTO GradeAcademicPR(L_id,sid,Date,Lecturer_grade)
VALUES(12,9,'2022-02-03 15:10:00',2.81)
INSERT INTO GradeAcademicPR(L_id,sid,Date,Lecturer_grade)
VALUES(14,19,'2023-12-01 13:10:00',3.91)

----------------------------------------------------------------------------------------------------------------------------
--GAT


INSERT INTO GradeAcademicThesis(L_id,EE_id,sid,Title,EE_grade,Lecturer_grade)
VALUES(2,6,3,'hydrodynamics',3.23,3.24)
INSERT INTO GradeAcademicThesis(L_id,EE_id,sid,Title,EE_grade,Lecturer_grade)
VALUES(12,15,9,'thermodynamics',2.80,2.81)
INSERT INTO GradeAcademicThesis(L_id,EE_id,sid,Title,EE_grade,Lecturer_grade)
VALUES(14,18,19,'funkystatic',3.90,3.91)

------------------------------------------------------------------------------------------------------------
--GIT



INSERT INTO GradeIndustrialThesis(E_id,C_id,sid,Title,Company_grade,Employee_grade)
VALUES(1,4,3,'hydrodynamics',3.23,3.24)
INSERT INTO GradeIndustrialThesis(E_id,C_id,sid,Title,Company_grade,Employee_grade)
VALUES(2,11,9,'thermodynamics',0.80,0.81)
INSERT INTO GradeIndustrialThesis(E_id,C_id,sid,Title,Company_grade,Employee_grade)
VALUES(3,16,19,'funkystatic',0.90,0.91)
--------------------------------------------------------------------------------------------------------------
--GAD



INSERT INTO GradeAcademicDefense(L_id,EE_id,sid,Location,EE_grade,Lecturer_grade)
VALUES(2,6,3,'haven',3.23,3.24)
INSERT INTO GradeAcademicDefense(L_id,EE_id,sid,Location,EE_grade,Lecturer_grade)
VALUES(12,15,9,'hell',2.80,2.81)
INSERT INTO GradeAcademicDefense(L_id,EE_id,sid,Location,EE_grade,Lecturer_grade)
VALUES(14,18,19,'egypt',3.90,3.91)


--------------------------------------------------------------------------------------------------------------
--GID



INSERT INTO GradeIndustrialDefense(E_id,C_id,sid,Location,Company_grade,Employee_grade)
VALUES(1,4,3,'haven',3.23,3.24)
INSERT INTO GradeIndustrialDefense(E_id,C_id,sid,Location,Company_grade,Employee_grade)
VALUES(2,11,9,'hell',0.80,0.81)
INSERT INTO GradeIndustrialDefense(E_id,C_id,sid,Location,Company_grade,Employee_grade)
VALUES(3,16,19,'egypt',0.90,0.91)


------------------------------------------------------------------------------------------------------------------
--LEE

INSERT INTO LecturerRecommendEE(L_id,EE_id,PCode)
VALUES(2,6,'BP101')
INSERT INTO LecturerRecommendEE(L_id,EE_id,PCode)
VALUES(12,15,'BP106')
INSERT INTO LecturerRecommendEE(L_id,EE_id,PCode)
VALUES(14,18,'BP105')

---------------------------------------------------------------------------------------------------------------------

--SP



INSERT INTO StudentPreferences
VALUES(3,'BP101',1)
INSERT INTO StudentPreferences
VALUES(9,'BP106',2)
INSERT INTO StudentPreferences
VALUES(19,'BP105',3)


--------------------------------------------------------------------------------------------------------------------
--MBP


INSERT INTO MajorHasBachelorProject
VALUES('ECON101','BP101')
INSERT INTO MajorHasBachelorProject
VALUES('AARCH106','BP106')
INSERT INTO MajorHasBachelorProject
VALUES('FORK103','BP105')

---------------------------------------------------------------------------------------------------------------------
