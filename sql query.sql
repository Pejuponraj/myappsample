--
with new as (select departmentid,
name,
salary, 
dense_rank() over(partition by departmentid order by salary desc) as rnks
from employee)
select d.name as department, n.name as employee, n.salary from new n
inner join department d on n.departmentid=d.id
where rnks <=3
