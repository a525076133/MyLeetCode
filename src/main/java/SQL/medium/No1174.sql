select ROUND(SUM(IF(d.order_date = d.customer_pref_delivery_date, 1, 0)) / COUNT(d.customer_id) * 100, 2) immediate_percentage
from Delivery d,
     (select customer_id, MIN(order_date) earliest
      from Delivery
      group by customer_id) t
where d.customer_id = t.customer_id
  and d.order_date = t.earliest;



