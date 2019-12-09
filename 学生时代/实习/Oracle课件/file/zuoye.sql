4.
DECLARE
V_YEAR NUMBER(4):=&P_YEAR;
V_REMAINDER1 NUMBER(5,2);
V_REMAINDER2 NUMBER(5,2);
V_REMAINDER3 NUMBER(5,2);
BEGIN 
V_REMAINDER1:=MOD(V_YEAR,4);
V_REMAINDER2:=MOD(V_YEAR,100);
V_REMAINDER3:=MOD(V_YEAR,400);
IF((V_REMAINDER1=0 AND V_REMAINDER2<>0)OR V_REMAINDER3=0) THEN 
   DBMS_OUTPUT.PUT_LINE(V_YEAR||' is a leap year');
   ELSE DBMS_OUTPUT.PUT_LINE(V_YEAR||' is not a leap year');
   END IF;
END;
--5.
--a.For the exercises below, you will require a temporary table to store the results. 
  --You can either create the table yourself or run the labAp_05.
  --sql script that will create the table for you. Create a table 	
  --named TEMP with the following three columns:
译文：
对于下面的练习，您将需要一个临时表来存储结果。
您可以自己创建表，也可以运行labAp_05。
将为您创建表的sql脚本。创建一个表
名为TEMP，包含以下三列:

create table temp(
num_store number(7,2),
char_store varchar2(35),
date_store date
);
--b.Write a PL/SQL block that contains two variables, MESSAGE and DATE_WRITTEN. 
---Declare MESSAGE as VARCHAR2 data type with a length of 35 and DATE_WRITTEN as     	
---DATE data type. Assign the following values to the variables:
译文：编写一个PL/SQL块，其中包含两个变量MESSAGE和DATE_WRITTEN。
      将MESSAGE声明为VARCHAR2数据类型，长度为35，并将date_write作为日期数据类型。
      为变量赋值如下:
DECLARE
MESSAGE VARCHAR2(35);
date_write date;
BEGIN
  MESSAGE := 'This is my first PL/SQL program';
  date_write := SYSDATE;
  dbms_output.put_line(MESSAGE);
  dbms_output.put_line(date_write);
  INSERT INTO temp(char_store,date_store) values (MESSAGE,date_write); 
END;

select * from temp;
--6.a. Store a department number in a iSQL*Plus substitution variable
     --在iSQL*Plus替换变量中存储部门编号
      
	--b. Write a PL/SQL block to print the number of people working in that department.
  --译文：编写一个PL/SQL块来打印在该部门工作的人员数量。
  
  DECLARE
  V_DNO NUMBER := &P_DNO; 
  V_DEPTNUM NUMBER;
  BEGIN
    SELECT COUNT(*) INTO V_DEPTNUM
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = V_DNO;
    DBMS_OUTPUT.PUT_LINE(V_DEPTNUM);
  END;
--7.Write a PL/SQL block to declare a variable called v_salary to store the salary of an employee. 
-- In the executable part of the program, do the following:
   --a.Store an employee name in a  iSQL*Plus substitution variable
   --b.Store his or her salary in the variable v_salary
   --c.If the salary is less than 3,000, give the employee a raise of 500 and display the message '<Employee Name>’s salary updated' in the window.
   --d.If the salary is more than 3,000, print the employee’s salary in the format, '<Employee Name> earns …...………'
   --f.Test the PL/SQL for the following last names:
译文：
   编写一个PL/SQL块来声明一个名为v_salary的变量来存储员工的工资。在程序的可执行部分，执行以下步骤:
   将员工名存储在iSQL*Plus替换变量中
   将他或她的工资存储在变量v_salary中
   如果工资低于3000，则给员工加薪500，并在窗口中显示“< employee Name> ' s salary updated'”信息。
   如果工资超过3000，以“< employee Name> earn…”格式打印员工工资。
   测试以下姓氏的PL/SQL:
   
   DECLARE
   V_NAME EMPLOYEES.LAST_NAME%TYPE;
   V_SALARY NUMBER;
   BEGIN
     V_NAME := &E_NAME;
     SELECT SALARY
     INTO V_SALARY
     FROM EMPLOYEES
     WHERE LAST_NAME = V_NAME;
     --DBMS_OUTPUT.PUT_LINE(V_SALARY||' '||V_NAME);
       DECLARE
       V_NEW_SALARY NUMBER;
       BEGIN
         IF V_SALARY > 3000 THEN V_NEW_SALARY := V_SALARY;
         ELSIF V_SALARY < 3000 THEN V_NEW_SALARY := V_SALARY+500;
         END IF;
         DBMS_OUTPUT.PUT_LINE(V_NAME||'  '||V_NEW_SALARY);
         END; 
     END;
--8.a.  Store the salary of an employee in a  iSQL*Plus substitution variable.
	--b.	Write a PL/SQL block to use the above defined salary and perform the following:
        --Calculate the annual salary as salary * 12.
        --Calculate the bonus as indicated below:
译文：
将员工的工资存储在iSQL*Plus替换变量中。
b.编写一个PL/SQL块来使用上面定义的工资并执行以下操作:
计算年薪为工资* 12:
计算奖金如下:
DECLARE
V_SALARY NUMBER := &E_SALARY;
V_ANN_SALARY NUMBER;
V_BONUS NUMBER;
BEGIN
  V_ANN_SALARY := V_SALARY*12;
  IF V_ANN_SALARY >= 20000 THEN V_BONUS := 2000;
    ELSIF V_ANN_SALARY > 10000 AND V_ANN_SALARY < 20000 THEN V_BONUS := 1000;
    ELSIF V_ANN_SALARY < 10000 THEN V_BONUS := 500;
    END IF;
    DBMS_OUTPUT.PUT_LINE('员工年薪为：'||V_ANN_SALARY||'  员工的奖金为：'||V_BONUS);
  END;
--9.a.	Write a PL/SQL block to store an employee number, the new department number, and the percentage
       --increase in the salary in iSQL*Plus substitution variables. 
  --b.	Update the department ID of the employee with the new department number, and update the salary
       --with the new salary. Use the EMP table for the updates. Once the update is complete, display the
       --message, 'Update complete' in the window. If no matching records are found, display ‘No Data
       --Found’. Test the PL/SQL for the following test cases:
译文：
a.编写一个PL/SQL块来存储一个员工编号、新的部门编号和iSQL*加上替换变量中工资增长的百分比。
b.用新部门号更新员工部门ID，用新工资更新工资。使用EMP表进行更新。更新完成后，在窗口中显示“更新完成”消息。
     如果没有找到匹配的记录，则显示“没有找到数据”。测试下列测试用例的PL/SQL:
SELECT * FROM EMPLOYEES;
DECLARE
V_ID NUMBER := &EMPLOYEE_ID;
V_DID NUMBER;
V_SAL_PER NUMBER;
BEGIN
  END;
--10.Create a PL/SQL block to declare a cursor EMP_CUR to select the employee name, salary, 
   --and hire date from the EMPLOYEES table. Process each row from the cursor, and if the salary is greater than 15,000
   -- and the hire date is greater than 01-FEB-1988, display the employee name, salary, and hire date in the window
   -- in the format shown in the sample output below:
 译文：创建PL/SQL块来声明游标EMP_CUR，以从EMPLOYEES表中选择员工姓名、工资和雇佣日期。
        从游标开始处理每一行，如果工资大于15,000，并且雇佣日期大于01-FEB-1988，
        则在窗口中显示员工姓名、工资和雇佣日期，格式如下面的示例输出所示: 
        SELECT * FROM EMPLOYEES;
DECLARE
  v_empno employees.employee_id%TYPE;
  v_ename employees.last_name%TYPE;
  v_salary employees.salary%TYPE;
  v_date employees.hire_date%TYPE;
  CURSOR EMP_CUR IS
    SELECT employee_id, last_name,salary,hire_date FROM employees;
BEGIN
  OPEN EMP_CUR;
  LOOP
    FETCH EMP_CUR
      INTO v_empno, v_ename,v_salary,v_date;
    EXIT WHEN EMP_CUR%ROWCOUNT > 10 OR EMP_CUR%NOTFOUND;
    IF v_salary > 15000 AND  v_date >= TO_DATE('01-02-1988','DD-MM-YYYY') THEN 
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_empno) || ' ' || v_ename ||' '||V_SALARY||' '||v_date);
    END IF;
  END LOOP;
  CLOSE EMP_CUR;
END;
--11.Create a PL/SQL block to retrieve the last name and department ID of each employee from the EMPLOYEES
-- table for those employees whose EMPLOYEE_ID is less than 114. 
   --From the values retrieved from the EMPLOYEES table, populate two PL/SQL tables, 
   --one to store the records of the employee last names and the other to store the records of their department IDs.
   -- Using a loop, retrieve the employee name information and the salary information from the PL/SQL tables and 
   --display it in the window, using DBMS_OUTPUT.PUT_LINE. Display these details for the first 15 employees in the PL/SQL tables. 
译文：
   为EMPLOYEE_ID小于114的员工创建一个PL/SQL块，从EMPLOYEES表中检索每个员工的姓和部门ID。
   从EMPLOYEES表检索的值中，填充两个PL/SQL表，一个用于存储员工姓的记录，另一个用于存储部门id的记录。
   使用循环，从PL/SQL表中检索员工姓名信息和工资信息，并使用DBMS_OUTPUT.PUT_LINE将其显示在窗口中。
   在PL/SQL表中显示前15名员工的这些详细信息。 
 DECLARE
   TYPE TABLE_NAME IS TABLE OF EMPLOYEES.LAST_NAME%TYPE INDEX BY BINARY_INTEGER;
   TYPE TABLE_DEPARTMENT IS TABLE OF EMPLOYEES.DEPARTMENT_ID%TYPE INDEX BY BINARY_INTEGER;
   V_NAME TABLE_NAME;
   V_DEPT TABLE_DEPARTMENT;
   i   BINARY_INTEGER := 0;
   CURSOR EMP_DEPT_CURSOR IS
     SELECT employee_id, last_name FROM employees WHERE EMPLOYEE_ID < 115;
   V_COUNT NUMBER := 15;
 BEGIN
   OPEN EMP_DEPT_CURSOR;
   LOOP
     i := i + 1;
     FETCH EMP_DEPT_CURSOR
       INTO  V_DEPT(i),V_NAME(i);
     EXIT WHEN i > V_COUNT;
   END LOOP;
   FOR i IN 1 .. V_COUNT LOOP
     DBMS_OUTPUT.PUT_LINE('EMPLOYEE_NAME ' || V_NAME(i) || '  ' ||
                          'TABLE_DEPT' || to_char(V_DEPT(i)));
   END LOOP;
 END;
--------------------------------------------------------------
DECLARE
  TYPE Table_Ename is table of employees.last_name%TYPE INDEX BY BINARY_INTEGER;
  TYPE Table_dept is table of employees.department_id%TYPE index BY BINARY_INTEGER;
  V_Tename Table_Ename;
  V_Tdept  Table_dept;
  CURSOR C_Namedept IS
    SELECT last_name, department_id from employees where employee_id < 115;
  i       BINARY_INTEGER := 0;
  V_COUNT NUMBER := 15;
BEGIN
  FOR emprec in C_Namedept LOOP
    i := i + 1;
    V_Tename(i) := emprec.last_name;
    V_Tdept(i) := emprec.department_id;
  END LOOP;
  FOR i IN 1 .. v_count LOOP
    DBMS_OUTPUT.PUT_LINE('EmployeeName:' || V_Tename(i) ||
                         'Department_id:' || V_Tdept(i));
  END LOOP;
END;
--12.a. Create a PL/SQL block that declares a cursor called DATE_CUR. Pass a parameter of DATE data
       --type to the cursor and print the details of all employees who have joined after that date.
    	 --DEFINE P_HIREDATE = 08-MAR-00
   --b. Test the PL/SQL block for the following hire dates: 08-MAR-00, 25-JUN-97, 28-SEP-98, 	07-FEB-99.
译文：
A.创建一个PL/SQL块，该块声明一个名为DATE_CUR的游标。将日期数据类型的参数传递给游标，并打印在该日期之后加入的所有员工的详细信息。
   定义P_HIREDATE = 08-MAR-00
b.测试PL/SQL块，以确定以下 租用日期: 08- 3 -00、25- 6 -97、28- 9 -98、07-FEB-99。
DECLARE
  CURSOR DATE_CUR(JOIN_DATE DATE) IS
    SELECT last_name, department_id,HIRE_DATE from employees where HIRE_DATE > JOIN_DATE;
  V_NO EMPLOYEES.EMPLOYEE_ID%TYPE;
  V_NAME EMPLOYEES.LAST_NAME%TYPE;
  V_HIREDATE EMPLOYEES.HIRE_DATE%TYPE;
  V_DATE DATE := TO_DATE('08-03-1900','DD-MM-YYYY');
BEGIN
  OPEN DATE_CUR(V_DATE);
  LOOP
    FETCH DATE_CUR INTO V_NAME,V_NO,V_HIREDATE;
    EXIT WHEN DATE_CUR%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('V_NO:' || V_NO ||
                         'V_NAME:' || V_NAME||' HIREDATE '||V_HIREDATE);
   END LOOP;
END;
--13. Create a PL/SQL block to promote clerks who earn more than 3,000 to the job title SR CLERK 
    --and increase their salary by 10%. Use the EMP table for this practice. 
    --Verify the results by querying on the EMP table. Hint: Use a cursor with FOR UPDATE and CURRENT OF syntax
译文：
创建一个PL/SQL块，将收入超过3,000的职员提升到职位SR CLERK，并将他们的工资提高10%。
在此实践中使用EMP表。通过查询EMP表来验证结果。提示:使用游标来更新和更新语法。
DECLARE
CURSOR C_TEST IS 
SELECT EMPLOYEE_ID,JOB_ID FROM EMPLOYEES
WHERE SALARY > 20000
FOR UPDATE OF JOB_ID;
BEGIN
  FOR R_TEST IN C_TEST LOOP
    UPDATE EMPLOYEES
    SET SALARY = SALARY*1.1
    WHERE CURRENT OF C_TEST;
    DBMS_OUTPUT.PUT_LINE('JLJL');
    END LOOP;
  END;
SELECT * FROM EMPLOYEES WHERE SALARY > 3000;  
--14.a. For the exercise below, you will require a table to store the results. 
      --You can create the ANALYSIS table yourself or run the labAp_14a.sql script that creates the table for you. 
      --Create a table called ANALYSIS with the following three columns:
译文：
对于下面的练习，您将需要一个表来存储结果。
——您可以自己创建分析表，或者运行labAp_14a。为您创建表的sql脚本。
——创建一个名为ANALYSIS的表，包含以下三列:
CREATE TABLE ANALUSIS(
ENAME VARCHAR2(20),
YEARS NUMBER(2),
SAL NUMBER(8,2)
);

SELECT * FROM ANALUSIS;
--b..Create a PL/SQL block to populate the ANALYSIS table with the information from the EMPLOYEES table. 
--Use an iSQL*Plus substitution variable to store an employee’s last name. 
译文：
创建一个PL/SQL块，用EMPLOYEES表中的信息填充分析表。
——使用iSQL*Plus替换变量存储员工的姓;
--c.Query the EMPLOYEES table to find if the number of years that the employee has been with the organization is
-- greater than five, and if the salary is less than 3,500, raise an exception. 
--Handle the exception with an appropriate exception handler that inserts the following values into the ANALYSIS table:
-- employee last name, number of years of service, and the current salary. 
--Otherwise display Not due for a raise in the window. 
--Verify the results by querying the ANALYSIS table. 
--Use the following test cases to test the PL/SQL block:
译文：
查询EMPLOYEES表，查看该员工在组织中的工作年限是否大于5年，如果工资低于3500，则抛出异常。
使用适当的异常处理程序处理异常，该异常处理程序将以下值插入到分析表中:员工姓、服务年限和当前工资。
否则在窗口中显示未到期的加薪。通过查询分析表来验证结果。使用以下测试用例测试PL/SQL块:
DECLARE
V_NAME EMPLOYEES.LAST_NAME%TYPE;
V_SAL EMPLOYEES.SALARY%TYPE;
V_DATE EMPLOYEES.HIRE_DATE%TYPE;
V_LASTNAME VARCHAR2(10) := &P_NAME;
V_YEARS NUMBER;
EPTN EXCEPTION;
BEGIN
  SELECT LAST_NAME,SALARY,HIRE_DATE
  INTO V_NAME,V_SAL,V_DATE
  FROM EMPLOYEES 
  WHERE LAST_NAME = V_LASTNAME;
  V_YEARS := MONTHS_BETWEEN(SYSDATE,V_DATE)/12;
  IF  V_YEARS > 5 AND V_SAL < 3500 THEN
      RAISE EPTN;
    ELSE 
      DBMS_OUTPUT.PUT_LINE('NO RAISE UP SALARY');
      END IF;
EXCEPTION 
 WHEN EPTN THEN
   INSERT INTO ANALUSIS VALUES(V_NAME,V_YEARS,V_SAL);
   DBMS_OUTPUT.PUT_LINE('DUE FOR A RAISE'); 
END;

select *from analusis;
-------procedure------
--15.In this practice, create a program to add a new job into the JOBS table.
译文：在这种实践中，创建一个程序将新作业添加到JOBS表中。
--a.Create a stored procedure called ADD_JOBS to enter a new order into the JOBS table. 
	--The procedure should accept three parameters. The first and second parameters supplies a job ID and a job title.
  --The third parameter supplies the minimum salary. 
  --Use the maximum salary for the new job as twice the minimum salary supplied for the job ID. 
译文：
创建一个名为ADD_JOBS的存储过程，以便在JOBS表中输入新订单。
该过程应该接受三个参数。
第一个和第二个参数提供了作业ID和作业标题。
第三个参数提供了最低工资。使用新工作的最高工资为工作ID提供的最低工资的两倍。
CREATE OR REPLACE PROCEDURE ADD_JOBS(J_ID IN JOBS.JOB_ID%TYPE,J_TITLE IN JOBS.JOB_TITLE%TYPE,J_MINSAL IN JOBS.MIN_SALARY%TYPE) IS
V_MAXSAL JOBS.MAX_SALARY%TYPE;
BEGIN
  V_MAXSAL := J_MINSAL* 2;
     INSERT INTO JOBS(JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES(J_ID,J_TITLE,J_MINSAL,V_MAXSAL);
     DBMS_OUTPUT.PUT_LINE('成功插入数据');
END ADD_JOBS;
--b.Disable the trigger SECURE_EMPLOYEES before invoking the procedure. 
--Invoke the procedure to add a new job with job ID SY_ANAL, job title System Analyst, and minimum salary of 6,000.
译文：
在调用过程之前禁用触发器c。
调用该过程添加一个新作业，该作业ID为SY_ANAL，作业标题系统分析师，最低工资为6000。

ALTER TRIGGER SECURE_EMPLOYEES DISABLE;

--C.Verify that a row was added and remember the new job ID for use in the next exercise.
   -- Commit the changes.
译文：
确认添加了一行，并记住下一个练习中使用的新作业ID。
——提交更改。
SELECT * FROM JOBS WHERE JOB_ID = 'SY_ANAL';

--16. In this practice, create a program to add a new row to the JOB_HISTORY table for an existing employee.
    --Note: Disable all triggers on the EMPLOYEES, JOBS, and JOB_HISTORY tables before invoking             
    --the procedure in part b. Enable all these triggers after executing the procedure. 
译文：
在这种实践中，创建一个程序来为现有员工在JOB_HISTORY表中添加新行。
注意:在调用b部分中的过程之前，禁用employee、JOBS和JOB_HISTORY表上的所有触发器。在执行过程之后，启用所有这些触发器。
--a.Create a stored procedure called ADD_JOB_HIST to enter a new row into the JOB_HISTORY table for an employee who is changing his job to the new job ID that you created in question 15b. 
	   --Use the employee ID of the employee who is changing the job and the new job ID for the employee as parameters. Obtain the row corresponding to this employee ID from the EMPLOYEES table and insert it into the JOB_HISTORY table. Make hire date of this employee as the start date and today's date as end date for this row in the JOB_HISTORY table. 
	   ---Change the hire date of this employee in the EMPLOYEES table to today's date. Update the job ID of this employee to the job ID passed as parameter (Use the job ID of the job created in question 15b) and salary equal to minimum salary for that job ID + 500. 
     ----Include exception handling to handle an attempt to insert a nonexistent employee.
--b.Disable triggers (Refer to the note at the beginning of this question.) 
	----Execute the procedure with employee ID 106 and job ID SY_ANAL as parameters.
	-----Enable the triggers that you disabled.
--c. Query the tables to view your changes, and then commit the changes.
译文：
a.
创建一个名为ADD_JOB_HIST的存储过程，以便在JOB_HISTORY表中为将作业更改为问题15b中创建的新作业ID的员工输入新行。
——使用正在更改作业的员工的员工ID和该员工的新工作ID作为参数。从EMPLOYEES表中获取与此员工ID对应的行，并将其插入JOB_HISTORY表中。将该员工的雇佣日期作为JOB_HISTORY表中这一行的开始日期和结束日期。
——在员工中更改该员工的雇佣日期
ALTER TABLE EMPLOYEESE,JOBS,JOB_HISTORY DISABLE  ALL TRIGGERS;

SELECT * FROM JOB_HISTORY;

--17.In this practice, create a program to update the minimum and maximum salaries for a job in the JOBS 	table.
译文：在这种实践中，创建一个程序来更新JOBS表中的作业的最低和最高工资。	
--a.	Create a stored procedure called UPD_SAL to update the minimum and maximum salaries for a specific job ID 
------in the JOBS table.
译文：创建一个名为UPD_SAL的存储过程，更新JOBS表中特定作业ID的最低工资和最高工资。	
---Pass three parameters to the procedure:
-- the job ID, a new minimum salary, and a new maximum salary for the job. 
-- Add exception handling to account for an invalid job ID in the JOBS table.
-- Also, raise an exception if the maximum salary supplied is less than the minimum salary.
-- Provide an appropriate message that will be displayed if the row in the JOBS table is locked and cannot be changed.
译文：向过程传递三个参数:作业ID、新的最低工资和作业的新最高工资。
      在JOBS表中添加异常处理来解释无效的作业ID。
      此外，如果提供的最高工资低于最低工资，则提出一个例外。
     ???提供适当的消息，如果JOBS表中的行被锁定且无法更改，则将显示该消息。
create or replace procedure UPD_SAL(P_ID IN  JOBS.JOB_ID%TYPE, P_MINSAL IN  JOBS.MIN_SALARY%TYPE,P_MAXSAL IN JOBS.MAX_SALARY%TYPE) is
V_MAXTHANMIN EXCEPTION;
V_ID JOBS.JOB_ID%TYPE;
begin
  IF P_MAXSAL < P_MINSAL THEN 
    RAISE V_MAXTHANMIN; 
    END IF;
    SELECT JOB_ID INTO V_ID FROM JOBS WHERE JOB_ID = P_ID;
    UPDATE JOBS 
    SET MIN_SALARY = P_MINSAL,MAX_SALARY = P_MAXSAL;
EXCEPTION 
  WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('作业ID异常');
  WHEN V_MAXTHANMIN THEN DBMS_OUTPUT.PUT_LINE('工资异常');
end UPD_SAL;
--b.	Execute the procedure. You can use the following data to test your procedure:
	--Note: Disable triggers SALARY_CHECK and  AUDIT_EMP_VALUES, if you get an error while executing the second EXECUTE statement. 
	--EXECUTE upd_sal ('SY_ANAL',7000,140) (This statement should raise exception)
	--EXECUTE upd_sal ('SY_ANAL',7000,14000) (This statement should be successful)
译文：
执行程序。你可以使用以下数据来测试你的程序:
注意:如果在执行第二个EXECUTE语句时出现错误，禁用触发器SALARY_CHECK和AUDIT_EMP_VALUES。
执行upd_sal ('SY_ANAL'，7000,140)(此语句应该引发异常)
执行upd_sal ('SY_ANAL'，7000,14000)(此语句应该成功)

--C.Query the JOBS table to view your changes, and then commit the changes.
译文：查询JOBS表以查看更改，然后提交更改。
          SELECT *  FROM JOBS;
--18.In this practice, create a procedure to monitor whether employees have exceeded their 	average salary limits.
     --a.	Add a column to the EMPLOYEES table by executing the following command:
      	(labaddA_18.sql)
	ALTER TABLE employees
	 ADD (sal_limit_indicate  VARCHAR2(3) DEFAULT 'NO'
  	      CONSTRAINT emp_sallimit_ck CHECK
           (sal_limit_indicate IN ('YES', 'NO')));
      b.  	Write a stored procedure called CHECK_AVG_SAL. This checks each employee's average 	salary limit from the JOBS table against the salary that this employee has in the EMPLOYEES 	table and updates the SAL_LIMIT_INDICATE column in the EMPLOYEES table when this 	employee has exceeded his or her average salary limit. 
	Create a cursor to hold employee IDs, salaries, and their average salary limit. Find the average 	salary limit possible for an employee's job from the JOBS table. Compare the average salary             	limit possible for each employee to exact salaries and if the salary is more than the average salary            	limit, set the employee’s SAL_LIMIT_INDICATE column to YES; otherwise, set it to NO.            	Add exception handling to account for a record being locked.
c.	Execute the procedure, and then test the results.
	Query the EMPLOYEES table to view your modifications, and then commit the changes.
译文：在这种实践中，创建一个程序来监视员工是否超出了他们的平均工资限制。
--a.译文：执行以下命令向EMPLOYEES表添加一列:
	ALTER TABLE employees
	 ADD (sal_limit_indicate  VARCHAR2(3) DEFAULT 'NO'
  	      CONSTRAINT emp_sallimit_ck CHECK
           (sal_limit_indicate IN ('YES', 'NO')));
           
 select * from employees;
--b.
译文：
编写一个名为CHECK_AVG_SAL的存储过程。
这将检查JOBS表中每个员工的平均工资限制与employee表中该员工的工资进行比较，
并在该员工超过其平均工资限制时更新EMPLOYEES表中的SAL_LIMIT_INDICATE列。
创建一个游标来保存员工id、工资和他们的平均工资限制。
从JOBS表中找出员工工作的平均工资限制。
将每个员工的平均工资限制与实际工资进行比较，如果工资超过平均工资限制，
将员工的SAL_LIMIT_INDICATE列设置为YES;
否则，将其设置为NO。
为锁定的记录添加异常处理。
select * from employees;


create or replace procedure CHECK_AVG_SAL is
V_AVG_SAL EMPLOYEES.SALARY%TYPE;
  CURSOR emp_cursor IS
    SELECT employee_id, job_id,salary FROM employees for update;
begin
   FOR E_cur IN emp_cursor LOOP
     SELECT (MIN_SALARY + MAX_SALARY)/2
     INTO V_AVG_SAL
     FROM JOBS
     WHERE E_cur.JOB_ID = JOBS.JOB_ID;
     IF E_cur.SALARY > V_AVG_SAL THEN 
       UPDATE EMPLOYEES
              SET SAL_LIMIT_INDICATE = 'YES'
              WHERE CURRENT OF emp_cursor;
           ELSE 
             UPDATE EMPLOYEES
             SET SAL_LIMIT_INDICATE = 'NO'
             WHERE CURRENT OF emp_cursor;
             END IF;
   END LOOP;
end CHECK_AVG_SAL;
--c.
--Execute the procedure, and then test the results.
	--Query the EMPLOYEES table to view your modifications, and then commit the changes.
译文：
执行过程，然后测试结果。
查询EMPLOYEES表以查看您的修改，然后提交更改。

--19.Create a program to retrieve the number of years of service for a specific employee.
译文：创建一个程序来检索特定员工的服务年限
--a.Create a stored function called GET_SERVICE_YRS to retrieve the total number of years of service for a specific employee. 
	---The function should accept the employee ID as a parameter and return the number of years of service. Add error handling to account for an invalid employee ID. 
译文：创建一个名为GET_SERVICE_YRS的存储函数来检索特定员工的服务年限。
      函数应该接受员工ID作为参数，并返回服务年限。为无效的员工ID添加错误处理。
create or replace function GET_SERVICE_YRS(F_EMID IN EMPLOYEES.EMPLOYEE_ID%TYPE) return number is
  Result number;
  V_YEARS NUMBER;
begin
  SELECT MONTHS_BETWEEN(SYSDATE,HIRE_DATE)
  INTO V_YEARS
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = F_EMID;
  return V_YEARS;
EXCEPTION
  WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.put_line('错误员工ID');
end GET_SERVICE_YRS; 
 
select EMPLOYEE_ID,JOB_ID,GET_SERVICE_YRS(EMPLOYEE_ID) from JOB_HISTORY;    
          
--b.	Invoke the function. You can use the following data:
	--EXECUTE DBMS_OUTPUT.PUT_LINE(get_service_yrs(999))
	---Hint: The above statement should produce an error message because there is no employee with employee ID 999.
	---EXECUTE DBMS_OUTPUT.PUT_LINE ('Approximately .... ' || 			 get_service_yrs(106) || ' years')
	---Hint: The above statement should be successful and return the number of years of service for employee with employee ID 106.
译文：
调用这个函数。你可以使用以下资料:
执行DBMS_OUTPUT.PUT_LINE (get_service_yrs (999))
提示:上面的语句应该产生一个错误消息，因为没有员工ID为999的员工。
DBMS_OUTPUT执行。PUT_LINE('大约....' || get_service_yrs(106) || ' years')
提示:以上声明应成功，并返回员工ID为106的服务年限。
--c.	Query the JOB_HISTORY and EMPLOYEES tables for the specified employee to verify that the modifications are accurate.
译文：查询指定员工的JOB_HISTORY和EMPLOYEES表，以验证修改是否正确。
select * from job_history;
select * from employees;
  
--20.In this practice, create a program to retrieve the number of different jobs that an employee worked
	 --during his or her service.
译文：
在这种实践中，创建一个程序来检索员工所从事的不同工作的数量.在他或她服务期间。
--a.Create a stored function called GET_JOB_COUNT to retrieve the total number of different jobs on which an employee worked. 
	--The function should accept one parameter to hold the employee ID. 
  --The function will return the number of different jobs that employee worked until now. 
  --This also includes the present job. Add exception handling to account for an invalid employee ID.
  --Hint: Verify distinct job IDs from the JOB_HISTORY table. Verify whether the current job ID is one of the job IDs on which the employee worked.
译文：
创建一个名为GET_JOB_COUNT的存储函数，检索员工工作的不同作业的总数。
该函数应该接受一个参数来保存员工ID。该函数将返回员工目前为止从事的不同工作的数量。这也包括目前的工作。为无效的员工ID添加异常处理。
提示:验证与JOB_HISTORY表不同的作业id。验证当前作业ID是否为员工所工作的作业ID之一.

--b.	Invoke the function. You can use the following data:
   --EXECUTE DBMS_OUTPUT.PUT_LINE('Employee worked on ' || 		get_job_count(176) || ' different jobs.')
译文：
调用这个函数。你可以使用以下资料:
DBMS_OUTPUT执行。PUT_LINE('Employee working on ' || get_job_count(176) || ' different jobs ')。
--(1)
create or replace function GET_JOB_COUNTv(F_EMID IN EMPLOYEES.EMPLOYEE_ID%TYPE) return varchar2 is
  V_RES VARCHAR2(50);
  V_IDS NUMBER;
  V_NUM NUMBER;
  Result varchar2(50);
begin
  SELECT COUNT(DISTINCT JOB_ID)
  INTO V_IDS
  FROM JOB_HISTORY
  WHERE EMPLOYEE_ID = F_EMID;
  
  SELECT COUNT(*)
  INTO V_NUM
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = F_EMID
  AND
  JOB_ID IN(SELECT JOB_ID
  FROM JOB_HISTORY
  WHERE EMPLOYEE_ID = F_EMID);
  IF V_NUM = 0 THEN 
    V_IDS := V_NUM +1;
  END IF;
  V_RES := 'Employee woked on '||V_IDS||' jobs.';
  return V_RES;
EXCEPTION 
  WHEN NO_DATA_FOUND THEN 
    DBMS_OUTPUT.PUT_LINE('员工ID有误');
end GET_JOB_COUNTV;
--(2)
create or replace function Test(F_EMID IN EMPLOYEES.EMPLOYEE_ID%TYPE) return number is
  Result number;
  V_RES NUMBER;
begin
  SELECT COUNT(*)
  INTO V_RES
  FROM ( 
  SELECT EMPLOYEE_ID, JOB_ID
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = F_EMID
  UNION
  SELECT EMPLOYEE_ID,JOB_ID
  FROM JOB_HISTORY
  WHERE EMPLOYEE_ID = F_EMID);
  return V_RES;
end Test;

--21.Create a package specification and body called EMP_JOB_PKG that contains your ADD_JOBS,      ADD_JOB_HIST, and UPD_SAL procedures, as well as your GET_SERVICE_YRS function.
--a.	Make all the constructs public. Consider whether you still need the stand-alone procedures and functions that you just packaged.
--b.	Disable all the triggers before invoking the procedure and enable them after invoking the procedure, as suggested in question 16b.
	--Invoke your ADD_JOBS procedure to create a new job with ID PR_MAN, job title Public Relations Manager, and salary of 6,250. 
	--Invoke your ADD_JOB_HIST procedure to modify the job of employee with employee ID 110 to job ID PR_MAN.
	--Hint: All of the above calls to the functions should be successful.
--c.	Query the JOBS, JOB_HISTORY, and EMPLOYEES tables to verify the results
译文：创建一个名为EMP_JOB_PKG的包规范和主体，其中包含ADD_JOBS、ADD_JOB_HIST和UPD_SAL过程，以及GET_SERVICE_YRS函数。
  a.将所有构念公开。考虑是否仍然需要刚才打包的独立过程和函数。
  b.如问题16b所示，在调用过程之前禁用所有触发器，在调用过程之后启用它们。
      调用ADD_JOBS过程，创建一个ID为PR_MAN、职位名称为Public Relations Manager、工资为6,250的新职位。
      调用ADD_JOB_HIST过程，将ID为110的employee的作业修改为作业ID PR_MAN。
      提示:以上对函数的所有调用都应该成功。
  c.查询JOBS、JOB_HISTORY和EMPLOYEES表来验证结果。
  





















































































































































































































