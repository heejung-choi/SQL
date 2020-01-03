--제출파일명 : exercise2.sql
--QUESTION
--1. 사원 테이블에서 사원이름을 첫글자는 대문자로, 나머지는 소문자로 출력하시오.
-- [결과]       사원이름
--           ---------------------
--                  Smith
select initcap(ename) from emp;


--2. 사원테이블에서 사원이름과 사원 이름의 두번째 글자부터 네번째 글자까지
-- 출력하시오.
-- [결과]         사원이름    2-4문자
--                  ---------------------
--                  SMITH        MIT
select ename, substr(ename,2,3) from emp;

--3. 사원테이블의 사원 이름의 문자 개수를 출력하시오.
select length(ename) from emp;

--4. 사원테이블에서 사원 이름의 앞 글자 하나와 마지막 글자 하나만 출력하되 
-- 모두 소문자로 각각 출력하시오.
select lower(substr(ename,1,1)||substr(ename,-1,1)) from emp;
--5. 3456.78을 반올림하여 소수점 아래 첫번째 자리 까지만 나타내시오.
select round(3456.78,1) from dual;

--6. 월급에 50를 곱하고 십단위는 절삭하여 출력하는데 월급뒤에 '원'을 붙이고 
--    천단위마다 ','를 붙여서 출력한다.
--[결과]	계산 결과
-----------------
--          40,000원
--	80,000원
-- 	62,500원
--	148,700원
select to_char(trunc(sal*50,-2),'999,999')||'원' from emp;

--7. 직원 이름과 커미션 설정 여부를 출력하는데 설정되었으면 '설정'
--    설정되지 않았으면 '미정'을 출력하시오.
--    	SMITH	미정	
--	ALLEN	설정	300
--	WARD	설정	200
--	JONES	설정	30
select ename, nvl2(comm,'설정'||comm,'미정') from emp;

--8. 직원 이름과 부서번호 그리고 부서번호에 따른 부서명을 출력하시오.
--    부서가 없는 직원은 '없당' 을 출력하시오.
--    (부서명 : 10 이면 'A 부서', 20 이면 'B 부서', 30 이면 'C 부서')
select * from emp;	
select ename ,decode(deptno, 10,'A부서',20,'B부서',30,'C부서') from emp;
--9. 직위가 'SALESMAN'이고 월급이 1000이상인 사원의
-- 이름과 월급을 출력하시오.
select ename, sal from emp where job='SALESMAN' and sal >=1000;

--10. 오늘날짜와 오늘날짜에서 10일을 더한 날짜를 출력하시오.
select sysdate, sysdate+10 from dual;
--11. 현재 시간을 "....년 ..월 ..일 ..시 ..분" 으로 출력하시오.
select to_char(sysdate, 'yyyy"년 "mm"월 "dd"일 "hh24"시 "mm"분"') from dual;
--12. 직원의 이름, 월급여, 연봉을 조회하는 질의를 작성하시오.
--(단, 직원의 연봉은 $200의 월 보너스를 포함하여 계산합니다.)

--이름              월급여               연봉
---------------------------------------------------
--SMITH             800                 12000
--ALLEN            1600                 21600
--WARD             1250                 17400
select ename "이름", sal"월급여", (sal+200)*12 "연봉" from emp;

--13.  다음과 같이 결과가 출력되도록 SELECT 명령을 완성한다.
--코드 값의 경우 월급이 1000 미만이면 A, 1000 이상이고 2000 미만이면 B, 2000 이상이고 3000 미만이면 C, 3000 이상이고 4000 미만이면 D,  이 외에는 E 를 출력한다.
--case 식으로 해결한다. (출력 순서는 달라질 수 있다)
select ename"이름", sal"월급",
    case 
    when sal <1000 then 'A'
    when sal <2000 then 'B'
    when sal <2000 then 'C'
    when sal <2000 then 'D'
    else 'E'
    end "코드"
    from emp;
    


--14. 14. 다음과 같이 결과가 출력되도록 SELECT 명령을 완성한다.
--코드 값의 경우 부서번호가 10이면 A, 20이면 B, 30이면 C, 40이면 E,  
--이 외에는 F 를 출력한다. decode( ) 함수로 해결한다. (출력 순서는 달라질 수 있다)
select ename, deptno, 
    decode(deptno, 10,'A',20,'B',30,'C',40,'E', 'F')
from emp;


--15. 이름의 두번째 문자가 “A”인 모든 직원의 이름을 조회하는 질의를 작성하시오 

--ENAME
----------
--WARD 
--MARTIN
--JAMES

select ename from emp where ename like'_A%';



--16.   모든 직원의 이름과 현재까지의 입사기간을 월단위(가장 가까운 월로 반올림할 것)로 
--   조회하는 질의를 작성하시오
--   (이때, 입사기간에 해당하는 열별칭은 “MONTHS WORKED”로 하고, 
--    입사기간이 가장 적은 직원순으로 정렬한다.)

--출력예)
--ENAME         MONTHS WORKED
--------------------------------
--ADAMS            284
--SCOTT            286
--MILLER           348
select ename, trunc(months_between(sysdate,hiredate)) "MONTHS WORKED" 
from emp order by hiredate desc;

--17. 사원테이블에서 사원이름과 사원들의 오늘 날짜까지의 근무일수를 구하시오.
--사원이름   근무일수
-- -----------------------
--SMITH    12474일
--ALLEN    12409일
--WARD    12407일
--JONES    12368일
--MARTIN    12189일
--BLAKE    12369일
select ename"사원이름",to_char(trunc(sysdate-hiredate)||'일') "근무일수" from emp;

--18. 1981년도에 입사한 직원들의 이름, 직위 그리고 입사일을
--         입사한 순으로 출력하시오.
select ename, job, hiredate from emp where hiredate like '%81%' order by hiredate;

--19. 내생일을 기준으로 요일을 출력하는 SQL  명령을 작성하시오.
select sysdate, to_char(to_date('1995-10-08', 'yyyy-mm-dd'),'dy') from dual;
--20. 현재를 기준으로 내가 태어난지 몇 개월 되었는지 알 수 있는 
--      SQL 명령을 작성하시오.


--21. 직원들의 이름과 월급 그리고 커미션 정보를 출력하는데
--     커미션이 정해지지 않은 직원은 "미정"이라고 출력하시오.
select ename, sal, comm, nvl(to_char(comm),'미정') from emp;


--22. 사원테이블에서 이름의 첫글자가 A이고 마지막 글자가 N이 아닌 사원의
-- 이름을 출력하시오.
select * from emp;
select ename from emp 
where ename like 'A%' and ename not like '%N';

SELECT ENAME FROM EMP WHERE ENAME LIKE 'A%' AND ENAME NOT LIKE '%N';

--23. 직원의 이름, 입사 날짜 그리고 년도를 기준으로한 반올림 날짜를
--     출력하시오.
SELECT ENAME, HIREDATE, ROUND(HIREDATE,'IY') FROM EMP;