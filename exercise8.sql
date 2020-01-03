--생성 파일명 : exercise8.sql
-- jdbctest 라는 사용자로 접속해서 이 테이블들을 생성한다.

--1. 테이블명 : visitor
--    컬럼 사양 : name - 한글 기준으로 최대 6자를 저장할 수 있게
--                  writedate - 날짜와 시간을 저장할 수 있게 
--                  memo - 한글 기준으로 최대 60자를 저장할 수 있게
--                   [visitor 테이블에 데이터를 3개 행을 입력]
--	      날짜 데이터 : 1개 : 현재시간,  
--                                      1개 : 2017년 12월 25일, 
--                                      1개 : 1999년 8월 11일

--2. 테이블명 : member
--    컬럼 사양 : m_id -  영문 기준으로 최대 12자를 저장할 수 있게 - primary key
--	     m_pwd - 영문 기준으로 최대 12자를 저장할 수 있게 - not null
--                   name - 한글 기준으로 최대 6자를 저장할 수 있게  - not null
--                   joindate - 날짜와 시간을 저장할 수 있게  - 기본값 sysdate

 
-- 3. 테이블명 : news
--     컬럼사양 : id - 길이가 8인 숫자 타입 - primary key
--                    writer - 한글 기준으로 최대 6자를 저장할 수 있게
--	      title - 한글 기준으로 최대 40자를 저장할 수 있게
--	      content - 한글 기준으로 최대 300자를 저장할 수 있게
--                    writedate - 날짜와 시간을 저장할 수 있게
--                     cnt - 길이가 8인 숫자 타입

--     시퀀스 생성 : news_seq - 1부터 시작, 1씩 증가

-- 4. 테이블명 : meeting
--     컬럼사양 : id - 길이가 8인 숫자 타입 - primary key
--                  name - 한글 기준으로 최대 6자를 저장할 수 있게
-- 	      title - 한글 기준으로 최대 40자를 저장할 수 있게 
--	      meetingdate - 날짜와 시간을 저장할 수 있게

--      시퀀스 생성 : meeting_seq - 1부터 시작, 1씩 증가

--5. 테이블명 : imgtest
--     컬럼사양 : name - 한글 기준으로 최대 6자를 저장할 수 있게 - primary key
--                   imgcontent - 이미지를 데이터로 저장할 수 있게 (blob타입으로)




create table visitor(
    name varchar2(18),
    writedate date default sysdate,
    memo varchar2(180));
desc visitor;

insert into visitor (writedate)
    values (to_date('171225', 'rrmmdd'));
insert into visitor (writedate)
    values (to_date('990811', 'rrmmdd'));           
select *from visitor;
commit;

create table member(
    m_id varchar2(24) primary key,
    m_pwd varchar2(24) not null,
    name varchar2(12) not null,
    joindate date default sysdate);
desc member;

select * from user_constraints 
where table_name = 'MEMBER';

create table news(
    id number(8) primary key,
    writer varchar2(18), 
    title varchar2(120),
    content varchar2(1200),
    writedate date,
    cnt number(8));
desc news;

create table meeting(
    id number(8) primary key,
    name varchar2(18), 
    title varchar2(120),
    meetingdate date);
desc meeting;

create table imgtest(
    name varchar2(18) primary key,
    imgcontent blob);
desc imgtest;

    
    
    
    

 




