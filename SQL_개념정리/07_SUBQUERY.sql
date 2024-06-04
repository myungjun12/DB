/*****
    SUBQUERY (서브쿼리)
    - 하나의 SQL 문 안에 포함된 또 다른 SQL문 
    - 메인쿼리 (기존쿼리)를 위해 보조 역할을 하는 쿼리문
    - SELECT FROM WHERE HAVING 절에서 사용 가능
    
    * SQL 에서 작성하는 모든 구문은 쿼리라고 부름
*****/

-- 서브쿼리
-- 예시 1
-- -부서코드가 노옹철 사원가 같은 소속의 직원의
-----이름 부서코드 조회하기

--1) 사원명이 노옹철인 사람의 부서코드 조회
SELECT DEPT_CODE 
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철'; --D9

--2) 부서코드가 D9인 직원을 조회
SELECT EMP_NAME, DEPT_CODE 
FROM EMPLOYEE 
WHERE DEPT_CODE = 'D9';--선동일D9  송종기D9  노옹철D9

--3) 부서코드가 노옹철사원과 같은 소속의 직원 명단 조회
---> 1)과 2)에 작성한 쿼리를 하나의 쿼리로 합쳐주기
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE 
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '노옹철');
--서브쿼리
--예시2
---전 직원의 평균 급여보다 많은 급여를 받고 있는 직원의
----사번,이름,직급코드,급여 조회

-- 1) 전 직원의 평균 급여 구하기 
SELECT AVG(SALARY)
FROM EMPLOYEE;
-- 2) 직원들 중 급여가 3000000원 이상인 사원들의 
--- 사번,이름,직급코드,급여 조회
SELECT EMP_ID,EMP_NAME,JOB_CODE,SALARY
FROM EMPLOYEE 
WHERE SALARY >= 3000000;
--3) 전 직원의 평균 급여보다 많은 급여를 받고 있는 직원 조회

--메인쿼리 2) 서브쿼리 1)
SELECT EMP_ID,EMP_NAME,JOB_CODE,SALARY
FROM EMPLOYEE 
WHERE SALARY >= (SELECT AVG(SALARY)
                 FROM EMPLOYEE);
