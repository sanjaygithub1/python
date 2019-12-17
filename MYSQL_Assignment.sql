#Create/Drop DB and Create Table
DROP DATABASE IF EXISTS `sql_dummy`;
CREATE DATABASE `sql_dummy`; 
USE `sql_dummy`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `pmt_mth` (
  `pmt_mth_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`pmt_mth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO `pmt_mth` VALUES (1,'Credit Card');
INSERT INTO `pmt_mth` VALUES (2,'Cash');
INSERT INTO `pmt_mth` VALUES (3,'Wallet');
INSERT INTO `pmt_mth` VALUES (4,'Debit Card');
INSERT INTO `pmt_mth` VALUES (5,'Net Banking');

#Update Table
UPDATE pmt_mth
SET name = 'COD';

UPDATE pmt_mth
SET name = 'COD'
WHERE pmt_mth_id = 2;

#Delete Table
DELETE FROM pmt_mth;

DELETE FROM pmt_mth WHERE pmt_mth_id = 5;

#Alter table
ALTER TABLE pmt_mth
ADD Remarks varchar(255);

ALTER TABLE pmt_mth
DROP Remarks;

ALTER TABLE pmt_mth
MODIFY Remarks varchar(250);

#inner join : Inner keyword is optional. Inner join retruns all common records based on matching fields

SELECT 
    orders.customer_id,
    order_id,
    first_name,
    last_name
FROM
    orders
        INNER JOIN
    customers ON orders.customer_id = customers.customer_id
ORDER BY orders.customer_id;

#Outer Join - Left Join: Matching from both tables and Non-matching from left table only(It means all the rcords from left table and matching ones in both)
#Outer keyword is optional. We want to find out all the customers who have order id or not.
SELECT 
    c.customer_id,
    order_id,
    first_name
FROM
    customers c
		LEFT OUTER JOIN
    orders o
     ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

#Outer Join - Right Join: Matching from both tables and Non-matching from right table only(It means all the rcords from right table and matching ones in both).Outer keyword is optional. We want to find out all the customers who have order id or not. Note here we have swapped table positions.
SELECT 
    c.customer_id,
    order_id,
    first_name
FROM
    orders o
		RIGHT OUTER JOIN
    customers c
     ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

#Union : Combining results of two queries; Number of columns (in Select clause) return by each query must be same.
SELECT 
    order_id, 
    order_date, 
    'Active' AS status
FROM
    orders
WHERE
    order_date >= '2019-01-01';
UNION
SELECT 
    order_id, 
    order_date, 
    'Archived' AS status
FROM
    orders
WHERE
    order_date < '2019-01-01';
        
#INSERT row; BIRTHDATE AND PHONE ARE OPTIONAL FIELDS AND THEY CAN BE NULL SO WE CAN USE DEFAULT OR NULL. POINT FIELD DEFAULT VALUE IS ZERO SO WE CAN USE DEFAULT KEYWORD. WE CAN INSERT SINGLE, MULTIPLE ROWS IN SINGLE QUERIES AT A TIME

INSERT INTO customers (
customer_id,
first_name,
last_name,
birth_date,
phone,
address,
city,
state,
points)
VALUES(DEFAULT,'SAD','GUM',NULL,NULL,'MA','AHM','GJ',DEFAULT),
	(DEFAULT,'SAN','GUQ',NULL,NULL,'MANI','ADI','GJ',DEFAULT)

#INSERT MULTIPLE ROWS into MULTIPLE TABLES

INSERT INTO orders (
customer_id, 
order_date, 
status)
VALUES(1, '2019-01-02', 1);

INSERT INTO order_items 
VALUES 
 (LAST_INSERT_ID(), 1,1,2.95),
 (LAST_INSERT_ID(), 2,1,3.95)