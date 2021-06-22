USE [SEDCHome]
GO
--Find all Students with FirstName = Antonio
--Find all Students with DateOfBirth greater than ‘01.01.1999’
--Find all Male students
--Find all Students with LastName starting With ‘T’
--Find all Students Enrolled in January/1998
--Find all Students with LastName starting With ‘J’ enrolled in January/1998

select *
from dbo.[Student]
where [FirstName]='Antonio'
Go

select * 
from dbo.[Student]
where [DateOfBirth]>'1999.01.01'
go

select *
from dbo.[Student]
where [Gender]='M'
go

select *
from dbo.[Student]
where [LastName] like 'T%'
go

select *
from dbo.[Student]
where [EnrolledDate] >= '1998.01.01' and [EnrolledDate]<'1998.02.01'
and [LastName] like 'J%'
Go

--Find all Students with FirstName = Antonio ordered by Last Name
--List all Students ordered by FirstName
--Find all Male students ordered by EnrolledDate, starting from the last enrolled

select *
from Student
where FirstName='Aleksandar'
order by LastName
Go

select *
from Student
Order by FirstName
Go

select *
from Student
where Gender='M'
Order by EnrolledDate desc
go

--List all Teacher First Names and Student First Names in single result set with duplicates
--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
--List all common First Names for Teachers and Students

Select FirstName
from Teacher
Union All
Select FirstName
from dbo.Student
Go

Select FirstName
from Teacher
Union 
Select FirstName
from dbo.Student
Go

Select FirstName
from Teacher
INTERSECT
Select FirstName
from dbo.Student
Go

--Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
--Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
--Change AchievementType table to guarantee unique names across the Achievement types



ALTER TABLE dbo.GradeDetails
ADD CONSTRAINT DF_Achievment_Default_Max_Points
DEFAULT 100 FOR AchievementMaxPoints
GO


ALTER TABLE dbo.GradeDetails
ADD CONSTRAINT DF_Prevent_Achievement_Points_More_Than_Max
CHECK (AchievementPoints <= AchievementMaxPoints)
GO

ALTER TABLE dbo.AchievementType
ADD CONSTRAINT UC_Name UNIQUE (Name)
GO



--List all possible combinations of Courses names and AchievementType names that can be passed by student
--List all Teachers that has any exam Grade
--List all Teachers without exam Grade
--List all Students without exam Grade (using Right Join)


select s.FirstName As StudentName,a.Name as AchievementType
from dbo.Student s
Cross join dbo.AchievementType a
Go



Select Distinct t.FirstName
from dbo.Teacher t
Left join dbo.Grade g ON t.ID=t.Id
Go



Select Distinct t.FirstName
From dbo.Teacher t
Left Join dbo.Grade g on t.ID=t.FirstName
Where g.TeacherID is null
Go



Select s.FirstName,g.StudentID As'Id'
From dbo.Grade g
Right Join dbo.Student s on s.ID=g.StudentID
Go