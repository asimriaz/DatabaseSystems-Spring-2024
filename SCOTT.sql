-- Script to create Oracle's "SCOTT" schema with tables
-- EMP, DEPT, BONUS, SALGRADE, DUMMY. Originally Oracle's demobld.sql.
--
-- In a format suitable for pasting into SQL Fiddle for Microsoft SQL Server:
-- http://sqlfiddle.com/#!18
begin transaction;
create table dept(
  deptno   int not null,
  dname    varchar(14),
  loc      varchar(13));
create table emp(
  empno    int not null,
  ename    varchar(10),
  job      varchar(9),
  mgr      int,
  hiredate date,
  sal      int,
  comm     int,  
  deptno   int not null);
create table bonus(
  ename    varchar(10),
  job      varchar(9),
  sal      int,
  comm     int);
create table salgrade(
  grade    decimal,
  losal    decimal,
  hisal    decimal);
create table dummy (
  dummy    decimal);
insert into dummy values (0);
insert into DEPT (DEPTNO, DNAME, LOC)
  select 10, 'ACCOUNTING', 'NEW YORK' from dummy union all
  select 20, 'RESEARCH',   'DALLAS'   from dummy union all
  select 30, 'SALES',      'CHICAGO'  from dummy union all
  select 40, 'OPERATIONS', 'BOSTON'   from dummy;
insert into emp (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
select 7839, 'KING',   'PRESIDENT', null, '1981-11-17', 5000, null, 10 union all
  select 7698, 'BLAKE',  'MANAGER',   7839, '1981-05-01', 2850, null, 30 union all
  select 7782, 'CLARK',  'MANAGER',   7839, '1981-06-09', 2450, null, 10 union all
  select 7566, 'JONES',  'MANAGER',   7839, '1981-04-02', 2975, null, 20 union all
  select 7788, 'SCOTT',  'ANALYST',   7566, dateadd(day, -85, '1987-07-13'),  3000, null, 20 union all
  select 7902, 'FORD',   'ANALYST',   7566, '1981-12-03', 3000, null, 20 union all
  select 7369, 'SMITH',  'CLERK',     7902, '1980-12-17',  800, null, 20 union all
  select 7499, 'ALLEN',  'SALESMAN',  7698, '1981-02-20', 1600,  300, 30 union all
  select 7521, 'WARD',   'SALESMAN',  7698, '1981-02-22', 1250,  500, 30 union all
  select 7654, 'MARTIN', 'SALESMAN',  7698, '1981-09-28', 1250, 1400, 30 union all
  select 7844, 'TURNER', 'SALESMAN',  7698, '1981-09-08', 1500,    0, 30 union all
  select 7876, 'ADAMS',  'CLERK',     7788, dateadd(day, -51, '1987-07-13'), 1100, null, 20 union all
  select 7900, 'JAMES',  'CLERK',     7698, '1981-12-03',  950, null, 30 union all
  select 7934, 'MILLER', 'CLERK',     7782, '1982-01-23', 1300, null, 10;
insert into salgrade
  select 1,  700, 1200 from dummy union all
  select 2, 1201, 1400 from dummy union all
  select 3, 1401, 2000 from dummy union all
  select 4, 2001, 3000 from dummy union all
  select 5, 3001, 9999 from dummy;
commit;