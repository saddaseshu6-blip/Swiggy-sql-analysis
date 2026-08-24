select count(*) from swiggy;
drop table swiggy;

LOAD DATA LOCAL INFILE 'C:/path/to/swiggy.csv'
INTO TABLE swiggy
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

set global local_infile=1;
show global variables like 'local_infiles';

use employees;
show tables;

create table swiggy (
id int,
name text,
city text,
rating text,
rating_count text,
cost text,
cuisine text,
lic_no text,
link text
);

LOAD DATA LOCAL INFILE 'C:/Users/balas/OneDrive/Excel Assignment/swiggy.csv'
INTO TABLE swiggy
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select* from swiggy;

select count(*) as total_rows
from swiggy;

select id,count(*) as duplicate_rows
from swiggy
group by id
order by duplicate_rows;

select*
from swiggy
where id is null
or city is null
or rating is null
or cuisine is null
or name is null;

select
 sum(id is null) as id_names,
sum(name is null) as name,
sum(city is null) as city1,
sum(rating is null) as ratings
from swiggy;

select*
from swiggy
where name=' '
or city=' '
or cuisine=' ';

update swiggy
set name= trim(name),
city=trim(city),
cuisine=trim(cuisine);

select name,city,cuisine
from swiggy;

select* from swiggy;
select*
from swiggy
where rating=' ';

update swiggy
set rating=null
where rating='_ _';

update swiggy
set rating_count=' '
where rating_count='+';

select*
from swiggy
where cast(rating_count as decimal(3,1))<1
or cast(rating_count as decimal (3,1))>6;

select distinct id
from swiggy;

update swiggy
set cost = replace(cost,',','');
select* from swiggy;

update swiggy
set cost=replace(cost,',','');

update swiggy
set rating=trim(rating);

select distinct name 
from swiggy;

update swiggy
set rating = 'null'
where rating = '--';
select* from swiggy;

update swiggy
set cost = ' '
where cost = 'â‚¹';
select* from swiggy;

select city,count(*) as total
from swiggy
group by city
order by total desc;

select menu,count(*) as total_orders
from swiggy
group by menu
having total_orders >1;

update swiggy
set name=upper(trim(name));
select* from swiggy;

select cuisine,city,address,count(*) as total
from swiggy
group by cuisine,city,address
having total >1;

select*
from swiggy
where cuisine is null
or trim(cuisine) = ' ';

select*
from swiggy
where rating is null
or trim(rating) = ' ';

select*
from swiggy
limit 100;

update swiggy
set rating = 'No rating'
where rating = 'no value';
select* from swiggy;

select*
from swiggy
limit 200;

select count(*) from swiggy;

select
sum(case when name is null then 1 else 0 end) as null_names,
sum(case when rating is null then 1 else 0 end) as null_ratings,
sum(case when city is null then 1 else 0 end) as null_cities
from swiggy;

delete from swiggy
where rating = 'New' or rating_count = '--';

update swiggy
set rating = cast(rating as decimal (2,1))
where rating not in ('new','--');

select city,count(*) as total_restaurants
from swiggy
group by city
order by total_restaurants desc
limit 20;

select cuisine,count(*) as count
from swiggy
group by cuisine
order by count desc
limit 10;

select name,count(*) as branches
from swiggy
group by name
order by branches desc
limit 20;

select city, round(avg(cast(rating as float)),2) as avg_rating,
count(*) as total_restaurant
from swiggy
where rating not in ('--')
group by city
having total_restaurant > 50
order by avg_rating desc
limit 5;

select city,round(avg(cast(replace(cost,',',' ') as signed)),2) as avg_cost
from swiggy
where cost is not null
group by city
order by avg_cost desc
limit 10;

select cuisine,round(avg(cast(rating as float)),2) as avg_rating,
count(*) as total_restaurants
from swiggy
where rating not in ('--')
group by cuisine
having total_restaurants >100
order by total_restaurants desc
limit 10;

select name,city,rating,rating_count,cost
from swiggy
where cast(rating as float) >=4.5 and cast(replace(rating_count,'+',' ') as signed)	>=1000
order by rating desc
limit 20;

select city,
round(avg(cast(rating as float)),2) as avg_rating,
round(avg(cast(replace(cost,',',' ')as signed)),0) as avg_count
from swiggy
where rating not in ('--')
group by city
having count(*) >50
order by avg_rating desc,avg_count asc
limit 10;


--- city has most restaurants on swiggy
select city,count(*) 
from swiggy
group by city
order by count(*) desc
limit 1;

select cuisine,count(*)
from swiggy
group by cuisine
order by count(*) desc
limit 1;

select name,count(*)  as branches
from swiggy
group by name
order by branches desc
limit 1;


select city,round(avg(cast(rating as decimal(3,2))),2) as avg_rating,count(*)
from swiggy
where rating not in ('--')
group by city
having count(*) >50
order by avg_rating desc
limit 1;

select city,round(avg(cast(replace(cost,'+',' ') as  signed)),2) as avg_cost,
count(*)
 from swiggy
 group by city
 having count(*)
 order by avg_cost asc
 limit 1;