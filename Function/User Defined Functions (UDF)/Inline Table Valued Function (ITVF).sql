/*
A scalar function, returns a single value. on the other hand, an Inline Table Valued function, return a table. 

Syntax for creating an inline table valued function
CREATE FUNCTION Function_Name(@Param1 DataType, @Param2 DataType..., @ParamN DataType)
RETURNS TABLE
AS
RETURN (Select_Statement)

If you look at the way we implemented this function, it is very similar to SCALAR function, with the following differences
1. We specify TABLE as the return type, instead of any scalar data type
2. The function body is not enclosed between BEGIN and END block. Inline table valued function body, cannot have BEGIN and END block.
3. The structure of the table that gets returned, is determined by the SELECT statement with in the function.

*/

Create Function fun_EmployeeByGender(@Gender varchar(100))
Returns Table
Return(	Select ID, Name, Gender, Salary, DepartmentId
		from tblEmployee 
		where Gender = @Gender)

Select * from  fun_EmployeeByGender('male') where Salary > 4000

/* As the inline user defined function, is returning a table, issue the select statement against the function, as if you are selecting the data from a TABLE.

Where can we use Inline Table Valued functions
1. Inline Table Valued functions can be used to achieve the functionality of parameterized views. We will talk about views, 
in a later session.
2. The table returned by the table valued function, can also be used in joins with other tables. */

Select E.Id, E.Name, D.DepartmentName
from fun_EmployeeByGender('male') E
Join tblDepartment D
On E.DepartmentId = D.ID