select stu.student_id, stu.student_name, sub.subject_name, count(1)
from Students stu, Subjects sub
left join Examinations e
on stu.student_id = e.student_id;