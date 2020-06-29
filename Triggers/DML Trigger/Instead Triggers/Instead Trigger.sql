/*
We can insert in record because 'vwEmployeeDetailsByDepartment' is created based on multiple tables. Get below error

Msg 4405, Level 16, State 1, Line 3
View or function 'vwEmployeeDetailsByDepartment' is not updatable because the modification affects multiple base tables.

Notes:- We can't be create After trigger with View but we can create Instead Trigger with table.
		If we have created instead trigger it will be overwride after trigger.

The instead of trigger correctly inserts, the record into tblEmployee table. Since, we are inserting a row, the inserted table, 
contains the newly added row, where as the deleted table will be empty.

In the trigger, we used Raiserror() function, to raise a custom error, when the DepartmentName provided in the insert query, 
doesnot exist. We are passing 3 parameters to the Raiserror() method. The first parameter is the error message, the second
parameter is the severity level. Severity level 16, indicates general errors that can be corrected by the user. 
The final parameter is the state. We will talk about Raiserror() and exception handling in sql server, in a later video session.
*/

Select * from vwEmployeeDetailsByDepartment

Insert into vwEmployeeDetailsByDepartment(Id, Salary, Name, Gender, DeptName) values(7, 5000,'Tom','Male','HR')

Select * from tblViewDepartment
select * from tblViewEmployee

Select * from vwEmployeeDetailsByDepartment

Alter Trigger tr_vwEmployeeDetailsByDepartment_ForInsert
On vwEmployeeDetailsByDepartment
Instead of insert
As
Begin
	Declare @DepId int

	--Check if there is a valid DepartmentId
	--for the given DepartmentName
	select @DepId = d.ID
	from inserted i 
	join tblDepartment d
	on i.DeptName = d.DepartmentName

	--If DepartmentId is null throw an error
	--and stop processing
	if(@DepId is null)
	begin
		Raiserror('Invalid Department Name. Statememt terminated',16,1)
		return
	end

	--Finally insert into tblEmployee table
	Insert into tblViewEmployee(Id,Name,Salary,Gender, DepartmentId)
	Select Id, Name,Salary, Gender ,@DepId
	from inserted
End

Select * from tblViewEmployee

