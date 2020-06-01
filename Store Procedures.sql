/* A stored procedure is group of T-SQL (Transact SQL) statements. If you have a situation, 
where you write the same query over and over again, you can save that specific query as a 
stored procedure and call it just by it's name. */

-- use Sample

Select * from tblDepartment
Select * from tblEmployee

Alter Proc Proc_GetEmployeesByDepartment 
@Gender varchar(20),
@DepartmentId int
As
Begin
	Select E.Name, E.Gender, E.Salary,D.DepartmentName
	From tblEmployee E
	Join tblDepartment D
	On E.DepartmentId = D.ID
	Where E.Gender = @Gender And E.DepartmentId = @DepartmentId
End

Alter Proc Proc_Employees 'female'
@gender varchar(20)
With Encryption
As 
Begin
	Select * from tblEmployee where Gender = @gender
End

Create Procedure Proc_GetEmployeeCountByGender
@Gender varchar(20),
@EmployeeCount int Output
As
Begin
	Select @EmployeeCount = COUNT(Gender) from tblEmployee where Gender = @Gender
End

Declare @Count int
Exec Proc_GetEmployeeCountByGender 'male', @Count output
if(@Count is null)
	print '@count is null'
Else
	print '@count is not null'
print @Count

-- Helper Procedures
sp_help Proc_GetEmployeeCountByGender -- Same as Alt+F1
sp_helptext Proc_GetEmployeeCountByGender
sp_depends Proc_GetEmployeeCountByGender

Create Proc Proc_GetNameById
@ID int,
@Name varchar(100) output
as
Begin
	Select @Name = Name from tblEmployees where Id = @ID
End

Declare @Name Varchar(100)
Exec Proc_GetNameById 4, @Name output
Print @Name

Create Proc Proc_GetTotalCountOfEmployeesOutput
@TotalCount int Output
As
Begin
	Select @TotalCount = COUNT(Id) from tblEmployees
End

Declare @Count int
Exec Proc_GetTotalCountOfEmployeesOutput @Count out
Print @Count

--Difference between return values and output parameters

--Retrun Staus Value
--Only Integer Datatype
--Only one value
--Use to convery success or failure

--Output Parameters
--Any Datatype
--More than one value
--Use to retrun values like name, count etc..

Create Proc Proc_GetTotalCountOfEmployeeReturn
As
Begin
	return (Select Count(Id) from tblEmployee)
End

Declare @ReturnCount int
Execute @ReturnCount = Proc_GetTotalCountOfEmployeeReturn
Print @ReturnCount

--Advantages Of Using Stored Procedures
--1. Execution plan retention and reusability.
--2. Reduces network traffic
--3. Code reusability and better maintainability
--4. Better Security
--5. Avoids SQL Injection attack