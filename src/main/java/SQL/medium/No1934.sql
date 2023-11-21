

select s.user_id user_id,
       round(1 - sum(action='timeout' or action is null) / count(1), 2) confirmation_rate
from Signups s
left join Confirmations c
on s.user_id = c.user_id
group by user_id;



# AVG函数
select s.user_id user_id,
       round(IFNULL(AVG(action='confirmed'), 0), 2) confirmation_rate
from Signups s
         left join Confirmations c
                   on s.user_id = c.user_id
group by user_id;