/*
	Deterministic and Nondeterministic Functions:

	Deterministic functions always return the same result any time they are called with a specific set of input values and given the 
	same state of the database. 
	Examples: Sum(), AVG(), Square(), Power() and Count()

	Note: All aggregate functions are deterministic functions.

	Nondeterministic functions may return different results each time they are called with a specific set of input values even 
	if the database state that they access remains the same.
	Examples: GetDate() and CURRENT_TIMESTAMP

	Rand() function is a Non-deterministic function, but if you provide the seed value, the function becomes deterministic, as the same 
	value gets returned for the same seed value.
*/

-- Deterministic Function
Select * from tblEmployee
Select count(*) from tblEmployee
Select SQUARE(12)

-- Non-deterministic Functions
Select GETDATE()
Select CURRENT_TIMESTAMP

Select floor((RAND() * 100))

/* 
 Encrypting a function definiton using WITH ENCRYPTION OPTION:
 We can also encrypt a function and Store Proc text. Once, encrypted, we cannot view the text of the function, using sp_helptext system stored procedure.
 If we try to, we will get a message stating 'The text for object is encrypted.'
*/

/*
	Creating a function WITH SCHEMABINDING option:
	1. The function fn_GetEmployeeNameById(), is dependent on tblEmployees table. 
	2. Delete the table tblEmployees from the database. Drop Table tblEmployees
	3. Now, execute the function fn_GetEmployeeNameById(), you will get an error stating 'Invalid object name tblEmployees'. 
	So, we are able to delete the table, while the function is still refrencing it.
	4. Now, recreate the table and insert data, using the scripts provided.
	5. Next, Alter the function fn_GetEmployeeNameById(), to use WITH SCHEMABINDING option.
*/

Alter Function fun_GetNameById(@Id int)
Returns varchar(200)
--With Encryption
with Schemabinding
As 
Begin
	Return(Select Name from dbo.tblEmployees where Id = @Id)
End

Select dbo.fun_GetNameById(2)

Drop table tblEmployees


sp_helptext fun_GetNameById