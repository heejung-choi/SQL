-- ������ ������ �������� �ذ��Ͽ� �����Ѵ�.
-- �������ϸ� : exercise1.sql

--1. ��� ���̺��� ����Ʈ�� ����Ͻÿ�.
select * from tab; --tab ���� ���� ��ųʸ���� �Ѵ�.

--2. emp ���̺�� dept ���̺��� ������ ����Ͻÿ�.
desc emp; 
desc dept;

--3. ���(emp)���̺��� ��� �����͸� ����Ͻÿ�.
SELECT * FROM emp;

--4. ������̺��� �����ȣ, ����̸�, ������ ����Ͻÿ�.
SELECT EMPNO, ENAME, SAL FROM emp;


--5. ������̺��� ���޿��� �̴µ� �ߺ��� �����Ͱ� ���� ����Ͻÿ�.
SELECT DISTINCT SAL FROM emp;

--6. ������̺��� ����̸��� ������ ����ϴµ� ������ �÷�����
-- "�� ��","�� ��"���� �ٲ㼭 ����Ͻÿ�. ��, ALIAS�� ���� �߰�
SELECT ENAME "�� ��", SAL "�� ��" FROM emp;

--7. ������̺��� ����̸�, ������ �̰�, ���ް� Ŀ�̼���  ���� ����
-- ����ϴµ� �÷����� '�Ǳ޿�'�̶�� �ؼ� ����Ͻÿ�.
-- ��, NULL���� ��Ÿ���� �ʰ� �Ͻÿ�.(Ŀ�̼� �ȹ޴»������)
SELECT ENAME,SAL,SAL+COMM "�Ǳ޿�" FROM emp
WHERE DEPTNO+COMM is not null;

--8. ������̺��� 'FORD'�̶�� ����� �����ȣ, �̸�, ������ ����Ͻÿ�.
SELECT empno, ename, sal FROM emp
where ename= 'FORD';

--9. ������̺��� ������ 'SALESMAN'�� ����� �����ȣ, �̸�, ������
-- ����Ͻÿ�.
SELECT empno, ename, job FROM emp
where uppor(job)= 'SALESMAN';-- �빮������ �ҹ������� �𸣸� upper ���

--10. ������̺��� �����ȣ�� 7499, 7521, 7654�� ����� �����ȣ, �̸�
-- ������ ����Ͻÿ�.
SELECT empno, ename, sal FROM emp
where empno='7499' OR empno='7521' OR empno='7654';

SELECT empno, ename, sal FROM emp
where empno IN ('7499','7521','7654');

--11. ������̺��� ������ 1500���� 3000������ ����� �����ȣ, �̸�,
-- ������ ����Ͻÿ�.
SELECT empno, ename, sal FROM EMP
WHERE sal BETWEEN 1500 AND 3000;

--12. ��� ���̺��� �Ŵ����� ���� ������ �̸��� ����Ͻÿ�.
SELECT ENAME FROM emp
WHERE MGR is null;

--13. ������̺��� ������ ���� ������ ��� ������ ����Ͻÿ�.
SELECT * FROM EMP
ORDER BY sal DESC;

--14. ������̺��� ������ �̸��� �Ի����� ����ϴµ� �ֱٿ� �Ի��� ������ ����Ͻÿ�.
SELECT ename, hiredate FROM EMP
ORDER BY hiredate DESC;

--15. ��� ���̺��� 30�� �μ��� �ٹ��ϴ� �������� �̸��� ����ϴµ�
-- �Ի����� ������ ������ ����Ͻÿ�.
SELECT ename FROM EMP
where deptno=30
ORDER BY hiredate;
