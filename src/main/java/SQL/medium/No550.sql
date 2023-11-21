select ROUND((
                 select COUNT(*)
                 from Activity a1
                 where (a1.player_id, a1.event_date)
                     in (select player_id,
                                MIN(event_date) earliest
                         from Activity
                         group by player_id)
                   and (a1.player_id, DATE_ADD(a1.event_date, INTERVAL 1 DAY))
                     in
                       (select player_id, event_date from Activity)) / (select count(distinct player_id) from Activity),
             2) fraction;


select ROUND(SUM(IF(a.event_date is null, 0, 1)) / COUNT(DISTINCT t.player_id), 2) fraction
from (select player_id,
             MIN(event_date) earliest
      from Activity
      group by player_id) t
         left join Activity a
                   on t.player_id = a.player_id and a.event_date = DATE_ADD(t.earliest, INTERVAL 1 DAY);

