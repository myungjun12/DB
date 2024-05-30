/*
날짜 사용하기 
DB에 저장된 날짜들 중에서 특수한 일정 기간을 조회하거나 변경하길 원할 때 사용

TO_DATE('문자열','패턴')
예를 들어 2024-05-01 자 이후 회원가입 한 회원 조회
TO_DATE('2024-05-01','YYYY-MM-DD')
*/

/*
컬럼명 별칭 지정

별칭 지정 방법
1) 컬럼명 AS "별칭" : 문자O,띄어쓰기O,특수문자O
2) 컬럼명 "별칭"    : 문자O,띄어쓰기O,특수문자O
3) 컬럼명 별칭      : 문자O,띄어쓰기X,특수문자X
4) 컬럼명 AS 별칭   : 문자O,띄어쓰기X,특수문자X
*/

--EMPLOYEE 테이블에서 이름,이메일 이메일에 @포함 이라는 별칭

-- 1)컬럼명 AS "별칭"
SELECT EMP_NAME,EMAIL AS "이메일 @ 포함" 
FROM EMPLOYEE;

--2)컬럼명 "별칭"
SELECT EMP_NAME,EMAIL"이메일 @ 포함" 
FROM EMPLOYEE;

--3)컬럼명 별칭
--띄어쓰기와 @ 사용 불가
SELECT EMP_NAME,EMAIL 이메일포함 
FROM EMPLOYEE;

--4)컬럼명 AS 별칭
--띄어쓰기와 @ 사용 불가
SELECT EMP_NAME,EMAIL AS 이메일포함 
FROM EMPLOYEE;

/* DISTINCT(별개의,전혀다른)
→ 중복 제거

-- 조회 결과 집합(RESULT SET)에서 
지정된 컬럼의 값이 중복되는 경우 
중복되는 값을 한 번만 표시할 때 사용

사용방법
SELECT DISTINCT 중복제거할컬럼명
FROM 테이블명
*/

--EMPLOYEE 테이블에서 모든 사원의 부서코드 조회
SELECT DEPT_CODE FROM EMPLOYEE;

--EMPLOYEE 테이블에서 사원이 존재하는 부서코드만 조회
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

--> D3 D4 D7 부서는 사원이 없기 때문에 조회되지 않음

--EMPLOYEE 테이블에 존재하는 직급 코드의 종류 조회 JOB_CODE
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

/*
WHERE 절 
--테이블에서 조건을 충족하는 행을 조회할 때 사용 
--WHERE 절에는 조건식(TRUE/FALSE)만 작성

비교 연산자 : >,<,>=,<=,=(같다),!=,<>(같지않다)
논리 연산자 : AND,OR,NOT

작성방법
SELECT 컬럼명,컬럼명, ...
FROM 테이블명
WHERE 조건식;
--> 지정된 테이블 모든 행에서 컬럼명이 일치하는 컬럼 값 조회
*/
--EMPLOYEE 테이블에서 급여가 300만원을 초과하는 사원의 
--이름 급여 부서코드 조회 
SELECT EMP_NAME,SALARY,DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > 3000000;

--EMPLOYEE 테이블에서 D9 부서에 해당하는 사원의 이름 조회
SELECT EMP_NAME 
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--EMPLOYEE 테이블에서 D9 부서에 해당하지 않는 사원의 이름 조회
SELECT EMP_NAME 
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9';

/*
NULL, NOT NULL

컬럼 값이 존재하지 않는 경우
IS NULL;

컬럼 값이 존재하는 경우 
IS NOT NULL;
*/
--EMPLOYEE 테이블에서 DEPT_CODE가 없는 사원 조회
SELECT * 
FROM EMPLOYEE 
WHERE DEPT_CODE IS NULL;

--EMPLOYEE 테이블에서 DEPT_CODE가 있는 사원 조회
SELECT * 
FROM EMPLOYEE 
WHERE DEPT_CODE IS NOT NULL;