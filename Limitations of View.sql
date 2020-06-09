/* 
	Limitations of views:
	1. You cannot pass parameters to a view. Table Valued functions are an excellent replacement for parameterized views.
	2. Rules and Defaults cannot be associated with views.
	3. The ORDER BY clause is invalid in views unless TOP or FOR XML is also specified.
	4. Views and Functions cannot be based on temporary tables.
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


Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

Select * from ##TestTempTable

-- Error: Cannot create a view on Temp Tables
Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable
