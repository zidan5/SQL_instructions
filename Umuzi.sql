CREATE TABLE public."Customers"
(
    "Firstname" character varying(50) COLLATE pg_catalog."default",
    "Lastname" character varying(50) COLLATE pg_catalog."default",
    "Gender" character varying COLLATE pg_catalog."default",
    "Address" character varying(200) COLLATE pg_catalog."default",
    "Phone" bigint,
    "Email" character varying(100) COLLATE pg_catalog."default",
    "City" character varying(20) COLLATE pg_catalog."default",
    "CustomerID" integer NOT NULL,
    "Country " character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT "Customers_pkey" PRIMARY KEY ("CustomerID")
)
CREATE TABLE public."Employees"
(
    "EmployeeID" integer NOT NULL,
    "Fisrtname" character varying(50) COLLATE pg_catalog."default",
    "Lastname" character(50) COLLATE pg_catalog."default",
    "Email" character varying(100) COLLATE pg_catalog."default",
    "JobTitle" character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "Employees_pkey" PRIMARY KEY ("EmployeeID")
)

CREATE TABLE public."Payments"
(
    "PaymentID" integer NOT NULL,
    "CustomerId" integer,
    "PaymentDate" date,
    "Amount" numeric(5,2),
    CONSTRAINT "Payments_pkey" PRIMARY KEY ("PaymentID"),
    CONSTRAINT "none" FOREIGN KEY ("CustomerId")
        REFERENCES public."Customers" ("CustomerID") MATCH SIMPLE

)
CREATE TABLE public."Orders"
(
    "OrderID" integer NOT NULL,
    "ProductID" integer,
    "PaymentID" integer,
    "FulFilledByEmployeeID" integer,
    "DateRequired" date,
    "DateShipped" date,
    "Status" character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "Orders_pkey" PRIMARY KEY ("OrderID"),
    CONSTRAINT "this references employeeId in employees" FOREIGN KEY ("FulFilledByEmployeeID")
        REFERENCES public."Employees" ("EmployeeID") MATCH SIMPLE

    CONSTRAINT "this references paymentId in payments" FOREIGN KEY ("PaymentID")
        REFERENCES public."Payments" ("PaymentID") MATCH SIMPLE

    CONSTRAINT "this references productId in product table" FOREIGN KEY ("ProductID")
        REFERENCES public."Products" ("ProductId") MATCH SIMPLE

)
CREATE TABLE public."Products"
(
    "ProductId" integer NOT NULL,
    "ProductName" character varying(100) COLLATE pg_catalog."default",
    "Description " character varying(300) COLLATE pg_catalog."default",
    "BuyPrice " numeric(5,2),
    CONSTRAINT "Products_pkey" PRIMARY KEY ("ProductId")
)
INSERT INTO public."Customers"(
	"CustomerID ", "FirstName ", "LastName ", "Gender ", "Address ", "Phone ", "Email ", "City ", "Country ")
	VALUES (1, 'John', 'Hibert', 'Male', '284 chaucer st', 084789657, 'john@gmail.com', 'Johannesburg', 'South Africa'),
	(2, 'Thando', 'Sithole', 'Female', '240 Sect 1', 0794445584, 'thando@gmail.com', 'Cape Town', 'South Africa'),
	(3, 'Leon', 'Glen', 'Male', '81 Everton Rd,Gillits', 0820832830, 'Leon@gmail.com', 'Durban', 'South Africa'),
	(4, 'Charl', 'Muller', 'Male', '290A Dorset Ecke', 44856872553, 'Charl.muller@yahoo.com', 'Berlin', 'Germany'),
	(5, 'Julia', 'Stein', 'Female', '2 Wernerring', 448672445058, 'Js234@yahoo.com', 'Frankfurt', 'Germany');

INSERT INTO public."Employees "(
	"EmployeeID ", "FirstName ", "LastName ", "Email ", "JobTitle ")
	VALUES (1, 'Kani', 'Matthew', 'mat@gmail.com', 'Manager'),
	(2, 'Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk'),
	(3, 'Gideon', 'Maduku', 'm@gmail.com', 'Accountant');

INSERT INTO public."Payments"(
	"PaymentID", "CustomerId", "PaymentDate", "Amount")
	VALUES (1, 1,'2018-09-01', 150.75),
		   (5, 2,'2018-09-03', 150.75),
		   (4, 3,'2018-09-03', 700.60);

INSERT INTO public."Products "(
	"ProductId ", "ProductName ", "Description ", "BuyPrice ")
	VALUES (1, 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75),
	(2, 'Classic Car', 'Turnable front wheels, steering function', 550.75),
	(3, 'Sports car', 'Turnable front wheels, steering function', 700.60);


1: SELECT * FROM Customers;
2: SELECT FirstName  FROM Customers;
3: SELECT FirstName  FROM Customers WHERE CustomerID =1;
4: UPDATE Customers SET FirstName ='Lerato', LastName='Mabitso' WHERE CustomerID =1;
5: DELETE FROM Customers WHERE CustomerID = 2
6: SELECT COUNT(DISTINCT Status) FROM Orders;
7: SELECT MAX(Amount) FROM Payments
8: SELECT * FROM Customers ORDER BY Country.
9: SELECT * FROM Products WHERE  BuyPrice BETWEEN R100 AND R600;
10: SELECT * FROM Customers WHERE Country='Germany' AND City ='Berlin';
11: SELECT * FROM Customers WHERE City='Cape Town' OR City ='Durban';
12: SELECT * FROM Products Where BuyPrice > 500;
13: SELECT SUM(Amount) FROM Payments;
14: SELECT COUNT(*) FROM Orders; WHERE Status = 'Shipped' ;
15: SELECT AVG(BuyPrice) FROM  Products;
16: SELECT Customers.FirstName, Customers.LastName, Payments.PaymentDate,Payments.Amount
  	   FROM Payments INNER JOIN Customers ON Payments.PaymentDate.CustomerId = Customers.CustomerID ; 
17: SELECT * FROM Products WHERE Description LIKE 'Turnable%';
