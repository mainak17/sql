--User's Third Transaction

select
  user_id,spend,transaction_date
from
(
  select
    *,
    row_number() over (partition by user_id order by transaction_date) as rnk
  from transactions
) tbl
where rnk = 3;

--Compensation Outliers
select * from (
select tbl.employee_id,tbl.salary,
CASE
    WHEN salary > 2*avg THEN 'Overpaid'
    WHEN salary < avg/2 THEN 'Underpaid'
END AS status
from 
(SELECT * FROM employee_pay ep
LEFT JOIN
(SELECT title, avg(salary) from employee_pay GROUP BY title) sal
on ep.title = sal.title) tbl ) tbl1
where status is not null;

--Odd and Even Measurements
select measurement_day,
SUM(case when mod(rnk,2)!=0 then measurement_value else 0 end) as odd_sum,
SUM(case when mod(rnk,2)=0 then measurement_value else 0 end) as even_sum
from
(
select *,date(measurement_time) as measurement_day,
  row_number() over(PARTITION BY date(measurement_time) order by measurement_time) as rnk 
from measurements
)
tbl
group by measurement_day;
