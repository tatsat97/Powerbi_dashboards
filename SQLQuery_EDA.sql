--get a union of all the three tables and create a new table

select * into dbo.['Hotels']
from ( select * from dbo.['2018$'] union select * from dbo.['2019$'] union select * from dbo.['2020$'])a

-- Let's start with the exploratory Data Analysis

-- Let's see the revenue growth per year 
-- we don't have a revenue column but we do have the average daily rate and stays_in coulumn
-- we can multiply the two to get the results
select * from dbo.['2018$']

select arrival_date_year, 
round(sum((stays_in_weekend_nights + stays_in_week_nights) * adr ), 3) as Revenue
from dbo.['Hotels']
group by arrival_date_year

-- grouping by the type of hotels 
select arrival_date_year, hotel,
round(sum((stays_in_weekend_nights + stays_in_week_nights) * adr ), 3) as Revenue
from dbo.['Hotels']
group by arrival_date_year, hotel
order by hotel,arrival_date_year

-- let's group other tables as well with the help of JOIN statements

 select * from dbo.['Hotels']
	left join dbo.market_segment$
	on ['Hotels'].market_segment = market_segment$.market_segment
	left join dbo.meal_cost$
	on meal_cost$.meal = ['Hotels'].meal


 