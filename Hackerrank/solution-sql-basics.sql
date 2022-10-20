-- Solution 1
select id,name,countrycode,district,population from city where countrycode = 'USA' and population > 100000;

-- Solution 2
select name from city where countrycode = 'usa' and population > 120000;

-- Solution 3
select * from city;

-- Solution 4
select * from city where id = 1661; 

-- Solution 5
select * from city where countrycode = 'JPN';      

-- Solution 6
select name from city where countrycode = 'JPN';   

-- Solution 7
select city,state from station;     

-- Solution 8
select distinct city from station where mod(id,2)=0 order by city;

-- Solution 9
select count(city) - count(distinct city) from station; 

-- Solution 10

-- Solution 11
-- Solution 12
-- Solution 13
-- Solution 14
-- Solution 15
-- Solution 16
-- Solution 17
-- Solution 18
-- Solution 19
-- Solution 20
-- Solution 21
-- Solution 22
-- Solution 23
-- Solution 24
-- Solution 25
