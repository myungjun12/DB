/*
SELECT WHERE 절
WHERE 의 경우 조건을 걸어 선택한 조건에 해당하는 행만 볼 수 있도록 설정
WHERE 원하는컬럼 = 원하는 컬럼에서 해당하는 조건;

만약 아무것도 없는 NULL 값을 조회하길 원한다면
WHERE 원하는컬럼 IS NULL; 

만약 NULL이 아닌 값만 조회하길 원한다면 
WHERE 원하는컬럼 IS NOT NULL;

~ 이상이거나 ~ 이하일 때는 >=<=>< 사용 (미만, 초과포함) 부등호 사용 
WHERE 원하는컬럼 >= 원하는값;

00 과 00 사이를 조회하길 원한다면 BETWEEN 00 AND 00;
예 WHERE BETWEEN 사당 AND 의정부 

-- WHERE 절 사용 X  
ORDER BY
오름차순 ASC 
내림차순 DESC
*/
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

-- 보너스가 없는 사원의 이름과 보너스를 조회
SELECT EMP_NAME,BONUS FROM EMPLOYEE
WHERE BONUS IS NULL;

-- 급여 등급이 S5인 사원의 이름과 급여 조회
SELECT DEPT_CODE,EMP_NAME,SALARY FROM EMPLOYEE
WHERE SAL_LEVEL = 'S5';

-- 사원 번호가 210 인 사원의 모든 정보 조회 EMP_ID
SELECT * FROM EMPLOYEE
WHERE EMP_ID = '210';

-- 이메일 주소가 NULL 이 아닌 사원의 이름과 이메일 조회
SELECT EMP_NAME,EMAIL FROM EMPLOYEE
WHERE EMAIL IS NOT NULL;

-- 보너스가 0.2 이상인 사원의 이름과 보너스를 조회
SELECT EMP_NAME, BONUS FROM EMPLOYEE
WHERE BONUS >= 0.2;
-- 급여가 3000000 에서 4000000 사이인 사원의 이름과 급여 조회
SELECT EMP_NAME,SALARY FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 4000000;

-- 급여가 높은 순서대로 사원의 이름과 급여 조회
SELECT EMP_NAME,SALARY FROM EMPLOYEE
ORDER BY SALARY DESC;

-- 사원의 이름을 오름차순으로 정렬해서 조회
-- 글자체계 오름차순 ㄱ 부터 올라가기 A-Z
-- 글자체계 내림차순 ㅎ 부터 내려가기 Z-A
SELECT EMP_NAME FROM EMPLOYEE
ORDER BY EMP_NAME ASC;

-- EMPLOYEE 테이블에서 급여가 300만원을 초과하는 
-- 사원의 사번 이름 급여 부서코드 조회
SELECT EMP_ID,EMP_NAME,SALARY,DEPT_CODE FROM EMPLOYEE
WHERE SALARY >= 3000000;

-- EMPLOYEE 테이블에서 
-- 연봉이 50000000 만원 이하인 사원의
-- 사번 이름 연봉 조회 연봉은 연봉으로 표기
SELECT EMP_ID,EMP_NAME,SALARY * 12 AS "연봉" FROM EMPLOYEE
WHERE SALARY*12 <= 50000000;

--EMPLOYEE 테이블에서
--부서코드가 'D9'가 아닌 사원들의
--이름 부서코드 전화번호 조회 PHONE
SELECT EMP_NAME,DEPT_CODE,PHONE FROM EMPLOYEE
WHERE DEPT_CODE != 'D9';

-- EMPLOYEE 테이블에서
-- 부서코드가 'D6'사원 중
-- 급여가 300만원을 초과하는 사원의
-- 이름 부서코드 급여 조회
SELECT EMP_NAME,DEPT_CODE,SALARY FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' AND SALARY >= 3000000;

--부서코드가 D6이고 직급코드가 J3인 사원의 이름과 급여 
SELECT DEPT_CODE,JOB_CODE,EMP_NAME,SALARY FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' AND JOB_CODE = 'J3';

--날짜 범위 비교 
--EMPLOYEE 테이블에서 
--입사일이 2000-01-01 부터 2000-12-31 사이인
--사원의 이름,입사일 조회
SELECT EMP_NAME,HIRE_DATE AS "입사일" FROM EMPLOYEE
WHERE HIRE_DATE
BETWEEN TO_DATE('2000-01-01','YYYY-MM-DD')
AND 
TO_DATE('2000-12-31','YYYY-MM-DD');

--입사일이 2000년 이후 입사한 사원의 이름과 입사일 조회
SELECT EMP_NAME,HIRE_DATE AS "입사일" FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('2000-01-01','YYYY-MM-DD');