/* 
	Limitations of views:
	1. You cannot pass parameters to a view. Table Valued functions are an excellent replacement for parameterized views.
	2. Rules and Defaults cannot be associated with views.
	3. The ORDER BY clause is invalid in views unless TOP or FOR XML is also specified.
	4. Views cannot be based on temporary tables.
*/

-- Error : Cannot pass Parameters to Views
Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from  tblEmployee
where Gender = @Gender

--Table Valued functions can be used as a replacement for parameterized views.
Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
As	
	Return (Select * from tblEmployees where Gender = @Gender)

Select * from dbo.fnEmployeeDetails('Male')

