select t2.product_name as product_name, t1.year as year, t1.price as price
from Sales t1
         left join Product t2
                   on t1.product_id = t2.product_id;