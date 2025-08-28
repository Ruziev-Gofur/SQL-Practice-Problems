-- 1-DARS

CREATE DATABASE TEST -- baza yaratish

Alter database TEST2 MODIFY NAME = TEST -- bazani nomini o'zgartiradi

DROP DATABASE TEST -- BAZANI O'CHIRADI


-- 2-DARS

CREATE database SchoolDB
use SchoolDB

-- Table yaratamiz
CREATE TABLE Teacher (
	Id int NOT NULL,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL
)

SELECT 
	Id,
	FirstName + ' ' + FirstName as FullName, -- FirstName va FirstName bir ustunga yozish
	Email
FROM Teacher

SELECT COUNT(*) as TotalCount
FROM Teacher -- Jadvalda neshta malumot borlogini ko'rsatadi

-- Jadvalga malumot qo'shish
insert into Teacher(Id, FirstName, LastName, Email)
Values(1, 'Elbek', 'Kamolov', 'teacher_k@mail.com')

-- Mavjud malumotni o'zgartirish
UPDATE Teacher
set
	FirstName = 'Kamol'
where Id=1

-- Id ni o'zgartiraman
update Teacher
set
	Id=2
where FirstName = 'Elbek'

select * from Teacher where Id=2

--DELETE

DELETE FROM Teacher --Jadvalni tozalash
delete from Teacher where Id=1 -- Bu bir qatorni Id=1 bo'lganini o'chiradi

DROP TABLE Teacher -- xamma jadval malumotlarini o'chirish
 

 -- 3-dars

 -- Student tebl yaratamiz
 create table Students (
	Id uniqueidentifier primary key, 
	Number int not null,
	FirstName varchar(50), -- string
	LastName varchar(70), -- string
	Letter char null, -- 1 talik xarakter
	BirthDate date, -- sana
	BirthTime time, -- vaqat
	CreatedDate dateTime not null, -- dd-mm-yy hh:mm:ss
	UpdatedDate dateTimeoffset not null, -- dd-mm-yy hh:mm:ss +5
	Detalis text, 
	Photo binary null,
	Account decimal
 )

 select * from Students

 -- mavjud teblga ustun qo'shish
 Alter table Students add Id uniqueidentifier primary key

 -- SELECT, DISTINCT, WHERE, ORDER BY


