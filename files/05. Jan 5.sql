--cross joins

CREATE TABLE Meals(MealName VARCHAR(100))
CREATE TABLE Drinks(DrinkName VARCHAR(100))

INSERT INTO Drinks VALUES('Orange Juice'), ('Tea'), ('Cofee')
INSERT INTO Meals VALUES('Omlet'), ('Fried Egg'), ('Sausage')

SELECT * FROM Meals
SELECT * FROM Drinks


SELECT * FROM Meals CROSS JOIN Drinks
SELECT * FROM Meals , Drinks


SELECT CONCAT_WS('--',MealName,DrinkName) AS MenuList
FROM Meals CROSS JOIN 
Drinks