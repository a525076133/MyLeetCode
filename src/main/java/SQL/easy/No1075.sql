select p.project_id project_id,
       round(AVG(experience_years),2) average_years
from Project p
left join Employee e
on p.employee_id = e.employee_id
group by p.project_id;