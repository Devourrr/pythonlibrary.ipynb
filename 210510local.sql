SELECT ENAME,UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP; -- 문자열함수 UPPER LOWER INITCAP

SELECT * FROM EMP
WHERE UPPER(ENAME) = UPPER('scott'); -- ename이 scott인 데이터 찾기

SELECT* FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%scott%'); -- ename에 scott단어 포함한 데이터 찾기

SELECT UPPER(ENAME) FROM EMP; -- ENAME 대문자로 출력

SELECT ENAME, LENGTH(ENAME) FROM EMP; --ENAME의 문자열길이 출력
SELECT ENAME, LENGTH(ENAME) FROM EMP WHERE LENGTH(ENAME)>=5; -- LENGTH함수는 숫자비교 가능

SELECT LENGTH(ENAME), LENGHTHB(ENAME) FROM EMP; -- LENGTHB는 문자열바이트 출력

SELECT * FROM EMP WHERE LENGTH(JOB) >= 6; -- 조건은 WHERE 절 안에

SELECT JOB FROM EMP;
SELECT JOB, SUBSTR(JOB,1,2) FROM EMP; --SUBSTR(문자열데이터, 문자열시작위치, 추출길이)
SELECT JOB, SUBSTR(JOB,3,2) FROM EMP; 
SELECT JOB, SUBSTR(JOB,5) FROM EMP; --SUBSTR(데이터, 시작위치) 시작위치부터 끝까지 출력
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB,3,2), SUBSTR(JOB,5) FROM EMP;

SELECT SUBSTR(ENAME,3) FROM EMP;
SELECT JOB,SUBSTR(JOB, -LENGTH(JOB)) FROM EMP;

SELECT JOB,SUBSTR(JOB, -LENGTH(JOB)) FROM EMP;
SELECT JOB,SUBSTR(JOB, -LENGTH(JOB),2) FROM EMP;
SELECT JOB,SUBSTR(JOB, -3) FROM EMP;
SELECT JOB,
SUBSTR(JOB, -LENGTH(JOB)),
JOB,SUBSTR(JOB, -LENGTH(JOB),2),
JOB,SUBSTR(JOB, -3) FROM EMP;

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1 FROM DUAL;
SELECT INSTR('HELLO, ORACLE!', 'L',5) AS INSTR_2 FROM DUAL;
SELECT INSTR('HELLO, ORACLE!', 'L',2,2) AS INSTR_3 FROM DUAL;

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1, --HE'L'LO ORACLE!
INSTR('HELLO, ORACLE!', 'L',5) AS INSTR_2, -- HELLO, ORAC'L'E!
INSTR('HELLO, ORACLE!', 'L',2,2) AS INSTR_3 -- HEL'L'O ORACLE!
FROM DUAL; -- INSTR 함수에서 찾으려는 대상 문자열은 'HELLO, ORACLE!'과 같이 직접 문자열 데이터를 작성해 줄 수도 있고 
--문자열 데이터가 저장되어 있는 열을 지정할 수도 있습니다

SELECT * FROM EMP WHERE INSTR(ENAME,'S') >0; -- INSTR 함수로 ENAME에 'S'가 있는 행 출력
-- 찾으려는 문자가 문자열 데이터에 포함되어 있지 않다면 위치값이 없으므로 0을 반환, INSTR함수를 LIKE와 비슷한 용도로 사용가능
SELECT * FROM EMP WHERE ENAME LIKE '%S%'; -- INSTR함수 + LIKE연산자 사용

SELECT '010-1234-5678' AS REPLACE_BEFORE,
REPLACE('010-1234-5678','-',' ') AS REPLACE_1, -- '-' 공백으로 변환 출력
REPLACE('010-1234-5678','-') AS REPLACE_2 FROM DUAL; -- '-'대체문자 지정X, 문자가 삭제된 상태로 출력

SELECT 'Oracle',
LPAD('Oracle',10,'#') AS LPAD_1,
RPAD('Oracle',10,'*') AS RPAD_1,
LPAD('Oracle',10,'') AS LPAD_2, -- 대체문자 지정 안할시 출력결과NULL
RPAD('Oracle',10) AS RPAD_2 FROM DUAL;

SELECT RPAD('971225-',14,'*') AS RPAD_JMNO,
RPAD('010-1234-',13,'*') AS RPAD_PHONE FROM DUAL;

SELECT CONCAT(EMPNO,ENAME) FROM EMP;
SELECT CONCAT(EMPNO,ENAME),
CONCAT(EMPNO,CONCAT(': ',ENAME))
FROM EMP;
SELECT CONCAT(EMPNO,ENAME),CONCAT(EMPNO,CONCAT(':',ENAME)) FROM EMP 
WHERE ENAME = 'SCOTT';

SELECT EMPNO||ENAME FROM EMP;
SELECT EMPNO||': '||ENAME FROM EMP;
SELECT EMPNO||ENAME, EMPNO||': '||ENAME FROM EMP;

--TRIM 함수 사용하기(삭제할 문자가 없을 때)
-- 공백 문자가 제거되었는지를 확인하기 위해 ||연산자를 사용하여 대괄호[]로 문자열을 감쌌음
SELECT '[' || TRIM(' _ _Oracle_ _ ')||']' AS TRIM, -- 양쪽 공백 삭제
'['|| TRIM(LEADING FROM ' _ _Oracle_ _ ')||']' AS TRIM_LEADING, -- 왼쪽 공백 삭제
'[' ||TRIM(TRAILING FROM ' _ _Oracle_ _ ')||']' AS TRIM_TRAILING, --오른쪽 공백 삭제
'[' ||TRIM(BOTH FROM' _ _Oracle_ _ ')||']' AS TRIM_BOTH FROM DUAL; -- 양쪽 공백 삭제

--삭제할 문자가 있을때
SELECT '[' || TRIM('_'FROM'_ _Oracle_ _')||']' AS TRIM, -- 양쪽 '_' 삭제
'['|| TRIM(LEADING '_'FROM '_ _Oracle_ _')||']' AS TRIM_LEADING, -- 왼쪽 '_' 삭제
'[' ||TRIM(TRAILING '_'FROM '_ _Oracle_ _')||']' AS TRIM_TRAILING, --오른쪽 '_' 삭제
'[' ||TRIM(BOTH '_'FROM'_ _Oracle_ _')||']' AS TRIM_BOTH FROM DUAL; -- 양쪽 '_' 삭제

SELECT '['|| TRIM(' _Oracle_ ')|| ']' AS TRIM,
'['|| LTRIM(' _Oracle_ ')|| ']' AS LTRIM,
'['|| RTRIM(' _Oracle_ ')|| ']' AS RTRIM, -- 삭제할 문자 지정X
'['|| LTRIM('<_Oracle_>','_<')|| ']' AS LTRIM_2, -- 삭제할 문자집합 지정
'['|| RTRIM('<_Oracle_>','>_')|| ']' AS RTRIM_2 FROM DUAL;

SELECT ROUND(1234.5678) AS ROUND, -- 소수점 기준 반올림
ROUND(1234.5678,0) AS ROUND_0, -- 소수점기준 인덱스위치 반올림
ROUND(1234.5678,1) AS ROUND_1,
ROUND(1234.5678,2) AS ROUND_2,
ROUND(1234.5678,-1) AS ROUND_MINUS1,
ROUND(1234.5678,-2) AS ROUND_MINUS2 FROM DUAL;

SELECT TRUNC(1234.5678) AS TRUNC, -- 소수점 기준 버림
TRUNC(1234.5678,0) AS TRUNC_0, -- 소수점 기준 인덱스 위치 버림
TRUNC(1234.5678,1) AS TRUNC_1,
TRUNC(1234.5678,2) AS TRUNC_2,
TRUNC(1234.5678,-1) AS TRUNC_MINUS1,
TRUNC(1234.5678,-2) AS TRUNC_MINUS2 FROM DUAL;

SELECT CEIL(3.14),
FLOOR(3.14),
CEIL(-3.14),
FLOOR(-3.14) FR
MOD(10,2),
MOD(11,2) OM DUAL;

SELECT MOD(15,6),
MOD(10,2),
MOD(11,2) FROM DUAL; --MOD함수로 나머지 값 출력

SELECT SYSDATE AS NOW,
SYSDATE-1 AS YESTERDAY,
SYSDATE+1 AS TOMORROW FROM DUAL;

SELECT SYSDATE,
ADD_MONTHS(SYSDATE, 3) FROM DUAL;

SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE,120) AS WORK10YEAR FROM EMP;

-- 입사 40년 미만인 사원 데이터 출력하기
SELECT EMPNO, ENAME, HIREDATE, SYSDATE FROM EMP
WHERE ADD_MONTHS(HIREDATE,480) > SYSDATE;

SELECT SYSDATE,
ADD_MONTHS(SYSDATE,6) FROM DUAL;

--HIREDATE 와 SYSDATE 사이 개월 수를 MONTHS_BETWEEN 함수로
SELECT EMPNO,ENAME, HIREDATE, SYSDATE,
MONTHS_BETWEEN(HIREDATE,SYSDATE) AS MONTHS1,
MONTHS_BETWEEN(SYSDATE,HIREDATE) AS MONTHS2,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTHS3 FROM EMP;
/* 비교 날짜의 입력 위치에 따라 음수/양수가 나올 수 있기 때문에
개월 수 차이는 소수점 단위까지 결과가 나오므로 TRUNC함수를 조합하면 개월수 차이를 정수로 출력할 수 있다*/

SELECT SYSDATE,
NEXT_DAY(SYSDATE,'월요일'),
LAST_DAY(SYSDATE) FROM DUAL;

SELECT SYSDATE,
ROUND(SYSDATE,'CC') AS FORMAT_CC,
ROUND(SYSDATE,'YYYY') AS FORMAT_YYYY,
ROUND(SYSDATE,'Q') AS FORMAT_Q,
ROUND(SYSDATE,'DDD') AS FORMAT_DDD,
ROUND(SYSDATE,'HH') AS FORMAT_HH FROM DUAL;

SELECT SYSDATE,
TRUNC(SYSDATE,'CC') AS FORMAT_CC,
TRUNC(SYSDATE,'YYYY') AS FORMAT_YYYY,
TRUNC(SYSDATE,'Q') AS FORMAT_Q,
TRUNC(SYSDATE,'DDD') AS FORMAT_DDD,
TRUNC(SYSDATE,'HH') AS FORMAT_HH FROM DUAL;

SELECT EMPNO,ENAME,EMPNO+'500' FROM EMP -- 숫자와 문자열 더해서 출력
WHERE ENAME = 'SCOTT';

SELECT 'ABCD' + EMPNO, EMPNO FROM EMP WHERE ENAME = 'SCOTT';
--숫자처럼 생긴 문자데이터는 숫자로 바꿔주지만 그  외의 경우는 동작을 기대하기 어렵습니다

--원하는 출력 형태로 날짜 출력하기
SELECT SYSDATE AS 현재날짜시간 FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간 FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE,'MM') AS MM,
TO_CHAR(SYSDATE,'MON') AS MON,
TO_CHAR(SYSDATE,'MONTH') AS MONTH,
TO_CHAR(SYSDATE,'DD') AS DD,
TO_CHAR(SYSDATE,'DY') AS DY,
TO_CHAR(SYSDATE,'DAY') AS DAY FROM DUAL; -- 현재 사용하고 있는 언어에 맞게 출력

SELECT SYSDATE,
TO_CHAR(SYSDATE,'MM','NLS_DATE_LANGUAGE=AMERICAN') AS MM,
TO_CHAR(SYSDATE,'MON','NLS_DATE_LANGUAGE=AMERICAN') AS MON,
TO_CHAR(SYSDATE,'MONTH','NLS_DATE_LANGUAGE=AMERICAN') AS MONTH,
TO_CHAR(SYSDATE,'DD','NLS_DATE_LANGUAGE=AMERICAN') AS DD,
TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGUAGE=AMERICAN') AS DY,
TO_CHAR(SYSDATE,'DAY','NLS_DATE_LANGUAGE=AMERICAN') AS DAY FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE,'MM','NLS_DATE_LANGUAGE=JAPANESE') AS MM,
TO_CHAR(SYSDATE,'MON','NLS_DATE_LANGUAGE=JAPANESE') AS MON,
TO_CHAR(SYSDATE,'MONTH','NLS_DATE_LANGUAGE=JAPANESE') AS MONTH,
TO_CHAR(SYSDATE,'DD','NLS_DATE_LANGUAGE=JAPANESE') AS DD,
TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGUAGE=JAPANESE') AS DY,
TO_CHAR(SYSDATE,'DAY','NLS_DATE_LANGUAGE=JAPANESE') AS DAY FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE,'HH24:MI:SS') AS HH24MISS,
TO_CHAR(SYSDATE,'HH24:MI:SS AM') AS HH24MISS_AM,
TO_CHAR(SYSDATE,'HH24:MI:SS P.M.') AS HH24MISS_PM FROM DUAL;



