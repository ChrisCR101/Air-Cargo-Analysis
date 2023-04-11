#Air Cargo Analysis

/*Creating the database and used import data wizard to import table data in to air cargo database in customer, passengers_on_flights, ticket_details tables)*/
CREATE DATABASE air_cargo
USE air_cargo;

/* Write query to create route_details table using suitable data types for the fields, such as route_id, flight_num, 
origin_airport, destination_airport, aircraft_id, and distance_miles. Implement the check constraint for the flight number 
and unique constraint for the route_id fields. Also, make sure that the distance miles field is greater than 0.*/

CREATE TABLE route_details (
  route_id INT NOT NULL UNIQUE,
  flight_num VARCHAR(10) NOT NULL,
  origin_airport VARCHAR(50) NOT NULL,
  destination_airport VARCHAR(50) NOT NULL,
  aircraft_id VARCHAR(50) NOT NULL,
  distance_miles INT NOT NULL CHECK (distance_miles > 0),
  PRIMARY KEY (route_id)
);
/* Used INSERT INTO statement for data insertion in to table*/
INSERT INTO route_details (route_id, flight_num, origin_airport, destination_airport, aircraft_id, distance_miles) 
VALUES 
(1, '1111', 'EWR', 'HNL', '767-301ER', 4962),
(2, '1112', 'HNL', 'EWR', '767-301ER', 4962),
(3, '1113', 'EWR', 'LHR', 'A321', 3466),
(4, '1114', 'JFK', 'LAX', '767-301ER', 2475),
(5, '1115', 'LAX', 'JFK', '767-301ER', 2475),
(6, '1116', 'HNL', 'LAX', '767-301ER', 2556),
(7, '1117', 'LAX', 'ORD', 'A321', 1745),
(8, '1118', 'ORD', 'EWR', 'A321', 719),
(9, '1119', 'DEN', 'LAX', 'ERJ142', 862),
(10, '1120', 'HNL', 'DEN', 'A321', 3365),
(12, '1122', 'ABI', 'ADK', '767-301ER', 4300),
(13, '1123', 'ADK', 'BQN', 'A321', 2232),
(14, '1124', 'BQN', 'CAK', 'A321', 2445),
(15, '1125', 'CAK', 'ANI', '767-301ER', 2000),
(16, '1126', 'ALB', 'APN', 'A321', 1700),
(17, '1127', 'APN', 'BLV', '767-301ER', 1900),
(18, '1128', 'ANI', 'BGR', 'ERJ142', 2450),
(19, '1129', 'ATW', 'AVL', 'A321', 2222),
(20, '1130', 'AVL', 'BOI', '767-301ER', 3134),
(21, '1131', 'BFL', 'BET', 'A321', 2425),
(22, '1132', 'BGR', 'BJI', 'ERJ142', 1242),
(23, '1133', 'BLV', 'BFL', '767-301ER', 2354),
(24, '1134', 'BJI', 'BQN', 'A321', 1575),
(25, '1135', 'RDM', 'BJI', 'A321', 2425),
(26, '1136', 'BET', 'BTM', 'ERJ142', 1311),
(27, '1137', 'BOI', 'CLD', 'A321', 578),
(28, '1138', 'BOS', 'CDC', '767-301ER', 246),
(29, '1139', 'BKG', 'CRW', '767-301ER', 909),
(30, '1140', 'BUR', 'STT', 'CRJ900', 780),
(31, '1141', 'BTM', 'CHA', 'ERJ142', 660),
(32, '1142', 'CLD',	'CHI', '767-301ER',	246),
(33, '1143', 'CDC', 'CST','CRJ900', 1345),
(34, '1144', 'CDW', 'COD', 'A321', 2452),
(35, '1145', 'STT', 'CDB', 'ERJ142', 2121),
(36, '1146', 'CHA', 'COU', 'CRJ900', 1212),
(37, '1147', 'CHI', 'CST', '767-301ER', 999),
(38,'1148', 'CST', 'DAL','A321', 1111),
(39, '1149', 'COD', 'SCC', 'CRJ900', 1579),
(40, '1150', 'CDB', 'DEC', 'A321', 909),
(41, '1151', 'CAE', 'DRT', 'ERJ142', 898),
(42, '1152', 'CSG', 'BOS', '767-301ER', 890),
(43,'1153', 'CBM', 'BOI', 'A321', 8989),
(44,'1154','COU', 'CAK', '767-301ER', 7676),
(45, '1155', 'CCR',	'EWR', 'CRJ900', 676),
(46,1156, 'CDV', 'HNL', '767-301ER', 8668),
(47, '1157', 'DAL','LAX','CRJ900', 675),
(48, '1158','SCC','DEN', 'A321', 5645),
(49, '1159', 'DEC', 'ABI','A321', 4533),
(50, '1160', 'DRT', 'ORD', 'A321', 2445);

# To verify all existent tables in aircargo
SHOW TABLES;

/* Write a query to display all the passengers (customers) who have travelled in routes 01 to 25. 
Take data  from the passengers_on_flights table.*/
SELECT customer_id
FROM passengers_on_flights
WHERE route_id BETWEEN '01' AND '25';

/* Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.*/
SELECT IF(GROUPING (class_id), 'Total', class_id) AS Class, 
COUNT(*) AS Total_Passengers, SUM(no_of_tickets*price_per_ticket) AS Total_revenue
FROM ticket_details
GROUP BY class_id with rollup
ORDER BY Total_Revenue;

/* Write a query to display the full name of the customer by extracting the first name and last name from the customer table.*/
SELECT UCASE(CONCAT(first_name, ' ' , last_name)) AS Full_name 
FROM air_cargo.customer;

/* Write a query to extract the customers who have registered and booked a ticket. Use data from the customer and ticket_details tables.*/
SELECT first_name, last_name, customer_id, COUNT(no_of_tickets) AS Total_Tickets_Booked
FROM customer
JOIN ticket_details USING (customer_id)
GROUP BY customer_id, first_name, last_name
ORDER BY total_tickets_booked desc;

/* Write a query to identify the customer’s first name and last name based on their customer ID and brand (Emirates) from the ticket_details table.*/
SELECT customer.first_name, customer.last_name
FROM customer
JOIN ticket_details
ON customer.customer_id = ticket_details.customer_id
WHERE ticket_details.brand = 'Emirates';

/* Write a query to identify the customers who have travelled by Economy Plus class using Group By and Having clause on the passengers_on_flights table.*/
SELECT customer_id, route_id, class_id
FROM passengers_on_flights
GROUP BY customer_id, route_id, class_id
HAVING class_id = 'Economy Plus';

/* Write a query to identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table.*/
SELECT IF(SUM(no_of_tickets*price_per_ticket) > 10000, "Yes","No")
FROM ticket_details;

/* Write a query to create and grant access to a new user to perform operations on a database.*/
CREATE USER 'user101'@'localhost' IDENTIFIED BY 'user101';
GRANT ALL PRIVILEGES 
ON air_cargo.ticket_details
TO user101@localhost;

/* Write a query to find the maximum ticket price for each class using window functions on the ticket_details table.*/
SELECT distinct class_id, max(price_per_ticket) over (partition by class_id)
as 'Max_Ticket_Price)'
FROM ticket_details;

/* Write a query to extract the passengers whose route ID is 4 by improving the speed and performance of the passengers_on_flights table.*/
SELECT *
FROM passengers_on_flights
WHERE route_id = '4';
CREATE INDEX route_id_4 on passengers_on_flights(route_id);

/*For the route ID 4, write a query to view the execution plan of the passengers_on_flights table.*/
SELECT * FROM passengers_on_flights
WHERE route_id = '4';

/*Write a query to calculate the total price of all tickets booked by a customer across different aircraft IDs using rollup function.*/
SELECT customer_id, SUM(price_per_ticket) as total_price, count(aircraft_id)
FROM ticket_details
GROUP BY customer_id WITH ROLLUP;

/*Write a query to create a view with only business class customers along with the brand of airlines.*/
CREATE VIEW business_class_view AS
SELECT customer_id, class_id, brand
FROM AIR_CARGO.ticket_details
WHERE class_id = 'Business'
ORDER BY brand;

/*Write a query to create a stored procedure to get the details of all passengers flying between a range of routes defined in run time. 
Also, return an error message if the table doesn't exist.*/
DELIMITER //

CREATE PROCEDURE route_details(
  IN origin_airport VARCHAR(255),
  IN destination_airport VARCHAR(255)
)
BEGIN
  IF NOT EXISTS (SELECT * FROM air_cargo.route_details WHERE table_name = 'route_details') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Table passenger_details does not exist.';
  ELSE
    SELECT * FROM route_details WHERE route_id BETWEEN origin_airport AND destination_airport;
  END IF;
END//

DELIMITER ;

/*Write a query to create a stored procedure that extracts all the details from the routes 
table where the travelled distance is more than 2000 miles.*/
DELIMITER //
CREATE PROCEDURE Travel_distance_miles() 
BEGIN
SELECT * FROM Route_details WHERE 
distance_miles > 2000 ;
END //

CALL Travel_distance_miles() ;

/*Write a query to create a stored procedure that groups the distance travelled by each flight into three categories. 
The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) for >2000 AND <=6500, 
and long-distance travel (LDT) for >6500.*/
DELIMITER &&
CREATE FUNCTION distance_travelled(distance_miles INT)
RETURNS VARCHAR(200) deterministic
BEGIN 
DECLARE distance_travelled VARCHAR (200);
IF distance_miles BETWEEN 0 AND 2000 THEN SET distance_travelled = 'Short Distance Travel (SDT)';
ELSEIF distance_miles BETWEEN 2000 AND 6500 THEN SET distance_travelled = 'Intermediate Distance Travel (IDT)';
ELSEIF distance_miles > 6500 THEN SET distance_travelled = 'Long-Distance Travel (LDT)';
END IF; 
RETURN (distance_travelled);
END &&
DELIMITER &&
SELECT route_id, flight_num, origin_airport, destination_airport, aircraft_id, distance_travelled (distance_miles) AS distance_miles
FROM route_details
ORDER BY distance_miles;

/*Write a query to extract ticket purchase date, customer ID, class ID and specify if the complimentary services are provided for the specific 
class using a stored function in stored procedure on the ticket_details table. Condition: If the class is Business and Economy Plus, then complimentary services are given as Yes, else it is No. */
DROP FUNCTION complimentary_services;
DELIMITER &&
CREATE FUNCTION Complimentary_services (Class TEXT)
RETURNS TEXT DETERMINISTIC
BEGIN
DECLARE Services TEXT ;
IF
Class = 'Bussiness' THEN SET Services = 'Yes' ;
ELSEIF Class = 'Economy Plus' THEN SET Services = 'Yes' ;
ELSE SET Services = 'No' ;
END IF;
RETURN (Services);
END &&

SELECT p_date, customer_id, class_id, complimentary_services(class_id) AS complimentary_services 
FROM ticket_details;

/*Write a query to extract the first record of the customer whose last name ends with Scott using a cursor from the customer table.*/
DELIMITER &&
CREATE PROCEDURE customer_cursor ()
BEGIN
DECLARE a VARCHAR (100);
DECLARE b VARCHAR (100);
DECLARE customer_cursor CURSOR FOR SELECT last_name, first_name FROM customer 
WHERE last_name = 'Scott'; 
OPEN customer_cursor; 
REPEAT FETCH customer_cursor INTO a,b;
UNTIL b = 0 END REPEAT; 
SELECT a as last_name, b as first_name; 
CLOSE customer_cursor; END;
&& DELIMITER ;

CALL customer_cursor();




















