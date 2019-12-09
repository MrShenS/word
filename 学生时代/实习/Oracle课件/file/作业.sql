--��ϰ--
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
��û��Ӷ���Ա����н10%(�ѹ��ʱ���������)

select 'The salary for'||last_name||'after a 10% is '||salary*1.1 New_salary 
from employees
where commission_pct is null;

4.Show the last names of all employees together with the number of years and the number of completed months that they have been employed
�г����й�Ա�����ϣ��Լ������ܹ͵���������ɹ������·��г����й�Ա�����ϣ��Լ������ܹ͵���������ɹ������·�

select last_name,floor(months_between(sysdate,hire_date)/12) years,round(months_between(sysdate,hire_date)) months
from employees;

5.Show those employees that have a name starting with J, K, L, or M.��ʾ��Щ������J��K��L��M��ͷ��Ա������ʾ��Щ������J��K��L��M��ͷ��Ա����
select *
from employees
where last_name like 'J%' or last_name like 'K%' or last_name like 'L%' or last_name like 'M%';

select * 
from employees
where substr(last_name,1,1) in ('J','K','L','M');

6.Show all employees, and indicate with ��Yes�� or ��No�� whether they receive a commission
��ʾ����Ա�������á��ǡ��򡰷񡱱�ʾ�����Ƿ��յ���Ӷ��

select last_name,nvl2(commission_pct,'��','��')
from employees;

7.Show the department names, locations, names, job titles, and salaries of employees who workin location 1800.
���ģ���ʾ��1800���ص㹤���Ĳ������ơ��ص㡢���ơ�ְ��͹��ʡ�
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

9.Show the names and locations for all departments, and the number of employees working in each department. Make sure that departments without employees are included as well.���ģ���ʾ���в��ŵ����ƺ�λ�ã��Լ�ÿ�����ŵ�Ա��������ȷ��û��Ա���Ĳ���Ҳ�������ڡ�
select d.department_id,d.department_name,d.location_id,count(e.employee_id)
from departments d,employees e
where d.department_id = e.department_id
group by d.department_id,d.department_name,d.location_id;

10.Which jobs are found in departments 10 and 20?
����:0��20��������Щְλ
select  job_id
from employees
where department_id in (10,20);

11.Which jobs are found in the Administration and Executive departments, and how many employees do these jobs? Show the job with the highest frequency first.
���ģ�������ִ�в�������Щְλ���ж���Ա��������Щ����?������ʾƵ����ߵĹ���
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
���ģ���ʾ�����ϰ���(����16��ǰ)��Ƹ������Ա��
select *
from employees
where to_number(to_char(hire_date,'MM')) = to_number(to_char(sysdate,'MM'))
and
to_number(to_char(hire_date,'dd')) < 16;

13.Show the names, salaries, and the number of dollars (in thousands) that all employees earn
���ģ���ʾ����Ա�������������ʺ�����(��ǧΪ��λ)
select last_name,round(salary) salary,salary/1000 thousands
from employees;

14.Show all employees who have managers with a salary higher than $15,000. Show thefollowing data: employee name, manager name, manager salary, and salary grade of the manager.
���ģ���ʾ���й�����Ա���ʸ���15,000��Ԫ��Ա������ʾ��������:Ա�����������������������ʡ������ʵȼ�
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
���ģ���ʾ���ű�š����ơ�Ա��������������ƽ�����ʣ��Լ�������Ա�������������ʡ�ְ��
select department_id,count(*),avg(salary)
from employees
group by department_id;

select d.did,d.dpn,d.salary,e.last_name,e.salary,e.job_id
from employees e,(select department_id did,count(*) dpn,avg(salary) salary
from employees
group by department_id) d
where e.department_id (+)= d.did;

16.Show the department number and the lowest salary of the department with the highest average 	salary.���ģ���ʾƽ��������ߵĲ��ŵĲ��źź���͹���
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
���ģ���ʾû�����۴������Ĳ��ŵı�š����ƺ�λ�á�
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
���ģ���ʾ���ű�š��������ƣ��Լ���ÿ�����Ź�����Ա������:
a.  Includes fewer than 3 employees:
���ģ�Ա����������3��: !!

with
table1 as (select department_id did, count(*) c
from employees
group by department_id
having count(*)<3)

select department_id ,department_name , table1.c  from departments d, table1 where table1.did=d.department_id
b.  Has the highest number of employees:
���ģ�Ա���������:
select * from(
select e.department_id, department_name, count(e.employee_id) employees 
from departments d, employees e 
where e.department_id = d.department_id 
group by e.department_id, department_name 
order by employees desc)
where rownum < 2;

c.  Has the lowest  number of employees: 
���ģ�Ա���������:
select * from(
select e.department_id, department_name, count(e.employee_id) employees 
from departments d, employees e 
where e.department_id = d.department_id 
group by e.department_id, department_name 
order by employees asc)
where rownum < 2;
19.Show the employee number, last name, salary, department number, and the average salary in their department for all employees.
���ģ���ʾ����Ա����Ա����š����ϡ����ʡ����ű�ź����ڲ��ŵ�ƽ�����ʡ�
select department_id,avg(salary)
from employees
group by department_id;

select table2.employee_id,table2.last_name,table2.department_id,table1.avgsalary from(
select department_id did,avg(salary) avgsalary 
from employees
group by department_id
) table1,employees table2
where table1.did = table2.department_id;

20.Show all employees who were hired on the day of the week on which the highest number of employees were hired.���ģ���ʾ������һ����Ա������������һ�챻��Ӷ��Ա��

select to_char(hire_date,'day') day,count(*) cc
from employees
group by to_char(hire_date,'day')
order by cc desc;


21.Create an anniversary overview based on the hire date of the employees. Sort the anniversaries in ascending order.���ģ�����Ա���Ĺ�Ӷ���ڴ�����������������������������������ģ�����Ա���Ĺ�Ӷ���ڴ��������������������������������

select to_char(sysdate, 'MON dd', 'NLS_DATE_LANGUAGE = American') from dual;
select last_name,to_char(hire_date, 'MON dd', 'NLS_DATE_LANGUAGE = American')
from employees
order by to_char(hire_date,'MM'),to_char(hire_date,'dd');

22.Find the job that was filled in the first half of 1990 and the same job that was filled during the same period in 1991.���ģ���һ��1990���ϰ���Ĺ�����1991��ͬ�ڵĹ�����

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

23.��дһ�����ϲ�ѯ,����һ����ʾ��н�ٷֱȡ�Ա��id���ɹ��ʺ��¹���������Ա���б�
   ����10��50��110��Ա����н5%��
   ����60��Ա����н10%��
   ����20��80��Ա����н15%��
   ����90��Ա������н

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
���ģ��޸ĻỰ����NLS_DATE_FORMAT����ΪDD-MON-YYYY HH24:MI:SS

alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

25.
a. Write queries to display the time zone offsets (TZ_OFFSET) for the following time zones.
	Australia/Sydney 
���ģ���д��ѯ����ʾ����ʱ����ʱ��ƫ����(TZ_OFFSET)��
�Ĵ�����/Ϥ��

b. Alter the session to set the TIME_ZONE parameter value to the time zone offset of
 				Australia/Sydney.
���ģ�
���ĻỰ�Խ�TIME_ZONE����ֵ����Ϊ��ʱ��ƫ����
�Ĵ�����Ϥ�ᡣ

c. Display the SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP, and
          LOCALTIMESTAMP for this session. 
���ģ�
��ʾSYSDATE��CURRENT_DATE��CURRENT_TIMESTAMP��
�˻Ự��LOCALTIMESTAMP��

d. Alter the session to set the TIME_ZONE parameter value to the time zone offset of 
 				Chile/Easter Island.
���ĻỰ�Խ�TIME_ZONE����ֵ����Ϊ��ʱ��ƫ����
��������ڵ���

26.Write a query to display the last names, month of the date of join, and hire date of those 
  employees who have joined in the month of January, irrespective of the year of join.
���ģ�
��дһ����ѯ����ʾ���ϡ��������ڵ��·ݺ͹�Ӷ����
1�·���ְ��Ա����������ְ��ݡ�

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
���ģ�
��дһ����ѯ��Ϊ����ID�ϴ�Ĳ�����ʾ��������
��80:
һ��������ÿ������ܹ���
�ܹ���
���������ڳ��еĹ����ܶ�
�������ĸ����ţ�ÿ������ܹ���
�������ڳ��У�ÿ�����ŵĹ����ܶ�
���������ڳ��еĹ����ܶ�
�����ŵĹ����ܶ����ְλ�ͳ���

28.

29.Write a query to display the top three earners in the EMPLOYEES table. Display their last 	names and salaries.
���ģ���дһ����ѯ����ʾEMPLOYEES����������ߵ������ˡ���ʾ���ǵ��պ�нˮ

select last_name,salary
from employees
where rownum < 4 
order by salary desc;

30. Write a query to display the employee ID and last names of the employees who work in the 	state of California. 
	Hint: Use scalar subqueries. 
���ģ�
��дһ����ѯ����ʾ�ڼ����������ݹ�����Ա����ID�����ϡ�
��ʾ:ʹ�ñ����Ӳ�ѯ��

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
  ���ģ�
��дһ����ѯ��ͨ������JOB_HISTORY���й�Ա����Сֵ(START_DATE)��ɾ����Ա���ϵ�JOB_HISTORY�С�ֻɾ����Щ���ٻ������ݹ�����Ա���ļ�¼��������Ĳ�ѯ��ȷִ�У������õ�����:
��ʾ:ʹ����ص�ɾ����� 

32.  Roll back the transaction
���ģ��ع�����
ROLLBACK [ WORK ] [ TO [SAVEPOINT] savepoint_name  | FORCE 'string' ];

33.Write a query to display the job IDs of those jobs whose maximum salary is above half the 	maximum salary in the whole company. Use the WITH clause to write this query. Name the 	query MAX_SAL_CALC.
���ģ���дһ����ѯ����ʾ��߹��ʳ���������˾��߹���һ��Ĺ����Ĺ���id��ʹ��WITH�Ӿ��д�����ѯ������ѯ����ΪMAX_SAL_CALC��

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
  		a. De Haan��s direct reports
���ģ�
��дSQL��䣬��ʾԱ����š����ϡ���ְ���ں͹��ʣ���ʾ:
a.De Haan��ֱ�ӱ�����

select employee_id
from employees
where last_name = 'De Haan';

select employee_id,last_name,hire_date,salary
from employees
where manager_id = (select employee_id
from employees
where last_name = 'De Haan');
b. The organization tree under De Haan (employee number 102)
���ģ�De Haan�µ���֯��(Ա�����102)

SELECT  employee_id,last_name,hire_date,salary
FROM    employees START   
WITH manager_id = 102 
CONNECT BY PRIOR employee_id = manager_id ;

35.Write a hierarchical query to display the employee number, manager number, and employee  		
         last name for all employees who are two levels below employee De Haan (employee
          		number 102). Also display the level of the employee.
���ģ���дһ���ֲ��ѯ����ʾ����employee De Haan (employee number 102)���������Ա����Ա����š������ź�Ա���ա�
      ����ʾԱ���ļ���

select employee_id,manager_id,level,last_name
from employees
where level > 2
start with
employee_id = 102
connect by prior employee_id = manager_id;

36.Produce a hierarchical report to display the employee number, manager number, the LEVEL 			pseudocolumn, and employee last name. For every row in the EMPLOYEES table, you 			should print a tree structure showing the employee, the employee��s manager, then the 			manager��s manager, and so on. Use indentations for the NAME column.
���ģ����ɷֲ㱨��,��ʾԱ�����롢������롢����α�к�Ա���ա�
����Ա�����е�ÿһ��,��Ӧ�ô�ӡһ�����ṹ,��ʾԱ����Ա����Ա���ľ���,Ȼ���Ǿ���ľ���,�ȵȡ�ʹ�������еİ��ۡ�

select employee_id,manager_id,level,LPAD(last_name, LENGTH(last_name)+(LEVEL*2)-2,'_') last_name 
from employees
start with last_name = 'King'
connect by prior employee_id = manager_id;

37.Write a query to do the following: 
         Retrieve the details of the employee ID, hire date, salary, and manager ID of those employees whose employee ID is more than or equal to 200 from the EMPLOYEES table.
         If the salary is less than $5,000, insert the details of employee ID and salary into the SPECIAL_SAL table.
         Insert the details of employee ID, hire date, and salary into the SAL_HISTORY table. 
         Insert the details of employee ID, manager ID, and salary into the MGR_HISTORY table.
���ģ���дһ����ѯ��ִ�����²���:����Ա��ID����Ӷ���ڡ����ʺ;���ID��ϸ��,Ա����Ա�������Ա�������г��������200�ˡ�
      ������ʵ���5000��Ԫ,��Ա��ID�͹��ʵ�ϸ�ڲ��뵽ר�ñ��С���Ա��ID����Ӷ���ں͹��ʵ�ϸ�ڲ���SAL_HISTORY��
      ��Ա��ID��manager ID��нˮ��ϸ�ڲ���MGR_HISTORY���С�

38. Query the SPECIAL_SAL, SAL_HISTORY and the MGR_HISTORY tables to view the inserted records.
���ģ���ѯSPECIAL_SAL��SAL_HISTORY��MGR_HISTORY�����鿴����ļ�¼��

39.Create the LOCATIONS_NAMED_INDEX table based on the following table instance chart. 		
   Name the index for the PRIMARY KEY column as LOCATIONS_PK_IDX
   ���ģ����������ʵ������LOCATIONS_NAMED_INDEX��
         �������е���������ΪLOCATIONS_PK_IDX

create table LOCATIONS_PK_INDEX(
Deptno number(4) primary key,
Dname varchar2(30)
);

create index LOCATIONS_PK_IDX
ON LOCATIONS_PK_INDEX(Deptno);

40.Query the USER_INDEXES table to display the INDEX_NAME for the LOCATIONS_NAMED_INDEX table. 
���ģ���ѯuser_index������ʾLOCATIONS_NAMED_INDEX���INDEX_NAME��

41.Write a SQL script file to drop all objects (tables, views, indexes, sequences, synonyms, and so on) that you own. 
���ģ���дһ��SQL�ű��ļ���ɾ����ӵ�е����ж���(����ͼ�����������С�ͬ��ʵ�)��
Note: The output shown is only a guideline.
���ģ�ע��:��ʾ�����ֻ��һ��ָ�����롣
