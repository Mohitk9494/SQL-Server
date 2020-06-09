/*

Is it possible to Insert, Update and delete rows, from the underlying tblEmployees table, using view vWEmployeesDataExceptSalary?
Yes, SQL server views are updateable.

*/

CREATE TABLE tblViewEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

Insert into tblViewEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblViewEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblViewEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblViewEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblViewEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblViewEmployee values (6,'Ben', 4800, 'Male', 3)

Select * from tblViewEmployee

Create view vWEmployeesDataExceptSalary
as
Select Id, Name, Gender, DepartmentId
from tblViewEmployee

Select * from vWEmployeesDataExceptSalary

Update vWEmployeesDataExceptSalary set Name = 'Mikey' where Id = 2

Delete from vWEmployeesDataExceptSalary where Id = 2
Insert into vWEmployeesDataExceptSalary values (2, 'Mikey', 'Male', 2)

/*
	Now, let us see, what happens if our view is based on multiple base tables. For this purpose, let's create tblDepartment table and populate 
	with some sample data.
*/

CREATE TABLE tblViewDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

Insert into tblViewDepartment values (1,'IT')
Insert into tblViewDepartment values (2,'Payroll')
Insert into tblViewDepartment values (3,'HR')
Insert into tblViewDepartment values (4,'Admin')

Select * from tblViewDepartment

Create view vwEmployeeDetailsByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblViewEmployee
join tblViewDepartment
on tblViewEmployee.DepartmentId = tblViewDepartment.DeptId

Select * from vwEmployeeDetailsByDepartment

-- Now, let's update, John's department, from HR to IT. At the moment, there are 2 employees (Ben, and John) in the HR department.

Update vwEmployeeDetailsByDepartment 
set DeptName='IT' where Name = 'John'

/*
	Notice, that Ben's department is also changed to IT. To understand the reasons for incorrect UPDATE, select Data from tblViewDepartment and 
	tblViewEmployee base tables.

	The UPDATE statement, updated DeptName from HR to IT in tblDepartment table, instead of upadting DepartmentId column in tblEmployee table. 
	So, the conclusion - If a view is based on multiple tables, and if you update the view, it may not update the underlying base tables 
	correctly. To correctly update a view, that is based on multiple table, INSTEAD OF triggers are used.
*/