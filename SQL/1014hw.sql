-- 1014 ws

use workshop;

-- 1
SELECT e.ENAME, e.SAL, d.DNAME
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO;

-- 2
SELECT d.DNAME
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
AND e.ENAME = 'KING';

-- 3
SELECT e.ENAME, d.DEPTNO, d.DNAME, e.SAL
FROM emp e RIGHT OUTER JOIN dept d
ON e.DEPTNO = d.DEPTNO;

-- 4
SELECT concat(e.ENAME, '의 매니저는 ', m.ENAME, ' 이다')
FROM emp e, emp m
WHERE e.MGR = m.EMPNO;

-- 5
SELECT e.ENAME, d.DNAME, e.SAL, e.JOB
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
AND e.JOB = (
	SELECT JOB
	FROM emp
	WHERE ENAME = 'SCOTT'
)
AND ENAME != 'SCOTT';
--
SELECT e.ENAME, d.DNAME, e.SAL, e.JOB
FROM emp e, dept d , (
	SELECT JOB
	FROM emp
	WHERE ENAME = 'SCOTT'
) j
WHERE e.DEPTNO = d.DEPTNO
AND e.JOB = j.JOB
AND ENAME != 'SCOTT';

-- 6
SELECT EMPNO, ENAME, HIREDATE, SAL
FROM emp
WHERE DEPTNO = (
	SELECT DEPTNO
	FROM emp
	WHERE ENAME = 'SCOTT'
)
AND ENAME != 'SCOTT';

-- 7
SELECT e.EMPNO, e.ENAME, d.DNAME, e.HIREDATE, d.LOC, e.SAL
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
AND e.SAL > (
	SELECT AVG(SAL)
	FROM emp
);

-- 8
SELECT e.EMPNO, e.ENAME, d.DNAME, d.LOC, e.SAL
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
AND e.JOB IN (
	SELECT DISTINCT JOB
    FROM emp
    WHERE DEPTNO=30
)
ORDER BY e.SAL DESC;

-- 9
SELECT e.EMPNO, e.ENAME, e.HIREDATE, d.LOC
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
AND d.DEPTNO = 10
AND e.JOB NOT IN (
	SELECT DISTINCT JOB
	FROM emp
    WHERE DEPTNO = 30
);

SELECT e.EMPNO, e.ENAME, e.HIREDATE, d.LOC
FROM (SELECT * FROM emp WHERE DEPTNO = 10) e, dept d
WHERE e.DEPTNO = d.DEPTNO
-- AND e.DEPTNO = 10
AND e.JOB NOT IN (
	SELECT DISTINCT JOB
	FROM emp
    WHERE DEPTNO = 30
);

-- 10
SELECT EMPNO, ENAME, SAL, JOB
FROM emp
WHERE SAL IN (
	SELECT SAL
	FROM emp
	WHERE ENAME IN ('KING','JAMES')
)
AND ENAME NOT IN ('KING','JAMES');

-- 11
SELECT EMPNO, ENAME, SAL
FROM emp
WHERE SAL > (
	SELECT max(SAL)
	FROM emp
	WHERE DEPTNO = 30
);

-- 12
CREATE INDEX emp_name ON emp (ENAME);

-- 13
SELECT ENAME, SAL
FROM emp
WHERE YEAR(HIREDATE) = (
	SELECT YEAR(HIREDATE)
	FROM emp
	WHERE ENAME = 'ALLEN'
);