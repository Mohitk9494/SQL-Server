-- Inline Table Value Function
Alter Function fun_ILTVF_GetEmployee()
Returns Table
Return (
	Select E.ID, E.Name, E.Gender, D.ID As DepartmentId, D.DepartmentName, D.DepartmentHead 
	from tblEmployee E
	Join tblDepartment D
	On E.DepartmentId = D.ID
)

Select * from fun_ILTVF_GetEmployee()

Create Function fun_MSTVF_GetEmployee()
Returns @Table Table (Id int, EmpName varchar(100), Gender varchar(100))
Begin 
	Insert into @Table
	Select Id, Name, Gender from tblEmployees

	Return
End

Select * from fun_MSTVF_GetEmployee()

Select * from tblEmployees

Select * from tblDepartment

Select * from fun_ILTVF_GetEmployee()

Update fun_ILTVF_GetEmployee() Set DepartmentHead = 'Rich' where DepartmentId = 1

/* Differences between Inline Table Valued functions and Multi-statement Table Valued functions
1. In an Inline Table Valued function, the RETURNS clause cannot contain the structure of the table, the function returns. 
	Where as, with the multi-statement table valued function, we specify the structure of the table that gets returned
2. Inline Table Valued function cannot have BEGIN and END block, where as the multi-statement function can have.
3. Inline Table valued functions are better for performance, than multi-statement table valued functions. 
	If the given task, can be achieved using an inline table valued function, always prefer to use them, 
	over multi-statement table valued functions.
4. It's possible to update the underlying table, using an inline table valued function, but not possible using multi-statement 
	table valued function.
	
Updating the underlying table using inline table valued function: 
This query will change Sam to Sam1, in the underlying table tblEmployees. When you try do the same thing with the multi-statement 
table valued function, you will get an error stating 'Object 'fn_MSTVF_GetEmployees' cannot be modified.'

Update fn_ILTVF_GetEmployees() set Name='Sam1' Where Id = 1

Reason for improved performance of an inline table valued function:
Internally, SQL Server treats an inline table valued function much like it would a view and treats a multi-statement table valued 
function similar to how it would a stored procedure. 
*/
