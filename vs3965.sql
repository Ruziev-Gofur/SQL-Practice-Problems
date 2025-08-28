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
-- SELECT - malumotlarni chiqarish



select COUNT(*) from Products
select * from Products

-- Distinct - takrorlangan malumotni olib tashlaydi
select Distinct 
	SupplierID, CategoryID
from Products

-- where
select * from Products
	where UnitsOnOrder > 30 -- UnitsOnOrder qiymatini 30 da kattalarini chiqaradi

select * from Products
	where CategoryID = 1

	-- order by
select * from Products
-- where CategoryID = 1
order by UnitPrice desc, UnitsInStock asc

-- AND, OR
select * from Products
where UnitPrice > 20 or (ReorderLevel < 10 and CategoryID = 1)

-- NOT - inkor
select * from Products
where not SupplierID = 1


-- INSERT INTO - jadvalga yangi malumot qo'shish
/*INSERT INTO Products(ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit,UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values(78, 'Salom', 111, 222, 'fdsfsdf', 20000, 4000, 12, 32, 23)*/

-- NULL Values
select * from Products

select * from Employees
where Region is not null

-- TOP, LIMIT, FETCH FIRST or ROWNUM Clause
-- TOP - boshidagi 10ta malumotni ko'rsatadi

select COUNT(*) from Products

select TOP 10 * from Products
where UnitPrice > 20

-- MAX MIN
select max(UnitPrice)
from Products
WHERE UnitPrice < 20

select min(UnitPrice)
from Products
WHERE UnitPrice > 20

-- COUNT - jadvalda qancha malumot borligini sonini chiqaradi
SELECT COUNT(UnitPrice)
FROM Products

-- SUM
select SUM(CategoryID)
from Products
where CategoryID > 6

-- AVG - o'rtacha qiymat chiqarib beradi
select AVG(UnitPrice) 
from Products
where UnitPrice>10

-- LIKE - berilgan so'zga o'xshash so'zlarni olib kelib beradi
SELECT * FROM Products
where ProductName like 
-- 'G%' -- G xarifi b.n boshlanadigan so'zlarni topadi
-- '%u' -- U xarifi b.n tugaydigan so'zlarni topadi
-- '%k%' -- malumotlarni ichida k xarifi borlarini topadi

-- Wildcard 
select * from Products
where ProductName like -- '__ef%' 
-- '%ni__'
-- 'Cha_%'
-- '[S,A,G]%'	-- bosh xarifi
-- '[A-F]%'
'[A-F]_[e]%'

-- IN -- shunga tegishli malumotlar
select * from Products
where CategoryID IN (1,2,4)

-- NOT IN -- shunga tegishli bo'lmagan malumotlar
select * from Products
where CategoryID NOT IN (1,2,4)

-- IN 
select * from Products
where UnitPrice in (select UnitPrice where ReorderLevel > 5)

-- BETWEEN - ikkita qiymat orasidagi malumotlar
select * from Products
where CategoryID between 2 and 4

-- Aliases
select 
	ProductName as 'Maxsulot Nomi',
	ReorderLevel 'Navbat',
	UnitPrice 'Maxsulot Narxi'
from Products

-- JOINS
-- INNER JOIN - o'xshash malumotni tutashgan xolatda chop qilari
SELECT 
	p.*,
	s.CompanyName,
	c.CategoryName
	from Products p
inner join Categories c on 
	p.CategoryID = c.CategoryID
join Suppliers s on
	s.SupplierID = p.SupplierID 
	and s.Phone in (
	'(171) 555-2222',
	'(100) 555-4822',
	'(313) 555-5735',
	'(03) 3555-5011',
	'(98) 598 76 54',
	'(06) 431-7877',
	'(03) 444-2343', 
	'(161) 555-4448',
	'031-987 65 43') 

where p.UnitPrice > 10



select 
	c.Country 'Custumer Country',
	e.Country 'Employer Country',
	c.ContactName,
	e.City,
	e.FirstName + ' ' + e.LastName 'FullName'
from Customers c
full join Employees e on 
	c.Country = e.Country
	AND c.City = e.City


	-- SELF JOIN
select 
	A.ContactName 'A Contact Name',
	B.ContactName 'B Contact Name',
	A.City
from Customers A, Customers B
where A.CustomerID <> B.CustomerID
	AND A.City = B.City And A.City = 'M�xico D.F.'

	-- UNION Operatori
select Country, City from Customers
where Country LIKE '%SA%'
UNION
select Country, City from Employees
WHERE Country = 'USA'
ORDER BY Country

-- GROUP BY, having

select
	Country,
	count(CustomerID)
	from Customers
group by country having count(CustomerID) >5 -- having sart qo'yish u.n
order by COUNT(CustomerID) desc		-- desc - kamayish tartibida



select 
	Categories.*,
	GroupedProducts.total
from Categories
join(
	select 
		CategoryID,
		COUNT(ProductID) total
	from Products
	group by CategoryID
) as GroupedProducts on
	GroupedProducts.CategoryID = Categories.CategoryID

-- EXISTS Operator faqat true qaytaradi
-- Hech bo'lmasa bir marta xarid qilgan xaridorlar ro'yxati

select * 
from Customers
where EXISTS(
	select * from Orders
	where Orders.CustomerID = Customers.CustomerID
)

select * from Orders
where CustomerID = 'ALFKI'

-- ANY and ALL
-- SeaFood(dengiz maxsuloti) ning hech bo'lmasa bittasining narxidan qimmat bo'lgan mahsulotni olib kelib ber

select 
	ProductName,
	UnitPrice,
	CategoryID
from Products
where not UnitPrice > Any(	-- Any - xech bo'lmasa bittasi
	select UnitPrice 
	from Products
	where CategoryID in (
		select CategoryID 
		from Categories
		where CategoryName = 'Beverages'
	)
)		
order by UnitPrice

-- Stored Procedure - Uni bir marta yaratib qo�yasiz va keyin qayta�qayta chaqirib ishlatasiz.

create procedure SelectAllProducts
as
begin
	select * from Products
end;

-- execute SelectAllProducts
exec SelectAllProducts

-- CTRL + K + C - KOMENTARUYA
-- @productID-o'zgaruvchi nomi, uniqueidentifier-o'zgaruvchi turi

create procedure SelectProductById(@productId uniqueidentifier)	
as
begin
	select * from Products
	where Id = @productId
end;

create procedure InserProduct(
	@newId uniqueidentifier,
	@newName text,
	@newPrice money)
as 
begin
	insert into Products(Id, [Name], Price)
	value(@newId, @newName, @newPrice);
end

drop procedure SelectAllProducts