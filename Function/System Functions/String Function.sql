--1. ASCII(Character_Expression) - Returns the ASCII code of the given character expression.
Select ASCII('A')

--2. CHAR(Integer_Expression) - Converts an int ASCII code to a character. The Integer_Expression, should be between 0 and 255.
Declare @Start int 
Set @Start = ASCII('a')
While(@Start <= ASCII('z'))
Begin
	Print CHAR(@Start)
	Set @Start = @Start + 1 
End

--3. LTRIM(Character_Expression) - Removes blanks on the left handside of the given character expression.
Select Ltrim('         Raj')
Select LTRIM([Name]) As [Name] from tblEmployee

--4. RTRIM(Character_Expression) - Removes blanks on the right hand side of the given character expression.
Select RTRIM('Raj          ')
Select RTRIM([Name]) As [Name] from tblEmployee

Select TRIM('        Raj')

--5. LOWER(Character_Expression) - Converts all the characters in the given Character_Expression, to lowercase letters.
Select Lower(RTRIM(LTRIM([Name]))) from tblEmployee

--6. UPPER(Character_Expression) - Converts all the characters in the given Character_Expression, to uppercase letters.
Select UPPER(RTRIM(LTRIM([Name]))) from tblEmployee

--7. REVERSE('Any_String_Expression') - Reverses all the characters in the given string expression.
Select REVERSE(UPPER('Raj'))
Select REVERSE([Name]) from tblEmployee

--8. LEN(String_Expression) - Returns the count of total characters, in the given string expression, excluding the blanks at the end of the expression.
Select LEN('    Raj')
Select LEN(TRIM('     Raj'))
Select [Name], LEN([Name]) from tblEmployee

--9. LEFT(Character_Expression, Integer_Expression) - Returns the specified number of characters from the left hand side of the given character expression.
Select Left('ABCDEF',3)

--10. RIGHT(Character_Expression, Integer_Expression) - Returns the specified number of characters from the right hand side of the given character expression.
Select RIGHT('ABCDEF',3)

--11. CHARINDEX('Expression_To_Find', 'Expression_To_Search', 'Start_Location') - Returns the starting position of the specified expression in a character string. Start_Location parameter is optional.
Select CHARINDEX('@','raj@gmail.com')

--12. SUBSTRING('Expression', 'Start', 'Length') - As the name, suggests, this function returns substring (part of the string), from the given expression. You specify the starting location using the 'start' parameter and the number of characters in the substring using 'Length' parameter. All the 3 parameters are mandatory.
Select SUBSTRING('raj@gmail.com',5,9)

--Select SUBSTRING('rajendra@gmail.com', CHARINDEX('@','rajendra@gmail.com') + 1,9)

Select SUBSTRING('raj@gmail.com', CHARINDEX('@','raj@gmail.com') + 1, 
LEN('raj@gmail.com') - CHARINDEX('@','raj@gmail.com'))

Select * from tblEmployees

Select SUBSTRING(Email, CHARINDEX('@',Email) + 1, LEN(Email) - Charindex('@',Email)) As [Email Domain],
Count(Email) As Total 
from tblEmployees
Group by SUBSTRING(Email, CHARINDEX('@',Email) + 1, LEN(Email) - Charindex('@',Email))

--13. REPLICATE(String_To_Be_Replicated, Number_Of_Times_To_Replicate) - Repeats the given string, for the specified number of times.
Select REPLICATE('Raj ',5)

Select * , 
SUBSTRING(Email,1,2) + REPLICATE('*',5) + SUBSTRING(Email,CHARINDEX('@',Email), LEN(Email) - Charindex('@',Email)) As HiddenEmail
from tblEmployees

--14. SPACE(Number_Of_Spaces) - Returns number of spaces, specified by the Number_Of_Spaces argument.
Select *, Name + SPACE(2) + Gender As NameWithGender
from tblEmployees

--15. PATINDEX('%Pattern%', Expression) - Returns the starting position of the first occurrence of a pattern in a specified expression. 
--It takes two arguments, the pattern to be searched and the expression. PATINDEX() is simial to CHARINDEX(). With CHARINDEX() we cannot 
--use wildcards, where as PATINDEX() provides this capability. If the specified pattern is not found, PATINDEX() returns ZERO.
Select Email, PATINDEX('%@gmail.com',Email) As FirstOccurence
From tblEmployees
Where PATINDEX('%@gmail.com',Email) > 0

--16. REPLACE(String_Expression, Pattern , Replacement_Value)
--Replaces all occurrences of a specified string value with another string value.
Select Email, REPLACE(Email,'.com','.net') As ConvertedEmail
From tblEmployees

--17. STUFF(Original_Expression, Start, Length, Replacement_expression) - STUFF() function inserts Replacement_expression, 
--at the start position specified, along with removing the charactes specified using Length parameter.
Select Email, STUFF(Email, 2, 3, '*****')
from tblEmployees
