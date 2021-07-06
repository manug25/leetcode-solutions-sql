/*
Difficulty: Hard
Runtime: 393 ms
Memory: 0B
*/

with cte as (
select * from trips
    where client_id not in (select distinct users_id from users where banned = 'Yes') and
    driver_id not in (select distinct users_id from users where banned ='Yes') and
    request_at between '2013-10-01' and '2013-10-03'
)

select request_at as Day,
ROUND(SUM(CASE WHEN status like 'cancel%' THEN 1 ELSE 0 END)/COUNT(*),2) as 'Cancellation Rate'
from cte
group by request_at;
