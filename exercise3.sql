--제출파일명 : exercise3.sql
-- scott_create_table.sql 을 복사하여 scott 계정 영역에서 수행시키고 
-- course1 과 couse2 테이블을 생성한 후에 진행한다.

-- 1. 집합연산자 실습 

-- 1.1 course1 과 course2 를 모두 수강하는 학생들의 이름, 전화 번호 그리고 
--    나이를 출력하시오.

SELECT * FROM COURSE1
INTERSECT
SELECT * FROM COURSE2;
  
-- 1.2 course1 이든 course2 든 수강하는 학생들의 이름, 전화 번호 그리고 
--    나이를 출력하는데 나이가 많은 순으로 출력하시오.



-- 1.3 course1은 수강하지만 course2 는 수강하지 않는 학생들의 이름을 출력하시오.

SELECT NAME FROM COURSE1
MINUS
SELECT NAME FROM COURSE2;


-- 1.4 course2는 수강하지만 course1 은 수강하지 않는 학생들의 이름과 전화번호를 
--    이름 순으로 출력하시오.

SELECT NAME,PHONE FROM(
    SELECT * FROM COURSE2
    MINUS
    SELECT * FROM COURSE1
)
ORDER BY NAME;


--2. 모든 직원들 월급의 평균을 구하시오. 
       (소수점 이하 둘째자리까지만 나타내고 셋째자리 부터는 절삭하시오)

	월급 평균
               -----------
	   x

SELECT TRUNC(AVG(SAL),2) AS "월급 평균" FROM EMP;



--3. 모든 직원들이 받는 커미션의 합을 구하시오.
	커미션 합
               -----------
	  x


SELECT SUM(COMM) AS "커미션 합" FROM EMP;



--4. 각 직급별로 총월급을 출력하되 총월급이 낮은 순으로 출력하시오.

	직급명	총월급
	----------------------------
	xxxx          xxx
	 :	   :


SELECT JOB AS "직급명", SUM(SAL) AS "총월급"
FROM EMP
GROUP BY JOB
ORDER BY SUM(SAL);


--5. 각 부서에서 근무하는 직원들의 명수를 알고싶다. 다음 형식으로 출력하는 SQL
--    을 작성하시오 .

	부서정보	   직원명수
	----------------------------
	미정          1명
	30번 부서   6명
	20번 부서   4명
	10번 부서   3명


SELECT NVL2(DEPTNO,TO_CHAR(DEPTNO)||''||'번 부서','미정') AS "부서정보"
        , COUNT(*) AS "직원명수"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO DESC;


--6. 년도별로 몇명이 입사했는지 알고싶다. 다음 형식으로 출력하는 SQL
--    을 작성하시오 . (많이 입사한 순으로 출력)

	입사년도 	   입사 인원수
	----------------------------
	1981년	   10명
	1987년	   2명
	1982년	   1명
	1980년	   1명


SELECT CONCAT(TO_CHAR(HIREDATE,'YYYY'),'년') AS "입사년도"
    ,CONCAT(TO_CHAR(COUNT(*)),'명') AS "입사 인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY')
ORDER BY COUNT(*) DESC;


--7. 전체 직원들의 숫자를 부서정보를 다음 형식으로 출력하는 SQL
--    을 작성하시오 .

	2019년 12월 27일 기준으로 14명이 근무중입니다.


SELECT TO_CHAR(SYSDATE,'YYYY"년" MM"월" DD"일 기준으로 "')||''||TO_CHAR(COUNT(*),'99')||''||'명이 근무중입니다.'
FROM EMP;


--8. 직급별 총월급을 출력하되, 직급이 'MANAGER'인 직원들은 제외하시오. 
--   그리고 그 총월급이 5000보다 큰 직급와 총월급만 출력하시오.

	직급명	총월급
	----------------------------
	xxxx          xxx
	 :	   :




--9. 30번 부서의 업무별 년봉의 평균을 검색한다.
-- 연봉계산은 월급+커미션(null이면 0으로 계산)이며 
-- 출력 양식은 소수점 이하 두 자리(반올림)까지 통일된 양식으로 출력한다.
              업무명       평균월급
              ---------------------------
              xxxx         xxx.xx
	 :	    :


SELECT JOB AS "업무명", ROUND(AVG(SAL+NVL(COMM,0)),2) AS "평균월급"
FROM EMP
WHERE DEPTNO=30
GROUP BY JOB;


--10. 월별 입사인원을 다음 형식으로 출력하는 SQL 을 작성하시오 . 
--     입사월별로 오름차순이며 입사인원이 2명 이상인 경우에만 출력한다.


	02월	2명
	04월	2명
	05월	2명
	09월	2명
	12월	3명


SELECT TO_CHAR(HIREDATE,'MM"월"'), COUNT(*)
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'MM"월"')
HAVING COUNT(*)>=2
ORDER BY TO_CHAR(HIREDATE,'MM"월"');



  

SELECT * FROM COURSE1;
SELECT * FROM COURSE2;
--1.1
SELECT * FROM COURSE1
INTERSECT
SELECT * FROM COURSE2;

--1.2 -> 서브쿼리 이용
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
SELECT TRUNC(AVG(SAL),2) AS "월급 평균" FROM EMP;

--3
SELECT SUM(COMM) FROM EMP;

--4
SELECT JOB AS "직급명", SUM(SAL) AS "총월급"
FROM EMP
GROUP BY JOB
ORDER BY SUM(SAL);

--5
SELECT NVL2(DEPTNO,TO_CHAR(DEPTNO)||''||'번 부서','미정') AS "부서정보"
        , COUNT(*)||''||'명' AS "직원명수"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO DESC;

--6 
SELECT CONCAT(TO_CHAR(HIREDATE,'YYYY'),'년') AS "입사년도"
    ,CONCAT(TO_CHAR(COUNT(*)),'명') AS "입사 인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY')
ORDER BY COUNT(*) DESC;

--7
SELECT TO_CHAR(SYSDATE,'YYYY"년" MM"월" DD"일 기준으로 "')||''||TO_CHAR(COUNT(*),'99')||''||'명이 근무중입니다.'
FROM EMP;

--8
SELECT JOB AS 직급명, SUM(SAL) AS 총월급
FROM EMP
WHERE JOB!='MANAGER'
GROUP BY JOB
HAVING SUM(SAL)>5000;

--9
SELECT JOB AS "업무명", ROUND(AVG(SAL+NVL(COMM,0)),2) AS "평균월급"
FROM EMP
WHERE DEPTNO=30
GROUP BY JOB;

--10
SELECT TO_CHAR(HIREDATE,'MM"월"'), COUNT(*)
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'MM"월"')
HAVING COUNT(*)>=2
ORDER BY TO_CHAR(HIREDATE,'MM"월"');