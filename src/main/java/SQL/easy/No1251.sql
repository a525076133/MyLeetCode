select p.product_id product_id,
       IFNULL(round(sum(p.price * u.units) / sum(u.units), 2), 0) average_price
from Prices p
     left join
     UnitsSold u
on p.product_id = u.product_id
  and u.purchase_date between p.start_date and end_date
group by p.product_id;





