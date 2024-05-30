-- 모든 직원 정보 조회
SELECT * FROM EMPLOYEE;

-- 모든 부서 정보 조회
SELECT * FROM department;

-- 모든 직원 정보 조회
SELECT * FROM JOB;

-- EMPLOYEE 테이블에서 이름,입사일 조회
SELECT EMP_NAME,hire_date FROM employee;

/*
컬럼값 산술 연산 
-- 컬럼값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값 

-- SELECT 문 작성 시 컬럼명에 산술 연산을 직접 작성하면
    조회결과(RESULT SET)에 연산 결과가 반영되어 조회된다.
*/    

-- EMPLOYEE 테이블에서 모든 사원에 이름,급여,급여_+100만원 조회 
SELECT EMP_NAME,SALARY,SALARY + 1000000 FROM EMPLOYEE;

-- 급여 + 100 에 AS 사용해서 100만원 인상 추가 
-- AS의 경우 큰 따옴표를 사용해서 표기
SELECT EMP_NAME,SALARY,SALARY + 1000000 AS "급여_100만원_인상"
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 모든 사원의 사번,이름,연봉(급여*12)조회
SELECT EMP_ID,EMP_NAME,SALARY AS "급여",SALARY * 12 AS "연봉"
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 모든 사원의 사번,이름,상반기급여(급여*6) 조회
SELECT EMP_ID,EMP_NAME,SALARY * 6 AS "상반기급여" FROM EMPLOYEE;

-- 특정 부서에서 속한 사원의 이름과 이메일 조회
-- 특정 부서 D9
SELECT DEPT_CODE, EMP_NAME,EMAIL FROM EMPLOYEE 
WHERE DEPT_CODE = 'D9';

-- 특정 부서 D1에서 속한 사원의 이름과 이메일 조회
SELECT DEPT_CODE,EMP_NAME,EMAIL FROM EMPLOYEE 
WHERE DEPT_CODE = 'D1';

-- 특정 부서 D4 에서 속한 사원의 이름과 전화번호 이메일 조회
SELECT DEPT_CODE,EMP_NAME,EMAIL,PHONE FROM EMPLOYEE
WHERE DEPT_CODE = 'D4';

-- WHERE 에서 조회한 조건에 부합하는 사람이 없으면 값이 나오지 않음
-- IS NULL 을 사용하면 없는 사람을 조회할 수 있음

SELECT DEPT_CODE,EMP_NAME,EMAIL,PHONE 
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;

-- DEPT_CODE 가 모두 IS NULL 인 사람의 모든 정보를 조회
SELECT * FROM EMPLOYEE -- 직원 모든 정보 불러올건데
WHERE DEPT_CODE IS NULL; -- 조건 : DEPT_CODE가 NULL인 직원
