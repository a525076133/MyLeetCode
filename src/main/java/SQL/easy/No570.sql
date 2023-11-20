select name
from Employee
where id in (
    select managerId
    from Employee
    group by managerId
    having count(managerId) >= 5
);

# 连接
select e.name name
from (select managerId id
      from Employee
      group by managerId
      having count(managerId) >= 5) e2
         join Employee e on e.id = e2.id;


