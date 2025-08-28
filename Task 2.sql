-- Task 2
/*
SELECT name
FROM Customer
WHERE referee_id IS NULL
   OR referee_id != 2; */

-- Adding default constraint
 use Sample

select * from tblGender
select * from tblPerson

Insert into tblPerson (ID, Name, Email, GenderId) Values (10, 'Jon', 'jon@r.com', NULL)

-- Adding a new column
ALTER TABLE tblPerson
ADD CONSTRAINT DF_tblPerson_GenderId
DEFAULT 4 FOR GENDERID

-- Dropping a constraint
ALTER TABLE tblPerson
DROP CONSTRAINT DF_tblPerson_GenderId

-- Cascading referential integrity constraint
Delete from tblGender Where ID = 2

INSERT INTO tblGender (ID, Gender)
VALUES (3, 'Unknown');

-- Adding a check constraint
-- Mavjut jadvalga ustun qo'shish
ALTER TABLE tblPerson
ADD Age INT NULL;

-- Adding a check constraint
select * from tblPerson

Delete from tblPerson where ID = 10	-- Jadvaldan qatorno o'chirish

Insert into tblPerson values (4, 'asad', 'asad@a.com', 4, 32)

Alter Table tblPerson
Add Constraint CK_tblPerson_Age CHECK (AGR > 0 AND AGR < 150)

-- Identity Column in SQL Server 
use Sample

select * from dbo.tblPerson1
	
SET IDENTITY_INSERT tblPerson1 ON -- ustuniga o‘zingiz belgilagan qiymatlarni qo‘yish imkonini beradi.
SET IDENTITY_INSERT tblPerson1 OFF

Insert into dbo.tblPerson1  values ('Asqar')

Delete from tblPerson1 where PersonId = 10

Delete from dbo.tblPerson1

DBCC CHECKIDENT ('tblPerson1', RESEED, 0); 


