select query_name,
       ROUND(AVG(rating / position), 2)                     quality,
       ROUND(SUM(IF(rating < 3, 1, 0)) / COUNT(*) * 100, 2) poor_query_percentage
from Queries
group by query_name;