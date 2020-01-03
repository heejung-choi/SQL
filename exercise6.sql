--QUESTION
--�������ϸ� : exercise6.sql
--��� ���������� ����ؼ� �ذ��մϴ�.

select * from emp;
select * from dept;
select * from salgrade;
--�ϳ��� ���̺� : �������� ���� ���̺�� :������ �� �����ϴ�.
-- 1. 'DALLAS'���� �ٹ��ϴ� ������ �̸�, ����, �μ���ȣ�� ����Ͻÿ�.
--�̸�         ����         �μ���ȣ              
---------- --------- ----------
--SCOTT	   ANALYST	20
--SMITH	   CLERK		20
--JONES	   MANAGER	20
--FORD	   ANALYST	20

select ename "�̸�", job "����", deptno "�μ���ȣ"
from emp 
where deptno=any(select deptno 
                from dept
                where loc='DALLAS');

--2. 'SMITH'���� ������ ���� �޴� �������� �̸��� ���� �׸��� �μ����� ����Ѵ�.
--������               �޿�             �μ���         
---------- ---------- ------------
--SCOTT		3000	RESEARCH
--ALLEN		1600	SALES
--WARD		1250	SALES
--JONES		2975	RESEARCH
--MARTIN	1250	SALES
--BLAKE		2850	SALES
--CLARK		2450	ACCOUNTING
--KING		5000	ACCOUNTING
--TURNER	1500	SALES
--JAMES		950	SALES
--FORD		3000	RESEARCH
--MILLER		1300	ACCOUNTING

select ename "������", sal "�޿�", dname "�μ���"
from emp e join dept d using (deptno)
where sal>(select sal 
            from emp 
            where ename='SMITH');


--3. 30�� �μ��� ������� ������ �ؿ� �Ի��� �������� �̸�, ����, 
--   �μ���ȣ �׸��� �Ի�⵵�� ����Ѵ�.(30���μ� �����ϰ�)
--Ename        Sal            DeptNo         HireYear
---------- ---------- ---------- ----------
--FORD	   3000	       20		1981
--KING	   5000	       10		1981
--CLARK	   2450	       10		1981
--JONES	   2975	       20		1981
select ename "Ename", sal "Sal", deptno "DeptNo", to_char(hiredate,'YYYY') "HireYear"
from emp
where deptno !=30
    and to_char(hiredate,'YYYY') 
    =ANY(select to_char(hiredate,'YYYY') "HireYear" 
            from emp
            where deptno=30);

--4. 'BLAKE'�� ���� �μ��� �ִ� �������� �̸��� �Ի����� �̴µ� 'BLAKE'�� ���� ����Ѵ�. 
--ENAME      HIREDATE
---------- --------
--JAMES	     81/12/03
--TURNER     81/09/08
--BLAKE	     81/05/01
--MARTIN     81/09/28
--WARD	     81/02/22
--ALLEN	     81/02/20

select ename, hiredate
from emp
where ename !='BLAKE'
    and deptno =(select deptno
                    from emp
                    where ename ='BLAKE'); 

--5. ��ձ޿����� ���� �޿��� �޴� �������� ������ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����Ѵ�.
--  EMPNO ENAME    SAL
---------- ------ ----------
--7839	KING	5,000��
--7788	SCOTT	3,000��
--7902	FORD	3,000��
--7566	JONES	2,975��
--7698	BLAKE	2,850��
--7782	CLARK	2,450��
select empno, ename, to_char(sal, '9,999')||'��'
from emp
where sal> (select avg(sal) 
            from emp)
order by sal desc ;

--6. �̸��� 'T'�� �����ϰ� �ִ� ������� ���� �μ����� �ٹ��ϰ�
--   �ִ� ������ ������ȣ�� �̸��� ����Ѵ�.
--EMPNO ENAME     
---------- ----------
--7902	FORD
--7566	JONES
--7369	SMITH
--7788	SCOTT
--7900	JAMES
--7844	TURNER
--7698	BLAKE
--7654	MARTIN
--7521	WARD
--7499	ALLEN
select empno, ename
from emp
where deptno =any(select deptno 
                from emp 
                where ename like '%T%');

--**************************************
--7 �޿��� ��ձ޿����� ����,�̸��� S�ڰ� ���� ������ ������
--  �μ����� �ٹ��ϴ� ��� ������ ������ȣ,�̸� �� �޿��� ����Ͻÿ�.
--EMPNO      ENAME      SAL
----------  --------  -------
--7902	     FORD	      3000
--7566	     JONES      2975
--7788	     SCOTT      3000
--7698	     BLAKE      2850
select empno, ename, sal
from emp
where deptno in(select deptno from emp where sal>(select avg(sal) from emp) and ename like '%S%');

--8. 30�� �μ��� �ִ� ������ �߿��� ���� ���� ������ �޴� ��������
--   ���� ������ �޴� �������� �̸�, �μ���ȣ, ������ ����Ѵ�. 
--   (��, ALL �Ǵ� ANY �����ڸ� ����� ��)
--  �̸�    �μ���ȣ   ����
--------------------------------
--JONES	20	2975
--SCOTT	20	3000
--FORD	20	3000
--KING	10	5000
select ename "�̸�", empno "�μ���ȣ", sal "����"
from emp
where sal >all (select sal from emp where deptno=30);

--9. SALES �μ����� ���ϴ� �������� �μ���ȣ, �̸�, ������ ����Ѵ�.
--DEPTNO    ENAME       JOB      
---------- ---------- ---------
--30�� �μ�  ALLEN	       SALESMAN
--30�� �μ�  WARD	       SALESMAN
--30�� �μ�  MARTIN      SALESMAN
--30�� �μ�  BLAKE	       MANAGER
--30�� �μ�  TURNER      SALESMAN
--30�� �μ�  JAMES	       CLERK
 
 select deptno||'�� �μ�' "DEPTNO", ename, job
 from emp
 where deptno = (select deptno 
                    from dept 
                    where dname='SALES');

--10. 'KING'���� �����ϴ� ��� ������ �̸��� �Ի糯¥�� ����Ѵ�. 
--     (KING���� �����ϴ� �����̶� mgr�� KING�� ������ �ǹ���) 
--�̸�         �Ի糯¥
---------- ----------
--JONES	   1981�� 04�� 02��
--BLAKE	   1981�� 05�� 01��
--CLARK	   1981�� 06�� 09��

select ename "�̸�", to_char(hiredate, 'YYYY"��" MM"��" DD"��"')"�Ի糯¥"
from emp
where ename in(select e.ename from emp e join emp m on(e.mgr=m.empno) where m.ename='KING');

select ename "�̸�", to_char(hiredate, 'YYYY"��" MM"��" DD"��"')"�Ի糯¥"
from emp
where mgr=(select empno from emp where ename = 'KING');

--10. 'KING'���� �����ϴ� ��� ������ �̸��� �Ի糯¥�� ����Ѵ�. 
--     (KING���� �����ϴ� �����̶� mgr�� KING�� ������ �ǹ���) 
--�̸�         �Ի糯¥
---------- ----------
--JONES	   1981�� 04�� 02��
--BLAKE	   1981�� 05�� 01��
--CLARK	   1981�� 06�� 09��
select ename "�̸�", to_char(hiredate, 'YYYY"��" fmMM"��" DD"��"')"�Ի糯¥"
from emp
where ename in(select e.ename from emp e join emp m on(e.mgr=m.empno) where m.ename='KING');


