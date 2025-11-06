create database drug_sales_db;
use drug_sales_db;
drop database drug_sales_db;

create table drug_sales (
id int auto_increment primary key,
drug_name varchar(100),
manufacturer varchar(100),
dosage_form varchar(50),
strength varchar(50),
package_size varchar(50),
units_sold int,
revenue decimal(10,2),
sale_date date,
region varchar(100),
sales_representative varchar(100),
customer_type varchar(50)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sample_Pharmaceutical_Drug_Sales.csv"
INTO TABLE drug_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows
(drug_name, manufacturer, dosage_form, strength, package_size, units_sold, revenue, 
sale_date,  region, sales_representative,  customer_type);

-- Total revenue by region
select region, sum(revenue) as total_revenue
from drug_sales
group by region
order by total_revenue desc;

-- Top 5 best selling drugs by Units sold
select drug_name, sum(units_sold) as total_units
from drug_sales
group by drug_name
order by total_units desc
limit 5;

-- Monthly Revenue
select date_format(sale_date, '%Y-%m') as month, sum(revenue) as monthly_revenue
from drug_sales
group by month
order by month;

-- Revenue by Customer Type
select customer_type, sum(revenue) as total_revenue
from drug_sales
group by customer_type
order by total_revenue desc;

-- Total revenue by manufacturer
select manufacturer, sum(revenue) as total_revenue
from drug_sales
group by manufacturer
order by total_revenue desc;