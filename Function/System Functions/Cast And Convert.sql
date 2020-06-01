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

--To convert one data type to another, CAST and CONVERT functions can be used. 

--Syntax of CAST and CONVERT functions from MSDN:
--CAST ( expression AS data_type [ ( length ) ] )
--CONVERT ( data_type [ ( length ) ] , expression [ , style ] )

--From the syntax, it is clear that CONVERT() function has an optional style parameter, where as CAST() function lacks this capability.

Select Id,Name, DOB, CAST(DOB as nvarchar) as CastDOB from #tblEmployeeDOB
Select ID, Name, DOB, CONVERT(nvarchar, DOB) as ConvertedDOB from #tblEmployeeDOB

--The following table lists a few of the common DateTime styles for Convert:
--Style	DateFormat
--101	mm/dd/yyyy
--102	yy.mm.dd
--103	dd/mm/yyyy
--104	dd.mm.yy
--105	dd-mm-yy
Select ID, Name, DOB, CONVERT(nvarchar, DOB, 103) as ConvertedDOB from #tblEmployeeDOB

Select ID, Name + '-' + CAST(Id as nvarchar) As [Nam-Id] from #tblEmployeeDOB

--In SQL Server 2008, Date datatype is introduced, so you can also use
SELECT CAST(GETDATE() as DATE)
SELECT CONVERT(DATE, GETDATE(), 103)

--Note: To control the formatting of the Date part, DateTime has to be converted to NVARCHAR using the styles provided. 
--When converting to DATE data type, the CONVERT() function will ignore the style parameter.

Select CAST(DOB As date) as DOB, COUNT(Id) as Total
from #tblEmployeeDOB
Group by CAST(DOB As date)

--The following are the differences between the 2 functions.
--1. Cast is based on ANSI standard and Convert is specific to SQL Server. So, if portability is a concern and if you want to use the script with other database applications, use Cast(). 
--2. Convert provides more flexibility than Cast. For example, it's possible to control how you want DateTime datatypes to be converted using styles with convert function.

--The general guideline is to use CAST(), unless you want to take advantage of the style functionality in CONVERT().



