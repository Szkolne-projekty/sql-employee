/* 1. Napisz zapytanie, aby znaleźć adresy (location_id, street_address, city, state_province, country_name) wszystkich działów. */
SELECT l.LOCATION_ID, l.STREET_ADDRESS, l.CITY, l.STATE_PROVINCE, c.COUNTRY_NAME
FROM locations l
NATURAL JOIN countries c;

/* 2. Napisz zapytanie, aby znaleźć (first_name, last_name), department ID oraz DEPARTAMENT_Name wszystkich pracowników. */
SELECT e.FIRST_NAME, e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM employees e
NATURAL JOIN departments d;

/* 3. Napisz zapytanie, aby znaleźć imię i nazwisko (first_name, last_name), job, department ID pracownika pracującego w London. */
SELECT e.FIRST_NAME, e.LAST_NAME, e.JOB_ID, e.DEPARTMENT_ID
FROM employees e
NATURAL JOIN departments d
NATURAL JOIN locations l
WHERE l.CITY = 'London';

/* 4. Napisz zapytanie, aby znaleźć employee id, last_name wraz z jego manager_id, last_name. */
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.MANAGER_ID, m.LAST_NAME AS MANAGER_LAST_NAME
FROM employees e
JOIN employees m ON e.MANAGER_ID = m.EMPLOYEE_ID;

/* 5. Napisz zapytanie w celu znalezienia imienia i nazwiska (first_name, last_name) oraz hire_date pracowników, którzy zostali zatrudnieni po "Jones". */
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM employees
WHERE HIRE_DATE > (SELECT HIRE_DATE FROM employees WHERE LAST_NAME = 'Jones');

/* 6. Napisz zapytanie o nazwę działu i liczbę pracowników w dziale. */
SELECT d.DEPARTMENT_NAME, COUNT(e.EMPLOYEE_ID) AS LICZBA_PRACOWNIKOW
FROM departments d
LEFT JOIN employees e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME;

/* 7. Napisz zapytanie, aby znaleźć employee ID, job title, liczbę dni między datą końcową a datą początkową dla wszystkich stanowisk w dziale 90. */
SELECT jh.EMPLOYEE_ID, jh.JOB_ID, DATEDIFF(jh.END_DATE, jh.START_DATE) AS LICZBA_DNI
FROM job_history jh
NATURAL JOIN employees e
WHERE e.DEPARTMENT_ID = 90;

/* 8. Napisz zapytanie wyświetlające department ID, first_name, last_name menedżera. */
SELECT d.DEPARTMENT_ID, m.FIRST_NAME, m.LAST_NAME
FROM departments d
LEFT JOIN employees m ON d.MANAGER_ID = m.EMPLOYEE_ID;

/* 9. Napisz zapytanie wyświetlające department name, manager name, city. */
SELECT d.DEPARTMENT_NAME, m.FIRST_NAME, l.CITY
FROM departments d
LEFT JOIN employees m ON d.MANAGER_ID = m.EMPLOYEE_ID
NATURAL JOIN locations l;

/* 10. Napisz zapytanie wyświetlające nazwę stanowiska i średnie wynagrodzenie pracowników. */
SELECT j.JOB_TITLE, AVG(e.SALARY) AS SREDNIA_PENSJA
FROM jobs j
NATURAL JOIN employees e
GROUP BY j.JOB_TITLE;

/* 11. Napisz zapytanie wyświetlające job title, employee name oraz różnicę pomiędzy wynagrodzeniem pracownika a minimalnym wynagrodzeniem na danym stanowisku. */
SELECT j.JOB_TITLE, e.FIRST_NAME (e.SALARY - j.MIN_SALARY) AS ROZNICA_PENSJI
FROM employees e
NATURAL JOIN jobs j;

/* 12. Napisz zapytanie wyświetlające historię stanowisk pracy wykonanych przez dowolnego pracownika pobierającego obecnie ponad 10 000 pensji. */
SELECT eh.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, eh.JOB_ID, eh.START_DATE, eh.END_DATE
FROM job_history eh
NATURAL JOIN employees e
WHERE e.SALARY > 10000;

/* 13. Napisz zapytanie wyświetlające department name, first_name, last_name, hire date, salary menadżera dla wszystkich menadżerów ze stażem pracy powyżej 15 lat. */
SELECT d.DEPARTMENT_NAME, e.FIRST_NAME, e.LAST_NAME, e.HIRE_DATE, e.SALARY, m.FIRST_NAME
JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
LEFT JOIN employees m ON d.MANAGER_ID = m.EMPLOYEE_ID
WHERE DATEDIFF(CURDATE(), e.HIRE_DATE) > 15 * 365;
