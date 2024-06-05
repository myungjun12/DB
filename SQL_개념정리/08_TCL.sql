

--DEPARTMENT3 전체 삭제 
DELETE FROM DEPARTMEN3;

SELECT * FROM DEPARTMENT; --> 실수로 전체 내역 삭제 

---AAA 까지 롤 백 (AAA 까지 돌아가고 싶다)
ROLLBACK TO "AAA";

SELECT * FROM DEPARTMENT3; --AAA 지점으로 저장된 DB 내역이 돌아옴