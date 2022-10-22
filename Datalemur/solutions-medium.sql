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
where rnk = 3