/* 1. */
SELECT FIRST_NAME as "Imię", LAST_NAME as "Nazwisko" FROM employees;

/* 2. */
SELECT DISTINCT DEPARTMENT_ID FROM employees;

/* 3. */
SELECT * FROM employees ORDER BY employees.FIRST_NAME DESC;

/* 4. */
SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY * 0.15 as PF FROM employees;

/* 5. */
SELECT EMPLOYEE_ID, first_name, last_name, SALARY FROM `employees` ORDER BY SALARY;

/* 6. */
SELECT SUM(SALARY) FROM `employees` WHERE 1;

/* 7. */
SELECT MIN(SALARY), MAX(SALARY) FROM `employees` WHERE 1;

/* 8. */
SELECT AVG(SALARY), COUNT(*) FROM `employees` WHERE 1;

/* 9. */
SELECT COUNT(*) FROM `employees` WHERE 1;

/* 10. */
SELECT COUNT(DISTINCT JOB_ID) FROM employees;

/* 11. */
SELECT UPPER(FIRST_NAME) FROM `employees` WHERE 1;

/* 12. */
SELECT SUBSTRING(FIRST_NAME, 1, 3) FROM `employees` WHERE 1;

/* 13. */
SELECT 171*214+625;

/* 14. */
SELECT DISTINCT LAST_NAME FROM `employees` WHERE 1

/* 15. */
SELECT TRIM(FIRST_NAME) FROM `employees` WHERE 1;

/* 16. */
SELECT LENGTH(FIRST_NAME), LENGTH(LAST_NAME) FROM `employees` WHERE 1;

/* 17. */
SELECT FIRST_NAME FROM employees WHERE FIRST_NAME LIKE "\d*";

/* 18. */
SELECT * FROM `employees` WHERE 1 LIMIT 10

/* 19. */
SELECT ROUND(SALARY / 12, 2) FROM `employees` WHERE 1;