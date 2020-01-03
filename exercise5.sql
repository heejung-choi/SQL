select * from emp;
select * from dept;
select * from salgrade;


--제출파일명 : exercise5.sql - ansi join 구문 사용
-- 1. DALLAS에서 근무하는 직원의 이름, 업무, 부서이름을 출력하시오.
--이름         업무         	부서이름          
---------- --------- ------------------
--SCOTT	    ANALYST	RESEARCH
--SMITH	    CLERK		RESEARCH
--JONES	    MANAGER	RESEARCH
--FORD	    ANALYST	RESEARCH      
select e.ename "이름", e.job "업무", d.dname "부서이름"
from emp e join dept d using (deptno)
where d.loc='DALLAS';

-- 만약, 대소문자에 확신이 없다면
--where e.deptno = d.deptno and upper(d.loc)='DALLAS';
-- 2. 이름에 'A'가 들어가는 직원들의 이름과 부서이름을 출력하시오.
--이름        부서이름          
--------    --------------
--ALLEN	   SALES
--WARD	   SALES
--MARTIN   SALES
--BLAKE	   SALES
--CLARK	   ACCOUNTING
--JAMES	   SALES

select e.ename "이름", d.dname "부서이름"
from emp e join dept d on(e.deptno = d.deptno)
where e.ename like '%A%';

-- 3. 직원이름과 그 직원이 속한 부서의 부서명, 그리고 월급을 
--출력하는데 월급이 3000이상인 직원을 출력하시오. 
--직원이름   부서명               월급
---------- -------------- ----------
--SCOTT	   RESEARCH	3,000원
--KING	   ACCOUNTING	5,000원
--FORD	   RESEARCH	3,000원

select e.ename "직원이름", d.dname "부서명", to_char(e.sal, '9,999')||'원' "월급"
from emp e join dept d on(e.deptno = d.deptno)
where e.sal>=3000;


-- 4. 업무가 'SALESMAN'인 직원들의 업무와 그 직원이름, 그리고
-- 그 직원이 속한 부서 이름을 출력하시오. 
--업무          직원이름       부서이름          
--------- ---------- --------------
--SALESMAN  TURNER     SALES         
--SALESMAN  MARTIN     SALES         
--SALESMAN  WARD       SALES         
--SALESMAN  ALLEN      SALES

select e.job "업무", e.ename "직원이름", d.dname "부서이름"
from emp e join dept d on(e.deptno = d.deptno)
where e.job='SALESMAN';

-- 5. 커미션이 책정된 직원들의 직원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '직원번호', '직원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하시오. 
--  직원번호 직원이름      연봉           실급여       급여등급
---------- ---------- ---------- ---------- ----------
--  7521 WARD             15000         15200          2
--  7654 MARTIN          15000         15300          2
--  7844 TURNER          18000         18000          3
--  7499	ALLEN	       19200         19500	   3
select e.empno "직원번호", e.ename "직원이름", e.sal*12 "연봉", e.sal*12+e.comm "실급여", s.grade "급여등급"
from emp e join salgrade s on(e.sal between s.losal and s.hisal)
where comm is not null
order by 실급여;    


-- 6. 부서번호가 10번인 직원들의 부서번호, 부서이름, 직원이름,
-- 월급, 급여등급을 출력하시오. 
--   부서번호 부서이름           직원이름      월급           급여등급
---------- -------------- ---------- ---------- ----------
--      10 ACCOUNTING     CLARK            2450          4
--      10 ACCOUNTING     KING              5000          5
--      10 ACCOUNTING     MILLER           1300           2 
select e.deptno "부서번호",  d.dname "부서이름", e.ename "직원이름", e.sal "월급", s.grade "급여등급"
from emp e join dept d on (e.deptno = d.deptno)
    join salgrade s on(e.sal between s.losal and s.hisal)
where e.deptno=10;

-- 7. 부서번호가 10번, 20번인 직원들의 부서번호, 부서이름, 
-- 직원이름, 월급, 급여등급을 출력하시오. 그리고 그 출력된 
-- 결과물을 부서번호가 낮은 순으로, 월급이 많은 순으로 정렬하시오. (7개 행)
--   부서번호 부서이름              직원이름               월급       급여등급
---------- -------------- ---------- ---------- ----------
--    10 ACCOUNTING              KING                   5000          5
--    10 ACCOUNTING              CLARK                 2450          4
select e.deptno "부서번호",  d.dname "부서이름", e.ename "직원이름", e.sal "월급", s.grade "급여등급"
from emp e join dept d on (e.deptno = d.deptno)
    join salgrade s on(e.sal between s.losal and s.hisal)
    where e.deptno in(10,20)
order by e.deptno , e.sal desc ;



-- 8. 사원들의 이름, 부서번호, 부서이름을 출력하시오. 
-- 단, 직원이 없는 부서도 출력하며 이경우 이름을 '미정'이라고
-- 출력한다. (14행)       
--이름               부서번호 부서이름          
---------- ---------- --------------
--SCOTT             20 RESEARCH
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
select nvl(e.ename,'미정') "이름", d.deptno "부서번호", d.dname "부서이름"
from emp e right join dept d on(e.deptno= d.deptno);
    


-- 9. 사원들의 이름, 부서번호, 부서이름을 출력하시오. 
-- 단, 아직 부서 배치를 못받은 직원도  출력하며 이경우 부서번호는  0 으로
-- 출력한다.        
--이름               부서번호     부서이름          
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
select e.ename "이름", nvl(d.deptno,0) "부서번호", d.dname "부서이름"
from emp e left join dept d on(e.deptno= d.deptno);


--10. 커미션이 정해진 모든 직원의 이름, 커미션, 부서이름, 위치를 조회하는 sql을 작성하시오.

--ENAME           COMM        DNAME         	LOC
----------------------------------------------------
--TURNER	0	SALES		CHICAGO
--MARTIN	1400	SALES		CHICAGO
--WARD		500	SALES		CHICAGO
--ALLEN		300	SALES		CHICAGO         
select  e.ename , e.comm, d.dname, d.loc
from emp e join dept d on(e.deptno= d.deptno)
where comm is not null;


-- 11. DALLAS에서 근무하는 사원의 이름,  월급, 등급을 출력하시오.
--이름         월급             등급          
---------- --------- --------------
--SMITH      800            1      
--JONES      2975          4   
--SCOTT	     3000	        4
--FORD       3000          4      
select  e.ename "이름", e.sal "월급", s.grade "등급"
from emp e join dept d on (e.deptno = d.deptno)
    join salgrade s on(e.sal between s.losal and s.hisal)
where d.loc='DALLAS';

-- 12. 사원들의 이름, 부서번호, 부서이름을 출력하시오. 
-- 단, 직원이 없는 부서도 출력하며 이경우 직원 이름을 '누구?'라고
-- 출력한다. 아직 부서 배치를 못받은 직원도  출력하며 부서 번호와 부서 이름을
-- '어디?' 이라고 출력한다.     
--이름               부서번호 부서이름          
---------- ---------- --------------
--ADAMS	어디?	어디?
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
--누구?	40	OPERATIONS
select nvl(e.ename,'누구?') "이름", nvl(to_char(d.deptno),'어디?')"부서번호", nvl(d.dname,'어디?') "부서이름"
from emp e full outer join dept d on (e.deptno = d.deptno)
order by ename;


--13. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의 
--   사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
--   '사원이름', '관리자번호', '관리자이름'으로 하여 출력하시오. 
      관리자가 없으면 '없음'을 대신 출력한다.
--    사원번호 사원이름            관리자번호 관리자이름     
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
--7839	KING	없음	없음

select e1.empno "사원번호", e1.ename "사원이름", nvl(to_char(e1.mgr),'없음') "관리자번호", nvl(e2.ename,'없음')"관리자 이름"
from emp e1 left outer join emp e2 on (e1.mgr = e2.empno);                 

-- 예제
select *
from emp
where sal >(select sal from emp where ename ='ADAMS');
-- adams는 1100을 받는다. 1100보다 큰 것만 나타내진다.
--select * from emp where sal >(select sal from emp where ename ='ADAMS' or ename ='JONES');
--이렇게 하면 오류가 난다. 서브쿼리의 select 행이 2개이다. 크다 연산자는 비교값이 반드시 한개여야 하기 때문에 사용할 수 없다.
-- 하나의 값만 비교 : 단일 행 연산자 / 단일행 연산자를 2개이상의 값과 비교하면 오류가 난다.
-- 이것이 단일행 서브쿼리라고 하고, 다중행 서브쿼리를 사용해야 다중행 연산자를 쓸 수 있다.
