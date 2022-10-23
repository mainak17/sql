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