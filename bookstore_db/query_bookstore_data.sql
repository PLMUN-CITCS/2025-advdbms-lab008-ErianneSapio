CREATE DATABASE `BookstoreDB`;
USE `BookstoreDB`;

-- Get customer names, order dates, book titles, and quantities
SELECT `c`.`Name` AS `CustomerName`, 
       `o`.`OrderDate`, 
       `b`.`Title` AS `BookTitle`, 
       `od`.`Quantity`
FROM `Customers` `c`
JOIN `Orders` `o` ON `c`.`CustomerID` = `o`.`CustomerID`
JOIN `OrderDetails` `od` ON `o`.`OrderID` = `od`.`OrderID`
JOIN `Books` `b` ON `od`.`ISBN` = `b`.`ISBN`;

-- Update book price
UPDATE `Books` 
SET `Price` = 8.99 
WHERE `ISBN` = '9781234567890';

-- Select book with the updated price
SELECT * FROM `Books` 
WHERE `ISBN` = '9781234567890';

-- Delete an order detail
DELETE FROM `OrderDetails` 
WHERE `OrderID` = 1 AND `ISBN` = '9780321765723';

-- Show remaining order details for order ID 1
SELECT * FROM `OrderDetails` 
WHERE `OrderID` = 1;

-- Get author names and corresponding book titles
SELECT `a`.`Name` AS `AuthorName`, 
       `b`.`Title` AS `BookTitle`
FROM `Authors` `a`
JOIN `BookAuthors` `ba` ON `a`.`AuthorID` = `ba`.`AuthorID`
JOIN `Books` `b` ON `ba`.`ISBN` = `b`.`ISBN`;

-- Get customer names who bought books by a specific author
SELECT `c`.`Name` AS `CustomerName`
FROM `Customers` `c`
JOIN `Orders` `o` ON `c`.`CustomerID` = `o`.`CustomerID`
JOIN `OrderDetails` `od` ON `o`.`OrderID` = `od`.`OrderID`
JOIN `Books` `b` ON `od`.`ISBN` = `b`.`ISBN`
JOIN `BookAuthors` `ba` ON `b`.`ISBN` = `ba`.`ISBN`
JOIN `Authors` `a` ON `ba`.`AuthorID` = `a`.`AuthorID`
WHERE `a`.`Name` = 'Douglas Adams'; -- Change author name as needed

-- Count the total number of books
SELECT COUNT(*) FROM `Books`;
