--Users
CREATE TABLE Users(user_id INT IDENTITY
, Username VARCHAR(20), Password VARCHAR(10), Email VARCHAR(50)
UNIQUE, phone_number VARCHAR(20), PRIMARY KEY(user_id));
--Bachelor Project
CREATE TABLE Bachelor_Project(Code VARCHAR(10), Name VARCHAR(20),
Description VARCHAR(200), PRIMARY KEY(Code));
--Lecturer
CREATE TABLE Lecturer(Lecturer_id INT UNIQUE, Schedule VARCHAR(20), PRIMARY KEY(Lecturer_id),
FOREIGN KEY (Lecturer_id) REFERENCES Users(user_id) ON DELETE CASCADE ON UPDATE CASCADE);
--L.Fields
CREATE TABLE LecturerFields(Lecturer_id INT UNIQUE, field VARCHAR(25), PRIMARY KEY(Lecturer_id),
FOREIGN KEY (Lecturer_id) REFERENCES Lecturer(Lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE);
--Company
CREATE TABLE Company(Company_id INT UNIQUE, Name VARCHAR(20), Representative_name VARCHAR(25)
, Representative_Email VARCHAR(50) UNIQUE, Location VARCHAR(5), PRIMARY KEY (Company_id),
FOREIGN KEY (Company_id) REFERENCES Users(user_id) ON DELETE CASCADE ON UPDATE CASCADE);
--Employee
CREATE TABLE Employee(Staff_id INT UNIQUE, Company_id INT, Username VARCHAR(20), 
Password VARCHAR(20), Email VARCHAR(50) UNIQUE, Field VARCHAR(25), Phone VARCHAR(13),
PRIMARY KEY (Staff_id, Company_id), 
FOREIGN KEY (Company_id) REFERENCES Company(Company_id) ON DELETE CASCADE ON UPDATE CASCADE);
--EE
CREATE TABLE External_Examiner(EE_id INT UNIQUE, Schedule VARCHAR(20), PRIMARY KEY (EE_id),
FOREIGN KEY (EE_id) REFERENCES Users(user_id) ON DELETE CASCADE ON UPDATE CASCADE);
--TA
CREATE TABLE Teaching_Assistant(TA_id INT UNIQUE, Schedule VARCHAR(20), PRIMARY KEY(TA_id),
FOREIGN KEY (TA_id) REFERENCES Users(user_id) ON DELETE CASCADE ON UPDATE CASCADE);
--Coordinator
CREATE TABLE Coordinator(coordinator_id INT UNIQUE, PRIMARY KEY(coordinator_id),
FOREIGN KEY (coordinator_id) REFERENCES Users(user_id) ON DELETE CASCADE ON UPDATE CASCADE);
--Submitted materials
CREATE TABLE BachelorSubmittedMaterials(Code VARCHAR(10), Material VARCHAR(20), PRIMARY KEY(Code),
FOREIGN KEY (Code) REFERENCES Bachelor_Project(Code) ON DELETE CASCADE ON UPDATE CASCADE);
--Academic
CREATE TABLE Academic(Academic_code VARCHAR(10), L_id INT, TA_id INT, EE_id INT,
PRIMARY KEY(Academic_code), 
FOREIGN KEY (Academic_code) REFERENCES Bachelor_Project(Code) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (TA_id) REFERENCES Teaching_Assistant(TA_id),
FOREIGN KEY (EE_id) REFERENCES External_Examiner(EE_id));
--Industrial
CREATE TABLE Industrial(Industrial_code VARCHAR(10), C_id INT, L_id INT, E_id INT,
PRIMARY KEY(Industrial_code), 
FOREIGN KEY (Industrial_code) REFERENCES Bachelor_Project(Code) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (C_id) REFERENCES Company(Company_id) ,
FOREIGN KEY (E_id) REFERENCES Employee(Staff_id));
--Faculty
CREATE TABLE Faculty(Faculty_Code VARCHAR(10), Name VARCHAR(20), Dean INT, PRIMARY KEY(Faculty_Code),
FOREIGN KEY (Dean) REFERENCES Lecturer(Lecturer_id) ON DELETE SET NULL ON UPDATE CASCADE);
--Major
CREATE TABLE Major(Major_Code VARCHAR(10), Faculty_code VARCHAR(10), Major_Name VARCHAR(20),
PRIMARY KEY(Major_code), 
FOREIGN KEY (Faculty_code) REFERENCES Faculty(Faculty_Code) ON DELETE CASCADE ON UPDATE CASCADE);
--Meeting
CREATE TABLE Meeting(Meeting_ID INT IDENTITY, L_id INT, STime TIME, ETime TIME, Duration AS DATEDIFF(minute,STime,ETime),
Meeting_Point VARCHAR(5), PRIMARY KEY (Meeting_ID),
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id));
--ToDoList
CREATE TABLE MeetingToDoList(Meeting_ID INT, ToDoList VARCHAR(200), PRIMARY KEY(Meeting_ID,ToDolist),
FOREIGN KEY (Meeting_ID) REFERENCES Meeting(Meeting_ID) ON DELETE CASCADE ON UPDATE CASCADE);
--Attendants
CREATE TABLE MeetingAttendents(Meeting_ID INT, Attendant_id INT, PRIMARY KEY(Meeting_ID,Attendant_id),
FOREIGN KEY (Meeting_ID) REFERENCES Meeting(Meeting_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Attendant_id) REFERENCES Users(user_id));
--Student
CREATE TABLE Student(sid INT UNIQUE, first_name VARCHAR(20), last_name VARCHAR(20),
Major_code VARCHAR(10), Date_Of_Birth DATETIME, Adress VARCHAR(100), Age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(Date_Of_Birth)),
Semester INT, GPA DECIMAL(3,2), 
TotalBachelorGrade DECIMAL(4,2),  Assigned_Project_code VARCHAR(10),PRIMARY KEY(sid),
FOREIGN KEY (sid) REFERENCES Users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Major_code) REFERENCES Major(Major_Code),
FOREIGN KEY (Assigned_Project_code) REFERENCES Bachelor_Project(Code) ON DELETE SET NULL ON UPDATE CASCADE);
--Thesis
CREATE TABLE Thesis(sid INT, Title VARCHAR(50), Deadline DATETIME, PDF_doc VARCHAR(1000),
Total_grade DECIMAL(4,2), 
PRIMARY KEY (sid,Title),
FOREIGN KEY (sid) REFERENCES Student(sid) ON DELETE CASCADE ON UPDATE CASCADE);
--Defense
CREATE TABLE Defense(sid INT, Location VARCHAR(5), Content VARCHAR(1000), Time TIME, Date DATETIME,
Total_Grade DECIMAL(4,2),
PRIMARY KEY(sid,Location), 
FOREIGN KEY (sid) REFERENCES Student(sid) ON DELETE CASCADE ON UPDATE CASCADE);
--PR
CREATE TABLE ProgressReport(sid INT, Date DATETIME, Content VARCHAR(1000), 
Grade DECIMAL(4,2),ComulativeProgressReportGrade DECIMAL(4,2),
UpdatingUser_id INT, PRIMARY KEY(sid,Date),
FOREIGN KEY (sid) REFERENCES Student(sid) ON DELETE CASCADE ON UPDATE CASCADE,
--CHECK FOR THE BELOW FOREIGN KEY WHETHER IT IS CASCADE OR SET NULL
FOREIGN KEY (UpdatingUser_id) REFERENCES Users(user_id));
--GIPR not done
CREATE TABLE GradeIndustrialPR(C_id INT, sid INT, Date DATETIME, Company_grade DECIMAL(4,2),
Lecturer_grade DECIMAL(4,2), PRIMARY KEY(sid,Date),
FOREIGN KEY (sid) REFERENCES ProgressReport(sid) ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (Date) REFERENCES ProgressReport(Date) ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (C_id) REFERENCES Company(Company_id) ON DELETE CASCADE ON UPDATE CASCADE);
--GAPR
CREATE TABLE GradeAcademicPR(L_id INT, sid INT, Date DATETIME, Lecturer_grade DECIMAL(4,2),
PRIMARY KEY(sid,Date),
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (sid) REFERENCES ProgressReport(sid) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Date) REFERENCES ProgressReport(Date) ON DELETE CASCADE ON UPDATE CASCADE);
--GAT
CREATE TABLE GradeAcademicThesis(L_id INT, EE_id INT, sid INT, Title VARCHAR(50), EE_grade DECIMAL(4,2),
Lecturer_grade DECIMAL(4,2), PRIMARY KEY(sid,Title),
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (sid) REFERENCES Thesis(sid) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Title) REFERENCES Thesis(Date) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (EE_id) REFERENCES External_Examiner(EE_id) ON DELETE SET NULL ON UPDATE CASCADE);
--GIT
CREATE TABLE GradeIndustrialThesis(C_id INT, E_id INT, sid INT, Title VARCHAR(50),
Company_grade DECIMAL(4,2), Employee_grade DECIMAL(4,2), PRIMARY KEY(sid,Title),
FOREIGN KEY (sid) REFERENCES Thesis(sid) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Title) REFERENCES Thesis(Date) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (C_id) REFERENCES Company(Company_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (E_id) REFERENCES Employee(Staff_id) ON DELETE SET NULL ON UPDATE CASCADE);
--GAD
CREATE TABLE GradeAcademicDefense(L_id INT, EE_id INT, sid INT, Location VARCHAR(5),
EE_grade DECIMAL(4,2), Lecturer_grade DECIMAL(4,2), PRIMARY KEY(sid,Location),
FOREIGN KEY (sid) REFERENCES Defense(sid) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Location) REFERENCES Defense(Location) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (EE_id) REFERENCES External_Examiner(EE_id) ON DELETE CASCADE ON UPDATE CASCADE);
--GID
CREATE TABLE GradeIndustrialDefense(C_id INT, E_id INT, sid INT, Location VARCHAR(5),
Company_grade DECIMAL(4,2), Employee_grade DECIMAL(4,2), PRIMARY KEY(sid,Location),
FOREIGN KEY (sid) REFERENCES Defense(sid) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Location) REFERENCES Defense(Location) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (C_id) REFERENCES Company(Company_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (E_id) REFERENCES Employee(Staff_id) ON DELETE SET NULL ON UPDATE CASCADE);
--LEE
CREATE TABLE LecturerRecommendEE(L_id INT, EE_id INT, PCode VARCHAR(10), PRIMARY KEY(EE_id,PCode),
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (EE_id) REFERENCES External_Examiner(EE_id),
FOREIGN KEY (PCode) REFERENCES Academic(Academic_code));
--SP
CREATE TABLE StudentPreferences(sid INT, PCode VARCHAR(10), PreferenceNumber INT, 
PRIMARY KEY(sid,PCode),
FOREIGN KEY (PCode) REFERENCES Academic(Academic_code) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (sid) REFERENCES Student(sid));
--MBP
CREATE TABLE MajorHasBachelorProject(Major_code VARCHAR(10), Project_code VARCHAR(10),
PRIMARY KEY(Major_code,Project_code),
FOREIGN KEY (Major_code) REFERENCES Major(Major_Code) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Project_code) REFERENCES Bachelor_Project(Code) ON DELETE CASCADE ON UPDATE CASCADE);

go
--2-B
CREATE PROC ViewProfile
@user_id int
AS 
SELECT * FROM Users u where u.user_id = @user_id;
go 
--3-a

CREATE PROC MakePreferencesLocalProject 
@sid int, @bachelor_code varchar(10), @preference_number int
AS 
IF(EXISTS(SELECT * FROM MajorHasBachelorProject  m INNER JOIN Student s ON m.Major_Code = s.Major_code AND @bachelor_code = m.Project_code))
INSERT INTO StudentPreferences VALUES (@sid,@bachelor_code,@preference_number)
ELSE 
RETURN 'Error';
go

--3-b // grade?
CREATE PROC ViewMyThesis
@sid int, @title varchar(50)
AS
SELECT * FROM Thesis t WHERE t.sid = @sid AND t.Title = @title;
go


--3-c
-- who creates the thesis? not sure
CREATE PROC SubmitMyThesis 
@sid int, @title varchar(50), @PDF_Document varchar(1000)
AS	

UPDATE Thesis 
SET  Thesis.PDF_doc = @PDF_Document
WHERE Thesis.sid = @sid, Thesis.Title =@title; 
go
-- 3-d

CREATE PROC ViewMyProgressReports
@sid int, @date datetime
AS 
IF (@date = null) 
SELECT * FROM ProgressReport p WHERE p.sid = @sid ORDER BY p.Date ASC
ELSE 
SELECT * FROM ProgressReport p WHERE p.sid = @sid AND p.Date = @date;
go

--3-e // grade?
CREATE PROC ViewMyDefense
@sid int
AS
SELECT * FROM Defense d WHERE d.sid = @sid ;
go
-- 3-f
CREATE PROC UpdateMyDefense
@sid int, @defense_content varcahr(1000)
AS 
UPDATE Defense  
SET Defense.Content = @defense_content
WHERE Defense.sid = @sid;
go
--3-g grade?


--3-h
CREATE PROC ViewNotBookedMeetings
@sid int
AS 
DECLARE @lecturer1 int,
@lecturer1 = (SELECT c.L_id  FROM Academic c )


INSERT INTO 
Student(sid,first_name,last_name,Major_code,Date_Of_Birth,Address,Semester,GPA,Assigned_Project_code)
VALUES
(9,'black','white','AARCH106','2000-01-01 00:00:00','safkjhdjkasfhjf',3,3.9,4)
INSERT INTO
Student(sid,first_name,last_name,Major_code,Date_Of_Birth,Address,Semester,GPA,Assigned_Project_code)
VALUES
(19,'christian','gray','FORK103','2001-01-01 00:00:00','sajlajfljadjkasfhjf',3,0.8,0.9)


INSERT INTO StudentPreferences
VALUES(9,'BP101',1)
INSERT INTO StudentPreferences
VALUES(9,'BP106',2)
INSERT INTO StudentPreferences
VALUES(19,'BP101',1)
INSERT INTO StudentPreferences
VALUES(19,'BP106',2)

INSERT INTO Bachelor_Project
VALUES('BP101','water hose','kvecebftqsdctxwrcsbbbkkrmjpbwibhavvtwcywylbkjvifkd')
iNSERT INTO Bachelor_Project
VALUES('BP106','Car wash','dmdrvrdvxiwbsbnlqvdsisdjepejezwohlxbuthlxgnebstimi') 
