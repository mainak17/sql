-- Data Science Skills
SELECT candidate_id
FROM candidates where skill in('Python','Tableau','PostgreSQL')
group by candidate_id
having count(candidate_id)=3;

--Page With No Likes
select distinct p.page_id from pages p 
LEFT JOIN 
page_likes pl 
on p.page_id=pl.page_id where liked_date is null
order by page_id;

--Unfinished Parts
SELECT distinct part FROM parts_assembly where finish_date is null;

-- Laptop vs. Mobile Viewership
select distinct (SELECT COUNT(1) FROM viewership where device_type = 'laptop') as laptop_views,
(SELECT COUNT(1) FROM viewership where device_type != 'laptop') as mobile_views from viewership;

-- Cities With Completed Trades
SELECT u.city,count(*) as total_orders FROM trades t
LEFT JOIN
users u 
on t.user_id = u.user_id
where t.status = 'Completed'
GROUP BY u.city
order by count(*) desc
limit 3;

--Final Account Balance
select account_id, sum(amt) as final_balance
from
(select *,
CASE
    WHEN transaction_type='Deposit' THEN amount*1
    WHEN transaction_type='Withdrawal' then amount*-1
END AS amt 
from transactions
) tbl
group by account_id;

## Pharmacy Analytics (Part 3) [CVS Health SQL Interview Question]
SELECT manufacturer,
concat('$'|| round(sum(total_sales)/1000000,0) || ' million') as sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY round(sum(total_sales)/1000000,0) desc;
