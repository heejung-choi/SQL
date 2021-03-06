 

# SQL 정리

1.  데이터/ 정보

(데이터)는 어떤 필요에 의해 수집했지만 아직 특정 목적을 위해 정제하지 않은 값, 사실 또는 자료를 의미합니다. (정보)는 수집된 (데이터)를 어떤 목적을 위해 분석, 가공하여 가치를 추가하거나 새로운 의미를 부여한 결과 입니다.

 

2.  데이터베이스를 함으로써 얻을 수 있는 장점이 아닌 것은?

데이터베이스는 구조화된 데이터의 집합이다.

여러사람과 실시간으로 공유하여 사용할 수 있다.

효율적인 데이터 관리를 할 수 있다.

효율적인 데이터 검색을 할 수 있다.

일관성 있는 방법으로 데이터 관리를 할 수 있다.

데이터 누락 및 중복 제거를 할 수 있다.

 

3. 파일시스템과 DBMS 방식의 차이점

| 파일 시스템 방식의 문제                                      | DBMS를 통한 데이터 관리                                      |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| 데이터 중복                                                  | 하나의 소프트웨어가 데이터를 관리함으로 데이터 중복을 피할 수 있음 |
| 응용 프로그램이 개별 데이터를 직접 관리                      | 여러 응용 프로그램이 하나의 DBMS를 통해 데이터를 사용하므로  데이터를 동시에 공유할 수 있음 |
| 응용 프로그램이 데이터를 쓰는 방식이 각각 다름               | 하나의 DBMS를 통해 데이터를 관리하기 때문에 각각의 응용  프로그램이 데이터를 관리하는 방식이 통합됨 |
| 데이터가 특정 응용프로그램에 종속되어 있으므로 응용 프로그램을 변경하면 기존 데이터를 사용할 수 없음 | 응용 프로그램과 별도로 데이터가 DBMS에 의해 관리, 보관되기 때문에 응용 프로그램의 업데이트 또는 변경과 관계없이 데이터를 사용할 수 있음 |

 



 

4. 관계형 데이터 모델

관계형 데이터 모델은 1970년 에드거프랭크커드가 제안한 모델로, 현대에 가장 많이 사용하는 관계형 데이터베이스의 바탕이 되는 모델입니다. 관계형 데이터 모델은 다른 모델과 달리 데이터간 관계에 초점을 둡니다. 

| 이름                 | 설명                                                         |
| -------------------- | ------------------------------------------------------------ |
| 개체(entity)         | 데이터베이스에서 데이터화하려는 사물, 개념의 정보 단위 입니다. 관계형 데이터베이스의 테이블 개념과 대응되며 테이블은 릴레이션으로 표기되기도 합니다. |
| 속성 (attribute)     | 개체를 구성하는 데이터의 가장 작은 논리적 단위로서 데이터의 종류, 특성, 상태 등을 정의합니다. 관계형 데이터베이스의 열 개념과 대응됩니다. |
| 관계  (relationship) | 개체와 개체 또는 속성간의 연관성을 나타내기 위해 사용합니다. 관계형데이터베이스에서는  테이블 간의 관계를 외래키 등으로 구현하여 사용합니다. |

 

5. 데이터 정의어

| 종류                                | 설명                                                         |
| ----------------------------------- | ------------------------------------------------------------ |
| DQL  (data query language)          | RDBMS에 저장한 데이터를 원하는 방식으로 조회하는 명령어      |
| DML  (data manipulation language)   | RBDMS 내 테이블의 데이터를 저장, 수정, 삭제하는 명령어       |
| DDL  (data definition language)     | RDBMS내 데이터 관리를 위해 테이블을 포함한 여러 객체를 생성, 수정, 삭제 하는 명령어 |
| TCL  (transaction control language) | 트랜잭션 데이터의 영구 저장, 취소 등과 관련된 명령어         |
| DCL  (data control language)        | 데이터 사용권한과 관련된 명령어                              |

 

6. 기본키(primary key)의 속성

1)  테이블의 저장된 행을 식별할 수 있는 유일한 값이어야 한다.

2)  값의 중복이 없어야 한다.

3)  NULL 값을 가질 수 없다.

 

7. 외래키 

외래키는 특정 테이블에 포함되어 있으면서 다른 테이블의 기본키로 지정된 키를 의미합니다. 

8. 자료형

데이터가 어떤 형태의 데이터인지를 말할 때 ‘자료형’이라는 용어를 사용합니다.

| 자료형     | 설명                                                         |
| ---------- | ------------------------------------------------------------ |
| VALCHAR2   | 4000byte 만큼의 가변길이 문자열데이터를 저장할 수 있다.(최소크기 1byte) |
| NUMBER     | ![img](file:///C:/Users/i9i91/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png)38자릿수의  숫자를 저장할 수 있다. NUMBER(p,s)와 같이 표기할 경우 s자리만큼 소숫점이하 자리수를 표현하고, 이 소주점 자리를 포함한  전체 p자리 만틈 숫자 데이터를 저장한다. |
| DATE       | 날짜 형식 저장 – 세기, 연, 월, 일, 시, 분, 초 저장 가능하다. |
| CHAR(길이) | 4000byte 만큼 고정길이 문자열 데이터를 저장할 수 있다.(최소크기 1byte) |
| NVARCHAR2  | 4000byte만큼의 가변길이 국가별 문자세트 데이터를 저장할 수 있다.(최소크기 1byte) |
| BLOB       | 최대크기 4GB의 대용량 이진 데이터를 저장할 수 있다.          |
| CLOB       | 최대크기 4GB의 대용량 텍스트 데이터를 저장할 수 있다.        |
| BFILE      | 최대크기 4GB의 대용량 이진 데이터 파일을 저장할 수 있다.     |

 

9. 테이블 구조 살펴보기

DESC EMP;

 

10. 다음 중 오라클이 내장하고 있는 더미테이블은?

dual

 

11. sql은 대입 연산자가 필요 없는 언어이다. 등가가 하나만 있으면 된다.

ex) select * from emp where deptno =30;

 

12. like 연산자

like 연산자는 이메일이나 게시판 제목 또는 내용 검색 기능처럼 일부 문자열이 포함된 데이터를 조회할 때 사용합니다. 

_ : 어떤 값이든 상관없이 한개의 문자 데이터를 의미

%: 길이와 상관 없이(문자 없는 경우도 포함) 모든 문자 데이터를 의미

ex) select * from emp where ename like 'S%';

13. 연산자 우선순위 

| 우선순위                           | 연산자                   | 설명                       |
| ---------------------------------- | ------------------------ | -------------------------- |
| 높음                    낮음       | * , /                    | 산술 연산자 곱하기, 나누기 |
| +, -                               | 산술 연산자 더하기, 빼기 |                            |
| =, !=, ^=, <>, >, >=, <, <=        | 대소 비교 연산자         |                            |
| is (not) null, (not) like, (not)in | 그 외 비교 연산자        |                            |
| between a and b                    | between 연산자           |                            |
| not                                | 논리 부정 연산자 not     |                            |
| and                                | 논리 부정 연산자 and     |                            |
| or                                 | 논리 부정 연산자 or      |                            |

 

14. 트렌젝션

트렌젝션이란 더이상 분할할 수 없는 최소 수행단위를 뜻하며 계좌이체와 같이 하나의 작업 또는 밀접하게 연관된 작업을 수행하기 위해 한개 이상의 데이터 조작 명령어(DML)로 이루어 진다. 즉, 어떤 기능 한가지를 수행하는 SQL문 덩어리 라고 볼 수 있다. 트랜젝션은 하나의 트랜잭션 내에 있는 여러 명령어를 한번에 수행하여 작업을 완료하거나 아예 수행하지 않는 상태, 즉 모든 작업을 취소한다. 이러한 특성으로 트랜잭션 의미를 ‘ALL OR NOTHING’ 문장으로 설명하기도 한다. 그리고 트랜잭션을 제어하기 위해 사용하는 명령어를 TCL이라고 한다.



15. 테이블 이름 생성규칙

1)  테이블 이름은 문자로 시작해야 한다.(한글도 가능하며 숫자로 시작할 수 없음)

2)  테이블 이름은 30byte 이하여야 한다.(즉, 영어는 30자, 한글은 15자 까지 사용 가능)

3)  같은 사용자 소유의 테이블 이름은 중복될 수 없다.(SCOTT 계정에 두 EMP 테이블은 존재할 수 없음)

4)  테이블 이름은 영문자(한글 가능), 숫자(0-9), 특수문자 $, #, _를 사용할 수 있다.

5)  SQL 키워드는 테이블 이름으로 사용할 수 없다.(select, from 등은 테이블 이름으로 사용 불가)

 

16. executeupdate(query)

 -> INSERT / DELETE / UPDATE 관련 구문(DML)에서는 반영된 레코드의 건수를 반환합니다.

 -> CREATE / DROP/ALTER 관련 구문(DDL)에서는 0 을 반환합니다.

 