CREATE TABLE USERS (
    USER_ID NUMBER PRIMARY KEY,
    USER_NAME VARCHAR2(50)NOT NULL,
    USER_EMAIL VARCHAR2(100)NOT NULL,
    USER_PASSWORD VARCHAR2(100)NOT NULL,
    CREATEDDATE DATE DEFAULT SYSDATE
    );
    
CREATE SEQUENCE USER_seq
       INCREMENT BY 1
       START WITH 1
       NOCYCLE
       NOCACHE;
       
INSERT INTO USERS VALUES (user_seq.nextval,'홍길동','hong@example.com','password123','24/06/07'); 
INSERT INTO USERS VALUES (user_seq.nextval,'김철수','kim@example.com','mypassword','24/06/07');       
INSERT INTO USERS VALUES (user_seq.nextval,'이영희','lee@example.com','securepass','24/06/07');  

CREATE TABLE Board (
    POST_ID NUMBER NOT NULL,
    USER_ID NUMBER PRIMARY KEY,
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT CLOB NOT NULL,
    CREATEDDATE DATE DEFAULT SYSDATE
    );
    
CREATE SEQUENCE BOARD_seq
    INCREMENT BY 1
    START WITH 1
    NOCYCLE
    NOCACHE;
    
INSERT INTO Board VALUES (board_seq.nextval,1,'첫 번째 게시물','이것은 첫 번째 게시물의 내용입니다.','24/06/07');
INSERT INTO Board VALUES (board_seq.nextval,2,'두 번째 게시물','이것은 두 번째 게시물의 내용입니다.','24/06/07');
INSERT INTO Board VALUES (board_seq.nextval,3,'세 번째 게시물','이것은 세 번째 게시물의 내용입니다.','24/06/07');