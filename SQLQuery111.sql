create database project 
CREATE table Customer (
   	custID integer PRIMARY KEY, 
    LN varchar(50) NOT NULL, /* Can't be empty */
    FN Varchar(50),
    phoneNumber varchar(50) UNIQUE, /* Unique Constraint - Can't use the same phone number twice */
    streetName text,
    streetNumber integer,
    zipCode integer
);
CREATE table Orders (
   	ordern integer PRIMARY KEY,
	customerId integer,
    typeID integer ,
    dateor date,
    timeor datetime,
	foreign key (customerId) References Customer(custID),
	foreign key (typeID) References typee(id),
);
CREATE table Order_pizza (
   	id integer PRIMARY KEY,
	order_id integer,
	pizzacode integer,
    quintty integer,
	foreign key (order_id) References Orders(ordern),
	foreign key (pizzacode) References pizzas(pizza_code),
);
CREATE table pizzas (
   	pizza_code integer PRIMARY KEY,
	pizza_name Varchar(50),
	pizza_price float,  
);
CREATE table typee (
   	id integer PRIMARY KEY,
	order_type Varchar(50),  
);
CREATE table Topping (
   	Topping_id integer PRIMARY KEY,
	Topping_name Varchar(50),
	Topping_price float,
);
CREATE table piz_orde_Top (
   	order_no integer PRIMARY KEY,
	pizza_code integer,
	Topping_code integer,
	foreign key (Topping_code) References Topping(Topping_id),
	foreign key (pizza_code) References pizzas(pizza_code),
);
INSERT INTO piz_orde_Top VALUES
(2,5,4)
INSERT INTO Order_pizza VALUES
(1,2,5,12)
INSERT INTO Orders VALUES
(2,4,3,'','' )
INSERT INTO typee VALUES
(1,'in'),
(2,'out'),
(3,'delivry')
INSERT INTO Topping VALUES
(2,'ptato',6),
(3,'chice',5),
(4,'water',2),
(5,'pepsi',3)

INSERT INTO pizzas VALUES
(2,'Margrita',16),
(3,'chicey',20),
(4,'chicken',21),
(5,'beaf',25)
INSERT INTO Customer VALUES
(2,'Tarek','Jamal' ,'0689874138','A Random Street',211,89000),
(3,'Ahmed','Mahmoud','0589631247','HisStreet',258,28932),
(4,'Aqua','Web','0514785236','www.aqweeb.com / Street adress',280,20000)

SELECT custID, LN ,FN FROM Customer WHERE custID = 2 ;
SELECT pizza_price , pizza_name from  pizzas where pizza_code= 5;
select pizzas.pizza_name ,Topping.Topping_name from piz_orde_Top
inner join pizzas on piz_orde_Top.pizza_code = pizzas.pizza_code 
inner join Topping on piz_orde_Top.Topping_code= Topping.Topping_id; 


SELECT Customer.FN , Customer.LN ,typee.order_type from Orders
join Customer on Orders.customerId = Customer.custID 
join typee on Orders.customerId = typee.id 



create view [V1] as
select pizzas.pizza_name ,Topping.Topping_name from piz_orde_Top
inner join pizzas on piz_orde_Top.pizza_code = pizzas.pizza_code 
inner join Topping on piz_orde_Top.Topping_code= Topping.Topping_id;
SELECT * FROM [V1];

ALTER TABLE Orders 
drop column timeor;

select pizza_name,pizza_code from pizzas
where pizza_price  between 10 And 20;

CREATE proc  addvalues @name varchar(50), @price float 
AS
SELECT * FROM Topping WHERE Topping_name = @name And Topping_price = @price
EXEC addvalues @name = 'kids meal' , @price = '15' 

select * from Orders order by typeID  ;
