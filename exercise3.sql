--�������ϸ� : exercise3.sql
-- scott_create_table.sql �� �����Ͽ� scott ���� �������� �����Ű�� 
-- course1 �� couse2 ���̺��� ������ �Ŀ� �����Ѵ�.

-- 1. ���տ����� �ǽ� 

-- 1.1 course1 �� course2 �� ��� �����ϴ� �л����� �̸�, ��ȭ ��ȣ �׸��� 
--    ���̸� ����Ͻÿ�.

SELECT * FROM COURSE1
INTERSECT
SELECT * FROM COURSE2;
  
-- 1.2 course1 �̵� course2 �� �����ϴ� �л����� �̸�, ��ȭ ��ȣ �׸��� 
--    ���̸� ����ϴµ� ���̰� ���� ������ ����Ͻÿ�.



-- 1.3 course1�� ���������� course2 �� �������� �ʴ� �л����� �̸��� ����Ͻÿ�.

SELECT NAME FROM COURSE1
MINUS
SELECT NAME FROM COURSE2;


-- 1.4 course2�� ���������� course1 �� �������� �ʴ� �л����� �̸��� ��ȭ��ȣ�� 
--    �̸� ������ ����Ͻÿ�.

SELECT NAME,PHONE FROM(
    SELECT * FROM COURSE2
    MINUS
    SELECT * FROM COURSE1
)
ORDER BY NAME;


--2. ��� ������ ������ ����� ���Ͻÿ�. 
       (�Ҽ��� ���� ��°�ڸ������� ��Ÿ���� ��°�ڸ� ���ʹ� �����Ͻÿ�)

	���� ���
               -----------
	   x

SELECT TRUNC(AVG(SAL),2) AS "���� ���" FROM EMP;



--3. ��� �������� �޴� Ŀ�̼��� ���� ���Ͻÿ�.
	Ŀ�̼� ��
               -----------
	  x


SELECT SUM(COMM) AS "Ŀ�̼� ��" FROM EMP;



--4. �� ���޺��� �ѿ����� ����ϵ� �ѿ����� ���� ������ ����Ͻÿ�.

	���޸�	�ѿ���
	----------------------------
	xxxx          xxx
	 :	   :


SELECT JOB AS "���޸�", SUM(SAL) AS "�ѿ���"
FROM EMP
GROUP BY JOB
ORDER BY SUM(SAL);


--5. �� �μ����� �ٹ��ϴ� �������� ����� �˰�ʹ�. ���� �������� ����ϴ� SQL
--    �� �ۼ��Ͻÿ� .

	�μ�����	   �������
	----------------------------
	����          1��
	30�� �μ�   6��
	20�� �μ�   4��
	10�� �μ�   3��


SELECT NVL2(DEPTNO,TO_CHAR(DEPTNO)||''||'�� �μ�','����') AS "�μ�����"
        , COUNT(*) AS "�������"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO DESC;


--6. �⵵���� ����� �Ի��ߴ��� �˰�ʹ�. ���� �������� ����ϴ� SQL
--    �� �ۼ��Ͻÿ� . (���� �Ի��� ������ ���)

	�Ի�⵵ 	   �Ի� �ο���
	----------------------------
	1981��	   10��
	1987��	   2��
	1982��	   1��
	1980��	   1��


SELECT CONCAT(TO_CHAR(HIREDATE,'YYYY'),'��') AS "�Ի�⵵"
    ,CONCAT(TO_CHAR(COUNT(*)),'��') AS "�Ի� �ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY')
ORDER BY COUNT(*) DESC;


--7. ��ü �������� ���ڸ� �μ������� ���� �������� ����ϴ� SQL
--    �� �ۼ��Ͻÿ� .

	2019�� 12�� 27�� �������� 14���� �ٹ����Դϴ�.


SELECT TO_CHAR(SYSDATE,'YYYY"��" MM"��" DD"�� �������� "')||''||TO_CHAR(COUNT(*),'99')||''||'���� �ٹ����Դϴ�.'
FROM EMP;


--8. ���޺� �ѿ����� ����ϵ�, ������ 'MANAGER'�� �������� �����Ͻÿ�. 
--   �׸��� �� �ѿ����� 5000���� ū ���޿� �ѿ��޸� ����Ͻÿ�.

	���޸�	�ѿ���
	----------------------------
	xxxx          xxx
	 :	   :




--9. 30�� �μ��� ������ ����� ����� �˻��Ѵ�.
-- ��������� ����+Ŀ�̼�(null�̸� 0���� ���)�̸� 
-- ��� ����� �Ҽ��� ���� �� �ڸ�(�ݿø�)���� ���ϵ� ������� ����Ѵ�.
              ������       ��տ���
              ---------------------------
              xxxx         xxx.xx
	 :	    :


SELECT JOB AS "������", ROUND(AVG(SAL+NVL(COMM,0)),2) AS "��տ���"
FROM EMP
WHERE DEPTNO=30
GROUP BY JOB;


--10. ���� �Ի��ο��� ���� �������� ����ϴ� SQL �� �ۼ��Ͻÿ� . 
--     �Ի������ ���������̸� �Ի��ο��� 2�� �̻��� ��쿡�� ����Ѵ�.


	02��	2��
	04��	2��
	05��	2��
	09��	2��
	12��	3��


SELECT TO_CHAR(HIREDATE,'MM"��"'), COUNT(*)
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'MM"��"')
HAVING COUNT(*)>=2
ORDER BY TO_CHAR(HIREDATE,'MM"��"');



  

SELECT * FROM COURSE1;
SELECT * FROM COURSE2;
--1.1
SELECT * FROM COURSE1
INTERSECT
SELECT * FROM COURSE2;

--1.2 -> �������� �̿�
SELECT * FROM
(
    SELECT * FROM COURSE1
    UNION
    SELECT * FROM COURSE2
)
ORDER BY AGE;

--1.3
SELECT NAME FROM COURSE1
MINUS
SELECT NAME FROM COURSE2;

--1.4
SELECT NAME,PHONE FROM(
    SELECT * FROM COURSE2
    MINUS
    SELECT * FROM COURSE1
)
ORDER BY NAME;

--2
SELECT TRUNC(AVG(SAL),2) AS "���� ���" FROM EMP;

--3
SELECT SUM(COMM) FROM EMP;

--4
SELECT JOB AS "���޸�", SUM(SAL) AS "�ѿ���"
FROM EMP
GROUP BY JOB
ORDER BY SUM(SAL);

--5
SELECT NVL2(DEPTNO,TO_CHAR(DEPTNO)||''||'�� �μ�','����') AS "�μ�����"
        , COUNT(*)||''||'��' AS "�������"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO DESC;

--6 
SELECT CONCAT(TO_CHAR(HIREDATE,'YYYY'),'��') AS "�Ի�⵵"
    ,CONCAT(TO_CHAR(COUNT(*)),'��') AS "�Ի� �ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY')
ORDER BY COUNT(*) DESC;

--7
SELECT TO_CHAR(SYSDATE,'YYYY"��" MM"��" DD"�� �������� "')||''||TO_CHAR(COUNT(*),'99')||''||'���� �ٹ����Դϴ�.'
FROM EMP;

--8
SELECT JOB AS ���޸�, SUM(SAL) AS �ѿ���
FROM EMP
WHERE JOB!='MANAGER'
GROUP BY JOB
HAVING SUM(SAL)>5000;

--9
SELECT JOB AS "������", ROUND(AVG(SAL+NVL(COMM,0)),2) AS "��տ���"
FROM EMP
WHERE DEPTNO=30
GROUP BY JOB;

--10
SELECT TO_CHAR(HIREDATE,'MM"��"'), COUNT(*)
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'MM"��"')
HAVING COUNT(*)>=2
ORDER BY TO_CHAR(HIREDATE,'MM"��"');