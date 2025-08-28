
CREATE DATABASE Students
use Students

-- Table yaratdim
CREATE TABLE Student (
	Id int not null,
	FirstName nvarchar(50) not null,
	age INT,
	course INT
)
select * from Student

-- Teblga talaba qo'shdim
INSERT INTO Student (Id, FirstName, age, course)
VALUES (7, 'Odil', 26, 4)


delete from Student where Id = 7

--✅ Savol 1:
--Yoshi 20 yoshdan katta bo‘lgan talabalarni chiqaruvchi SQL yozing.
select * from Student
where age > 20

--✅ Savol 2:
--Talabalarni ism bo‘yicha alfavit tartibida chiqaruvchi SQL yozing.
select * from Student
ORDER BY FirstName ASC

--✅ Savol 3:
--Har bir kurs bo‘yicha talabalar sonini chiqaruvchi SQL yozing.
SELECT course, COUNT(*) AS TalabalarSoni
FROM Student
GROUP BY course;

--✅ Savol 4:
--Faqat 2 tadan ortiq talabasi bor kurslarni chiqaruvchi SQL yozing.
SELECT course, COUNT(course) AS StudentCount
FROM Student
GROUP BY course
HAVING COUNT(course) > 2;


--✅ Savol 5 (BONUS):
--Ismi Ali bo‘lgan barcha talabalarni kurs bo‘yicha kamayish tartibida chiqaruvchi SQL yozing.
SELECT * FROM Student
WHERE FirstName = 'Ali'
