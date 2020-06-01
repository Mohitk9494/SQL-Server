Create table tblDepartment
(
     ID int primary key,
     DepartmentName nvarchar(50),
     Location nvarchar(50),
     DepartmentHead nvarchar(50)
)
Go

Insert into tblDepartment values (1, 'IT', 'London', 'Rick')
Insert into tblDepartment values (2, 'Payroll', 'Delhi', 'Ron')
Insert into tblDepartment values (3, 'HR', 'New York', 'Christie')
Insert into tblDepartment values (4, 'Other Department', 'Sydney', 'Cindrella')
Go

Create table tblEmployee
(
     ID int primary key,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DepartmentId int foreign key references tblDepartment(Id)
)
Go

Insert into tblEmployee values (1, 'Tom', 'Male', 4000, 1)
Insert into tblEmployee values (2, 'Pam', 'Female', 3000, 3)
Insert into tblEmployee values (3, 'John', 'Male', 3500, 1)
Insert into tblEmployee values (4, 'Sam', 'Male', 4500, 2)
Insert into tblEmployee values (5, 'Todd', 'Male', 2800, 2)
Insert into tblEmployee values (6, 'Ben', 'Male', 7000, 1)
Insert into tblEmployee values (7, 'Sara', 'Female', 4800, 3)
Insert into tblEmployee values (8, 'Valarie', 'Female', 5500, 1)
Insert into tblEmployee values (9, 'James', 'Male', 6500, NULL)
Insert into tblEmployee values (10, 'Russell', 'Male', 8800, NULL)
Go

--In SQL server, there are different types of JOINS.
--1. CROSS JOIN
--2. INNER JOIN 
--3. OUTER JOIN 

--Outer Joins are again divided into 3 types
--1. Left Join or Left Outer Join
--2. Right Join or Right Outer Join
--3. Full Join or Full Outer Join

--General Formula for Joins
--SELECT		ColumnList
--FROM			LeftTableName
--JOIN_TYPE		RightTableName
--ON			JoinCondition

Select * from tblEmployee
Select * from tblDepartment

Select Name, Gender, Salary, DepartmentName
From tblEmployee e
Inner Join tblDepartment d
On e.DepartmentId = d.ID

Select Name, Gender, Salary, DepartmentName
From tblEmployee e
Left Join tblDepartment d
On e.DepartmentId = d.ID

Select Name, Gender, Salary, DepartmentName
From tblEmployee e
Right Join tblDepartment d
On e.DepartmentId = d.ID

Select Name, Gender, Salary, DepartmentName
From tblEmployee e
Full Join tblDepartment d
On e.DepartmentId = d.ID

Select Name, Gender, Salary, DepartmentName
From tblEmployee e
Cross Join tblDepartment d

--Advanced or intelligent joins

Select Name,Gender,Salary,DepartmentName
from tblEmployee e
Left join tblDepartment d
on e.DepartmentId = d.ID
Where d.ID is null

Select Name,Gender,Salary,DepartmentName
from tblEmployee e
Right join tblDepartment d
on e.DepartmentId = d.ID
Where e.DepartmentId is null

Select Name,Gender,Salary,DepartmentName
from tblEmployee e
Full join tblDepartment d
on e.DepartmentId = d.ID
Where d.DepartmentName is null or e.DepartmentId is null

--Self Join
Create table tblEmployeeAndManager
(
	ID int primary key identity(1,1),
	Name varchar(200),
	ManagerId int
)

Insert into tblEmployeeAndManager values ('Mike',3)
Insert into tblEmployeeAndManager values ('Rob',1)
Insert into tblEmployeeAndManager values ('Todd',Null)
Insert into tblEmployeeAndManager values ('Ben',1)
Insert into tblEmployeeAndManager values ('Sam',1)

Select * from tblEmployeeAndManager

Select E.Name as Employee, isnull(M.Name, 'No Manager')  as Manager
from tblEmployeeAndManager E
Left Join tblEmployeeAndManager M
on E.ManagerId = M.ID

Select E.Name as Employee, M.Name as Manager
from tblEmployeeAndManager E
Inner Join tblEmployeeAndManager M
on E.ManagerId = M.ID

Select E.Name as Employee, M.Name as Manager
from tblEmployeeAndManager E
Cross Join tblEmployeeAndManager M


