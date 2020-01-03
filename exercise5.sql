select * from emp;
select * from dept;
select * from salgrade;


--�������ϸ� : exercise5.sql - ansi join ���� ���
-- 1. DALLAS���� �ٹ��ϴ� ������ �̸�, ����, �μ��̸��� ����Ͻÿ�.
--�̸�         ����         	�μ��̸�          
---------- --------- ------------------
--SCOTT	    ANALYST	RESEARCH
--SMITH	    CLERK		RESEARCH
--JONES	    MANAGER	RESEARCH
--FORD	    ANALYST	RESEARCH      
select e.ename "�̸�", e.job "����", d.dname "�μ��̸�"
from emp e join dept d using (deptno)
where d.loc='DALLAS';

-- ����, ��ҹ��ڿ� Ȯ���� ���ٸ�
--where e.deptno = d.deptno and upper(d.loc)='DALLAS';
-- 2. �̸��� 'A'�� ���� �������� �̸��� �μ��̸��� ����Ͻÿ�.
--�̸�        �μ��̸�          
--------    --------------
--ALLEN	   SALES
--WARD	   SALES
--MARTIN   SALES
--BLAKE	   SALES
--CLARK	   ACCOUNTING
--JAMES	   SALES

select e.ename "�̸�", d.dname "�μ��̸�"
from emp e join dept d on(e.deptno = d.deptno)
where e.ename like '%A%';

-- 3. �����̸��� �� ������ ���� �μ��� �μ���, �׸��� ������ 
--����ϴµ� ������ 3000�̻��� ������ ����Ͻÿ�. 
--�����̸�   �μ���               ����
---------- -------------- ----------
--SCOTT	   RESEARCH	3,000��
--KING	   ACCOUNTING	5,000��
--FORD	   RESEARCH	3,000��

select e.ename "�����̸�", d.dname "�μ���", to_char(e.sal, '9,999')||'��' "����"
from emp e join dept d on(e.deptno = d.deptno)
where e.sal>=3000;


-- 4. ������ 'SALESMAN'�� �������� ������ �� �����̸�, �׸���
-- �� ������ ���� �μ� �̸��� ����Ͻÿ�. 
--����          �����̸�       �μ��̸�          
--------- ---------- --------------
--SALESMAN  TURNER     SALES         
--SALESMAN  MARTIN     SALES         
--SALESMAN  WARD       SALES         
--SALESMAN  ALLEN      SALES

select e.job "����", e.ename "�����̸�", d.dname "�μ��̸�"
from emp e join dept d on(e.deptno = d.deptno)
where e.job='SALESMAN';

-- 5. Ŀ�̼��� å���� �������� ������ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '������ȣ', '�����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����Ͻÿ�. 
--  ������ȣ �����̸�      ����           �Ǳ޿�       �޿����
---------- ---------- ---------- ---------- ----------
--  7521 WARD             15000         15200          2
--  7654 MARTIN          15000         15300          2
--  7844 TURNER          18000         18000          3
--  7499	ALLEN	       19200         19500	   3
select e.empno "������ȣ", e.ename "�����̸�", e.sal*12 "����", e.sal*12+e.comm "�Ǳ޿�", s.grade "�޿����"
from emp e join salgrade s on(e.sal between s.losal and s.hisal)
where comm is not null
order by �Ǳ޿�;    


-- 6. �μ���ȣ�� 10���� �������� �μ���ȣ, �μ��̸�, �����̸�,
-- ����, �޿������ ����Ͻÿ�. 
--   �μ���ȣ �μ��̸�           �����̸�      ����           �޿����
---------- -------------- ---------- ---------- ----------
--      10 ACCOUNTING     CLARK            2450          4
--      10 ACCOUNTING     KING              5000          5
--      10 ACCOUNTING     MILLER           1300           2 
select e.deptno "�μ���ȣ",  d.dname "�μ��̸�", e.ename "�����̸�", e.sal "����", s.grade "�޿����"
from emp e join dept d on (e.deptno = d.deptno)
    join salgrade s on(e.sal between s.losal and s.hisal)
where e.deptno=10;

-- 7. �μ���ȣ�� 10��, 20���� �������� �μ���ȣ, �μ��̸�, 
-- �����̸�, ����, �޿������ ����Ͻÿ�. �׸��� �� ��µ� 
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������ �����Ͻÿ�. (7�� ��)
--   �μ���ȣ �μ��̸�              �����̸�               ����       �޿����
---------- -------------- ---------- ---------- ----------
--    10 ACCOUNTING              KING                   5000          5
--    10 ACCOUNTING              CLARK                 2450          4
select e.deptno "�μ���ȣ",  d.dname "�μ��̸�", e.ename "�����̸�", e.sal "����", s.grade "�޿����"
from emp e join dept d on (e.deptno = d.deptno)
    join salgrade s on(e.sal between s.losal and s.hisal)
    where e.deptno in(10,20)
order by e.deptno , e.sal desc ;



-- 8. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. 
-- ��, ������ ���� �μ��� ����ϸ� �̰�� �̸��� '����'�̶��
-- ����Ѵ�. (14��)       
--�̸�               �μ���ȣ �μ��̸�          
---------- ---------- --------------
--SCOTT             20 RESEARCH
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
select nvl(e.ename,'����') "�̸�", d.deptno "�μ���ȣ", d.dname "�μ��̸�"
from emp e right join dept d on(e.deptno= d.deptno);
    


-- 9. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. 
-- ��, ���� �μ� ��ġ�� ������ ������  ����ϸ� �̰�� �μ���ȣ��  0 ����
-- ����Ѵ�.        
--�̸�               �μ���ȣ     �μ��̸�          
---------- ---------- --------------
--MILLER	10	ACCOUNTING
--KING		10	ACCOUNTING
--CLARK		10	ACCOUNTING
--FORD		20	RESEARCH
--JONES		20	RESEARCH
--SMITH		20	RESEARCH
--SCOTT		20	RESEARCH
--JAMES		30	SALES
--TURNER	30	SALES
--BLAKE		30	SALES
--MARTIN	30	SALES
--WARD		30	SALES
--ALLEN		30	SALES
--ADAMS		0	(null)
select e.ename "�̸�", nvl(d.deptno,0) "�μ���ȣ", d.dname "�μ��̸�"
from emp e left join dept d on(e.deptno= d.deptno);


--10. Ŀ�̼��� ������ ��� ������ �̸�, Ŀ�̼�, �μ��̸�, ��ġ�� ��ȸ�ϴ� sql�� �ۼ��Ͻÿ�.

--ENAME           COMM        DNAME         	LOC
----------------------------------------------------
--TURNER	0	SALES		CHICAGO
--MARTIN	1400	SALES		CHICAGO
--WARD		500	SALES		CHICAGO
--ALLEN		300	SALES		CHICAGO         
select  e.ename , e.comm, d.dname, d.loc
from emp e join dept d on(e.deptno= d.deptno)
where comm is not null;


-- 11. DALLAS���� �ٹ��ϴ� ����� �̸�,  ����, ����� ����Ͻÿ�.
--�̸�         ����             ���          
---------- --------- --------------
--SMITH      800            1      
--JONES      2975          4   
--SCOTT	     3000	        4
--FORD       3000          4      
select  e.ename "�̸�", e.sal "����", s.grade "���"
from emp e join dept d on (e.deptno = d.deptno)
    join salgrade s on(e.sal between s.losal and s.hisal)
where d.loc='DALLAS';

-- 12. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. 
-- ��, ������ ���� �μ��� ����ϸ� �̰�� ���� �̸��� '����?'���
-- ����Ѵ�. ���� �μ� ��ġ�� ������ ������  ����ϸ� �μ� ��ȣ�� �μ� �̸���
-- '���?' �̶�� ����Ѵ�.     
--�̸�               �μ���ȣ �μ��̸�          
---------- ---------- --------------
--ADAMS	���?	���?
--ALLEN	30	SALES
--BLAKE	30	SALES
--CLARK	10	ACCOUNTING
--FORD	20	RESEARCH
--JAMES	30	SALES
--JONES	20	RESEARCH
--KING	10	ACCOUNTING
--MARTIN	30	SALES
--MILLER	10	ACCOUNTING
--SCOTT	20	RESEARCH
--SMITH	20	RESEARCH
--TURNER	30	SALES
--WARD	30	SALES
--����?	40	OPERATIONS
select nvl(e.ename,'����?') "�̸�", nvl(to_char(d.deptno),'���?')"�μ���ȣ", nvl(d.dname,'���?') "�μ��̸�"
from emp e full outer join dept d on (e.deptno = d.deptno)
order by ename;


--13. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� �������� 
--   �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
--   '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����Ͻÿ�. 
      �����ڰ� ������ '����'�� ��� ����Ѵ�.
--    �����ȣ ����̸�            �����ڹ�ȣ �������̸�     
---------- ---------- ---------- ----------
--7876	ADAMS	7788	SCOTT
--7902	FORD	7566	JONES
--7788	SCOTT	7566	JONES
--7900	JAMES	7698	BLAKE
--7844	TURNER	7698	BLAKE
--7654	MARTIN	7698	BLAKE
--7521	WARD	7698	BLAKE
--7499	ALLEN	7698	BLAKE
--7934	MILLER	7782	CLARK
--7782	CLARK	7839	KING
--7698	BLAKE	7839	KING
--7566	JONES	7839	KING
--7369	SMITH	7902	FORD
--7839	KING	����	����

select e1.empno "�����ȣ", e1.ename "����̸�", nvl(to_char(e1.mgr),'����') "�����ڹ�ȣ", nvl(e2.ename,'����')"������ �̸�"
from emp e1 left outer join emp e2 on (e1.mgr = e2.empno);                 

-- ����
select *
from emp
where sal >(select sal from emp where ename ='ADAMS');
-- adams�� 1100�� �޴´�. 1100���� ū �͸� ��Ÿ������.
--select * from emp where sal >(select sal from emp where ename ='ADAMS' or ename ='JONES');
--�̷��� �ϸ� ������ ����. ���������� select ���� 2���̴�. ũ�� �����ڴ� �񱳰��� �ݵ�� �Ѱ����� �ϱ� ������ ����� �� ����.
-- �ϳ��� ���� �� : ���� �� ������ / ������ �����ڸ� 2���̻��� ���� ���ϸ� ������ ����.
-- �̰��� ������ ����������� �ϰ�, ������ ���������� ����ؾ� ������ �����ڸ� �� �� �ִ�.
