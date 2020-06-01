-- Declare Varialbe
Declare @DOB datetime, @tempdate datetime, @years int, @months int, @days int
Set @DOB = '03-19-1992'
Select @tempdate = @DOB

Select @years = DATEDIFF(YEAR, @tempdate,GETDATE()) - 
				Case 
					When (MONTH(@DOB) > MONTH(GETDATE())) Or
						 (MONTH(@DOB) = MONTH(GETDATE()) And (DAY(@DOB)> DAY(GETDATE())))
						 Then 1 Else 0
					End
Select @tempdate = DATEADD(YEAR, @years, @tempdate) 

Select @months = DATEDIFF(MONTH, @tempdate,GETDATE()) - 
				 Case
					When (DAY(@DOB) > DAY(GETDATE()))
					Then 1 Else 0
				 End	
Select @tempdate = DATEADD(MONTH, @months, @tempdate)

Select @days = DATEDIFF(DAY, @tempdate, GETDATE())

Select @years as [Year], @months As [Month], @days as [Days]

Select dbo.fn_ComputeAge('03-19-1992')

-- Function

Alter Function fn_ComputeAge(@DOB Datetime)
returns nvarchar(50) 
as 
Begin
	Declare @tempdate datetime, @years int, @months int, @days int
	Select @tempdate = @DOB

	Select @years = DATEDIFF(YEAR, @tempdate,GETDATE()) - 
					Case 
						When (MONTH(@DOB) > MONTH(GETDATE())) Or
							 (MONTH(@DOB) = MONTH(GETDATE()) And (DAY(@DOB)> DAY(GETDATE())))
							 Then 1 Else 0
						End
	Select @tempdate = DATEADD(YEAR, @years, @tempdate) 

	Select @months = DATEDIFF(MONTH, @tempdate,GETDATE()) - 
					 Case
						When (DAY(@DOB) > DAY(GETDATE()))
						Then 1 Else 0
					 End	
	Select @tempdate = DATEADD(MONTH, @months, @tempdate)

	Select @days = DATEDIFF(DAY, @tempdate, GETDATE())

	Declare @Age nvarchar(50)
	Set @Age =  CAST(@years as nvarchar(4)) + ' Years ' + CAST(@months as nvarchar(2)) + ' Months ' + CAST(@days as nvarchar(2)) + ' Days Old'
	
	return @Age
End