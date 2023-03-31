GO
-- password- generator
CREATE PROCEDURE GENERATEPWD(@OUTMESSAGE VARCHAR(10) OUTPUT)  
AS   
BEGIN  
SET NOCOUNT ON  
declare @LENGTH INT,@CharPool varchar(26),@PoolLength varchar(26),@LoopCount  INT  
DECLARE @RandomString VARCHAR(10),@CHARPOOLINT VARCHAR(9)  
  
    
SET @CharPool = 'A!B@C!D#E@FG#H$IJ$K%LM%NPQR%ST&UV(W)X_YZ'  
DECLARE @TMPSTR VARCHAR(3)  

SET @PoolLength = DataLength(@CharPool)  
SET @LoopCount = 0  
SET @RandomString = ''  
  
    WHILE (@LoopCount <10)  
    BEGIN  
        SET @TMPSTR =   SUBSTRING(@Charpool, CONVERT(int, RAND() * @PoolLength), 1)           
        SELECT @RandomString  = @RandomString + CONVERT(VARCHAR(5), CONVERT(INT, RAND() * 10))  
        IF(DATALENGTH(@TMPSTR) > 0)  
        BEGIN   
            SELECT @RandomString = @RandomString + @TMPSTR    
            SELECT @LoopCount = @LoopCount + 1  
        END  
    END  
    SET @LOOPCOUNT = 0    
    SET @OUTMESSAGE=@RandomString  
END 

GO



--Student TotalBachelorGrade

GO


CREATE PROC PRCGrade
@sid INT, @date DATETIME
AS
DECLARE @grade DECIMAL(3,2), @grade1 DECIMAL(3,2)

SELECT @grade = P.ComulativeProgressReportGrade
FROM ProgressReport P
WHERE @sid = P.sid AND @date = P.Date

SET @grade1 = AVG(@grade)

UPDATE ProgressReport
SET ComulativeProgressReportGrade = @grade1
WHERE @sid = sid AND @date = Date
go

go

CREATE PROC PRGrade
@sid int, @date DATETIME
AS
DECLARE @LecturerGrade DECIMAL(3,2), @CompanyGrade DECIMAL(3,2)
SELECT @LecturerGrade = G.Lecturer_grade
FROM ProgressReport P INNER JOIN GradeAcademicPR G ON P.sid = G.sid AND P.Date = G.Date
WHERE @sid = P.sid AND @date = P.Date

SELECT @CompanyGrade = G1.Company_grade
FROM ProgressReport P1 INNER JOIN  GradeIndustrialPR G1 ON P1.sid = G1.sid AND P1.Date = G1.Date
WHERE @sid = P1.sid AND @date = P1.Date

if @LecturerGrade IS NULL AND @CompanyGrade IS NOT NULL
UPDATE ProgressReport 
SET Grade = @CompanyGrade
WHERE @sid = sid AND @date = Date

if @LecturerGrade IS NOT NULL AND @CompanyGrade IS NULL
UPDATE ProgressReport 
SET Grade = @LecturerGrade
WHERE @sid = sid AND @date = Date





--Total_Grade in Thesis
go

CREATE PROC ThesisGrade
@sid INT, @title VARCHAR(50)
as
DECLARE @gradeT DECIMAL(3,2), @gradeEE DECIMAL(3,2), @gradeL DECIMAL(3,2), @gradeC DECIMAL(3,2), @gradeE DECIMAL(3,2)

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


GO







GO
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
 GO














--1



go
CREATE PROC UserRegister --date modified  9/12/2021 12:30 pm

@usertype varchar(20), 
@userName varchar(20), 
@email varchar(50), 
@first_name varchar(20),
@last_name varchar(20), 
@birth_date datetime, 
@GPA decimal(3,2), 
@semester int, 
@address varchar(100)
,@faculty_code varchar(10), 
@major_code varchar(10),
@company_name varchar(20),
@representative_name varchar(20),
@representative_email varchar(50), 
@phone_number varchar(20),
@country_of_residence varchar(20),


@user_id int OUTPUT ,
@password varchar(25) OUTPUT
as

set @user_id =0
set @password =null
IF (NOT EXISTS ( SELECT * FROM Users u WHERE  u.Email = @email))

BEGIN

   --SELECT a AS val FROM @result1

EXECUTE GENERATEPWD @password OUTPUT --stored proc 
SELECT @password 

insert into Users(Username,Email,phone_number,Password,Role)values(@userName,@email,@phone_number,@password,@usertype)


select @user_id=user_id
from Users
where @email=Users.Email

SELECT @user_id 


if @usertype='Student'
insert into Student
(sid,first_name,last_name,Major_code,Date_Of_Birth,Address,GPA ,Semester)
values
(@user_id,
@first_name
,@last_name,
@major_code,
@birth_date,
@address,
@GPA,
@semester)

if @usertype='Company' 
begin
insert into Company(Company_id,Location,Name, Representative_name,Representative_Email)
values(@user_id,@country_of_residence ,@company_name,@representative_name,@representative_email)
end
if @usertype='Lecturer'
begin

insert into Lecturer(Lecturer_id)values(@user_id)

end

if @usertype='Teaching_Assistant'
begin

insert into Teaching_Assistant(TA_id)values(@user_id)
end

if @usertype='External_Examiner'
begin

insert into External_Examiner(EE_id)values(@user_id)
end

if @usertype='Coordinator'
begin
insert into Coordinator(coordinator_id)values(@user_id)
end
END 
--if @usertype='external_supervisor'
--external supervisor does not exist in schema ask leqaa



--2-a



go 

CREATE PROC UserLogin
@email VARCHAR(50),
@password VARCHAR(10),
@success BIT OUTPUT, 
@user_id int OUTPUT

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

    

    go




--3-a
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

--3-b
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

--3-e 
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















--4a) 

CREATE PROC AddEmployee
@ComapnyID int, 
@email varchar(50), 
@name varchar(20), 
@phone_number varchar(20),
@field varchar(25),

 @StaffID int OUTPUT, 
 @ComapnyID_OUT int  OUTPUT,--for leqaa 2 varibles with same name so i changed output to be a differrent name
 @password varchar(10) OUTPUT

 AS
 set @StaffID=-1
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

IF @X>0 AND  @Y=0
BEGIN
EXECUTE GENERATEPWD @password OUTPUT --stored proc 
SELECT @password 


INSERT INTO Users(Username,Password,Email,phone_number)
VALUES(@name,@password,@email,@phone_number)

SELECT @StaffID=user_id
FROM Users U
WHERE U.Email=@email


INSERT INTO Employee(Staff_id,Company_id,Username,Password,Email,Field,Phone)
VALUES(@StaffID,@ComapnyID ,@name ,@password,@email,@field ,@phone_number)

SELECT @StaffID
SELECT @ComapnyID_OUT

END
ELSE 
PRINT 'unregistered company or already registered employee'
GO

--4B)
CREATE PROC CompanyCreateLocalProject
@ComapnyID int, 
@proj_code varchar(10), 
@title varchar(50), 
@description varchar(200),
@major_code varchar(10)
AS

DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE @ComapnyID=Company.Company_id

IF @X>0 AND EXISTS (SELECT Major_Code FROM Major WHERE Major_Code=@major_code)
AND not EXISTS (SELECT Code FROM Bachelor_Project WHERE Code=@proj_code)
begin
INSERT INTO Bachelor_Project(Code,Name,Description)
VALUES(@proj_code,@title,@description)

INSERT INTO Industrial(Industrial_code,C_id)VALUES
(@proj_code,@ComapnyID)

INSERT INTO MajorHasBachelorProject
(Major_code,Project_code)VALUES(@major_code,@proj_code)


end
ELSE
PRINT 'INVALID MAJOR CODE or already existed project'
GO

--4-c

CREATE PROC AssignEmployee
@bachelor_code varchar(10), 
@staff_id int, 
@Company_id int,

@staff_id_OUT INT OUTPUT--for leqaa 2 varibles with same name so i changed output to be a differrant name

AS
set @staff_id_OUT=-1
DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE Company.Company_id=@Company_id

DECLARE @Y INT;
SET @Y = 0;
SELECT @Y=COUNT(Code) 
FROM Bachelor_Project
WHERE Bachelor_Project.Code=@bachelor_code

IF @X>0 AND @Y>0 and EXISTS(SELECT Staff_id FROM Employee WHERE Staff_id=@staff_id)
and not EXISTS(SELECT Industrial_code FROM Industrial WHERE Industrial_code=@bachelor_code)
BEGIN
INSERT INTO Industrial(Industrial_code,E_id)VALUES
(@bachelor_code,@staff_id)

SET @staff_id_OUT =@staff_id;
SELECT * 
FROM Bachelor_Project
WHERE @bachelor_code=Bachelor_Project.Code
END
ELSE
PRINT 'UNREGISTERED EMPLOYEE OR UNREGISTERED COMPANY OR UNREGISTERED PROGECT'
GO



--4-d

CREATE PROC CompanyGradeThesis
@Company_id int, 
@sid int, 
@thesis_title varchar(50), 
@Company_grade Decimal(4,2)

AS

DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE @Company_id=Company.Company_id
IF @X>0 and
EXISTS(SELECT sid FROM Thesis WHERE sid=@sid )and
EXISTS(SELECT Title FROM Thesis WHERE Title=@thesis_title )and
(
not EXISTS(SELECT sid FROM GradeIndustrialThesis WHERE sid=@sid ) or
not EXISTS(SELECT Title FROM GradeIndustrialThesis WHERE Title=@thesis_title )
)

begin
INSERT INTO GradeIndustrialThesis
(sid,Title,C_id,Company_grade)VALUES
(@sid,@thesis_title,@Company_id,@Company_grade)

end
else
print 'unregistered thesis or unregistered company or already registered GradeIndustrialThesis  or unregistered student'
GO



--4-e

CREATE PROC CompanyGradedefense
@Company_id int, 
@sid int, 
@defense_location varchar(5), 
@Company_grade Decimal(4,2)

 AS

DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE @Company_id=Company.Company_id
IF @X>0and
EXISTS(SELECT sid FROM Defense WHERE sid=@sid )and
EXISTS(SELECT Location FROM Defense WHERE Location=@defense_location )and
(
not EXISTS(SELECT sid FROM GradeIndustrialDefense WHERE sid=@sid ) or
not EXISTS(SELECT Location FROM GradeIndustrialDefense WHERE Location=@defense_location )
)
INSERT INTO  GradeIndustrialDefense
(sid,Location,C_id,Company_grade)
VALUES(@sid,@defense_location,@Company_id,@Company_grade)
else
print'unregistered Defense or unregistered company or already registered GradeIndustrialDefense or unregistered student'
GO




--4-f



CREATE PROC CompanyGradePR
@Company_id int, 
@sid int, 
@date datetime, 
@Company_grade decimal(4,2)
AS

DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(Company_id) 
FROM Company
WHERE @Company_id=Company.Company_id
IF @X>0 and
EXISTS(SELECT sid FROM ProgressReport WHERE sid=@sid )and
EXISTS(SELECT Date FROM ProgressReport WHERE Date=@date )and
(
not EXISTS(SELECT sid FROM GradeIndustrialPR WHERE sid=@sid ) or
not EXISTS(SELECT Date FROM GradeIndustrialPR WHERE Date=@date )
)


INSERT INTO GradeIndustrialPR
(C_id ,sid,Date,Company_grade)VALUES 
(@Company_id,@sid,@date,@Company_grade)
else
print 'unregistered ProgressReport or unregistered company or already registered GradeIndustrialPR or unregistered student'
GO


--5-a


GO

CREATE PROC LecturerCreateLocalProject
@Lecturer_id int, @proj_code varchar(10), @title varchar(50), @description varchar(200),
@major_code varchar(10)

as
IF @proj_code NOT IN(
SELECT B.Code
FROM Bachelor_Project B
)
BEGIN
INSERT INTO Bachelor_Project(Code, Name, Description)VALUES(@proj_code, @title, @description)
INSERT INTO Academic(Academic_code,L_id)VALUES(@proj_code,@Lecturer_id)
IF @major_code NOT IN(SELECT M.Major_Code
FROM Major M)
BEGIN
INSERT INTO Major(Major_Code)VALUES(@major_code)
END
INSERT INTO MajorHasBachelorProject(Major_code,Project_code)VALUES(@major_code, @proj_code)
END


--5-b

go 
CREATE PROC SpecifyThesisDeadline
 @deadline DATETIME
 AS
 SELECT * INTO #mytemp FROM Student ORDER BY sid
DECLARE @t int
WHILE (EXISTS(SELECT * FROM #mytemp))
BEGIN
SELECT @t = MIN(sid)
FROM #mytemp 
if (@t IN (SELECT T.sid FROM Thesis T)) 
UPDATE Thesis SET Deadline = @deadline WHERE sid = @t 
ELSE 
BEGIN
 INSERT INTO Thesis (sid,Title,Deadline) VALUES (@t,'THESISID:' + CONVERT(VARCHAR(10),@t),@deadline)
END
 DELETE TOP (1) FROM #mytemp
END 


 --5-c
  

 GO
 CREATE PROC CreateMeeting
 @Lecturer_id int, @start_time time, @end_time time, @date datetime, @meeting_point varchar(5)
 
 as
 IF @Lecturer_id NOT IN(SELECT M.L_id
 FROM Meeting M
 WHERE M.Duration <= 0) 
 BEGIN
 INSERT INTO Meeting(L_id, STime, ETime, Meeting_Point, Date)VALUES(@Lecturer_id, @start_time, @end_time, @meeting_point, @date)
 
 END
 
 --5-d
 go


 CREATE PROC LecturerAddToDo
@meeting_id int, 
@to_do_list varchar(200)

AS
IF  EXISTS(SELECT Meeting_ID FROM MeetingToDoList WHERE Meeting_ID=@meeting_id)
UPDATE MeetingToDoList
SET  MeetingToDoList.ToDoList = @to_do_list
WHERE MeetingToDoList.Meeting_ID=@meeting_id 

ELSE
INSERT INTO MeetingToDoList(Meeting_ID,ToDoList)VALUES
(@meeting_id,@to_do_list)



--5-e


go

CREATE PROC ViewMeetingLecturer
@Lecturer_id int, @meeting_id int
AS
IF @meeting_id IN(SELECT M.Meeting_ID
FROM Meeting M)

SELECT *
FROM Meeting M1
WHERE @Lecturer_id =M1.L_id AND @meeting_id = M1.Meeting_ID

ELSE
SELECT * 
FROM Meeting
WHERE @Lecturer_id = L_id

--5-f

go
CREATE PROC ViewEE
AS
SELECT *
FROM External_Examiner E 
WHERE NOT EXISTS(SELECT A.EE_id FROM Academic A WHERE E.EE_id = A.EE_id)

--5-g
go

CREATE PROC RecommendEE
 @Lecturer_id int, @proj_code varchar(10), @EE_id int
 AS
 IF @EE_id NOT IN (SELECT L.EE_id
 FROM LecturerRecommendEE L)
 INSERT INTO LecturerRecommendEE(L_id, EE_id, PCode)VALUES(@Lecturer_id, @EE_id, @proj_code)


 --5-h
 go

 CREATE PROC SuperviseIndustrial
 @Lecturer_id int, @proj_code varchar(10)
AS
IF @proj_code IN(SELECT I.Industrial_code FROM Industrial I)
UPDATE Industrial
SET L_id = @Lecturer_id
WHERE @proj_code = Industrial_code


--5-i
go

CREATE PROC LecGradeThesis
@Lecturer_id int, @sid int, @thesis_title varchar(50), @Lecturer_grade Decimal(4,2)
AS
IF @sid IN (SELECT G.sid FROM GradeAcademicThesis G) AND @thesis_title IN(SELECT G1.Title FROM GradeAcademicThesis G1)
UPDATE GradeAcademicThesis
SET Lecturer_grade = @Lecturer_grade
WHERE sid = @sid AND L_id = @Lecturer_id AND Title = @thesis_title

ELSE
INSERT INTO GradeAcademicThesis(sid,Title,L_id,Lecturer_grade)VALUES(@sid,@thesis_title,@Lecturer_id,@Lecturer_grade)

--5-j
go
CREATE PROC LecGradedefense
@Lecturer_id int, @sid int, @defense_location varchar(5), @Lecturer_grade Decimal(4,2)
AS
IF @sid IN (SELECT G.sid FROM GradeAcademicDefense G) AND @defense_location IN(SELECT G1.Location FROM GradeAcademicDefense G1)
UPDATE GradeAcademicDefense
SET Lecturer_grade = @Lecturer_grade
WHERE sid = @sid AND L_id = @Lecturer_id AND Location = @defense_location

ELSE
INSERT INTO GradeAcademicDefense(sid,Location,L_id,Lecturer_grade)VALUES(@sid,@defense_location,@Lecturer_id,@Lecturer_grade)


--5-k
go

CREATE PROC LecCreatePR
 @Lecturer_id int, @sid int, @date datetime, @content varchar(1000)
 AS
IF @sid NOT IN (SELECT P.sid
FROM ProgressReport P) AND @date NOT IN(SELECT P1.Date
FROM ProgressReport P1) AND @Lecturer_id NOT IN (SELECT P2.L_id
FROM GradeAcademicPR P2)
BEGIN
INSERT INTO GradeAcademicPR(L_id) VALUES(@Lecturer_id)
INSERT INTO ProgressReport(sid, Date, Content) VALUES(@sid, @date, @content)
END


--5-l

go

CREATE PROC LecGradePR
@Lecturer_id int, @sid int, @date datetime, @lecturer_grade decimal(4,2)
AS

DECLARE @proj_code VARCHAR(10)

SELECT @proj_code = S.Assigned_Project_code
FROM Student S
WHERE @sid = S.sid AND EXISTS(SELECT A.Academic_code
FROM Academic A
WHERE A.L_id = @Lecturer_id)

IF @sid IN(SELECT G.sid FROM GradeAcademicPR G) AND @date IN(SELECT G1.Date FROM GradeAcademicPR G1) AND @proj_code IS NOT NULL
UPDATE GradeAcademicPR
SET Lecturer_grade = @lecturer_grade
WHERE L_id = @Lecturer_id AND @sid = sid AND Date = @date



GO
--6-a 

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
IF @X>0  and EXISTS (SELECT sid FROM Student WHERE sid=@sid)
BEGIN
IF  not EXISTS(SELECT sid FROM ProgressReport WHERE sid=@sid) or  not EXISTS(SELECT Date FROM ProgressReport WHERE Date=@date) 
INSERT INTO ProgressReport(sid,Date,Content)
VALUES (@sid,@date,@content)
ELSE
print 'unregistered teaching assistant or already existed ProgressReport or unregistered Student'
END
GO

--6-b


CREATE PROC TAAddToDo
@meeting_id int, 
@to_do_list varchar(200)

AS
IF not EXISTS(SELECT Meeting_ID FROM MeetingToDoList WHERE Meeting_ID=@meeting_id) or 
not EXISTS(SELECT ToDoList FROM MeetingToDoList WHERE ToDoList=@to_do_list)
INSERT INTO MeetingToDoList(Meeting_ID,ToDoList)VALUES
(@meeting_id,@to_do_list)
ELSE
print 'already existed MeetingToDoList'
GO
go



--7A)
CREATE PROC EEGradeThesis
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
IF @X>0 and EXISTS (SELECT sid FROM Student WHERE sid=@sid) and(
EXISTS (SELECT Title FROM Thesis WHERE Title=@thesis_title)and 
EXISTS (SELECT sid FROM Thesis WHERE sid=@sid))

begin
IF EXISTS (SELECT sid FROM GradeAcademicThesis WHERE sid=@sid) AND EXISTS(SELECT Title FROM GradeAcademicThesis WHERE Title=@thesis_title)
UPDATE  GradeAcademicThesis 
SET GradeAcademicThesis.EE_grade=@EE_grade ,GradeAcademicThesis.EE_id=@EE_id
WHERE GradeAcademicThesis.sid=@sid AND GradeAcademicThesis.Title=@thesis_title
ELSE 
begin 
INSERT INTO GradeAcademicThesis (sid,Title,EE_grade,EE_id)
VALUES(@sid,@thesis_title,@EE_grade, @EE_id)

end
end
else 
print 'unregistered External_Examiner or unregistered Student or unregistered thesis'
GO

--7B)
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
IF @X>0  and EXISTS (SELECT sid FROM Defense WHERE sid=@sid) and (
EXISTS (SELECT Location FROM Defense WHERE Location=@defense_location)and 
EXISTS (SELECT sid FROM Defense WHERE sid=@sid))

begin
IF EXISTS (SELECT sid FROM GradeAcademicDefense WHERE sid=@sid) AND 
EXISTS(SELECT Location FROM GradeAcademicDefense WHERE Location=@defense_location)
UPDATE  GradeAcademicDefense 
SET GradeAcademicDefense.EE_grade=@EE_grade
WHERE GradeAcademicDefense.sid=@sid AND GradeAcademicDefense.Location=@defense_location
ELSE
INSERT INTO GradeAcademicDefense (sid,Location,EE_grade,EE_id)
VALUES(@sid,@defense_location,@EE_grade,@EE_id)
end
else 
print 'unregistered External_Examiner or unregistered Student or unregistered Defense'
GO


--8-a
GO 
create Procedure ViewUsers
@User_type varchar(20), @User_id int
AS
if (@User_type is null and @User_id is null )
select * from Users 
ORDER BY Role ASC,user_id ASC

else if (@User_type is NOT null and @User_id is null)
begin
if @usertype='Student'
select * from Student ORDER BY sid ASC

if @usertype='Company'
select * from Company ORDER BY Company_id ASC

if @usertype='Lecturer'
select * from Lecturer ORDER BY Lecturer_id ASC

if @usertype='Teaching_Assistant'
select * from Teaching_Assistant ORDER BY TA_id ASC

if @usertype='External_Examiner'
select * from External_Examiner ORDER BY EE_id ASC

if @usertype='Coordinator'
select * from Coordinator ORDER BY coordinator_id ASC

end

else 
begin
if @usertype='Student'
select * from Student 
where sid=@User_id 

if @usertype='Company'
select * from Company 
where Company_id=@User_id 

if @usertype='Lecturer'
select * from Lecturer 
where Lecturer_id=@User_id 

if @usertype='Teaching_Assistant'
select * from Teaching_Assistant 
where TA_id=@User_id 

if @usertype='External_Examiner'
select * from External_Examiner
where EE_id=@User_id 

if @usertype='Coordinator'
select * from Coordinator 
where coordinator_id=@User_id  

end


GO

--8-B
CREATE PROC AssignAllStudentsToLocalProject
AS
SELECT * INTO #mytemp from Student

WHILE(EXISTS (SELECT * FROM #mytemp  ))
BEGIN--ORDER BY PreferenceNumber ASC
DECLARE @st int
SELECT TOP 1 @st=sid FROM #mytemp ORDER BY GPA ASC
SELECT  z.sid,s.PreferenceNumber,s.PCode INTO #mytemp2 FROM #mytemp z INNER JOIN StudentPreferences s ON z.sid = s.sid WHERE @st = z.sid ORDER BY PreferenceNumber ASC
WHILE(EXISTS (SELECT * FROM #mytemp2  ) AND ((SELECT Assigned_Project_code FROM Student WHERE sid = @st ) IS NULL ))
BEGIN
DECLARE @k varchar(10)
SELECT TOP 1 @k= PCode FROM #mytemp2;
IF(EXISTS(SELECT * FROM Student s WHERE s.Assigned_Project_code = @k))
BEGIN
DELETE FROM #mytemp2 WHERE PCode = @k;
END
ELSE 
UPDATE Student SET Assigned_Project_code = @k WHERE sid = @st
END
DROP TABLE #mytemp2
DELETE FROM #mytemp WHERE sid = @st

END
DROP table #mytemp;


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
if(@lecture_id is null)
print 'error'
else
begin
select * from LecturerRecommendEE 
where L_id = @lecture_id
end


---8-e 
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

--9A)
CREATE PROC EmployeeGradeThesis
@Employee_id int, 
@sid int, 
@thesis_title varchar(50), 
@Employee_grade Decimal(4,2)
AS
DECLARE @X INT;
SET @X = 0;
SELECT @X=COUNT(@Employee_id) 
FROM Employee
WHERE @Employee_id=Employee.Staff_id



IF @X>0 AND EXISTS (SELECT sid FROM Student WHERE sid=@sid)AND
EXISTS(SELECT sid FROM Thesis WHERE sid=@sid )and
EXISTS(SELECT Title FROM Thesis WHERE Title=@thesis_title )

BEGIN
IF EXISTS (SELECT sid FROM GradeIndustrialThesis WHERE sid=@sid) 
AND EXISTS(SELECT Title FROM GradeIndustrialThesis WHERE Title=@thesis_title)
UPDATE  GradeIndustrialThesis  
SET Employee_grade=@Employee_grade
WHERE GradeIndustrialThesis.sid=@sid AND GradeIndustrialThesis.Title=@thesis_title

ELSE
INSERT INTO GradeIndustrialThesis
(sid,Title,E_id,Employee_grade) VALUES
(@sid,@thesis_title,@Employee_id,@Employee_grade)
END
ELSE
PRINT 'unregistered thesis or unregistered employee or unregistered Student'



GO
--9B)
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
IF @X>0 and EXISTS(SELECT sid FROM Defense WHERE sid=@sid )and
EXISTS(SELECT Location FROM Defense WHERE Location=@defense_location )

begin
IF EXISTS (SELECT sid FROM GradeIndustrialDefense WHERE sid=@sid) 
AND EXISTS(SELECT Location FROM GradeIndustrialDefense WHERE Location=@defense_location)
UPDATE  GradeIndustrialDefense 
SET Employee_grade=@Employee_grade
WHERE GradeIndustrialDefense.sid=@sid AND GradeIndustrialDefense.Location=@defense_location
ELSE
INSERT INTO GradeIndustrialDefense(E_id,sid,Location,Employee_grade)
VALUES
(@Employee_id,@sid,@defense_location,@Employee_grade)
end

else
PRINT 'unregistered Defense or unregistered employee or unregistered Student'



GO
--9C)
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
IF @X>0 and EXISTS (SELECT sid FROM Student WHERE sid=@sid)and
(not EXISTS(SELECT sid FROM ProgressReport WHERE sid=@sid) or 
not EXISTS(SELECT Date FROM ProgressReport WHERE Date=@date) )
begin
INSERT INTO ProgressReport(sid,Date,Content,UpdatingUser_id)
VALUES
(@sid,@date,@content,@Employee_id)
end
else
print 'already registered ProgressReport or unregistered Employee or unregistered Student'


GO