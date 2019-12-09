prompt PL/SQL Developer import file
prompt Created on 2019年7月24日 by skycloud
set feedback off
set define off
prompt Creating COUNTRIES...
create table COUNTRIES
(
  country_id   CHAR(2) not null,
  country_name VARCHAR2(40),
  region_id    NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column COUNTRIES.country_id
  is 'Primary key of countries table.';
comment on column COUNTRIES.country_name
  is 'Country name';
comment on column COUNTRIES.region_id
  is 'Region ID for the country. Foreign key to region_id column in the departments table.';

prompt Creating DEPARTMENTS...
create table DEPARTMENTS
(
  department_id   NUMBER(4) not null,
  department_name VARCHAR2(30) not null,
  manager_id      NUMBER(6),
  location_id     NUMBER(4)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DEPARTMENTS.department_id
  is 'Primary key column of departments table.';
comment on column DEPARTMENTS.department_name
  is '"A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. "';
comment on column DEPARTMENTS.manager_id
  is 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
comment on column DEPARTMENTS.location_id
  is 'Location id where a department is located. Foreign key to location_id column of locations table.';

prompt Creating EMPLOYEES...
create table EMPLOYEES
(
  employee_id    NUMBER(6) not null,
  first_name     VARCHAR2(20),
  last_name      VARCHAR2(25) not null,
  email          VARCHAR2(25) not null,
  phone_number   VARCHAR2(20),
  hire_date      DATE not null,
  job_id         VARCHAR2(10) not null,
  salary         NUMBER(8,2),
  commission_pct NUMBER(2,2),
  manager_id     NUMBER(6),
  department_id  NUMBER(4)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column EMPLOYEES.employee_id
  is 'Primary key of employees table.';
comment on column EMPLOYEES.first_name
  is 'First name of the employee. A not null column.';
comment on column EMPLOYEES.last_name
  is 'Last name of the employee. A not null column.';
comment on column EMPLOYEES.email
  is 'Email id of the employee';
comment on column EMPLOYEES.phone_number
  is 'Phone number of the employee; includes country code and area code';
comment on column EMPLOYEES.hire_date
  is 'Date when the employee started on this job. A not null column.';
comment on column EMPLOYEES.job_id
  is '"Current job of the employee; foreign key to job_id column of the
jobs table. A not null column."';
comment on column EMPLOYEES.salary
  is '"Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)"';
comment on column EMPLOYEES.commission_pct
  is '"Commission percentage of the employee; Only employees in sales
department elgible for commission percentage"';
comment on column EMPLOYEES.manager_id
  is '"Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)"';
comment on column EMPLOYEES.department_id
  is '"Department id where employee works; foreign key to department_id
column of the departments table"';

prompt Creating JOBS...
create table JOBS
(
  job_id     VARCHAR2(10) not null,
  job_title  VARCHAR2(35) not null,
  min_salary NUMBER(6),
  max_salary NUMBER(6)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column JOBS.job_id
  is 'Primary key of jobs table.';
comment on column JOBS.job_title
  is 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
comment on column JOBS.min_salary
  is 'Minimum salary for a job title.';
comment on column JOBS.max_salary
  is 'Maximum salary for a job title';

prompt Creating JOB_GRADES...
create table JOB_GRADES
(
  grade_level VARCHAR2(3),
  lowest_sal  NUMBER,
  highest_sal NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating JOB_HISTORY...
create table JOB_HISTORY
(
  employee_id   NUMBER(6) not null,
  start_date    DATE not null,
  end_date      DATE not null,
  job_id        VARCHAR2(10) not null,
  department_id NUMBER(4)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column JOB_HISTORY.employee_id
  is '"A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table"';
comment on column JOB_HISTORY.start_date
  is '"A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)"';
comment on column JOB_HISTORY.end_date
  is '"Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)"';
comment on column JOB_HISTORY.job_id
  is '"Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column."';
comment on column JOB_HISTORY.department_id
  is 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';

prompt Creating LOCATIONS...
create table LOCATIONS
(
  location_id    NUMBER(4) not null,
  street_address VARCHAR2(40),
  postal_code    VARCHAR2(12),
  city           VARCHAR2(30) not null,
  state_province VARCHAR2(25),
  country_id     CHAR(2)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column LOCATIONS.location_id
  is 'Primary key of locations table';
comment on column LOCATIONS.street_address
  is '"Street address of an office, warehouse, or production site of a company.
Contains building number and street name"';
comment on column LOCATIONS.postal_code
  is '"Postal code of the location of an office, warehouse, or production site
of a company. "';
comment on column LOCATIONS.city
  is '"A not null column that shows city where an office, warehouse, or
production site of a company is located. "';
comment on column LOCATIONS.state_province
  is '"State or Province where an office, warehouse, or production site of a
company is located."';
comment on column LOCATIONS.country_id
  is '"Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table."';

prompt Creating REGIONS...
create table REGIONS
(
  region_id   NUMBER not null,
  region_name VARCHAR2(25)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for COUNTRIES...
alter table COUNTRIES disable all triggers;
prompt Disabling triggers for DEPARTMENTS...
alter table DEPARTMENTS disable all triggers;
prompt Disabling triggers for EMPLOYEES...
alter table EMPLOYEES disable all triggers;
prompt Disabling triggers for JOBS...
alter table JOBS disable all triggers;
prompt Disabling triggers for JOB_GRADES...
alter table JOB_GRADES disable all triggers;
prompt Disabling triggers for JOB_HISTORY...
alter table JOB_HISTORY disable all triggers;
prompt Disabling triggers for LOCATIONS...
alter table LOCATIONS disable all triggers;
prompt Disabling triggers for REGIONS...
alter table REGIONS disable all triggers;
prompt Deleting REGIONS...
delete from REGIONS;
commit;
prompt Deleting LOCATIONS...
delete from LOCATIONS;
commit;
prompt Deleting JOB_HISTORY...
delete from JOB_HISTORY;
commit;
prompt Deleting JOB_GRADES...
delete from JOB_GRADES;
commit;
prompt Deleting JOBS...
delete from JOBS;
commit;
prompt Deleting EMPLOYEES...
delete from EMPLOYEES;
commit;
prompt Deleting DEPARTMENTS...
delete from DEPARTMENTS;
commit;
prompt Deleting COUNTRIES...
delete from COUNTRIES;
commit;
prompt Loading COUNTRIES...
insert into COUNTRIES (country_id, country_name, region_id)
values ('CA', 'Canada', 2);
insert into COUNTRIES (country_id, country_name, region_id)
values ('DE', 'Germany', 1);
insert into COUNTRIES (country_id, country_name, region_id)
values ('UK', 'United Kingdom', 1);
insert into COUNTRIES (country_id, country_name, region_id)
values ('US', 'United States of America', 2);
commit;
prompt 4 records loaded
prompt Loading DEPARTMENTS...
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
values (10, 'Administration', 200, 1700);
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
values (20, 'Marketing', 201, 1800);
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
values (50, 'Shipping', 124, 1500);
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
values (60, 'IT', 103, 1400);
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
values (80, 'Sales', 149, 2500);
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
values (90, 'Executive', 100, 1700);
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
values (110, 'Accounting', 205, 1700);
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
values (190, 'Contracting', null, 1700);
commit;
prompt 8 records loaded
prompt Loading EMPLOYEES...
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (100, 'Steven', 'King', 'SKING', '515.123.4567', to_date('17-06-1987', 'dd-mm-yyyy'), 'AD_PRES', 24000, null, null, 90);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', to_date('21-09-1989', 'dd-mm-yyyy'), 'AD_VP', 17000, null, 100, 90);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', to_date('13-01-1993', 'dd-mm-yyyy'), 'AD_VP', 17000, null, 100, 90);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', to_date('03-01-1990', 'dd-mm-yyyy'), 'IT_PROG', 9000, null, 102, 60);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', to_date('21-05-1991', 'dd-mm-yyyy'), 'IT_PROG', 6000, null, 103, 60);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', to_date('07-02-1999', 'dd-mm-yyyy'), 'IT_PROG', 4200, null, 103, 60);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', to_date('16-11-1999', 'dd-mm-yyyy'), 'ST_MAN', 5800, null, 100, 50);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', to_date('17-10-1995', 'dd-mm-yyyy'), 'ST_CLERK', 3500, null, 124, 50);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', to_date('29-01-1997', 'dd-mm-yyyy'), 'ST_CLERK', 3100, null, 124, 50);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', to_date('15-03-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2600, null, 124, 50);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', to_date('09-07-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2500, null, 124, 50);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', to_date('29-01-2000', 'dd-mm-yyyy'), 'SA_MAN', 10500, .2, 100, 80);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', to_date('11-05-1996', 'dd-mm-yyyy'), 'SA_REP', 11000, .3, 149, 80);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', to_date('24-03-1998', 'dd-mm-yyyy'), 'SA_REP', 8600, .2, 149, 80);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', to_date('24-05-1999', 'dd-mm-yyyy'), 'SA_REP', 7000, .15, 149, null);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', to_date('17-09-1987', 'dd-mm-yyyy'), 'AD_ASST', 4400, null, 101, 10);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', to_date('17-02-1996', 'dd-mm-yyyy'), 'MK_MAN', 13000, null, 100, 20);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (202, 'Pat', 'Fay', 'PFAY', '603.123.6666', to_date('17-08-1997', 'dd-mm-yyyy'), 'MK_REP', 6000, null, 201, 20);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', to_date('07-06-1994', 'dd-mm-yyyy'), 'AC_MGR', 12000, null, 101, 110);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', to_date('07-06-1994', 'dd-mm-yyyy'), 'AC_ACCOUNT', 8300, null, 205, 110);
commit;
prompt 20 records loaded
prompt Loading JOBS...
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('AD_PRES', 'President', 20000, 40000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('AD_VP', 'Administration Vice President', 15000, 30000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('AD_ASST', 'Administration Assistant', 3000, 6000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('AC_MGR', 'Accounting Manager', 8200, 16000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('SA_MAN', 'Sales Manager', 10000, 20000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('SA_REP', 'Sales Representative', 6000, 12000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('ST_MAN', 'Stock Manager', 5500, 8500);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('ST_CLERK', 'Stock Clerk', 2000, 5000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('IT_PROG', 'Programmer', 4000, 10000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('MK_MAN', 'Marketing Manager', 9000, 15000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
values ('MK_REP', 'Marketing Representative', 4000, 9000);
commit;
prompt 12 records loaded
prompt Loading JOB_GRADES...
insert into JOB_GRADES (grade_level, lowest_sal, highest_sal)
values ('A', 1000, 2999);
insert into JOB_GRADES (grade_level, lowest_sal, highest_sal)
values ('B', 3000, 5999);
insert into JOB_GRADES (grade_level, lowest_sal, highest_sal)
values ('C', 6000, 9999);
insert into JOB_GRADES (grade_level, lowest_sal, highest_sal)
values ('D', 10000, 14999);
insert into JOB_GRADES (grade_level, lowest_sal, highest_sal)
values ('E', 15000, 24999);
insert into JOB_GRADES (grade_level, lowest_sal, highest_sal)
values ('F', 25000, 40000);
commit;
prompt 6 records loaded
prompt Loading JOB_HISTORY...
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
values (102, to_date('13-01-1993', 'dd-mm-yyyy'), to_date('24-07-1998', 'dd-mm-yyyy'), 'IT_PROG', 60);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
values (101, to_date('21-09-1989', 'dd-mm-yyyy'), to_date('27-10-1993', 'dd-mm-yyyy'), 'AC_ACCOUNT', 110);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
values (101, to_date('28-10-1993', 'dd-mm-yyyy'), to_date('15-03-1997', 'dd-mm-yyyy'), 'AC_MGR', 110);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
values (201, to_date('17-02-1996', 'dd-mm-yyyy'), to_date('19-12-1999', 'dd-mm-yyyy'), 'MK_REP', 20);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
values (114, to_date('24-03-1998', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 'ST_CLERK', 50);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
values (122, to_date('01-01-1999', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 'ST_CLERK', 50);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
values (200, to_date('17-09-1987', 'dd-mm-yyyy'), to_date('17-06-1993', 'dd-mm-yyyy'), 'AD_ASST', 90);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
values (176, to_date('24-03-1998', 'dd-mm-yyyy'), to_date('31-12-1998', 'dd-mm-yyyy'), 'SA_REP', 80);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
values (176, to_date('01-01-1999', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 'SA_MAN', 80);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
values (200, to_date('01-07-1994', 'dd-mm-yyyy'), to_date('31-12-1998', 'dd-mm-yyyy'), 'AC_ACCOUNT', 90);
commit;
prompt 10 records loaded
prompt Loading LOCATIONS...
insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
values (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
values (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
values (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
values (1800, '460 Bloor ST. W.', 'ON M5S 1X8', 'Toronto', 'Ontario', 'CA');
insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
values (2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');
commit;
prompt 5 records loaded
prompt Loading REGIONS...
insert into REGIONS (region_id, region_name)
values (1, 'Europe');
insert into REGIONS (region_id, region_name)
values (2, 'Americas');
insert into REGIONS (region_id, region_name)
values (3, 'Asia');
insert into REGIONS (region_id, region_name)
values (4, 'Middle East and Africa');
commit;
prompt 4 records loaded
prompt Enabling triggers for COUNTRIES...
alter table COUNTRIES enable all triggers;
prompt Enabling triggers for DEPARTMENTS...
alter table DEPARTMENTS enable all triggers;
prompt Enabling triggers for EMPLOYEES...
alter table EMPLOYEES enable all triggers;
prompt Enabling triggers for JOBS...
alter table JOBS enable all triggers;
prompt Enabling triggers for JOB_GRADES...
alter table JOB_GRADES enable all triggers;
prompt Enabling triggers for JOB_HISTORY...
alter table JOB_HISTORY enable all triggers;
prompt Enabling triggers for LOCATIONS...
alter table LOCATIONS enable all triggers;
prompt Enabling triggers for REGIONS...
alter table REGIONS enable all triggers;
set feedback on
set define on
prompt Done.
