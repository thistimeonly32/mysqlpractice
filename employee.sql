show databases;
use hr;
show tables;
describe departments;
select * from departments;
select * from employees;
select FIRST_NAME 'First Name', last_name 'Last Name' from employees;
select distinct department_id from employees;
select * from employees order by FIRST_NAME desc;
select first_name, last_name, salary, salary*.15 as 'pf(15% of salary)' from employees;
select EMPLOYEE_ID, last_name, salary, salary*.15 as 'pf(15% of salary)' from employees order by salary asc;
select sum(salary) as 'Total Salary' from employees;
select max(salary) as 'max salary', min(salary) as 'min salary' from employees;
select avg(salary) as 'avg salary', count(salary) as 'No. of Employees' from employees;
select count(*) from employees;
select count(distinct(JOB_ID)) as 'No. of jobs' from employees;
select lower(first_name) as 'First Name' from employees;
select substring(first_name, 1, 3) as 'First Name' from employees;
select 171*214+625 as result;
select concat(first_name,' ', last_name) as name from employees;
select trim(first_name) as 'First Name' from employees;
select first_name, last_name, concat(first_name,' ', last_name) as name, 
length(first_name) as fnl, length(last_name) as lnl, 
length(concat(first_name,' ', last_name)) as nl
from employees;

SELECT * 
   FROM employees 
   WHERE  first_name REGEXP  '[0-9]';
   
select * from employees limit 10;
SELECT first_name, last_name, round(salary/12,2) as 'Monthly Salary' 
   FROM employees;
   
select * from employees where salary not between 10000 and 15000;
select first_name, last_name, salary from employees 
where salary not between 10000 and 15000 and department_id in (30, 100);

select first_name from employees where year(HIRE_DATE) like '1987';
select last_name, job_id, salary from employees 
where job_id in ('IT_PROG', 'SH_CLERK') and salary not in (4500, 10000, 15000);
select last_name from employees where length(concat(first_name, last_name)) = 6;
select last_name from employees where LAST_NAME like '__e%';

select max(salary) as 'max salary' from employees where JOB_ID  = 'IT_PROG';
select avg(salary) as 'avg salary', count(EMPLOYEE_ID) from employees where department_id  = 90;

select Round(min(salary), 0) as 'lowest salary', 
Round(avg(salary), 0) as 'avg salary', 
Round(max(salary), 0) as 'highest salary', 
Round(sum(salary), 0) as 'total salary', 
count(*) as 'total employees' from employees;

select * from 
(select distinct job_id, count(job_id) as 'job_count' from employees group by JOB_ID) as inner_table
where job_count > 1;


select distinct job_id, count(job_id) as 'job_count' from employees group by JOB_ID having count(job_id) > 1;

select Round(max(salary), 0) as 'highest salary', Round(min(salary), 0) as 'lowest salary',
Round(max(salary), 0) -  Round(min(salary), 0) as 'difference' from employees;

select min(salary), first_name as 'min_salary' from employees group by first_name;

select manager_id, min(salary) as 'min salary of employee' from employees group by MANAGER_ID;

select job_id, avg(salary) from employees where job_id not in ('IT_PROG') group by job_id;

select job_id, avg(salary), max(salary), min(salary), sum(salary) from employees where DEPARTMENT_ID in (90) group by job_id;

select job_id, max(salary)
from employees group by job_id having max(salary) >= 12000;

select avg(salary), count(DEPARTMENT_ID)
from employees  group by DEPARTMENT_ID having count(DEPARTMENT_ID) > 10;

select * from employees where salary > (select salary as bullsalary from employees where last_name in ('Bull'));

select first_name, last_name from employees where department_id = (select DEPARTMENT_ID from departments where department_name = 'IT');

select first_name, last_name from employees where MANAGER_ID is not null and manager_id != 0 and
department_id in (select department_id from departments 
where location_id in (select location_id from locations where country_id = 'US'));

select first_name, last_name, salary from employees group by salary having avg(SALARY) < salary;

select first_name, last_name, salary from employees where salary > (select avg(salary) from employees);

select first_name, last_name, salary from employees where salary > (select avg(salary) from employees);
select first_name, last_name, salary from employees e where salary = (select min_salary from jobs j where j.job_id = e.JOB_ID);

select FIRST_NAME, last_name, salary from employees where salary > (select avg(salary) from employees) 
and DEPARTMENT_ID in (select department_id from departments 
where department_name like 'IT%');

select first_name, last_name, salary from employees 
where salary > (select salary from employees where last_name like 'Bell');

select first_name, last_name, salary from employees where salary in (
select min(salary) from employees group by department_id);

select first_name, last_name, salary from employees where salary > All(
select avg(salary) from employees group by department_id);

select FIRST_NAME, last_name from employees 
where salary > (select max(salary) from employees where job_id = 'SH_CLERK') order by salary;

select FIRST_NAME, last_name from employees 
where salary > All(select salary from employees where job_id = 'SH_CLERK');

select first_name, last_name, employee_id from employees 
where EMPLOYEE_ID not in (select manager_id from employees);

select * from employees where manager_id = 105;

select employee_id, first_name, last_name from employees;

SELECT employee_id, first_name, last_name, 
(SELECT department_name FROM departments d
 WHERE e.department_id = d.department_id) department 
 FROM employees e ORDER BY department;
 
 select FIRST_NAME, last_name, salary from employees e1
where salary > All(select avg(salary) from employees e2 where e2.department_id = e1.DEPARTMENT_ID);

select * from employees where mod(EMPLOYEE_ID, 2) != 0;

select * from
(select distinct salary from employees
order by salary desc limit 5) as ot order by salary asc limit 1;

SELECT DISTINCT salary 
FROM employees e1 
WHERE 4 >= (SELECT COUNT(DISTINCT salary) 
FROM employees e2 
WHERE e2.salary >= e1.salary);


SELECT DISTINCT salary
FROM employees;

select department_id, department_name from departments
where department_id not in (select distinct department_id from employees);

select * from employees where department_id = 120;















