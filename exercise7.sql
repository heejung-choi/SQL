

���� ���ϸ� : exercise7.sql

-- ��� �ǽ������� EMP�� DEPT ���̺��� ������ ������ ���� ����� �����ϰ�
-- ����� ���� Ȯ���� ���� ROLLBACK ����� �����Ѵ�.

-- [ �׽�Ʈ ���� : ��!! ]
-- ������ Ȯ��
-- �������� �䱸�Ǵ� DML �� ����
-- ������ Ȯ��
-- rollback

-- 1. EMP ���̺��� ������ȣ�� 7499���� ������ ������ 5000�޷��� �����Ѵ�.
select * from emp;
update emp
set sal = 5000
where deptno=20;
select * from emp;
rollback;
-- 2. EMP���̺��� �μ���ȣ�� 20���� �������� ������ ���� ���޿��� 10% �λ��� �ݾ����� �����Ѵ�.
select * from emp;
update emp
set sal = sal*1.1
where deptno=20;
select * from emp;
rollback;

-- 3. DEPT ���̺� �Ʒ��� �������� �����͸� �Է��Ѵ�.
-- �μ���ȣ: 50, �μ���ġ: BOSTON,  �μ���: RESERCH
select * from dept;
insert into dept(deptno, dname, loc)
values(50,'BOSTON','RESERCH');
select * from dept;
rollback;

-- 4. EMP ���̺� �Ʒ��� ���� �����͸� �����Ѵ�.
-- ������ȣ: 9900, �����̸�: JACKSON, ����: SALESMAN, �μ���ȣ: 10, ���� : 800
select * from emp;
insert into emp(empno,ename,job,deptno,sal)
values(9900,'JACKSON','SALESMAN',10,800);
select * from emp;
rollback;

-- 5. DEPT ���̺� �Ʒ��� �������� �����͸� �Է��Ѵ�.
-- �μ���ȣ: 60, �μ���ġ: NULL,  �μ���: MARKETING
select * from dept;
insert into dept(deptno,loc,dname)
values(60,null,'MARKETING');
select * from dept;
rollback;

select * from dept;
insert into dept(deptno,loc,dname)
values(60,'','MARKETING');
select * from dept;
rollback;
-- 6. ������ȣ�� 7698���� ������ �μ���ȣ�� 7369�� ������ 
-- �μ���ȣ�� �����Ѵ�.
select * from emp;
update emp
set deptno = (select deptno from emp where empno=7369)
where empno=7698;
select * from emp;
rollback;

-- 7. 20�� �μ��� �������� ��� �����Ѵ�.
select * from emp;
delete from emp
where deptno= 20;
select * from emp;
rollback;

-- 8. ������ 1000 ������ �������� �����Ѵ�.
select * from emp;
delete from emp
where sal<=1000;
select * from emp;
rollback;

-- 9. ������ȣ�� 7900 �� ������ ������ ���� ���޿��� 5% ������Ű��
         �μ���ȣ�� 40���� �����Ѵ�.
select * from emp;
update emp
    set sal=sal*1.05,
        deptno=40
    where empno=7900;    
select * from emp;
rollback;

-- 10. ���縦 �������� �Ի����� 38�� �̻��� �����鿡 ���Ͽ� 
          ������ 2��� �����ϰ� Ŀ�̼ǵ� 3000���� �����Ѵ�.
         --(�Ի����� �⵵�� �������� �ݿø��Ͽ� ����Ѵ�.)
select * from emp;
update emp
    set sal=sal*2,
        comm=3000
    where months_between(sysdate,round(hiredate,'yy'))>= 456;   
select * from emp;
rollback;         

