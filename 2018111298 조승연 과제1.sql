use hr;
# A.1 
# 3
select distinct department_id, job_id 
from employees;


# A.2
# 2
select sysdate(); 
select concat(last_name) as 'Name', employee_id, hire_date #concat을 없애면 맨 아래 행에 null이 나오므로 방지를 위해 concat 사용
from employees
where hire_date between '1995-05-20' and '1996-05-20'
order by hire_date;


# 3 
select concat(first_name, ' ', last_name) as "Name", salary, job_id, commission_pct
from employees
where commission_pct is not null
order by salary desc, commission_pct desc;


# A.4
# 2

select job_id, avg(salary) as 'Avg Salary'
from employees
where job_id not like '%CLERK'
group by job_id
having avg(salary) > 10000
order by avg(salary) desc;


# A.5
# 1
select department_name, COUNT(e.employee_id)
from employees e, departments d
where d.department_id = e.department_id 
group by department_name
having COUNT(e.employee_id)>=5
order by COUNT(e.employee_id) desc, department_name; 

# 2
select concat(e.first_name, ' ', e.last_name) as "Name",
		job_id, department_name, hire_date, salary, grade_level
from employees e, job_grades j, departments d
where d.department_id = e.department_id 
		and e.salary between j.lowest_sal and j.highest_sal;


# A.6
# 3
select employee_id, concat(first_name, ' ', last_name) as "Name", job_id, hire_date
from employees
where department_id = (select department_id from departments 
                    where location_id = (select location_id from locations where city like 'O%'));


# 4
select concat(first_name, ' ', last_name) as "Name", job_id, salary, department_id, 
		(select ROUND(avg(salary)) from employees e2 where e1.department_id = e2.department_id group by department_id) as 'Department Avg Salary'
from employees e1;


#A.7
#2
select e.employee_id, e.job_id
from employees e, job_history h
where e.employee_id=h.employee_id and e.job_id =h.job_id;


#2-계속

select e.employee_id, e.job_id, null, null
from employees e, job_history h
where e.employee_id=h.employee_id and e.job_id =h.job_id and e.employee_id='176'
union
select employee_id, job_id, start_date as 'Start date', end_date as 'End date'
from job_history
where employee_id='176';