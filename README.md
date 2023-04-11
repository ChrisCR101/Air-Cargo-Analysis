# Air-Cargo-Analysis

Project description
Air Cargo is an aviation company that provides air transportation services for passengers and freight. They use their air crafts to provide different services with the help of partnerships or alliances with other airlines. The company wants to prepare reports on regular passengers, busiest routes, ticket sales details, and other scenarios to improve the ease of travel and booking for customers.

Project Objective:
To ensure that Air Cargo improves their operability and becomes more customer-focused, becomes a favourable choice in air travel, they have requested me as a database administrator, to identify and focus on the following in their report preparation efforts:
o	Identify the regular customers to provide offers.
o	Analyse the busiest route which will help to increase the number of aircrafts required. 
o	Prepare an analysis to determine the ticket sales details. 
Specific operations completed:
1.	Created an ER diagram for the given airlines database.
2.	Wrote a query to create route_details table using suitable data types for the fields, such as route_id, flight_num, origin_airport, destination_airport, aircraft_id, and distance_miles. Implement the check constraint for the flight number and unique constraint for the route_id fields. Also, make sure that the distance miles field is greater than 0.
3.	Wrote a query to display all the passengers (customers) who have travelled in routes 01 to 25. Data from the passengers_on_flights table.
4.	Wrote a query to identify the number of passengers and total revenue in business class from the ticket_details table.
5.	Wrote a query to display the full name of the customer by extracting the first name and last name from the customer table.
6.	Wrote a query to extract the customers who have registered and booked a ticket. Used data from the customer and ticket_details tables.
7.	Wrote a query to identify the customer’s first name and last name based on their customer ID and brand (Emirates) from the ticket_details table.
8.	Wrote a query to identify the customers who have travelled by Economy Plus class using Group By and Having clause on the passengers_on_flights table.
9.	Wrote a query to identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table.
10.	Wrote a query to create and grant access to a new user to perform operations on a database.
11.	Wrote a query to find the maximum ticket price for each class using window functions on the ticket_details table.
12.	Wrote a query to extract the passengers whose route ID is 4 by improving the speed and performance of the passengers_on_flights table.
13.	For the route ID 4, wrote a query to view the execution plan of the passengers_on_flights table.
14.	Wrote a query to calculate the total price of all tickets booked by a customer across different aircraft IDs using rollup function.
15.	Wrote a query to create a view with only business class customers along with the brand of airlines.
16.	Wrote a query to create a stored procedure to get the details of all passengers flying between a range of routes defined in run time. Also, return an error message if the table doesn't exist.
17.	Wrote a query to create a stored procedure that extracts all the details from the routes table where the travelled distance is more than 2000 miles.
18.	Wrote a query to create a stored procedure that groups the distance travelled by each flight into three categories. The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for >6500.
19.	Wrote a query to extract ticket purchase date, customer ID, class ID and specify if the complimentary services are provided for the specific class using a stored function in stored procedure on the ticket_details table. Condition: 
- If the class is Business and Economy Plus, then complimentary services are given as Yes, else it is No.
20.	Wrote a query to extract the first record of the customer whose last name ends with Scott using a cursor from the customer table.





