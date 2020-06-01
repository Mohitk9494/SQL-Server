/* In SQL Server there are 3 types of User Defined functions
1. Scalar functions
2. Inline table-valued functions
3. Multistatement table-valued functions

Scalar functions may or may not have parameters, but always return a single (scalar) value. The returned value can be of any 
data type, except text, ntext, image, cursor, and timestamp.

To create a Scalar function, we use the following syntax:
Create Function function_name(@Parameter data_type, @Parameter data_type..)
Returns return_DataType
As 
Begin
	Function Body
	return retrun_DataType
End */

Create Function fun_CalculateAge(@DOB date)
Returns Int
As 
Begin
	Declare @Age Int
	Set @Age =	DATEDIFF(YEAR, @DOB, Getdate()) -
				Case
					When(MONTH(@DOB) > MONTH(GETDATE())) 
					OR (MONTH(@DOB) = MONTH(GETDATE()) And DAY(@DOB) < DAY(GETDATE()))
					Then 1
					Else 0
				End 
	return @Age
End

Select dbo.fun_CalculateAge('03/16/2000')

Create table #tblEmployeeDOB
(
	Id int primary key identity,
	Name varchar(100),
	DOB datetime
)

Insert into #tblEmployeeDOB values('Ramesh','12/03/1998')
Insert into #tblEmployeeDOB values('Mohit','05/26/1988')
Insert into #tblEmployeeDOB values('Kiran','01/06/1978')
Insert into #tblEmployeeDOB values('Deepu','11/15/1999')
Insert into #tblEmployeeDOB values('Mukesh','05/26/1988')
Insert into #tblEmployeeDOB values('Kunal','01/06/1978')
Insert into #tblEmployeeDOB values('Lala','11/15/1999')
Insert into #tblEmployeeDOB values('Kala','05/26/1988')
Insert into #tblEmployeeDOB values('Isha','01/06/1978')
Insert into #tblEmployeeDOB values('Meena','11/15/1999')

Select Name, DOB, dbo.fun_CalculateAge(DOB) as Age from #tblEmployeeDOB

Select Name, DOB, dbo.fun_CalculateAge(DOB) as Age
from #tblEmployeeDOB 
where dbo.fun_CalculateAge(DOB) > 30

Create Proc proc_CalculateAge 
@DOB date 
As 
Begin
	Declare @Age Int
	Set @Age =	DATEDIFF(YEAR, @DOB, Getdate()) -
				Case
					When(MONTH(@DOB) > MONTH(GETDATE())) 
					OR (MONTH(@DOB) = MONTH(GETDATE()) And DAY(@DOB) < DAY(GETDATE()))
					Then 1
					Else 0
				End 
	Select @Age
End

/* A stored procedure also can accept DateOfBirth and return Age, but you cannot use stored procedures in a select or where clause. 
This is just one difference between a function and a stored procedure. 

To alter a function we use ALTER FUNCTION FuncationName statement and to delete it, we use DROP FUNCTION FuncationName.

To view the text of the function use sp_helptext FunctionName */