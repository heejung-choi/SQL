--�������ϸ� : exercise2.sql
--QUESTION
--1. ��� ���̺��� ����̸��� ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ����Ͻÿ�.
-- [���]       ����̸�
--           ---------------------
--                  Smith
select initcap(ename) from emp;


--2. ������̺��� ����̸��� ��� �̸��� �ι�° ���ں��� �׹�° ���ڱ���
-- ����Ͻÿ�.
-- [���]         ����̸�    2-4����
--                  ---------------------
--                  SMITH        MIT
select ename, substr(ename,2,3) from emp;

--3. ������̺��� ��� �̸��� ���� ������ ����Ͻÿ�.
select length(ename) from emp;

--4. ������̺��� ��� �̸��� �� ���� �ϳ��� ������ ���� �ϳ��� ����ϵ� 
-- ��� �ҹ��ڷ� ���� ����Ͻÿ�.
select lower(substr(ename,1,1)||substr(ename,-1,1)) from emp;
--5. 3456.78�� �ݿø��Ͽ� �Ҽ��� �Ʒ� ù��° �ڸ� ������ ��Ÿ���ÿ�.
select round(3456.78,1) from dual;

--6. ���޿� 50�� ���ϰ� �ʴ����� �����Ͽ� ����ϴµ� ���޵ڿ� '��'�� ���̰� 
--    õ�������� ','�� �ٿ��� ����Ѵ�.
--[���]	��� ���
-----------------
--          40,000��
--	80,000��
-- 	62,500��
--	148,700��
select to_char(trunc(sal*50,-2),'999,999')||'��' from emp;

--7. ���� �̸��� Ŀ�̼� ���� ���θ� ����ϴµ� �����Ǿ����� '����'
--    �������� �ʾ����� '����'�� ����Ͻÿ�.
--    	SMITH	����	
--	ALLEN	����	300
--	WARD	����	200
--	JONES	����	30
select ename, nvl2(comm,'����'||comm,'����') from emp;

--8. ���� �̸��� �μ���ȣ �׸��� �μ���ȣ�� ���� �μ����� ����Ͻÿ�.
--    �μ��� ���� ������ '����' �� ����Ͻÿ�.
--    (�μ��� : 10 �̸� 'A �μ�', 20 �̸� 'B �μ�', 30 �̸� 'C �μ�')
select * from emp;	
select ename ,decode(deptno, 10,'A�μ�',20,'B�μ�',30,'C�μ�') from emp;
--9. ������ 'SALESMAN'�̰� ������ 1000�̻��� �����
-- �̸��� ������ ����Ͻÿ�.
select ename, sal from emp where job='SALESMAN' and sal >=1000;

--10. ���ó�¥�� ���ó�¥���� 10���� ���� ��¥�� ����Ͻÿ�.
select sysdate, sysdate+10 from dual;
--11. ���� �ð��� "....�� ..�� ..�� ..�� ..��" ���� ����Ͻÿ�.
select to_char(sysdate, 'yyyy"�� "mm"�� "dd"�� "hh24"�� "mm"��"') from dual;
--12. ������ �̸�, ���޿�, ������ ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�.
--(��, ������ ������ $200�� �� ���ʽ��� �����Ͽ� ����մϴ�.)

--�̸�              ���޿�               ����
---------------------------------------------------
--SMITH             800                 12000
--ALLEN            1600                 21600
--WARD             1250                 17400
select ename "�̸�", sal"���޿�", (sal+200)*12 "����" from emp;

--13.  ������ ���� ����� ��µǵ��� SELECT ����� �ϼ��Ѵ�.
--�ڵ� ���� ��� ������ 1000 �̸��̸� A, 1000 �̻��̰� 2000 �̸��̸� B, 2000 �̻��̰� 3000 �̸��̸� C, 3000 �̻��̰� 4000 �̸��̸� D,  �� �ܿ��� E �� ����Ѵ�.
--case ������ �ذ��Ѵ�. (��� ������ �޶��� �� �ִ�)
select ename"�̸�", sal"����",
    case 
    when sal <1000 then 'A'
    when sal <2000 then 'B'
    when sal <2000 then 'C'
    when sal <2000 then 'D'
    else 'E'
    end "�ڵ�"
    from emp;
    


--14. 14. ������ ���� ����� ��µǵ��� SELECT ����� �ϼ��Ѵ�.
--�ڵ� ���� ��� �μ���ȣ�� 10�̸� A, 20�̸� B, 30�̸� C, 40�̸� E,  
--�� �ܿ��� F �� ����Ѵ�. decode( ) �Լ��� �ذ��Ѵ�. (��� ������ �޶��� �� �ִ�)
select ename, deptno, 
    decode(deptno, 10,'A',20,'B',30,'C',40,'E', 'F')
from emp;


--15. �̸��� �ι�° ���ڰ� ��A���� ��� ������ �̸��� ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ� 

--ENAME
----------
--WARD 
--MARTIN
--JAMES

select ename from emp where ename like'_A%';



--16.   ��� ������ �̸��� ��������� �Ի�Ⱓ�� ������(���� ����� ���� �ݿø��� ��)�� 
--   ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�
--   (�̶�, �Ի�Ⱓ�� �ش��ϴ� ����Ī�� ��MONTHS WORKED���� �ϰ�, 
--    �Ի�Ⱓ�� ���� ���� ���������� �����Ѵ�.)

--��¿�)
--ENAME         MONTHS WORKED
--------------------------------
--ADAMS            284
--SCOTT            286
--MILLER           348
select ename, trunc(months_between(sysdate,hiredate)) "MONTHS WORKED" 
from emp order by hiredate desc;

--17. ������̺��� ����̸��� ������� ���� ��¥������ �ٹ��ϼ��� ���Ͻÿ�.
--����̸�   �ٹ��ϼ�
-- -----------------------
--SMITH    12474��
--ALLEN    12409��
--WARD    12407��
--JONES    12368��
--MARTIN    12189��
--BLAKE    12369��
select ename"����̸�",to_char(trunc(sysdate-hiredate)||'��') "�ٹ��ϼ�" from emp;

--18. 1981�⵵�� �Ի��� �������� �̸�, ���� �׸��� �Ի�����
--         �Ի��� ������ ����Ͻÿ�.
select ename, job, hiredate from emp where hiredate like '%81%' order by hiredate;

--19. �������� �������� ������ ����ϴ� SQL  ����� �ۼ��Ͻÿ�.
select sysdate, to_char(to_date('1995-10-08', 'yyyy-mm-dd'),'dy') from dual;
--20. ���縦 �������� ���� �¾�� �� ���� �Ǿ����� �� �� �ִ� 
--      SQL ����� �ۼ��Ͻÿ�.


--21. �������� �̸��� ���� �׸��� Ŀ�̼� ������ ����ϴµ�
--     Ŀ�̼��� �������� ���� ������ "����"�̶�� ����Ͻÿ�.
select ename, sal, comm, nvl(to_char(comm),'����') from emp;


--22. ������̺��� �̸��� ù���ڰ� A�̰� ������ ���ڰ� N�� �ƴ� �����
-- �̸��� ����Ͻÿ�.
select * from emp;
select ename from emp 
where ename like 'A%' and ename not like '%N';

SELECT ENAME FROM EMP WHERE ENAME LIKE 'A%' AND ENAME NOT LIKE '%N';

--23. ������ �̸�, �Ի� ��¥ �׸��� �⵵�� ���������� �ݿø� ��¥��
--     ����Ͻÿ�.
SELECT ENAME, HIREDATE, ROUND(HIREDATE,'IY') FROM EMP;