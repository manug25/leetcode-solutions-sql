
SELECT 
    e.salary FROM
    (
        SELECT salary, dense_rank() over(order by salary desc) as sal
        FROM employee
    )e
    WHERE e.sal = N LIMIT 1
