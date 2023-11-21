select r.contest_id contest_id,
       round(count(1) / (select count(1) from Users) * 100, 2) percentage
from Register r
group by r.contest_id
order by percentage desc, r.contest_id;



# select r.contest_id contest_id,
#        round(sum(r.user_id=u.user_id) / count(distinct u.user_id) * 100, 2) percentage
# from Register r, Users u
# group by r.contest_id
# order by percentage desc, r.contest_id;

