select activity_date day,
       count(distinct user_id) active_users
from Activity
where activity_date <= DATE('2019-07-27') and activity_date > DATE('2019-06-27')
group by activity_date;