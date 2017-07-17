/*
1. DDL(Data Definition Language)
데이터베이스, 유저,  테이블등의 구조 정의 및 수정에 관련된 명령어로
Create, Alter, Drop, Truncate 등이 있다.
*/
# iot_test 라는 데이터베이스 생성
create database iot_test;

# iot_test데이터 베이스 선택
# 이후 모든 작업은 데이터베이스를 변경하기 전까지 해당 데이터 베이스에서 이루어짐
use iot_test;


# user_info라는 테이블 생성
create table user_info(
#user_num이라는 컬럼명에 자료형은 int, 자동증가이며 해당테이블의 기본키
#기본키는 중복 불가
user_num int(5) auto_increment primary key,
user_id varchar(30) not null ,
user_pwd varchar(30) not null,
user_name varchar(100) not null,
class_num int(5) not null,
age int(3),
#기본키는 아니지만 user_id로 인덱스가 만들어지며 unique이기 때문에 중복불가
unique index(user_id)
);

# board라는 테이블 삭제
drop table board;

create table board(
board_num int(7) auto_increment primary key,
title varchar(100) not null,
content text,
user_num int(5),
#board테이블의 user_num이 user_info의 user_num을 참조하게 되며
# 이를 외래키라고 부른다
# 외래키를 설정하게 될경우 참조하는 테이블의 컬럼에 값이 없을경우 저장할 수 없다
foreign key (user_num) references user_info(user_num)
)

#user_info테이블을 수정할건데
#class_num이라는 컬럼명의 int타입을 가지고 null을 허용하지 않는 컬럼을 추가하겠다는 문구
alter table user_info
add column class_num int(5) not null;


#user_info테이블을 수정할건데
#num이라는 컬럼의 이름을 user_num으로 바꾸고 int타입으로 선언하겠다는 문구
ALTER TABLE user_info
CHANGE COLUMN num user_num int;


#user_info테이블을 수정할건데
#id컬럼을 중복불가 인덱스로 추가 하겠다는 문구
alter table user_info 
add unique index(user_id);

#외래키를 2개 설정해야 할 경우의 예제
create table comment_info(
ci_num int(5) AUTO_INCREMENT primary key,
content text,
reg_Date datetime not null,
board_num int(7) not null,
user_num int(5) not null,
foreign key (board_num) references board(board_num),
foreign key (user_num) references user_info(user_num)
);


#외래키를 2개 설정해야 할 경우의 예제
create table comment_info(
ci_num int(5) AUTO_INCREMENT primary key,
content text,
reg_Date datetime not null,
board_num int(7) not null,
user_num int(5) not null,
foreign key (board_num) references board(board_num),
foreign key (user_num) references user_info(user_num)
);

#유저 생성 명령어
create user 'test'@'localhost' identified by 'test';

# test라는 유저 삭제
drop user test;

# 유저명@'%' 외부 접속이 가능한 유저 생성      /*아이디에 ''을 써줘도 되고 안써줘도되는데 써주는게 좋다!*/
# identified by '비밀번호'
create user test@'%' identified by 'test';

/*
2. DML(Data Manipulation Language)
데이터를 조작하는 명령어로
Select, Insert, Update, Delete가 있다.
*/
# 컬럼에 * 를 사용할경우 from에 명시한 테이블의 모든 컬럼이
# 테이블 생성시 만들어진 컬럼 순서대로 결과에 출력되게 된다.
select * from comment_info;
select * from user_info;
# insert into 테이블명(컬럼 정보들) values(입력할 값 정보들)
# 컬럼정보에서 명시된 순서대로 입력할 값 정보들을 입력하면 해당 테이블에 로우데이터가 1개 저장되게 된다.
insert into user_info(user_id, user_pwd, user_name, class_num, age)
values('red','red','홍길동',1, 30);
insert into board(title, content, user_num)
values('제목2','내용2',1);
insert into comment_info(content, reg_date, board_num, user_num)
values('코멘트2_',now(), 2,1);


/*
3. DCL(Data Control Language)
제어에 관련된 명령어로
Grant, Revoke가 있다.
*/

#권한 명령어 이후 적용사항을 리로드하는 명령어
flush privileges;

#iot_Test 데이터 베이스의 모든 권한을 test@'%'에게 주겠다는 명령어
grant all privileges on iot_test to test@'%';
#iot_Test 데이터 베이스의 모든 권한을 주었던 test@'%'부터 모든 권한을 박탈하겠다는 명령어
revoke all on iot_test from test@'%';
SELECT SUM(data_length+index_length)/1024/1024 used_MB FROM information_schema.tables
where table_schema='iot_test';


select * from information_schema.tables
where table_schema='iot_test'
;
create table board2(
board_num int(3) not null AUTO_INCREMENT primary key,
board_title varchar(30) not null,
user_num int(3) ,
foreign key (user_num) references user_info2(user_num)
)
;
show variables where Variable_name in('version','log','general_log');

select @@general_log;
select @@version;

set global general_log=1;

select * from mysql.user;

 1. user_info 테이블 생성
    1) user_num int(3) 널 허용 불가, 자동 증가, 기본키
    2) user_id varchar(30) 널 허용 불가, 유니크 인덱스
    3) user_name varchar(30) 널 허용 불가
 2. board 테이블 생성
    1) board_num int(3) 널 허용 불가, 자동 증가, 기본키
    2) board_title varchar(30) 널 허용 불가
    3) user_num int(3) 널 허용 불가, user_info테이블의 user_num과 외래키로 연결
1.모든사람의 age의 합과 평균을 구하는 sql문을 작성해주세요.
2.Id와 pwd가 다른 사람을 검색하는 sql문을 작성해주세요.
3.Class_num이 0보다 크고 2보다는 작은 사람을 검색하는 sql문을 작성해주세요.
4.Id가 ‘b’로 시작하는 사람을 검색하는 sql문을 작성해주세요
5.Age가 30보다 크거나 같고 40보다 작거나 같은 사람을 삭제하는 sql문을 작성해주세요.
6. Class_num이 1 이거나 2면서 나이가 30보다 크거나 같은 사람을 검색하는 sql문을 작성해주세요
DELIMITER $$
DROP PROCEDURE P_INSERT_USER_INFO;
CREATE PROCEDURE p_insert_user_info
(IN loop_cnt int(1),OUT RESULT INT)
/* 반복횟수를 파라메터로 받는다*/
BEGIN 
	DECLARE i INT DEFAULT 0;

	/* 만약 SQL에러라면 ROLLBACK 처리한다. */
	DECLARE exit handler for SQLEXCEPTION
	  BEGIN
		ROLLBACK;        
		SET RESULT = -1;  
	END;
	/* 트랜젝션 시작 */
	START TRANSACTION;
	WHILE (i <= loop_cnt) DO
        INSERT INTO user_info(user_id, user_pwd, user_name, class_num, age)
        VALUES (concat('test',i), concat('test', i), concat('test', i), i,i);
        SET i = i + 1;
    END WHILE;
	/* 커밋 */
	COMMIT;
	SET RESULT = 0;
END$$
DELIMITER ;


