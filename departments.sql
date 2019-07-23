SELECT * FROM hr.departments;
select department_id from departments 
where location_id in ((select location_id from locations where country_id = 'US'));
select department_id from departments 
where department_name like 'IT%';

select d.department_id, d.location_id, l.LOCATION_ID, l.CITY, l.POSTAL_CODE 
from departments d, locations l 
where d.LOCATION_ID = l.LOCATION_ID;

SELECT location_id, street_address, city, state_province
FROM locations where COUNTRY_ID is not null;

SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries;

select * from departments natural join locations natural join countries;

select first_name, last_name, department_id
from employees;

select first_name, last_name, department_id, department_name 
from employees natural join departments;
