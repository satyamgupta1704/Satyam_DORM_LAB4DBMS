# Create Database ecom_store which manages e-commerce website.
create database if not exists ecom_store;

# Using the created db ecom_store.
use ecom_store;

# Create all the required tables to store e-commerce data.
-- Supplier
create table if not exists supplier
(
supp_id int unsigned primary key,
supp_name varchar(50) not null,
supp_city varchar(50) not null,
supp_phone varchar(50) not null
);

-- Customer
create table if not exists customer
(
cus_id int unsigned primary key,
cus_name varchar(20) not null,
cus_phone varchar(10) not null,
cus_city varchar(30) not null,
cus_gender enum('M','F')
);

-- Category
create table if not exists category
(
cat_id int unsigned primary key,
cat_name varchar(20) not null
);

-- Product
create table if not exists product
(
pro_id int unsigned primary key,
pro_name varchar(20) not null default "Dummy",
pro_desc varchar(60),
cat_id int unsigned not null,
foreign key(cat_id) references category(cat_id)
);

-- Supplier_pricing
create table if not exists supplier_pricing
(
pricing_id int unsigned primary key,
pro_id int unsigned not null,
foreign key(pro_id) references product(pro_id),
supp_id int unsigned not null,
foreign key(supp_id) references supplier(supp_id),
supp_price int default 0
);

-- Order
create table if not exists `order`
(
ord_id int unsigned primary key,
ord_amount int not null,
ord_date date not null,
cus_id int unsigned not null,
foreign key(cus_id) references customer(cus_id),
pricing_id int unsigned not null,
foreign key(pricing_id) references supplier_pricing(pricing_id)
);

-- Rating
create table if not exists rating
(
rat_id int unsigned primary key,
ord_id int unsigned not null,
foreign key(ord_id) references `order`(ord_id),
rat_ratstars int not null
);

# Insertion of e-commerce data in the tables created above.
-- Supplier
INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

-- Customer
INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

-- Category
INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

-- Product
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

-- Supplier_pricing
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

-- Order
INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

-- Rating
INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

/* Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. */
select t2.cus_gender as customer_gender, count(t2.cus_id) as total_customers from
(select t1.cus_id, t1.ord_amount, t1.cus_gender, t1.cus_name from 
(select `order`.*, customer.cus_gender, customer.cus_name from `order` inner join customer where 
`order`.cus_id = customer.cus_id having `order`.ord_amount >= 3000)
as t1 group by t1.cus_id) as t2 group by t2.cus_gender;

/* Display all the orders along with product name ordered by a customer having Customer_Id=2. */
select product.pro_name, `order`.* from `order`, supplier_pricing, product
where `order`.cus_id = 2 and 
`order`.pricing_id = supplier_pricing.pricing_id and
supplier_pricing.pro_id = product.pro_id;

/* Display the Supplier details who can supply more than one product. */
select supplier.* from supplier where supplier.supp_id in 
(select supp_id from supplier_pricing group by supp_id having 
count(supp_id) > 1) group by supplier.supp_id;

/* Find the least expensive product from each category and print the table with category id, name, product name and price of the product. */
select category.cat_id, category.cat_name, min(t3.min_price) as min_price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join  
(select pro_id, min(supp_price) as min_price from supplier_pricing group by pro_id) 
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;

/* Display the Id and Name of the Product ordered after “2021-10-05”. */
select product.pro_id,product.pro_name from `order` 
inner join supplier_pricing on supplier_pricing.pricing_id = `order`.pricing_id 
inner join product on product.pro_id = supplier_pricing.pro_id 
where `order`.ord_date > "2021-10-05";

/* Display customer name and gender whose names start or end with character 'A'. */
select customer.cus_name, customer.cus_gender from customer 
where customer.cus_name like 'A%' or customer.cus_name like '%A';

/* Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
For Type_of_Service, If rating =5, print “Excellent Service”, If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. */
DELIMITER //
CREATE PROCEDURE ecom_proc()
BEGIN
select report.supp_id, report.supp_name, report.avg_rating,
CASE
	WHEN report.avg_rating = 5 THEN 'Excellent Service'
    WHEN report.avg_rating > 4 THEN 'Good Service'
    WHEN report.avg_rating > 2 THEN 'Average Service'
    ELSE 'Poor Service'
END AS type_of_service from 
(select final.supp_id, supplier.supp_name, final.avg_rating from
(select test.supp_id, sum(test.rat_ratstars) / count(test.rat_ratstars) as avg_rating from
(select supplier_pricing.supp_id, test.ord_id, test.rat_ratstars from supplier_pricing inner join
(select `order`.pricing_id, rating.ord_id, rating.rat_ratstars from `order` inner join rating on rating.`ord_id` = `order`.ord_id) 
as test on test.pricing_id = supplier_pricing.pricing_id) 
as test group by supplier_pricing.supp_id) 
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
END //
DELIMITER ;

call ecom_proc();
