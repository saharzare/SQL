--create orders
create table Orders
(ID int identity(1,1) primary key
,CustomerName nvarchar(20),
OrderDate date,
employename nvarchar(20))
---------------------
--create orderdetails
create table OrderDetails 
(ID int identity(1,1) primary key,
OrderID int,
Product nvarchar(20),
Price int,
Quantity int,
constraint FK_OrderDetails_Orders foreign key (OrderID)  references Orders(ID))
---------------
Begin transaction

insert into Orders values
('Sara',getdate(),'Sahar'),
('Sara',getdate(),'Ali'),
('saghar',getdate(),'Ali')
--------------
--the last input in orderdetails is out of range of int so it will be rollback.(not insert in orders and orderdetails)
insert into OrderDetails values
(1,'Milk',2,12),(2,'Yougert',2,2),(1,'Honey',3,1),(3,'gum',200000,2)

if @@error = 0
commit
else
rollback
-------------------------