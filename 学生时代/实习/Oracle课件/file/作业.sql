--练习--
select table_name from user_tables;
select * from job_grades;
1.Show all data of the clerks who have been hired after the year 1997.

select * from employees where to_number(to_char(hire_date,'yyyy'))>1997;

2.Show the last name,  job, salary, and commission of those employees who earn commission. Sort the data by the salary in descending order.

select e.last_name,j.job_title job,e.salary,e.commission_pct*e.salary commission 
from employees e,jobs j
where e.job_id=j.job_id 
order by salary desc;

3.Show the employees that have no commission with a 10% raise in their salary (round off thesalaries).
给没有佣金的员工加薪10%(把工资表四舍五入)

select 'The salary for'||last_name||'after a 10% is '||salary*1.1 New_salary 
from employees
where commission_pct is null;

4.Show the last names of all employees together with the number of years and the number of completed months that they have been employed
列出所有雇员的姓氏，以及他们受雇的年数和完成工作的月份列出所有雇员的姓氏，以及他们受雇的年数和完成工作的月份

select last_name,floor(months_between(sysdate,hire_date)/12) years,round(months_between(sysdate,hire_date)) months
from employees;

5.Show those employees that have a name starting with J, K, L, or M.显示那些名称以J、K、L或M开头的员工。显示那些名称以J、K、L或M开头的员工。
select *
from employees
where last_name like 'J%' or last_name like 'K%' or last_name like 'L%' or last_name like 'M%';

select * 
from employees
where substr(last_name,1,1) in ('J','K','L','M');

6.Show all employees, and indicate with “Yes” or “No” whether they receive a commission
显示所有员工，并用“是”或“否”表示他们是否收到了佣金

select last_name,nvl2(commission_pct,'是','否')
from employees;

7.Show the department names, locations, names, job titles, and salaries of employees who workin location 1800.
译文：显示在1800个地点工作的部门名称、地点、名称、职务和工资。
select d.department_name,d.location_id,e.last_name,e.job_id,e.salary
from employees e,departments d
where e.department_id = d.department_id
and d.location_id = 1800;

8.How many employees have a name that ends with an n? Create two possible solutions.
select count(*)
from employees
where last_name like '%n';

select count(*)
from employees
where substr(last_name,length(last_name)-1,1) = 'n';

9.Show the names and locations for all departments, and the number of employees working in each department. Make sure that departments without employees are included as well.译文：显示所有部门的名称和位置，以及每个部门的员工人数。确保没有员工的部门也包括在内。
select d.department_id,d.department_name,d.location_id,count(e.employee_id)
from departments d,employees e
where d.department_id = e.department_id
group by d.department_id,d.department_name,d.location_id;

10.Which jobs are found in departments 10 and 20?
译文:0和20部门有哪些职位
select  job_id
from employees
where department_id in (10,20);

11.Which jobs are found in the Administration and Executive departments, and how many employees do these jobs? Show the job with the highest frequency first.
译文：行政和执行部门有哪些职位，有多少员工从事这些工作?首先显示频率最高的工作
select *
from departments
where department_name in ('Administration','Executive');
10 90
select job_id,count(*) frequency
from employees
where department_id in (select department_id
from departments
where department_name in ('Administration','Executive'))
group by job_id
order by frequency desc;

12.Show all employees who were hired in the first half of the month (before the 16th of the month).
译文：显示本月上半月(本月16日前)招聘的所有员工
select *
from employees
where to_number(to_char(hire_date,'MM')) = to_number(to_char(sysdate,'MM'))
and
to_number(to_char(hire_date,'dd')) < 16;

13.Show the names, salaries, and the number of dollars (in thousands) that all employees earn
译文：显示所有员工的姓名、工资和收入(以千为单位)
select last_name,round(salary) salary,salary/1000 thousands
from employees;

14.Show all employees who have managers with a salary higher than $15,000. Show thefollowing data: employee name, manager name, manager salary, and salary grade of the manager.
译文：显示所有管理人员工资高于15,000美元的员工。显示以下数据:员工姓名、经理姓名、经理工资、经理工资等级
select e2.last_name,e1.last_name,e2.salary
from employees e1,employees e2
where e1.employee_id = e2.manager_id
and
e1.salary > 15000;

WITH 
dept_costs AS ( select e2.last_name,e1.last_name,e2.salary salary
from employees e1,employees e2
where e1.employee_id = e2.manager_id
and
e1.salary > 15000),
avg_cost AS ( select grade_level,lowest_sal,highest_sal from job_grades)
select d.salary 
from dept_costs d,avg_cost a
where d.salary between a.lowest_sal and highest_sal;

15.Show the department number, name, number of employees, and average salary of all departments, together with the names, salaries, and jobs of the employees working in each department.
译文：显示部门编号、名称、员工人数、各部门平均工资，以及各部门员工的姓名、工资、职务。
select department_id,count(*),avg(salary)
from employees
group by department_id;

select d.did,d.dpn,d.salary,e.last_name,e.salary,e.job_id
from employees e,(select department_id did,count(*) dpn,avg(salary) salary
from employees
group by department_id) d
where e.department_id (+)= d.did;

16.Show the department number and the lowest salary of the department with the highest average 	salary.译文：显示平均工资最高的部门的部门号和最低工资
select department_id
from employees
where rownum < 2
group by department_id;

select department_id,min(salary)
from employees
where department_id = (select department_id
from employees
where rownum < 2
group by department_id)
group by department_id;

17.Show the department numbers, names, and locations of the departments where no  work.
译文：显示没有销售代表工作的部门的编号、名称和位置。
select job_id
from  jobs
where job_title = 'Sales Representative';

select e.department_id 
from employees e 
where e.job_id = 'SA_REP' 
and e.department_id is not null 

select * 
from departments 
where department_id in (select e.department_id 
      from employees e 
      where e.job_id != (select job_id
from  jobs
where job_title = 'Sales Representative') 
      and e.department_id is not null ); 
      
18.Show the department number, department name, and the number of employees working in each department that:
译文：显示部门编号、部门名称，以及在每个部门工作的员工人数:
a.  Includes fewer than 3 employees:
译文：员工人数少于3人: !!

with
table1 as (select department_id did, count(*) c
from employees
group by department_id
having count(*)<3)

select department_id ,department_name , table1.c  from departments d, table1 where table1.did=d.department_id
b.  Has the highest number of employees:
译文：员工人数最多:
select * from(
select e.department_id, department_name, count(e.employee_id) employees 
from departments d, employees e 
where e.department_id = d.department_id 
group by e.department_id, department_name 
order by employees desc)
where rownum < 2;

c.  Has the lowest  number of employees: 
译文：员工人数最低:
select * from(
select e.department_id, department_name, count(e.employee_id) employees 
from departments d, employees e 
where e.department_id = d.department_id 
group by e.department_id, department_name 
order by employees asc)
where rownum < 2;
19.Show the employee number, last name, salary, department number, and the average salary in their department for all employees.
译文：显示所有员工的员工编号、姓氏、工资、部门编号和所在部门的平均工资。
select department_id,avg(salary)
from employees
group by department_id;

select table2.employee_id,table2.last_name,table2.department_id,table1.avgsalary from(
select department_id did,avg(salary) avgsalary 
from employees
group by department_id
) table1,employees table2
where table1.did = table2.department_id;

20.Show all employees who were hired on the day of the week on which the highest number of employees were hired.译文：显示所有在一周中员工人数最多的那一天被雇佣的员工

select to_char(hire_date,'day') day,count(*) cc
from employees
group by to_char(hire_date,'day')
order by cc desc;


21.Create an anniversary overview based on the hire date of the employees. Sort the anniversaries in ascending order.译文：根据员工的雇佣日期创建周年纪念概述。按升序排列周年纪念译文：根据员工的雇佣日期创建周年纪念概述。按升序排列周年纪念

select to_char(sysdate, 'MON dd', 'NLS_DATE_LANGUAGE = American') from dual;
select last_name,to_char(hire_date, 'MON dd', 'NLS_DATE_LANGUAGE = American')
from employees
order by to_char(hire_date,'MM'),to_char(hire_date,'dd');

22.Find the job that was filled in the first half of 1990 and the same job that was filled during the same period in 1991.译文：找一份1990年上半年的工作和1991年同期的工作。

select hire_date
from employees
where to_char(hire_date,'yyyy') = 1990
and
to_char(hire_date,'MM') < 7; 

select job_id
from employees
where to_char(hire_date,'yyyy') = 1991
and 
to_char(hire_date,'MM') < 7
INTERSECT
select job_id
from employees
where to_char(hire_date,'yyyy') = 1990
and
to_char(hire_date,'MM') < 7;

23.编写一个复合查询,生成一个显示加薪百分比、员工id、旧工资和新工资增长的员工列表。
   部门10、50、110的员工加薪5%，
   部门60的员工加薪10%，
   部门20、80的员工加薪15%，
   部门90的员工不加薪

   select '05% raise',employee_id,salary,salary*0.05 new_salary
   from employees
   where department_id in(10,50,110)
   UNION
   select '10% raise',employee_id,salary,salary*0.1 new_salary
   from employees
   where department_id = 60
   union
   select '15% raise',employee_id,salary,salary*0.15 new_salary
   from employees
   where department_id in (20,80)
   union
   select 'no raise',employee_id,salary,salary new_salary
   from employees
   where department_id = 90;
   
   
24.Alter the session to set the NLS_DATE_FORMAT to  DD-MON-YYYY HH24:MI:SS
译文：修改会话，将NLS_DATE_FORMAT设置为DD-MON-YYYY HH24:MI:SS

alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

25.
a. Write queries to display the time zone offsets (TZ_OFFSET) for the following time zones.
	Australia/Sydney 
译文：编写查询来显示以下时区的时区偏移量(TZ_OFFSET)。
澳大利亚/悉尼

b. Alter the session to set the TIME_ZONE parameter value to the time zone offset of
 				Australia/Sydney.
译文：
更改会话以将TIME_ZONE参数值设置为的时区偏移量
澳大利亚悉尼。

c. Display the SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP, and
          LOCALTIMESTAMP for this session. 
译文：
显示SYSDATE、CURRENT_DATE、CURRENT_TIMESTAMP和
此会话的LOCALTIMESTAMP。

d. Alter the session to set the TIME_ZONE parameter value to the time zone offset of 
 				Chile/Easter Island.
更改会话以将TIME_ZONE参数值设置为的时区偏移量
智利复活节岛。

26.Write a query to display the last names, month of the date of join, and hire date of those 
  employees who have joined in the month of January, irrespective of the year of join.
译文：
编写一个查询来显示姓氏、加入日期的月份和雇佣日期
1月份入职的员工，不论入职年份。

select last_name,round(months_between(sysdate,hire_date)),hire_date
from employees
where to_char(hire_date,'MM') = '01';

select * from employees;

27.Write a query to display the following for those departments whose department ID is greater 
      than 80:
           The total salary for every job within a department 
           The total salary  
           The total salary for those cities in which the departments are located
           The total salary for every job, irrespective of the department 
           The total salary for every department irrespective of the city
           The total salary of the cities in which the departments are located
           Total salary for the departments, irrespective of  job titles and cities 
译文：
编写一个查询，为部门ID较大的部门显示以下内容
比80:
一个部门内每项工作的总工资
总工资
各部门所在城市的工资总额
不论在哪个部门，每项工作的总工资
不论所在城市，每个部门的工资总额
各部门所在城市的工资总额
各部门的工资总额，不分职位和城市

28.

29.Write a query to display the top three earners in the EMPLOYEES table. Display their last 	names and salaries.
译文：编写一个查询来显示EMPLOYEES表中收入最高的三个人。显示他们的姓和薪水

select last_name,salary
from employees
where rownum < 4 
order by salary desc;

30. Write a query to display the employee ID and last names of the employees who work in the 	state of California. 
	Hint: Use scalar subqueries. 
译文：
编写一个查询来显示在加利福尼亚州工作的员工的ID和姓氏。
提示:使用标量子查询。

select location_id
from locations
where state_province = 'California';

select department_id
from departments
where location_id = 1500;

select employee_id,last_name
from employees
where department_id = (select department_id
from departments
where location_id = (select location_id
from locations
where state_province = 'California'));

31.Write a query to delete the oldest JOB_HISTORY row of  an employee by looking up the 	JOB_HISTORY table for the MIN(START_DATE) for the employee. Delete the records of 	only those employees who have changed at least two jobs. If your query executes correctly, 	you will get the feedback:
	 Hint: Use a correlated DELETE command.
  译文：
编写一个查询，通过查找JOB_HISTORY表中雇员的最小值(START_DATE)来删除雇员最老的JOB_HISTORY行。只删除那些至少换过两份工作的员工的记录。如果您的查询正确执行，您将得到反馈:
提示:使用相关的删除命令。 

32.  Roll back the transaction
译文：回滚事务
ROLLBACK [ WORK ] [ TO [SAVEPOINT] savepoint_name  | FORCE 'string' ];

33.Write a query to display the job IDs of those jobs whose maximum salary is above half the 	maximum salary in the whole company. Use the WITH clause to write this query. Name the 	query MAX_SAL_CALC.
译文：编写一个查询，显示最高工资超过整个公司最高工资一半的工作的工作id。使用WITH子句编写这个查询。将查询命名为MAX_SAL_CALC。

with
MAX_SAL_CALC as (
select job_id jid
from employees 
where salary > (select max(salary)/2 from employees))

select distinct j.job_title,e.salary
from jobs j,MAX_SAL_CALC m,employees e
where j.job_id = m.jid
and
j.job_id = e.job_id;

34.	Write a SQL statement to display employee number, last name, start date, and salary, 		showing:
  		a. De Haan’s direct reports
译文：
编写SQL语句，显示员工编号、姓氏、入职日期和工资，显示:
a.De Haan的直接报道：

select employee_id
from employees
where last_name = 'De Haan';

select employee_id,last_name,hire_date,salary
from employees
where manager_id = (select employee_id
from employees
where last_name = 'De Haan');
b. The organization tree under De Haan (employee number 102)
译文：De Haan下的组织树(员工编号102)

SELECT  employee_id,last_name,hire_date,salary
FROM    employees START   
WITH manager_id = 102 
CONNECT BY PRIOR employee_id = manager_id ;

35.Write a hierarchical query to display the employee number, manager number, and employee  		
         last name for all employees who are two levels below employee De Haan (employee
          		number 102). Also display the level of the employee.
译文：编写一个分层查询，显示低于employee De Haan (employee number 102)两层的所有员工的员工编号、经理编号和员工姓。
      还显示员工的级别。

select employee_id,manager_id,level,last_name
from employees
where level > 2
start with
employee_id = 102
connect by prior employee_id = manager_id;

36.Produce a hierarchical report to display the employee number, manager number, the LEVEL 			pseudocolumn, and employee last name. For every row in the EMPLOYEES table, you 			should print a tree structure showing the employee, the employee’s manager, then the 			manager’s manager, and so on. Use indentations for the NAME column.
译文：生成分层报告,显示员工号码、经理号码、级别伪列和员工姓。
对于员工表中的每一行,您应该打印一个树结构,显示员工的员工、员工的经理,然后是经理的经理,等等。使用名称列的凹痕。

select employee_id,manager_id,level,LPAD(last_name, LENGTH(last_name)+(LEVEL*2)-2,'_') last_name 
from employees
start with last_name = 'King'
connect by prior employee_id = manager_id;

37.Write a query to do the following: 
         Retrieve the details of the employee ID, hire date, salary, and manager ID of those employees whose employee ID is more than or equal to 200 from the EMPLOYEES table.
         If the salary is less than $5,000, insert the details of employee ID and salary into the SPECIAL_SAL table.
         Insert the details of employee ID, hire date, and salary into the SAL_HISTORY table. 
         Insert the details of employee ID, manager ID, and salary into the MGR_HISTORY table.
译文：编写一个查询来执行以下操作:检索员工ID、雇佣日期、工资和经理ID的细节,员工的员工身份是员工名单中超过或等于200人。
      如果工资低于5000美元,则将员工ID和工资的细节插入到专用表中。将员工ID、雇佣日期和工资的细节插入SAL_HISTORY表。
      将员工ID、manager ID和薪水的细节插入MGR_HISTORY表中。

38. Query the SPECIAL_SAL, SAL_HISTORY and the MGR_HISTORY tables to view the inserted records.
译文：查询SPECIAL_SAL、SAL_HISTORY和MGR_HISTORY表来查看插入的记录。

39.Create the LOCATIONS_NAMED_INDEX table based on the following table instance chart. 		
   Name the index for the PRIMARY KEY column as LOCATIONS_PK_IDX
   译文：基于下面表实例表创建LOCATIONS_NAMED_INDEX表。
         将主键列的索引命名为LOCATIONS_PK_IDX

create table LOCATIONS_PK_INDEX(
Deptno number(4) primary key,
Dname varchar2(30)
);

create index LOCATIONS_PK_IDX
ON LOCATIONS_PK_INDEX(Deptno);

40.Query the USER_INDEXES table to display the INDEX_NAME for the LOCATIONS_NAMED_INDEX table. 
译文：查询user_index表以显示LOCATIONS_NAMED_INDEX表的INDEX_NAME。

41.Write a SQL script file to drop all objects (tables, views, indexes, sequences, synonyms, and so on) that you own. 
译文：编写一个SQL脚本文件来删除您拥有的所有对象(表、视图、索引、序列、同义词等)。
Note: The output shown is only a guideline.
译文：注意:显示的输出只是一个指导方针。
