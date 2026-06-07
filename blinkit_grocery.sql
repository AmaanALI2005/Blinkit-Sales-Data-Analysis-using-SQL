create database blinkit_db;
use blinkit_db;

create table blinkit_grocery (
item_fat_content VARCHAR(20),
    item_identifier VARCHAR(20),
    item_type VARCHAR(100),
    outlet_establishment_year INT,
    outlet_identifier VARCHAR(20),
    outlet_location_type VARCHAR(50),
    outlet_size VARCHAR(20),
    outlet_type VARCHAR(100),
    item_visibility DECIMAL(10,6),
    item_weight DECIMAL(10,2),
    total_sales DECIMAL(10,4),
    rating DECIMAL(3,1)
);

select * from blinkit_grocery;


-- 2. Total number of records
select count(*) as total_records
 from blinkit_grocery;


-- 3. Distinct Item Types
select distinct item_type
from blinkit_grocery;


-- 4. Average Rating
select avg(rating) as avg_rating
from blinkit_grocery;


-- 5. Highest Sales Product
select * from blinkit_grocery 
order by total_sales desc 
limit 1;


-- 6.Total Sales by Item Type
select item_type,
                 sum(total_sales) as total_sales
from blinkit_grocery
group by item_type
order by total_sales 
desc;


-- 7. Average Sales by Fat Content
select item_fat_content,
avg(total_sales) as avg_sales
from blinkit_grocery 
group by item_fat_content;


-- 8. Top 10 Products by Sales
select item_identifier , total_sales 
from blinkit_grocery
order by total_sales
desc limit 10;


-- 9. Total Sales by Outlet Type
select outlet_type , 
sum(total_sales) as total_sales
from blinkit_grocery 
group by outlet_type
order by total_sales desc;


-- 10. Average Rating by Outlet Size
SELECT outlet_size,
       AVG(rating) AS avg_rating
FROM blinkit_grocery
GROUP BY outlet_size;


-- 11. Top Selling Item Type in Each Outlet Type
select outlet_type,
item_type,
 sum(total_sales) as sales
from blinkit_grocery 
group by outlet_type, item_type
order by outlet_type , sales desc ;


-- 12. Top 10 Rank Products by Sales
SELECT item_identifier,
       total_sales,
       RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM blinkit_grocery limit 10 ;


-- 13. Outlet with Highest Total Sales
SELECT outlet_identifier,
       SUM(total_sales) AS total_sales
FROM blinkit_grocery
GROUP BY outlet_identifier
ORDER BY total_sales DESC limit 3;


-- 14. Year-wise Sales Analysis
SELECT outlet_establishment_year,
       SUM(total_sales) AS total_sales
FROM blinkit_grocery
GROUP BY outlet_establishment_year
order by outlet_establishment_year;


-- 15. Percentage Contribution of Each Item Type
SELECT item_type,
       ROUND(
           SUM(total_sales) * 100 /
           (SELECT SUM(total_sales) FROM blinkit_grocery),
           2
       ) AS contribution_percent
FROM blinkit_grocery
GROUP BY item_type
ORDER BY contribution_percent DESC;

