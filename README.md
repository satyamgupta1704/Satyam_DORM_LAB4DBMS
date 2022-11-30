# Satyam_DORM_LAB4DBMS

An E-commerce website manages its data in the form of various tables.

We are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the E-commerce with the schema definition provided to us.

Once we are done with the creation, we are required to Insert the data in the tables created above.

Once, both these operations(DDL and DML) are performed, we write DQL queries to query the tables in the database, to achieve a certain goal. We created select queries, applied joins, used subqueries, and also created stored functions for the following display or print purposes - 
Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
Display all the orders along with product name ordered by a customer having Customer_Id=2
Display the Supplier details who can supply more than one product.
Find the least expensive product from each category and print the table with category id, name, product name and price of the product
Display the Id and Name of the Product ordered after “2021-10-05”.
Display customer name and gender whose names start or end with character 'A'.
Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

To solve above problem statement, we used SQL's DDL, DML and DQL queries and executed them using MySQL WorkBench. All the queries being used are saved in a singular file called Lab 4 - DBMS_e-commerce_website.sql.
