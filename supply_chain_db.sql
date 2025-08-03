DROP DATABASE supply_chain;
CREATE DATABASE supply_chain;
## using the database
USE supply_chain;
## selecting the data 
select * from Train;

## 1. Identify slow-moving and fast-moving products based on sales trends

with ranked_products as ( 
select *,
ntile(5) over (order by Prior_purchases desc) as purchase_rank
from Train
) 
select *,
case 
when purchase_rank = 1 then 'fast-moving-product'
when purchase_rank = 5 then 'slow-moving-product'
else 'moderate'
end as Movement_category
from ranked_products;

### 2. Detect late shipment patterns by product, supplier, and region

select Warehouse_block as Region,
count(*) as Total_shipments,
sum(case when `Reached.on.Time_Y.N` = 0 then 1 else 0 end) as Late_shipment,
round(sum(case when `Reached.on.Time_Y.N` = 0 then 1 else 0 end) * 100.0 / count(*),2) as Late_shipment_percentage
from Train
group by Warehouse_block
order by Late_shipment_percentage desc;


## 3. Monitor stock availability and demand forecasting for warehouses
### average daily demand per Warehouse
SELECT 
    Warehouse_block,
    ROUND(AVG(Prior_purchases), 2) AS avg_daily_demand,
    SUM(Prior_purchases) AS total_historical_demand
FROM Train
GROUP BY Warehouse_block;




### Threshold for Stock Availability
with forecast as (
	SELECT 
		Warehouse_block,
		ROUND(AVG(Prior_purchases), 2) AS avg_daily_demand,
		ROUND(AVG(Prior_purchases) * 30, 0) AS forecast_30day_demand		
	FROM Train
	GROUP BY Warehouse_block 
)
select 
	Warehouse_block,
    avg_daily_demand,
    forecast_30day_demand,
	50 as assumed_current_stock,
		case
			WHEN 50 < forecast_30day_demand THEN 'At Risk of Stock-Out'
			ELSE 'Stock Sufficient'
		END AS stock_status
from forecast;
    

## 4. Rank products/suppliers based on fulfillment efficiency and delivery SLAs

with delivery_status as (
	select Warehouse_block,
    count(*) as Total_shipments,
    sum(case when `Reached.on.Time_Y.N`= 1 then 1 else 0 end) as Ontime_shipments,
    sum(case when `Reached.on.Time_Y.N`= 1 then 1 else 0 end) * 100 / count(*) as Ontime_shipment_percentage
    from Train
    group by Warehouse_block
    ),
Ranked as (
	select *, 
		rank() over (order by Ontime_shipment_percentage desc) as fulfillment_rank
        from delivery_status
        ) 
select * 
	from Ranked;

## 5. Track rolling sales and inventory turnover using window functions
-- Step 1: Add the shipment_date column
ALTER TABLE Train ADD COLUMN shipment_date DATE;

SET SQL_SAFE_UPDATES = 0;
select * from Train;
-- Step 2: Use a variable to assign sequential dates
SET @row := 0;

UPDATE Train 
SET shipment_date = DATE_ADD('2024-01-01', INTERVAL (@row := @row + 1) DAY);

### Step 3 : Rolling Turnover

WITH rolling_stats AS (
    SELECT 
        shipment_date,
        Prior_purchases AS daily_sales,
        Cost_of_the_Product,

        -- Rolling 7-day Sales
        SUM(Prior_purchases) OVER (
            PARTITION BY Warehouse_block 
            ORDER BY shipment_date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS rolling_7day_sales,

        -- Rolling Avg Inventory (using cost as proxy)
        AVG(Cost_of_the_Product) OVER (
            PARTITION BY Warehouse_block 
            ORDER BY shipment_date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS rolling_avg_inventory
    FROM Train
)
SELECT 
    
    shipment_date,
    daily_sales,
    rolling_7day_sales,
    ROUND(rolling_7day_sales / NULLIF(rolling_avg_inventory, 0), 2) AS rolling_inventory_turnover
FROM rolling_stats
ORDER BY shipment_date;

