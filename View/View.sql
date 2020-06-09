/*
	What is a View?
	A view is nothing more than a saved SQL query. A view can also be considered as a virtual table.

	When this query is executed, the database engine actually retrieves the data from the underlying base tables, tblEmployees and 
	tblDepartments. The View itself, doesnot store any data by default. However, we can change this default behaviour, which we will talk 
	about in a later session. So, this is the reason, a view is considered, as just, a stored query or a virtual table.

	Advantages of using views:
	1. Views can be used to reduce the complexity of the database schema, for non IT users.
	2. Views can be used as a mechanism to implement row and column level security.
	3. Views can be used to present only aggregated data and hide detailed data.

	To look at view definition - sp_helptext vWName
	To modify a view - ALTER VIEW statement 
	To Drop a view - DROP VIEW vWName

*/

Select e.ID, Name, Gender,Salary,DepartmentName
from tblEmployee e
Join tblDepartment d
On e.DepartmentId = d.ID

Create View View_EmployeesByDepartment
As
Select e.ID, Name, Gender,Salary,DepartmentName
from tblEmployee e
Join tblDepartment d
On e.DepartmentId = d.ID

Select * from View_EmployeesByDepartment

Create View View_SummarizedData
As
Select d.DepartmentName, COUNT(e.ID) as TotalEmployees  
from tblDepartment d
join tblEmployee e
on d.ID = e.DepartmentId
Group by d.DepartmentName

Select * from View_SummarizedData


