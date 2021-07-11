SELECT
CASE 
    WHEN MOD(id,2) != 0 and id != (select count(*) from seat) THEN id+1
    WHEN MOD(id,2) = 0 THEN id-1
    ELSE id
END as id, student
FROM seat
ORDER BY id asc;

/*
SELECT s1.id as id, COALESCE(s2.student, s1.student) as student
FROM seat s1
LEFT JOIN seat s2
ON (s1.id+1)^1-1 = s2.id
ORDER BY s1.id asc
*/