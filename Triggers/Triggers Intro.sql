/*
In SQL server there are 3 types of triggers
	1. DML triggers 
	2. DDL triggers
	3. Logon trigger

*****************************************************************************************************
*						1. DML(Data Manipulation Language) Triggers									*										*
*****************************************************************************************************
	DML stands for Data Manipulation Language. INSERT, UPDATE, and DELETE statements are DML statements. DML triggers are fired, 
	when ever data is modified using INSERT, UPDATE, and DELETE events.

	DML triggers can be again classified into 2 types.
		1. After triggers (Sometimes called as FOR triggers)
		2. Instead of triggers
	
	After triggers, as the name says, fires after the triggering action. The INSERT, UPDATE, and DELETE statements, causes an after 
	trigger to fire after the respective statements complete execution.
		
	--------------------------------------------------------------------------------------------------------------------------
	After DML Trigger Syntex	
	-------------------------------------------------
	After DML Inserted Trigger
	-------------------------------------------------
	Create Trigger tr_tblEmployee_ForInsert
	On tblEmployee
	For Insert
	As
	Begin
		select * from inserted
	End
	--------------------------------------------------
	After DML Deleted Trigger
	-------------------------------------------------
	Create Trigger tr_tblEmployee_ForInsert
	On tblEmployee
	For Delete
	As
	Begin
		select * from deleted
	End
	--------------------------------------------------
	After DML Updated Trigger
	-------------------------------------------------
	Create Trigger tr_tblEmployee_ForInsert
	On tblEmployee
	For Update
	As
	Begin
		Select * from inserted
		Select * from deleted 
	End
	--------------------------------------------------

	INSTEAD of triggers, fires instead of the triggering action. The INSERT, UPDATE, and DELETE statements, can cause an INSTEAD OF 
	trigger to fire INSTEAD OF the respective statement execution.

	Notes:- We can't be create After trigger with View but we can create Instead Trigger with table. If we have created instead 
	trigger it will be overwride after trigger.

	--------------------------------------------------------------------------------------------------------------------------
	Instead DML Trigger Syntex	
	----------------------------------------------------------------------
	After DML Inserted Trigger
	-------------------------------------------------
	Create Trigger tr_vwEmployeeDetailsByDepartment_ForInsert
	On vwEmployeeDetailsByDepartment
	Instead of insert
	As
	Begin
		Select * from inserted
	End
*/