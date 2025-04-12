--1
with new as (select departmentid,
name,
salary, 
dense_rank() over(partition by departmentid order by salary desc) as rnks
from employee)
select d.name as department, n.name as employee, n.salary from new n
inner join department d on n.departmentid=d.id
where rnks <=3
---2
 SELECT ROUND(SUM(tiv_2016):: numeric, 2) as tiv_2016
FROM insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
) 
AND (lat, lon) IN (
    SELECT lat, lon
    FROM insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);

