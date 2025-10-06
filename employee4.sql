/* 1. Napisz zapytanie, aby znaleźć imię (imię, nazwisko) i wynagrodzenie pracowników, którzy mają wyższą pensję niż pracownik, którego nazwisko='Bull'. */
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY > (SELECT SALARY FROM employees WHERE LAST_NAME = 'Bull');

/* 2. Napisz zapytanie, aby znaleźć imię, nazwisko wszystkich pracowników, którzy pracują w dziale IT. */
SELECT FIRST_NAME, LAST_NAME 
FROM employees 
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM departments WHERE DEPARTMENT_NAME LIKE '%IT%');

/* 3. Napisz zapytanie, aby znaleźć imię, nazwisko pracowników, którzy mają kierownika i pracowali w dziale w USA. */
SELECT e.FIRST_NAME, e.LAST_NAME 
FROM employees e
WHERE e.MANAGER_ID IS NOT NULL 
AND e.DEPARTMENT_ID IN (
  SELECT d.DEPARTMENT_ID 
  FROM departments d
  JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID
  JOIN countries c ON l.COUNTRY_ID = c.COUNTRY_ID
  WHERE c.COUNTRY_NAME = 'USA'
);

/* 4. Napisz zapytanie, aby znaleźć imię, nazwisko pracowników, którzy są menedżerami. */
SELECT FIRST_NAME, LAST_NAME 
FROM employees 
WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID FROM departments WHERE MANAGER_ID IS NOT NULL);

/* 5. Napisz zapytanie, aby znaleźć imię, nazwisko i wynagrodzenie pracowników, których wynagrodzenie jest wyższe niż średnia pensja. */
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY > (SELECT AVG(SALARY) FROM employees);

/* 6. Napisz zapytanie, aby znaleźć imię, nazwisko i wynagrodzenie pracowników, których wynagrodzenie jest równe minimalnemu wynagrodzeniu dla ich grupy zaszeregowania. */
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees e 
WHERE SALARY = (SELECT MIN(j.MIN_SALARY) FROM jobs j WHERE e.JOB_ID = j.JOB_ID);

/* 7. Napisz zapytanie, aby znaleźć imię, nazwisko i wynagrodzenie pracowników, którzy zarabiają więcej niż średnia pensja i pracują w dowolnym dziale IT. */
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY > (SELECT AVG(SALARY) FROM employees) 
AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM departments WHERE DEPARTMENT_NAME LIKE '%IT%');

/* 8. Napisz zapytanie, aby znaleźć imię, nazwisko i wynagrodzenie pracowników, którzy zarabiają więcej niż zarabia Mr. Bell. */
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY > (SELECT SALARY FROM employees WHERE LAST_NAME = 'Bell');

/* 9. Napisz zapytanie, aby znaleźć imię, nazwisko i wynagrodzenie pracowników, którzy zarabiają tyle samo, co płaca minimalna dla wszystkich działów. */
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY = (SELECT MIN(MIN_SALARY) FROM jobs);

/* 10. Napisz zapytanie, aby znaleźć imię, nazwisko i wynagrodzenie pracowników, których wynagrodzenie jest wyższe niż średnia pensja wszystkich działów. */
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY > (SELECT AVG(SALARY) FROM employees);

/* 11. Napisz zapytanie, aby znaleźć imię, nazwisko i wynagrodzenie pracowników, którzy zarabiają wynagrodzenie wyższe niż wynagrodzenie wszystkich urzędników wysyłkowych (JOB_ID = 'SH_CLERK'). Posortuj wyniki wynagrodzenia od najniższego do najwyższego. */
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY > ALL (SELECT SALARY FROM employees WHERE JOB_ID = 'SH_CLERK') 
ORDER BY SALARY ASC;

/* 12. Napisz zapytanie, aby znaleźć imię, nazwisko pracowników, którzy nie są przełożonymi. */
SELECT FIRST_NAME, LAST_NAME 
FROM employees 
WHERE EMPLOYEE_ID NOT IN (SELECT DISTINCT MANAGER_ID FROM employees WHERE MANAGER_ID IS NOT NULL);

/* 13. Napisz zapytanie, aby wyświetlić identyfikator pracownika, imię, nazwisko i nazwy działów wszystkich pracowników. */
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_NAME 
FROM employees e 
LEFT JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

/* 14. Napisz zapytanie wyświetlające identyfikator pracownika, imię, nazwisko, wynagrodzenie wszystkich pracowników, których wynagrodzenie jest powyżej średniej dla ich działów. */
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, e.SALARY 
FROM employees e 
WHERE e.SALARY > (SELECT AVG(e2.SALARY) FROM employees e2 WHERE e.DEPARTMENT_ID = e2.DEPARTMENT_ID);

/* 15. Napisz zapytanie, które pobierze parzyste rekordy z tabeli pracowników. */
SELECT * 
FROM employees 
WHERE MOD(EMPLOYEE_ID, 2) = 0;

/* 16. Napisz zapytanie, aby znaleźć piątą maksymalną pensję w tabeli pracowników. */
SELECT MIN(SALARY) 
FROM (
  SELECT DISTINCT SALARY FROM employees ORDER BY SALARY DESC LIMIT 5
) sub;

/* 17. Napisz zapytanie, aby znaleźć 4. pensję minimalną w tabeli pracowników. */
SELECT MAX(SALARY)
FROM (
  SELECT DISTINCT SALARY FROM employees ORDER BY SALARY ASC LIMIT 4
) sub;

/* 18. Napisz zapytanie, które wybierze 10 ostatnich rekordów z tabeli. */
SELECT * 
FROM employees 
ORDER BY EMPLOYEE_ID DESC 
LIMIT 10;

/* 19. Napisz zapytanie, aby wyświetlić identyfikator działu i nazwę wszystkich działów, w których nie pracuje żaden pracownik. */
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME 
FROM departments d 
LEFT JOIN employees e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID 
WHERE e.EMPLOYEE_ID IS NULL;

/* 20. Napisz zapytanie, aby uzyskać 3 maksymalne pensje. */
SELECT DISTINCT SALARY 
FROM employees 
ORDER BY SALARY DESC 
LIMIT 3;

/* 21. Napisz zapytanie, aby otrzymać 3 pensje minimalne. */
SELECT DISTINCT SALARY 
FROM employees 
ORDER BY SALARY ASC 
LIMIT 3;
