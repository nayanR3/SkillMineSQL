create TABLE CUSTOMER
(
    CustomerID int UNIQUE ,
    CustomerName varchar(30) not null,
    city varchar(30),
    PostalCode int,
    country varchar(30) DEFAULT 'India'
);


INSERT INTO CUSTOMER VALUES (013, 'Holmes', 'London', 001110, 'UK');
INSERT INTO CUSTOMER VALUES (001, 'Micheal', 'New York', 100201, 'USA');
INSERT INTO CUSTOMER VALUES (020, 'Albert', 'New York', 100201, 'USA');
INSERT INTO CUSTOMER VALUES (025, 'Ravindran', 'Bangalore', 010200, 'India');
INSERT INTO CUSTOMER VALUES (015, 'Stuart', 'London', 001110, 'UK');
INSERT INTO CUSTOMER VALUES (002, 'Bolt', 'New York', 100201, 'USA');
INSERT INTO CUSTOMER VALUES (018, 'Fleming', 'Brisban', 800100, 'Australia');
INSERT INTO CUSTOMER VALUES (021, 'Jacks', 'Brisban', 800100, 'Australia');
INSERT INTO CUSTOMER VALUES (019, 'Yearannaidu', 'Chennai', 909808, 'India');
INSERT INTO CUSTOMER VALUES (005, 'Sasikant', 'Mumbai', 150191, 'India');
INSERT INTO CUSTOMER VALUES (007, 'Ramanathan', 'Chennai', 909808, 'India');
INSERT INTO CUSTOMER VALUES (022, 'Avinash', 'Mumbai', 150191, 'India'    );
INSERT INTO CUSTOMER VALUES (004, 'Winston', 'Brisban', 800100, 'Australia');
INSERT INTO CUSTOMER VALUES (023, 'Karl', 'London', 001110, 'UK');
INSERT INTO CUSTOMER VALUES (006, 'Shilton', 'Torento', 505050, 'Canada');
INSERT INTO CUSTOMER VALUES (010, 'Charles', 'Hampshair', 909009, 'UK');
INSERT INTO CUSTOMER VALUES (017, 'Srinivas', 'Bangalore', 010200, 'India');
INSERT INTO CUSTOMER VALUES (012, 'Steven', 'SanJose', 100100, 'USA');
INSERT INTO CUSTOMER VALUES (008, 'Karolina', 'Torento', 505050, 'Canada');
INSERT INTO CUSTOMER VALUES (003, 'Martin', 'Torento', 505050, 'Canada');
INSERT INTO CUSTOMER VALUES (009, 'Ramesh', 'Mumbai', 150191, 'India');
INSERT INTO CUSTOMER VALUES (014, 'Rangarappa', 'Bangalore', 010200, 'India');
INSERT INTO CUSTOMER VALUES (016, 'Venkatpati', 'Bangalore', 010200, 'India');
INSERT INTO CUSTOMER VALUES (011, 'Sundariya', 'Chennai', 909808, 'India');


SELECT * from CUSTOMER 


--Q1. Write a statement that will select the City column from the Customers table
SELECT city from CUSTOMER


--Q2. Select all the different values from the Country column in the Customers table.
SELECT distinct country from CUSTOMER


--Q3. Select all records where the City column has the value "London
select * from CUSTOMER where city = 'London'


--Q4. Use the NOT keyword to select all records where City is NOT "Bangalore".
SELECT * from CUSTOMER where city not like 'Bangalore'


--Q5. Select all records where the CustomerID column has the value 23.
SELECT * from CUSTOMER where CustomerID = 23


--Q6. Select all records where the City column has the value 'Bangalore' and the PostalCode column has the value 10200. 
select * from CUSTOMER where City = 'Bangalore' and PostalCode = 10200


--Q7. Select all records where the City column has the value 'Bangalore' or 'London'.
SELECT * from CUSTOMER where City = 'Bangalore' or City = 'London'


--Q8. Select all records from the Customers table, sort the result alphabetically by the column City. 
SELECT * from CUSTOMER order by City


--Q9. Select all records from the Customers table, sort the result reversed alphabetically by the column City. 
SELECT * from CUSTOMER order by City desc


--Q10. Select all records from the Customers table, sort the result alphabetically, first by the column country, then, by the column City
SELECT * from CUSTOMER order by Country, City


--Q11.Select all records from the Customers where the PostalCode column is empty. 
select * from CUSTOMER where PostalCode = null


--Q12. Select all records from the Customers where the PostalCode column is NOT empty. 
select * from CUSTOMER where PostalCode not like null


--Q13. Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Canada".
UPDATE  Customer SET  City = 'Oslo' WHERE  Country = 'Canada';
select city from Customer where Country = 'Canada'


--Q14. Delete all the records from the Customers table where the Country value is 'USA'.
DELETE from Customer where Country = 'USA';


--Q15. Use the MIN function to select the record with the smallest value of the Price column.
ALTER TABLE Customer add Price INT
SELECT * from Customer order by CustomerID
UPDATE Customer set Price =12000 WHERE CustomerID =3
UPDATE Customer set Price =10000 WHERE CustomerID =4
UPDATE Customer set Price =15000 WHERE CustomerID =5
UPDATE Customer set Price =9000 WHERE CustomerID =6
UPDATE Customer set Price =91000 WHERE CustomerID =7
UPDATE Customer set Price =8000 WHERE CustomerID =8
UPDATE Customer set Price =7500 WHERE CustomerID =9
UPDATE Customer set Price =10000 WHERE CustomerID =10

-- SELECT CustomerId, CustomerName, city, postalcode, country, MIN(Price) as min_price from customer
SELECT MIN(Price) as min_price from customer


--Q16. Use an SQL function to select the record with the highest value of the Price column.
SELECT MAX(price) as max_price from customer


--Q17. Use the correct function to return the number of records that have the Price value set to 20


--Q18. Use an SQL function to calculate the average price of all products.
SELECT AVG(Price) as Average from Customer


--Q19. Use an SQL function to calculate the sum of all the Price column values in the Products table
select SUM(price) as Sum from Customer


--Q20. Select all records where the value of the City column starts with the letter "M".
SELECT * from customer where city LIKE 'M%'


--Q21. Select all records where the value of the City column ends with the letter "n".
SELECT * from customer where city LIKE '%n'


--Q22. Select all records where the value of the City column contains the letter "a".
SELECT * from customer where city LIKE '%a%'


--Q23. Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
SELECT * from customer where city LIKE 'L%n'


--Q24. Select all records where the value of the City column does NOT start with the letter "a".
SELECT * from customer where city NOT LIKE '%a%'


--Q25. Select all records where the second letter of the City is an "a".
SELECT * from customer where city LIKE '_a%'


--Q26. Select all records where the first letter of the City is an "a" or a "c" or an "s".
SELECT * from customer where city LIKE '[acs]%' 


--Q27. Select all records where the first letter of the City starts with anything from an "a" to an "f".
SELECT * from customer where city LIKE '[a-f]%'


--Q28. Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
SELECT * from customer where city not LIKE '[acf]%' 


--Q29. Use the IN operator to select all the records where the Country is either "UK" or "Canada".
SELECT * FROM Customer WHERE Country IN ('UK', 'Canada');


--Q30. Use the IN operator to select all the records where Country is NOT "UK" and NOT "Canada".
SELECT * FROM Customer WHERE Country not IN ('UK', 'Canada');


--Q31. Use the BETWEEN operator to select all the records where the value of the Price column is between 8000 and 12000
SELECT * FROM Customer WHERE Price BETWEEN 8000 and 15000;


--Q32. Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 8000 and 15000.
SELECT * FROM Customer WHERE Price NOT BETWEEN 8000 AND 15000;


--Q33. Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Martin' and 'Stuart'.
SELECT * from Customer where CustomerName BETWEEN 'Martin' AND 'Stuart'


--Q34. When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
SELECT CustomerID, CustomerName, PostalCode as Pno FROM Customer


--Q35. When displaying the Customers table, refer to the table as Consumers instead of Customers.
SELECT Consumers.* from Customer as Consumers


--Q36. List the number of customers in each country. 
SELECT COUNT (CustomerID) as count, Country FROM Customer GROUP BY Country ORDER BY  COUNT(CustomerID) DESC


--Q37. List the number of customers in each country, ordered by the country with the most customers first.
SELECT COUNT (CustomerName) as List, Country FROM Customer GROUP BY Country ORDER by  COUNT(CustomerName) DESC


--Q38. Write the correct SQL statement to create a new database called testDB.
CREATE DATABASE testDB;


--Q39. Write the correct SQL statement to delete a database named testDB
DROP DATABASE testDB;


--Q40. Add a column of type DATE called Birthday in Persons table
CREATE TABLE person (BDay DATE)
select * from person

INSERT into person VALUES (cast('12-21-2000' as date))

--Q41. Delete the column Birthday from the Persons table
-- note if table contains only one column and you try to delete it 
-- then you get error
-- because table must have at least one data column

ALTER TABLE person DROP COLUMN Bday;

ALTER TABLE person add age INT
UPDATE person set age =22 WHERE BDay ='12-21-2000'

insert into person values (cast('12-20-2002' as date), 18)