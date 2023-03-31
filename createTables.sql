CREATE DATABASE Project1;
USE Project1;
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
CREATE TABLE Meeting(Meeting_ID INT IDENTITY, L_id INT, STime TIME, ETime TIME, Duration AS DATEDIFF(minute,STime,ETime),Date DATETIME,
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
Major_code VARCHAR(10), Date_Of_Birth DATETIME, Address VARCHAR(100), Age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(Date_Of_Birth)),
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
FOREIGN KEY (sid,Date) REFERENCES ProgressReport(sid,Date) ON DELETE CASCADE ON UPDATE CASCADE,  
FOREIGN KEY (C_id) REFERENCES Company(Company_id));
--GAPR
CREATE TABLE GradeAcademicPR(L_id INT, sid INT, Date DATETIME, Lecturer_grade DECIMAL(4,2),
PRIMARY KEY(sid,Date),
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id),
FOREIGN KEY (sid,Date) REFERENCES ProgressReport(sid,Date) ON DELETE CASCADE ON UPDATE CASCADE);
--GAT
CREATE TABLE GradeAcademicThesis(L_id INT, EE_id INT, sid INT, Title VARCHAR(50), EE_grade DECIMAL(4,2),
Lecturer_grade DECIMAL(4,2), PRIMARY KEY(sid,Title),
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id),
FOREIGN KEY (sid,Title) REFERENCES Thesis(sid,Title) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (EE_id) REFERENCES External_Examiner(EE_id));
--GIT
CREATE TABLE GradeIndustrialThesis(C_id INT, E_id INT, sid INT, Title VARCHAR(50),
Company_grade DECIMAL(4,2), Employee_grade DECIMAL(4,2), PRIMARY KEY(sid,Title),
FOREIGN KEY (sid,Title) REFERENCES Thesis(sid,Title) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (E_id,C_id) REFERENCES Employee(Staff_id,Company_id));
--GAD
CREATE TABLE GradeAcademicDefense(L_id INT, EE_id INT, sid INT, Location VARCHAR(5),
EE_grade DECIMAL(4,2), Lecturer_grade DECIMAL(4,2), PRIMARY KEY(sid,Location),
FOREIGN KEY (sid,Location) REFERENCES Defense(sid,Location) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id),
FOREIGN KEY (EE_id) REFERENCES External_Examiner(EE_id));
--GID
CREATE TABLE GradeIndustrialDefense(C_id INT, E_id INT, sid INT, Location VARCHAR(5),
Company_grade DECIMAL(4,2), Employee_grade DECIMAL(4,2), PRIMARY KEY(sid,Location),
FOREIGN KEY (sid,Location) REFERENCES Defense(sid,Location) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (E_id,C_id) REFERENCES Employee(Staff_id,Company_id));
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













--Total_grade in Defense
go

CREATE PROC DefenseGrade
@sid INT, @Location VARCHAR(5)
AS
DECLARE @gradeT DECIMAL(3,2), @gradeEE DECIMAL(3,2), @gradeL DECIMAL(3,2), @gradeC DECIMAL(3,2), @gradeE DECIMAL(3,2)

SELECT @gradeEE = G.EE_grade
FROM GradeAcademicDefense G
WHERE @sid = G.sid AND @Location = G.Location

SELECT @gradeL = G1.Lecturer_grade
FROM GradeAcademicDefense G1
WHERE @sid = G1.sid AND @Location = G1.Location

SELECT @gradeC = G2.Company_grade
FROM GradeIndustrialDefense G2
WHERE @sid = G2.sid AND @Location = G2.Location

SELECT @gradeE = G3.Employee_grade
FROM GradeIndustrialDefense G3
WHERE @sid = G3.sid AND @Location = G3.Location

IF @gradeEE IS NULL AND @gradeL IS NULL AND @gradeC IS NOT NULL AND @gradeE IS NOT NULL
UPDATE Defense
SET Total_grade = (@gradeC + @gradeE)/2
WHERE @sid = sid AND @Location = Location

IF @gradeEE IS NOT NULL AND @gradeL IS NOT NULL AND @gradeC IS NULL AND @gradeE IS NULL
UPDATE Defense
SET Total_grade = (@gradeEE + @gradeL)/2
WHERE @sid = sid AND @Location = Location

--Student TotalBachelorGrade
go
CREATE PROC StudentGrade
@sid INT
AS
DECLARE @gradeT DECIMAL(3,2), @gradeD DECIMAL(3,2), @gradeC DECIMAL(3,2)

SELECT @gradeT = T.Total_grade
FROM Thesis T
WHERE @sid = T.sid

SELECT @gradeD = D.Total_grade
FROM Defense D
WHERE @sid = D.sid

SELECT @gradeC = P.ComulativeProgressReportGrade
FROM ProgressReport P
WHERE @sid = P.ComulativeProgressReportGrade
IF(@gradeT IS NOT NULL AND @gradeC IS NOT NULL AND @gradeT IS NOT NULL)
UPDATE Student
SET TotalBachelorGrade = (0.3 * @gradeT) + (0.3 * @gradeD) + (0.4 * @gradeC)
WHERE @sid = sid




--Total_Grade in Thesis
go

CREATE PROC ThesisGrade
@sid INT, @title VARCHAR(50)
as
DECLARE @gradeEE DECIMAL(3,2), @gradeL DECIMAL(3,2), @gradeC DECIMAL(3,2), @gradeE DECIMAL(3,2)

SELECT @gradeEE = G.EE_grade
FROM GradeAcademicThesis G
WHERE @sid = G.sid AND @title = G.Title

SELECT @gradeL = G1.Lecturer_grade
FROM GradeAcademicThesis G1
WHERE @sid = G1.sid AND @title = G1.Title

SELECT @gradeC = G2.Company_grade
FROM GradeIndustrialThesis G2
WHERE @sid = G2.sid AND @title = G2.Title

SELECT @gradeE = G3.Employee_grade
FROM GradeIndustrialThesis G3
WHERE @sid = G3.sid AND @title = G3.Title

IF @gradeEE IS NULL AND @gradeL IS NULL AND @gradeC IS NOT NULL AND @gradeE IS NOT NULL
UPDATE Thesis
SET Total_grade = (@gradeC + @gradeE)/2
WHERE @sid = sid AND @title = Title

IF @gradeEE IS NOT NULL AND @gradeL IS NOT NULL AND @gradeC IS NULL AND @gradeE IS NULL
UPDATE Thesis
SET Total_grade = (@gradeEE + @gradeL)/2
WHERE @sid = sid AND @title = Title


GO
------------------------------------------------------------------Ehab
-- password- generator
CREATE PROCEDURE GENERATEPWD(@OUTMESSAGE VARCHAR(10) OUTPUT)  
AS   
BEGIN  
SET NOCOUNT ON  
declare @LENGTH INT,@CharPool varchar(26),@PoolLength varchar(26),@LoopCount  INT  
DECLARE @RandomString VARCHAR(10),@CHARPOOLINT VARCHAR(9)  
  
    
SET @CharPool = 'A!B@C!D#E@FG#H$IJ$K%LM%N*PQR%ST&U*V(W)X_YZ'  
DECLARE @TMPSTR VARCHAR(3)  

SET @PoolLength = DataLength(@CharPool)  
SET @LoopCount = 0  
SET @RandomString = ''  
  
    WHILE (@LoopCount <10)  
    BEGIN  
        SET @TMPSTR =   SUBSTRING(@Charpool, CONVERT(int, RAND() * @PoolLength), 1)           
        SELECT @RandomString  = @RandomString + CONVERT(VARCHAR(5), CONVERT(INT, RAND() * 10))  
        IF(DATALENGTH(@TMPSTR) > 0)  
        BEGIN   
            SELECT @RandomString = @RandomString + @TMPSTR    
            SELECT @LoopCount = @LoopCount + 1  
        END  
    END  
    SET @LOOPCOUNT = 0    
    SET @OUTMESSAGE=@RandomString  
END 
--1
go
CREATE PROC UserRegister --date modified  9/12/2021 12:30 pm

@usertype varchar(20), @userName varchar(20), @email varchar(50), @first_name varchar(20),
@last_name varchar(20), @birth_date datetime, @GPA decimal(3,2), @semester int, @address varchar(100)
,@faculty_code varchar(10), @major_code varchar(10), @company_name varchar(20),
@representative_name varchar(20), @representative_email varchar(50), @phone_number varchar(20),
@country_of_residence varchar(20),

@user_id int OUTPUT ,
@password varchar(25) OUTPUT
as
IF (NOT EXISTS ( SELECT * FROM Users u WHERE  u.Email = @email))

BEGIN

   --SELECT a AS val FROM @result1

EXECUTE GENERATEPWD @password OUTPUT --stored proc 
SELECT @password 

insert into Users(Username,Email,phone_number,Password)values(@userName,@email,@phone_number,@password)


select @user_id=user_id
from Users
where @email=Users.Email

SELECT @user_id 


if @usertype='Student'
insert into Student
(sid,
first_name,
last_name,
Major_code,
Date_Of_Birth,
Address,
GPA ,
Semester)--TotalBachelorGrade not inserted not understanding it
values
(@user_id,
@first_name
,@last_name,
@major_code,
@birth_date,
@address,
@GPA,
@semester)

if @usertype='Company'--@country_of_residence=Location not sure from it  
begin
insert into Company(Company_id,Location,Name, Representative_name,Representative_Email)
values(@user_id,@country_of_residence ,@company_name,@representative_name,@representative_email)
end
if @usertype='Lecturer'
begin
--no input for the Schedule
insert into Lecturer(Lecturer_id)values(@user_id)

end

if @usertype='Teaching_Assistant'
begin
--no input for the Schedule
insert into Teaching_Assistant(TA_id)values(@user_id)
end

if @usertype='External_Examiner'
begin
--no input for the Schedule
insert into External_Examiner(EE_id)values(@user_id)
end

if @usertype='Coordinator'
begin
insert into Coordinator(coordinator_id)values(@user_id)
end
END 
--if @usertype='external_supervisor'
--external supervisor does not exist in schema ask leqaa




------------------------------------------------------------------Ehab end

--2-A
go 

CREATE PROC UserLogin
@email VARCHAR(50), @password VARCHAR(10),
 @success BIT OUTPUT, @user_id int OUTPUT

as
SET @success = 0;
SET @user_id= 0;

SET @user_id = (SELECT Users.user_id
FROM Users
WHERE @email = Email AND @password = Password);
IF(@user_id <> 0)
SET @success = 1

SELECT @success
SELECT @user_id

go
--2-B
CREATE PROC ViewProfile
@user_id int 
AS 
SELECT * FROM Users u where u.user_id = @user_id;
go
--2-C

CREATE procedure ViewBachelorProjects
     (@ProjectType varchar(20), @User_id int)
    
    as 
     if(@ProjectType is NUll and @User_id is null)
     select * from Bachelor_Project bp
     left join Student s on s.Assigned_Project_code = bp.Code
    
    else if (@ProjectType is not NULL and @User_id is null )
   BEGIN
   if(@ProjectType = 'Industrial')
   select * from  Industrial ind left join Student s on ind.Industrial_code =    s.Assigned_Project_code 
 else if (@ProjectType = 'Academic') 
   select * from  Academic acd left join Student s on acd.Academic_code =    s.Assigned_Project_code 
    END
  
  else if (@ProjectType is  NULL and @User_id is not null)
    select * from Bachelor_Project bp inner join Student s on bp.Code =    s.Assigned_Project_code 
    
     if(@ProjectType is not NUll and @User_id is not null)
   BEGIN
   if(@ProjectType = 'Industrial')
   select * from  Industrial ind left join Student s on ind.Industrial_code =    s.Assigned_Project_code where s.sid = @User_id
 else if (@ProjectType = 'Academic') 
   select * from  Academic acd left join Student s on acd.Academic_code =    s.Assigned_Project_code where s.sid = @User_id
    END

  

    --5-a
go

CREATE PROC LecturerCreateLocalProject
@Lecturer_id int, @proj_code varchar(10), @title varchar(50), @description varchar(200),
@major_code varchar(10)

as
IF @proj_code NOT IN(
SELECT B.Code
FROM Bachelor_Project B
)
INSERT INTO Bachelor_Project(Code, Name, Description)VALUES(@proj_code, @title, @description)
INSERT INTO Academic(Academic_code,L_id)VALUES(@proj_code,@Lecturer_id)
INSERT INTO MajorHasBachelorProject(Major_code,Project_code)VALUES(@major_code, @proj_code)

GO
-- 3-A
CREATE PROC MakePreferencesLocalProject 
@sid int, @bachelor_code varchar(10), @preference_number int
AS 
IF(EXISTS(SELECT * FROM MajorHasBachelorProject  m INNER JOIN Student s ON m.Major_Code = s.Major_code AND @bachelor_code = m.Project_code))
BEGIN
IF(EXISTS(SELECT * FROM StudentPreferences s WHERE s.sid = @sid AND s.PCode = @bachelor_code))
UPDATE StudentPreferences SET PreferenceNumber = @preference_number WHERE sid = @sid AND PCode = @bachelor_code
ELSE 
BEGIN
IF(EXISTS(SELECT * FROM StudentPreferences s WHERE s.sid = @sid AND s.PreferenceNumber= @preference_number))
DELETE FROM StudentPreferences  WHERE StudentPreferences.sid = @sid AND  StudentPreferences.PreferenceNumber = @preference_number;
ELSE 
INSERT INTO StudentPreferences VALUES (@sid,@bachelor_code,@preference_number)
END
END
ELSE 
RETURN 'Error';
go


CREATE PROC ViewMyThesis
@sid int, @title varchar(50)
AS
EXECUTE ThesisGrade @sid,@title
SELECT * FROM Thesis t WHERE t.sid = @sid AND t.Title = @title;
go


--3-c
-- who creates the thesis? not sure
CREATE PROC SubmitMyThesis 
@sid int, @title varchar(50), @PDF_Document varchar(1000)
AS

UPDATE Thesis 
SET  Thesis.PDF_doc = @PDF_Document
WHERE Thesis.sid = @sid AND Thesis.Title = @title; 
go
-- 3-d

CREATE PROC ViewMyProgressReports
@sid int, @date datetime
AS 
IF (@date IS NULL) 
SELECT * FROM ProgressReport p WHERE p.sid = @sid ORDER BY p.Date ASC
ELSE 
SELECT * FROM ProgressReport p WHERE p.sid = @sid AND p.Date = @date;
go

--3-e // grade?
CREATE PROC ViewMyDefense
@sid int
AS
DECLARE @Location varchar(5)
SELECT @location = d.Location FROM Defense d WHERE d.sid = @sid;
EXECUTE DefenseGrade @sid, @Location
SELECT * FROM Defense d WHERE d.sid = @sid ;
go
-- 3-f
CREATE PROC UpdateMyDefense
@sid int, @defense_content varchar(1000)
AS 
UPDATE Defense
SET Defense.Content = @defense_content
WHERE Defense.sid = @sid;
go
--3-g grade?
CREATE PROC ViewMyBachelorProjectGrade 
@sid int,@BachelorGrade decimal(4,2) OUTPUT
AS 
EXECUTE StudentGrade @sid
SELECT @BachelorGrade = s.TotalBachelorGrade FROM Student s WHERE s.sid = @sid 
SELECT @BachelorGrade
go
--3-h
CREATE PROC ViewNotBookedMeetings
@sid int 
AS 
IF(EXISTS(SELECT * FROM Academic a INNER JOIN Student s ON s.Assigned_Project_code = a.Academic_code WHERE s.sid = @sid))
SELECT DISTINCT m.* FROM Academic a INNER JOIN Student s  ON s.Assigned_Project_code = a.Academic_code  INNER JOIN Meeting m ON a.L_id = m.L_id LEFT OUTER JOIN MeetingAttendents ma ON ma.Meeting_ID = m.Meeting_ID  WHERE ma.Meeting_ID IS NULL ORDER BY m.STime ASC
ELSE 
SELECT DISTINCT m.* FROM Industrial i INNER JOIN Student s ON s.Assigned_Project_code = i.Industrial_code INNER JOIN Meeting m ON i.L_id = m.L_id LEFT OUTER JOIN MeetingAttendents ma ON ma.Meeting_ID = m.Meeting_ID WHERE ma.Meeting_ID IS NULL ORDER BY m.STime ASC;

go
--3-i
CREATE PROC BookMeeting -- IDK someone check leqaa
@sid int, @meeting_id int
AS 
INSERT INTO  MeetingAttendents  VALUES (@meeting_id, @sid);
go
--3-j

CREATE PROC ViewMeeting
@meeting_id int, @sid int
AS 
IF(@meeting_id IS NULL)
BEGIN
SELECT * FROM Meeting INNER JOIN MeetingAttendents 
ON Meeting.Meeting_ID = MeetingAttendents.Meeting_ID
WHERE MeetingAttendents.Attendant_id = @sid 

SELECT ToDolist,Meeting.Meeting_ID FROM Meeting INNER JOIN MeetingAttendents
ON Meeting.Meeting_ID = MeetingAttendents.Meeting_ID 
INNER JOIN  MeetingToDoList
ON Meeting.Meeting_ID = MeetingToDoList.Meeting_ID 
WHERE MeetingAttendents.Attendant_id = @sid
END 
ELSE 
BEGIN
SELECT * FROM Meeting INNER JOIN MeetingAttendents 
ON Meeting.Meeting_ID = MeetingAttendents.Meeting_ID
WHERE MeetingAttendents.Attendant_id = @sid AND MeetingAttendents.Meeting_ID = @meeting_id

SELECT ToDolist,Meeting.Meeting_ID FROM Meeting INNER JOIN MeetingAttendents
ON Meeting.Meeting_ID = MeetingAttendents.Meeting_ID 
INNER JOIN  MeetingToDoList
ON Meeting.Meeting_ID = MeetingToDoList.Meeting_ID 
WHERE MeetingAttendents.Attendant_id = @sid AND MeetingAttendents.Meeting_ID = @meeting_id

END
go

---3-k
CREATE PROC StudentAddToDo
@meeting_id int, @to_do_list varchar(200)
AS 
INSERT INTO MeetingToDoList 
VALUES (@meeting_id, @to_do_list)

go
------------------------------------------------------------------Ehab
--4a) MODIFIED 8/12/2021 7:16 PM
--insertion in users before any subtable 
CREATE PROC AddEmployee
@ComapnyID int, 
@email varchar(50), 
@name varchar(20), 
@phone_number varchar(20),
@field varchar(25),


 @StaffID int OUTPUT, 
 @ComapnyID_OUT int  OUTPUT,
 @password varchar(10) OUTPUT

 AS

DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE @ComapnyID=Company.Company_id
SET @ComapnyID_OUT=@ComapnyID;

DECLARE @Y INT;
SET @Y = 0;
SELECT @Y=COUNT(Email) 
FROM Employee
WHERE @email=Employee.Email

IF @X>0 AND  @Y=0--not registerd employee and registered company
BEGIN
EXECUTE GENERATEPWD @password OUTPUT --stored proc 
SELECT @password 


-- ASKED LEQAA ABOUT IT -----------------------------------------------------
INSERT INTO Users(Username,Password,Email,phone_number)
VALUES(@name,@password,@email,@phone_number)

SELECT @StaffID=user_id
FROM Users U
WHERE U.Email=@email


--Staff_id,Company_id AUTO GENRATED BEC THEY ARE PRIMARY KEYS 
INSERT INTO Employee(Staff_id,Company_id,Username,Password,Email,Field,Phone)
VALUES(@StaffID,@ComapnyID ,@name ,@password,@email,@field ,@phone_number)

SELECT @StaffID
SELECT @ComapnyID_OUT

END
GO

--4B)
CREATE PROC CompanyCreateLocalProject--modifed 9/12/2022  1:35
@company_id int, 
@proj_code varchar(10), 
@title varchar(50), 
@description varchar(200),
@major_code varchar(10)
AS

DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE @company_id=Company.Company_id

IF @X>0--why major code not inserted ? nead to know where to insert it
begin
INSERT INTO Bachelor_Project(Code,Name,Description)
VALUES(@proj_code,@title,@description)

INSERT INTO Industrial(Industrial_code,C_id)VALUES
(@proj_code,@company_id)

INSERT INTO MajorHasBachelorProject
(Major_code,Project_code)VALUES(@major_code,@proj_code)


end
GO

--4C)
CREATE PROC AssignEmployee
@bachelor_code varchar(10), 
@staff_id int, 
@Company_id int,
@staff_id_OUT  int OUTPUT
--all details of the bachelor project 
--that the employee is assigned to.
AS


DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE @Company_id=Company.Company_id

DECLARE @Y INT;
SET @Y = 0;
SELECT @Y=COUNT(Code) 
FROM Bachelor_Project
WHERE @bachelor_code=Bachelor_Project.Code

IF @X>0 AND @Y>0
SET IDENTITY_INSERT Industrial ON;
INSERT INTO Industrial(Industrial_code,E_id)VALUES
(Code,@staff_id)
SET IDENTITY_INSERT Industrial OFF;

SET @staff_id_OUT =@staff_id;
SELECT * 
FROM Bachelor_Project
WHERE @bachelor_code=Bachelor_Project.Code

GO

--4D)
CREATE PROC CompanyGradeThesis
@Company_id int, 
@sid int, 
@thesis_title varchar(50), 
@Company_grade Decimal(4,2)

AS
--CHECKING IF THE COMPANY IS ALREADY REGISTERED OR NOT
DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE @Company_id=Company.Company_id
IF @X>0
SET IDENTITY_INSERT Employee ON;
INSERT INTO Thesis(sid,Title,Total_grade)VALUES
(@sid,@thesis_title,@Company_grade)
SET IDENTITY_INSERT Employee OFF;


GO
--4E)

CREATE PROC CompanyGradedefense
@Company_id int, 
@sid int, 
@defense_location varchar(5), 
@Company_grade Decimal(4,2)

 AS
 --CHECKING IF THE COMPANY IS ALREADY REGISTERED OR NOT
DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE @Company_id=Company.Company_id
IF @X>0
SET IDENTITY_INSERT Employee ON;
INSERT INTO  Defense (sid,Location,Total_Grade)
VALUES(@sid,@defense_location,@Company_grade)
SET IDENTITY_INSERT Employee OFF;

GO
--4F)
CREATE PROC CompanyGradePR
@Company_id int, 
@sid int, 
@date datetime, 
@Company_grade decimal(4,2)
AS
 --CHECKING IF THE COMPANY IS ALREADY REGISTERED OR NOT
DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE @Company_id=Company.Company_id
IF @X>0
SET IDENTITY_INSERT Employee ON;
INSERT INTO ProgressReport(sid,Date,Grade)VALUES (@sid,@date,@Company_grade)
SET IDENTITY_INSERT Employee OFF;
--WHICH ONE WOUID BE INSERTED GRADE OR ComulativeProgressReportGrade 
GO
------------------------------------------------------------------Ehab end

--not copied

--8
GO
/*
CREATE PROCEDURE ViewUsers
@User_type varchar(20), @User_id int
as
if (@User_type is null or  @User_id is null )
print 'invalid parameters'
else    
select * from @User_type  u where  u.User_id 
*/
--- 8 - b 
GO
--create procedure AssignAllStudentsToLocalProject

--select * 
--from Student inner join "to be continued ,ely msh 3agbo ye3ayat"




--- 8 - c 
GO
create procedure AssignTAs
@coordinator_id int, @TA_id int, @proj_code varchar(10)
AS
update Academic 
set TA_id = @TA_id 
where Academic_code = @proj_code

--- 8 - d 

GO
create procedure ViewRecommendation
@lecture_id int
AS
select * from LecturerRecommendEE 
where L_id = @lecture_id

---8- e 
GO
create procedure AssignEE
@coordinator_id int, @EE_id int, @proj_code varchar(10)
AS
update Academic
set EE_id = @EE_id
where  Academic_code = @proj_code

--- 8 - f
GO
create procedure ScheduleDefense
@sid int, @date datetime, @time time, @location varchar(5)
AS
insert into Defense (sid , Location , Time , Date) values 
(@sid , @location ,@time , @date )

GO
------------------------------------------------------------------Ehab

--9A)--update and insert (MODIFIED)
CREATE PROC EmployeeGradeThesis
@Employee_id int, 
@sid int, 
@thesis_title varchar(50), 
@Employee_grade Decimal(4,2)
AS--CHECKING IF EMPLOYEE REGISTERED OR NOT 
DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(@Employee_id) 
FROM Employee
WHERE @Employee_id=Employee.Staff_id



IF @X>0
IF EXISTS (SELECT sid FROM Thesis WHERE sid=@sid) AND EXISTS(SELECT Title FROM Thesis WHERE Title=@thesis_title)
UPDATE  Thesis 
SET Total_grade=@Employee_grade
WHERE Thesis.sid=@sid AND Title=@thesis_title

ELSE
INSERT INTO Thesis(sid,Title,Total_grade) VALUES(@sid,@thesis_title,@Employee_grade)

GO
--9B)--update and insert
CREATE PROC EmployeeGradedefense
@Employee_id int, 
@sid int, 
@defense_location varchar(5), 
@Employee_grade Decimal(4,2)

AS
DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(@Employee_id) 
FROM Employee
WHERE @Employee_id=Employee.Staff_id
IF @X>0
IF EXISTS (SELECT sid FROM Defense WHERE sid=@sid) AND EXISTS(SELECT Location FROM Defense WHERE Location=@defense_location)
UPDATE  Defense 
SET Total_grade=@Employee_grade
WHERE Defense.sid=@sid AND Defense.Location=@defense_location
ELSE
INSERT INTO Defense(sid,Location,Total_Grade)VALUES
(@sid,@defense_location,@Employee_grade)


GO
--9C)--DO NOT NEAD MODIFY
CREATE PROC EmployeeCreatePR
@Employee_id int, 
@sid int, 
@date datetime, 
@content varchar(1000)

AS
DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(@Employee_id) 
FROM Employee
WHERE @Employee_id=Employee.Staff_id
IF @X>0
SET IDENTITY_INSERT Employee ON;
INSERT INTO ProgressReport(sid,Date,Content)VALUES
(@sid,@date,@content)
SET IDENTITY_INSERT Employee OFF;
GO


GO
--6A)-- PROGRESS REPORT UPDATED ONLY LEQAA SAID 
CREATE PROC TACreatePR
@TA_id int, 
@sid int, 
@date datetime, 
@content varchar(1000)
AS

DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(TA_id) 
FROM Teaching_Assistant
WHERE @TA_id=Teaching_Assistant.TA_id
IF @X=1
INSERT INTO ProgressReport(sid,Date,Content)
VALUES (@sid,@date,@content)

GO
--6B)
CREATE PROC TAAddToDo
--@TA_id int,EXTRA INPUT WE WANT TO ASK LEQAA ABOUT IT 
@meeting_id int, 
@to_do_list varchar(200)

AS

UPDATE MeetingToDoList
SET ToDoList = ToDoList + @to_do_list
WHERE MeetingToDoList.Meeting_ID=@meeting_id; 

GO

--7A)--if there is no record insert else update (modified)
CREATE PROC EEGradeThesis--CHECKING EXISTANCE WITH SID AND TITLE-
 @EE_id int, 
 @sid int, 
 @thesis_title varchar(50), 
 @EE_grade Decimal(4,2)
 AS

DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(EE_id) 
FROM External_Examiner
WHERE @EE_id=External_Examiner.EE_id
IF @X=1
IF EXISTS (SELECT sid FROM Thesis WHERE sid=@sid) AND EXISTS(SELECT Title FROM Thesis WHERE Title=@thesis_title)
UPDATE  Thesis 
SET Total_grade=@EE_grade
WHERE Thesis.sid=@sid AND Title=@thesis_title
ELSE 
SET IDENTITY_INSERT Employee ON;
INSERT INTO Thesis (sid,Title,Total_grade)
VALUES(@sid,@thesis_title,@EE_grade)
SET IDENTITY_INSERT Employee OFF;

GO
--7B)--if there is no record insert else update (MODIFIED)

CREATE PROC EEGradedefense
@EE_id int, 
@sid int, 
@defense_location varchar(5), 
@EE_grade Decimal(4,2)
 AS
DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(EE_id) 
FROM External_Examiner
WHERE @EE_id=External_Examiner.EE_id
IF @X=1
IF EXISTS (SELECT sid FROM Defense WHERE sid=@sid) AND EXISTS(SELECT Location FROM Defense WHERE Location=@defense_location)
UPDATE  Defense 
SET Total_grade=@EE_grade
WHERE Defense.sid=@sid AND Defense.Location=@defense_location
ELSE
SET IDENTITY_INSERT Employee ON;
INSERT INTO Defense (sid,Location,Total_Grade)
VALUES(@sid,@defense_location,@EE_grade)
SET IDENTITY_INSERT Employee OFF;

GO
------------------------------------------------------------------Ehab end




EXEC AssignAllStudentsToLocalProject