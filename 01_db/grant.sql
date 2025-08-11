SELECT * FROM user;
CREATE USER 'swcamp'@'%' IDENTIFIED BY 'swcamp';
CREATE DATABASE menudb;

-- menudb 데이터베이스의 모든 테이블에 대해 모든 권한을 swcamp에 부여
GRANT ALL PRIVILEGES ON menudb.* TO 'swcamp'@'%';

-- swcamp 계정의 바뀐 권한 확인하기
SHOW GRANTS FOR 'swcamp'@'%';