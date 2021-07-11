SELECT x.Department, x.Employee, x.Salary
FROM
(
    SELECT d.name as Department, e.name as Employee, e.salary as Salary,
    dense_rank() over (
        partition by e.departmentid order by e.salary desc
        ) as rnk
    FROM employee e
    JOIN department d
    ON e.departmentid = d.id
)x
WHERE x.rnk <=3