--Function				Date Time Format							Description

--GETDATE()				2012-08-31 20:15:04.543						Commonly used function
--CURRENT_TIMESTAMP		2012-08-31 20:15:04.543						ANSI SQL equivalent to GETDATE
--SYSDATETIME()			2012-08-31 20:15:04.5380028					More fractional seconds precision
--SYSDATETIMEOFFSET()	2012-08-31 20:15:04.5380028 + 01:00			More fractional seconds precision + Time zone offset
--GETUTCDATE()			2012-08-31 19:15:04.543						UTC Date and Time
--SYSUTCDATETIME()		2012-08-31 19:15:04.5380028					UTC Date and Time, with More fractional seconds precision

--UTC stands for Coordinated Universal Time, based on which, the world regulates clocks and time. There are slight differences between 
--GMT and UTC, but for most common purposes, UTC is synonymous with GMT.
 
If Exists(Select * from sys.tables where [Name] = 'tblDateTime')
	Begin
		Drop table [Sample].[dbo].[tblDateTime]
	End
Else
	Begin
		CREATE TABLE [Sample].[dbo].[tblDateTime]
		(
		 [c_time] [time](7) NULL,
		 [c_date] [date] NULL,
		 [c_smalldatetime] [smalldatetime] NULL,
		 [c_datetime] [datetime] NULL,
		 [c_datetime2] [datetime2](7) NULL,
		 [c_datetimeoffset] [datetimeoffset](7) NULL
		)
	End

Select * from [Sample].[dbo].[tblDateTime]

INSERT INTO tblDateTime VALUES (GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE())

INSERT INTO tblDateTime VALUES (SYSDATETIMEOFFSET(),SYSDATETIMEOFFSET(),SYSDATETIMEOFFSET(),SYSDATETIMEOFFSET(),SYSDATETIMEOFFSET(),SYSDATETIMEOFFSET())

Select GETDATE(), 'GETDATE()'
Select CURRENT_TIMESTAMP, 'CURRENT_TIMESTAMP'
Select SYSDATETIME() , 'SYSDATETIME()'
Select SYSDATETIMEOFFSET(), 'SYSDATETIMEOFFSET()'
Select GETUTCDATE(), 'GETUTCDATE()'

--1. ISDATE() - Checks if the given value, is a valid date, time, or datetime. Returns 1 for success, 0 for failure.
--Note: For datetime2 values, IsDate returns ZERO.

Select ISDATE('RAJ') --retrun 0
Select ISDATE(getdate()) --retrun 1
Select ISDATE('11-16-2001') --retrun 1
Select ISDATE('2012-09-01 11:34:21.1918447') --retrun 0

--2. Day() - Returns the 'Day number of the Month' of the given date
Select DAY(GETDATE())
Select DAY('11-16-2001')

--3. Month() - Returns the 'Month number of the year' of the given date
Select Month(GETDATE())
Select Month('11-16-2001')

--4. Year() - Returns the 'Year number' of the given date
Select Year(GETDATE())
Select Year('11-16-2001')

--5. DateName(DatePart, Date) - Returns a string, that represents a part of the given date. This functions takes 2 parameters. The first parameter 
-- 'DatePart' specifies, the part of the date, we want. The second parameter, is the actual date, from which we want the part of the Date.
Select DATENAME(WEEKDAY, GETDATE())
Select DATENAME(DAY, GETDATE())
Select DATENAME(MONTH, GETDATE())
Select DATENAME(YEAR, GETDATE())

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

Select *, DATENAME(WEEKDAY, DOB) As [Day],
MONTH(DOB) as [Month Number],
DATENAME(MONTH,DOB) as [Month Name],
YEAR(DOB) as [Year]
from #tblEmployeeDOB

-- dbo.fn_ComputeAge('') it's user Defind function
Select Name, DOB, dbo.fn_ComputeAge(DOB) from #tblEmployeeDOB


--6. DatePart(DatePart, Date) - Returns an integer representing the specified DatePart. This function is simialar to DateName().
-- DateName() returns nvarchar, where as DatePart() returns an integer. The valid DatePart parameter values are shown below.
Select DATEPART(MONTH, GETDATE())
Select DATENAME(MONTH, GETDATE())

-- 7. DATEADD (datepart, NumberToAdd, date) - Returns the DateTime, after adding specified NumberToAdd, to the datepart specified of the given date.
Select DATEADD(MONTH,6,GETDATE())
Select DATEADD(MONTH,-6,GETDATE())

--8. DATEDIFF(datepart, startdate, enddate) - Returns the count of the specified datepart boundaries crossed between the specified startdate and enddate.
Select DATEDIFF(MONTH, '11/30/2005','01/31/2006') -- returns 2
Select DATEDIFF(DAY, '11/30/2005','01/31/2006') -- returns 62


