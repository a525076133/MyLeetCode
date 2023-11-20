select a1.machine_id                                                                                  machine_id,
       round(sum(a2.timestamp - a1.timestamp) / (select count(distinct process_id) from Activity), 3) processing_time
from Activity a1,
     Activity a2
where a1.activity_type = 'start'
  and a2.activity_type = 'end'
  and a1.process_id = a2.process_id
  and a1.machine_id = a2.machine_id
group by a1.machine_id;


# 不考虑process_id, 平均时间 = (所有结束的时间戳 - 所有开始的时间戳) / 时间戳数量 * 2 #(因为包括了开始和结束的, 所以数量要除以二);

select machine_id machine_id,
       round(avg(if(activity_type = 'start', -timestamp, timestamp)) * 2, 3) processing_time
from Activity
group by machine_id;


# / (select count(distinct process_id) from Activity)