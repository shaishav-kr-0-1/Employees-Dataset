-- #1.Second Maximum salary from employee with every information;
select * from employees where salary = (select max(salary) from employees where salary<(select max(salary) from employees)); 
SELECT salary from Employees order by salary DESC LIMIT 2,1; -- Without using subquery
/*---------------------------------------------*/
-- #2.Finding Max Salary from each dep.
Select d.department_name as "Department Name", max(e.salary)as "Max Salary"  from departments d
right join employees e
on e.department_id = d.department_id
group by 1
order by 1;
/*---------------------------------------------*/
-- #3.Find employees joining month/year.
select concat(first_name,' ',last_name)as Employees , Monthname(hire_date) #for year just replace monthname with year function
as "Month of Joining" from employees;
/*---------------------------------------------*/
-- #4.Show employees whose salary is greater than 10000
Select concat(first_name,' ',last_name)as Employees ,salary from employees
where salary>= 10000;
/*---------------------------------------------*/

-- #5.Fetch all the employees whose name starts with S , m.
select * from employees 
where first_name like'S%';
select * from employees 
where first_name like "%m";
/*---------------------------------------------*/

-- #6.Fetch all the employees who got hired over the years.
select  Year(hire_date)
as "Joining Year", CONCAT(count(first_name)," Employees Joined" ) as "No.of Employees" from employees
Group by 1;
/*---------------------------------------------*/
-- #7.Min and Max salary from job title
select job_title as "Title"  , min_salary as "Min Salary", max_salary as "Max Salary"from jobs;
/*---------------------------------------------*/
-- #8.Show how many employees are working in each department
select d.department_name,count(first_name) as 'Employee Count'from employees e
inner join departments d 
on e.department_id = d.department_id
group by 1;
/*---------------------------------------------*/

-- #9.Show the avg salalry from each department
select d.department_name as "Department Name" ,round(avg(e.salary))as 'Avg Salary' from employees e
inner join departments d 
on e.department_id = d.department_id
group by 1;
/*---------------------------------------------*/

-- #10. Show how many employees work under each Job tille
Select job_title as "Job Title" , count(first_name) as "No.of Employees" from jobs j
inner join employees e
on j.job_id= e.job_id
Group by 1;
