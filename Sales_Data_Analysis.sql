use Analysis

--Data exploration
--count of rows
Select count(*) from Sales_data;

--sample data
select top 10 * from Sales_data;

--Data validation and Cleaning
--checking null values

select * from Sales_data
where order_id is null or
order_date is null or
product is null or
price is null or 
quantity is null or 
purchase_type is null or 
payment_method is null or
manager is null or
city is null;

-- check invalid values

select price,quantity from sales_data
where price <=0 or quantity <= 0;

UPDATE sales_data
SET Manager = TRIM(
    REGEXP_REPLACE(Manager, '\s+', ' ')
);

-- creating derived column

alter table Sales_data
add Sales_Year int,
    Sales_Month int,
    Month_Name varchar(20)
    Revenue decimal(18,2);

update Sales_data
set Sales_Year  = YEAR(Order_Date),
    Sales_Month = MONTH(Order_Date),
    Month_Name  = DATENAME(MONTH, Order_Date),
    Revenue    = Price * Quantity;
     
--KPI's

--Total Revenue
select sum(revenue) as Total_Revenue
from sales_data;

--Total Orders
select count(distinct[order_id]) as Total_Orders
from Sales_data;

--Total Quantity Sold
select sum(Quantity) as Total_quantity_sold
from Sales_data;

--Average Order value(AOV)
select sum(revenue) / count(distinct[order_id]) as Average_order_value
from Sales_data;

--monthly revenue (nov-dec 2022)
select sales_year,month_name,SUM(revenue) AS monthly_revenue
from sales_data
group by sales_year,Sales_month, month_name
order by Sales_month;

--best sales day
select top 1 order_date, sum(revenue) as daily_revenue 
from Sales_data
group by order_date
order by daily_revenue desc;

--Business Requirement questions

--1.Which product generates the highest revenue?
select [product], sum(revenue) as Total_revenue
from Sales_data
group by Product
order by total_revenue desc;


--2.Which product performs best each day?
 
with DailyProductSales AS (
     select Order_date,Product,SUM(revenue) AS daily_revenue,
            ROW_NUMBER() OVER (
            PARTITION BY [Order_date]
            ORDER BY SUM(revenue) DESC
        ) as rn
    from sales_data
    group by Order_date, Product
)
select Order_date,Product,daily_revenue
from DailyProductSales
where rn = 1;

--3.Which day had the highest revenue?

select top 1 Order_date, sum(revenue) as daily_revenue
from Sales_data
group by order_date
order by daily_revenue desc;

--4.Is there month-over-month revenue growth?

with monthlyRevenue as(
 select sales_year,sales_month, sum(revenue) as monthly_revenue
 from Sales_data
 group by sales_month, sales_year
 )

 select sales_year, sales_month, monthly_revenue, monthly_revenue 
 - lag(monthly_revenue) over (order by sales_month, sales_year) as growth_amount
 from monthlyrevenue;

 --5.What percentage of total revenue does each product contribute?

 select product, sum(revenue) as product_revenue,
 round( sum(revenue) *100 / (select sum(revenue) from Sales_data),2 ) as reveune_percentage
 from sales_data
 group by product
 order by product_revenue desc;

-- 6.Which cities generate the most revenue?

select city,sum(revenue) as city_revenue
from Sales_data
group by city
order by city_revenue desc;

--7.Top 3 cities by revenue

select city,total_revenue,city_rank
from(
    select city,sum(revenue) as total_revenue,
       DENSE_RANK() OVER (ORDER BY SUM(revenue) DESC) AS city_rank
    from sales_data
    group by City
) t
where city_rank <= 3;

--8.How does revenue accumulate over time?

select order_date, sum(revenue) as daily_revenue,
       sum(sum(revenue)) over( order by order_date) as running_total
from Sales_data
group by order_date
order by order_date;

--9. Which managers contribute the most revenue?

select manager, sum(revenue) as manager_revenue
from Sales_data
group by manager
order by manager_revenue desc;

--10.Which months performed above average?

with monthlyrevenue as (
   select sales_year, sales_month,month_name, sum(revenue) as monthly_revenue
   from Sales_data
   group by sales_year, sales_month,month_name
   )

select * from monthlyrevenue
where monthly_revenue > (SELECT AVG(monthly_revenue) FROM MonthlyRevenue);