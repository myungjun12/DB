/*** UPDATE 실습 ***/

--D1 인사관리부 -> 인사팀으로 변경
UPDATE DEPARTMENT2
SET dept_title = '인사팀'
WHERE dept_id = 'D1';
SELECT * FROM DEPARTMENT2
WHERE DEPT_ID = 'D1';
--D3 마케팅부 -> 마케팅팀 변경
UPDATE DEPARTMENT2
SET dept_title = '마케팅팀'
WHERE dept_id = 'D3';
SELECT * FROM DEPARTMENT2
WHERE DEPT_ID = 'D3';

--D8 기술지원부 -> 기술지원팀 변경
UPDATE DEPARTMENT2
SET dept_title = '기술지원팀'
WHERE dept_id = 'D8';
SELECT * FROM DEPARTMENT2
WHERE DEPT_ID = 'D8';

SELECT * FROM DEPARTMENT2;
--수정된 내용을 저장하길 원한다면 COMMIT; 
--저장하지 않길 원한다면 ROLLBACK;
COMMIT;
--EMPLOYEE2 테이블에서 BONUS를 받지 않은 사원의 
--BONUS를 0.1로 변경 
UPDATE EMPLOYEE2
SET BONUS = 0.1
WHERE BONUS IS NULL;

SELECT EMP_NAME,BONUS
FROM EMPLOYEE2;

ROLLBACK;

-- 모든 직원의 기본 급여 인상 EMPLOYEE2 
UPDATE EMPLOYEE2
SET SALARY = SALARY*1.1;

SELECT EMP_NAME,SALARY
FROM EMPLOYEE2;
-- D9 부서의 모든 직원의 보너스를 0.4로 수정 EMPLOYEE2
UPDATE EMPLOYEE2
SET BONUS = 0.4
WHERE dept_code = 'D9';
--확인
SELECT DEPT_CODE,BONUS 
FROM EMPLOYEE2 
WHERE DEPT_CODE = 'D9';
--UPDATE 테이블명 SET 컬럼명 = 변경할값

-- DEPT_CODE가 NULL인 직원은 D3부서로 이동 
UPDATE EMPLOYEE2
SET DEPT_CODE = 'D3'
WHERE DEPT_CODE IS NULL;

--특정 입사일(2000-01-01) 이후 입사한 직원의 급여 수정
--HRIE_DATE
UPDATE EMPLOYEE2
SET SALARY = SALARY*1.2
WHERE HIRE_DATE > TO_DATE('2000-01-01','YYYY-MM-DD');

--1997-09-12에 입사한 직원 퇴사처리 
-- ENY_YN
UPDATE EMPLOYEE2
SET ENT_YN = 'Y'
WHERE HIRE_DATE = TO_DATE('1997-09-12','YYYY-MM-DD');

SELECT HIRE_DATE,ENT_YN FROM EMPLOYEE2
WHERE HIRE_DATE = TO_DATE('1997-09-12');

ROLLBACK;
SELECT * FROM EMPLOYEE2;

SELECT EMP_NAME,EMAIL FROM EMPLOYEE2;
--특정 도메인 주소 변경
UPDATE EMPLOYEE2
SET EMAIL = REPLACE(EMAIL,'or.kr','KH.KH');

SELECT EMP_NAME,EMAIL FROM EMPLOYEE2;

--핸드폰번호 employee2 에서 010뒤에 -붙여서 변경 
update employee2
set PHONE = replace(PHONE,'010','010-')
WHERE PHONE LIKE '010%';
/*
EMPLOYEE2."PHONE" (actual:13,maximum:12)
-> 행 최대 크기 12자리로 설정해줬기 때문에 나중에 발생하는  에러
-->행 최대 크기를 늘리거나 다시 돌아가기 rollback;
*/
ROLLBACK;
select phone from employee2;

--특정 입사일을 가진 직원의 입사일 변경 
--hire-date 1999-09-09 입사한직원 -> 2000-01-02
UPDATE EMPLOYEE2
SET HIRE_DATE = TO_DATE('2000-01-02')
WHERE HIRE_DATE = TO_DATE('1999-09-09');

COMMIT;

SELECT HIRE_DATE FROM EMPLOYEE2;

UPDATE DEPARTMENT2
SET dept_title = '인사팀';

SELECT * FROM DEPARTMENT2;

ROLLBACK;

--UPDATE 한 번에 여러 컬럼 업데이트

--진행하기전 EMPLOYEE3 만들기 CREATE TABLE EMPLOYEE 복사
CREATE TABLE EMPLOYEE3 AS SELECT * FROM EMPLOYEE;

-- EMP_ID가 200인 직원의 이메일과 전화번호 업데이트
UPDATE EMPLOYEE3
SET EMAIL = 'ONE_SUN@or.kr',
    phone = '01012345678'
WHERE EMP_ID = '200';

SELECT EMP_ID,EMAIL,PHONE FROM EMPLOYEE3;

ROLLBACK;

--D9 부서의 모든 직원의 급여 * 1.1 보너스 = 0.2 변경 
UPDATE EMPLOYEE3
SET SALARY = SALARY * 1.1,
    BONUS = 0.2
WHERE DEPT_CODE = 'D9';    
--J3 직무 코드를 가진 직원의 직무 코드와 부서코드 변경 
--J5를 D5로 변경 
UPDATE EMPLOYEE3
SET JOB_CODE = 'J5',
    DEPT_CODE = 'D5'
WHERE JOB_CODE = 'J3';    
 
SELECT * FROM EMPLOYEE3;
--송은희 직원의 이름과 이메일 변경
--송은휘 SONGSONG@or.kr
UPDATE EMPLOYEE3
SET EMP_NAME = '송은휘',
    EMAIL = 'SONGSONG@or.kr'
WHERE EMP_NAME = '송은희';

ROLLBACK;

--차태연 직원의 이름과 급여변경
--> 차태형 8000000
UPDATE EMPLOYEE3
SET SALARY = 8000000,
    EMP_NAME = '차태형'
WHERE EMP_NAME = '차태연';
--> EMPLOYEE3 TABLE 해당하는 모든 직원의 이메일 도메인과
---> 부서코드 D4 변경 
UPDATE EMPLOYEE3
SET EMAIL = REPLACE(EMAIL,'or.kr','kh.kh'),
    DEPT_CODE = 'D4';

SELECT EMAIL,DEPT_CODE FROM EMPLOYEE3;

ROLLBACK;

--EMPLOYEE3 전체 테이블 삭제
DELETE FROM EMPLOYEE2;

--완전 삭제 --> COMMIT
COMMIT;
--되돌리기 --> ROLLBACK
ROLLBACK;

SELECT * FROM EMPLOYEE2;

DROP TABLE EMPLOYEE2;

COMMIT;


/**********

삭제하기 
테이블 안에 존재하는 값들을 모두 삭제하는 구문

[작성법]
DELETE FROM 테이블명 WHERE 조건설정;
만약 WHERE 조건을 설명하지 않으면 모든 행이 다 삭제됨 

DELETE FROM 테이블명;
-> 테이블 안에 있는 내용을 모두 삭제

DELETE FROM 테이블명
WHERE 컬럼명 = 삭제할컬럼값;
--> 테이블 안에서 특정한 컬럼값에 해당하는 줄을 모두 삭제

--완전 삭제 --> COMMIT

--되돌리기 --> ROLLBACK

주의할점:
DELETE는 테이블 안에 있는 내용을 삭제
DROP 은 테이블 자체를 삭제
DROP TABLE EMPLOYEE2;
**********/