-- Data Science Skills
SELECT candidate_id
FROM candidates where skill in('Python','Tableau','PostgreSQL')
group by candidate_id
having count(candidate_id)=3;

-- Cities With Completed Trades
SELECT u.city,count(*) as total_orders FROM trades t
LEFT JOIN
users u 
on t.user_id = u.user_id
where t.status = 'Completed'
GROUP BY u.city
order by count(*) desc
limit 3;