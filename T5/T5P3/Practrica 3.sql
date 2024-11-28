#1 subconsulta
SELECT emp.EName, emp.Sal
FROM empleados emp
WHERE emp.Sal > (
				SELECT emp.Sal
                FROM empleados emp
                WHERE emp.EName = "SMITH"
				);
#2 join
SELECT emp.EName, dep.DName
FROM empleados emp
INNER JOIN departamentos dep 
	USING (DeptNo);
#3 subconsulta
SELECT emp.EName, emp.HireDate
From empleados emp 
	WHERE YEAR(emp.HireDate) < 1998 AND emp.DeptNo = 10;
    

#4 
SELECT emp.EName, emp.Sal
From empleados emp 
WHERE emp.job = "CLERK" AND emp.Sal < 2000;
#5
SELECT emp.EName
From empleados emp 
WHERE emp.DeptNo = 10 AND (emp.Comm = 0 OR emp.Comm IS NULL);
#6 
SELECT emp.EName
From empleados emp 
WHERE emp.DeptNo = (SELECT emp.DeptNo 
                    FROM empleados emp
                    WHERE emp.EName = "ALLEN") AND emp.EName != "ALLEN";
#7
SELECT emp.EName
From empleados emp 
WHERE emp.EName LIKE "A%";
#8
SELECT emp.EName, emp.Job
From empleados emp 
INNER JOIN departamentos dep
	USING (DeptNo)
WHERE dep.Loc IN ("DALLAS")
ORDER BY emp.Job;
#9
SELECT emp.EName, emp.Sal
From empleados emp 
WHERE emp.DeptNo IN (SELECT dep.DeptNo
					FROM departamentos dep
                    WHERE dep.DName = "ACCOUNTING");
#10
SELECT emp.EName, emp.Comm
FROM empleados emp
WHERE emp.Job = "SALESMAN";
#11
SELECT emp.EName, emp.HireDate
FROM empleados emp
WHERE emp.Job NOT IN ("CLERK","SALESMAN");
#12
SELECT emp.EName, emp.Sal, emp.Comm
FROM empleados emp
WHERE emp.DeptNo = (
					SELECT emp.DeptNo
                    FROM empleados emp
                    WHERE emp.EName = "JONES"
                    );
#13
SELECT dep.DName
FROM departamentos dep
WHERE dep.DeptNo IN (SELECT emp.DeptNo
					FROM empleados emp
                    WHERE emp.Sal > (SELECT emp.Sal
									FROM empleados emp
                                    WHERE emp.EName = "ALLEN")
                    );
#14
SELECT emp.EmpNo, emp.EName, dep.DName
FROM empleados emp
INNER JOIN departamentos dep
	USING (DeptNo)
WHERE dep.Loc = "DALLAS" AND ( emp.Sal > (SELECT emp.Sal
                                        FROM empleados emp
                                        WHERE emp.EName = "SMITH") 
                                        AND emp.Sal < (	SELECT emp.Sal
														FROM empleados emp
														WHERE emp.EName = "ALLEN"));
#15
SELECT emp.EName
FROM empleados emp
WHERE (emp.Job = "PRESIDENT" OR  emp.Job = "MANAGER") 
AND emp.DeptNo = 10;
