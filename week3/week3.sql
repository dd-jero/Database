SELECT first_name , last_name, salary, salary*1.10 AS "increased_salary" FROM employee WHERE branch_id = 1;

SELECT first_name, last_name, salary FROM employee WHERE sex = 'M' and salary BETWEEN 60000 AND 80000;

SELECT first_name, last_name, salary FROM employee ORDER BY branch_id DESC, salary ASC;

SELECT e.first_name, e.last_name, w.total_sales FROM employee e -- employee를 e라는 별칭으로 설정
INNER JOIN works_with w ON e.emp_id = w.emp_id -- employee의 emp_id와 works_with의 emp_id를 기준으로 두 테이블 연결
INNER JOIN client c ON w.client_id = c.client_id -- works_with의 client_id와 client의 client_id를 기준으로 두 테이블 연결 
WHERE c.client_name = 'FedEx' AND e.salary >= 60000;

SELECT SUM(salary) AS total_salary, MAX(salary) AS max_salary, MIN(salary) AS min_salary, AVG(salary) AS avg_salary
FROM employee;

SELECT COUNT(*) AS total_employees FROM employee;

SELECT b.branch_name AS branch_name, COUNT(e.emp_id) AS employee_in_branch FROM branch b 
INNER JOIN employee e ON b.branch_id = e.branch_id
GROUP BY b.branch_name;