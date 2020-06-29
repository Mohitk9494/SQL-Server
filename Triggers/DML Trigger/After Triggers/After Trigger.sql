/*
After triggers, as the name says, fires after the triggering action. The INSERT, UPDATE, and DELETE statements, causes an after 
trigger to fire after the respective statements complete execution.
*/

-- After Trigger Example
/*
	When ever, a new Employee is added, we want to capture the ID and the date and time, the new employee is added in 
	tblEmployeeAudit table. The easiest way to achieve this, is by having an AFTER TRIGGER for INSERT event.

	In the trigger, we are getting the id from inserted table. So, what is this inserted table? INSERTED table, is a special table 
	used by DML triggers. 
	When we add a new row into tblEmployee table, a copy of the row will also be made into inserted table, which only a trigger can access. 
	We cannot access this table outside the context of the trigger. 
	The structure of the inserted table will be identical to the structure of tblEmployee table.
*/

Select * from tblEmployee

Insert into tblEmployee(ID,Name, Gender, Salary, DepartmentId)
Select 12,'Rajni','Female',5000,1

CREATE TABLE tblEmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
)

-- Alter Insert DML Trigger
Alter Trigger tr_tblEmployee_ForInsert
On tblEmployee
For Insert
As
Begin
	-- Magic Table 
	--Select * from inserted
	Declare @Id int
	
	Select @Id = Id from inserted

	Insert into tblEmployeeAudit(AuditData)
	Select 'New employee with Id  = ' + CAST(@Id as varchar(8)) + ' is added at ' + CAST(Getdate() as varchar(50))
End

Select * from tblEmployee
Select * from tblEmployeeAudit

-- After Delete DML Trigger
Alter Trigger tr_tblEmployee_ForDelete
On tblEmployee
For Delete
As 
Begin
	-- Delete Magic Table
	-- Select * from deleted
	Declare @Id int
	Select @Id = id from deleted

	Insert into tblEmployeeAudit(AuditData)
	Select 'An existing employee with Id  = ' + CAST(@Id as varchar(30)) + ' is deleted at ' + CAST(GETDATE() as varchar(50))
End

Delete from tblEmployee where ID = 12

-- After Update DML Trigger
Alter Trigger tr_tblEmployee_ForUpdate
On tblEmployee
For update
As
Begin
	 -- Declare variables to hold old and updated data
      Declare @Id int
      Declare @OldName nvarchar(20), @NewName nvarchar(20)
      Declare @OldSalary int, @NewSalary int
      Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
      Declare @OldDeptId int, @NewDeptId int
     
      -- Variable to build the audit string
      Declare @AuditString nvarchar(1000)

	 -- Load the updated records into temporary table
      Select *
      into #TempTable
      from inserted

	   -- Loop thru the records in temp table
      While(Exists(Select Id from #TempTable))
      Begin
            --Initialize the audit string to empty string
            Set @AuditString = ''
           
            -- Select first row data from temp table
            Select Top 1 @Id = Id, @NewName = Name, 
            @NewGender = Gender, @NewSalary = Salary,
            @NewDeptId = DepartmentId
            from #TempTable
           
            -- Select the corresponding row from deleted table
            Select @OldName = Name, @OldGender = Gender, 
            @OldSalary = Salary, @OldDeptId = DepartmentId
            from deleted where Id = @Id
   
     -- Build the audit string dynamically           
            Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + ' changed'
            if(@OldName <> @NewName)
                  Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName
                 
            if(@OldGender <> @NewGender)
                  Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender
                 
            if(@OldSalary <> @NewSalary)
                  Set @AuditString = @AuditString + ' SALARY from ' + Cast(@OldSalary as nvarchar(10))+ ' to ' + Cast(@NewSalary as nvarchar(10))
                  
			if(@OldDeptId <> @NewDeptId)
                  Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(10))+ ' to ' + Cast(@NewDeptId as nvarchar(10))
           
            insert into tblEmployeeAudit values(@AuditString)
            
            -- Delete the row from temp table, so we can move to the next row
            Delete from #TempTable where Id = @Id
      End
End

Select * from tblEmployee
Select * from tblEmployeeAudit

update tblEmployee set Name = 'Kunal',Gender ='Male',DepartmentId = 2 where ID = 10