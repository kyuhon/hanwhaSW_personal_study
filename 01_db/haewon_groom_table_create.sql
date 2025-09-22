railwaytbl_menutbl_menu-- create database groom;
-- use groom;

DROP TABLE IF EXISTS cash;
DROP TABLE IF EXISTS memberclaration;
DROP TABLE IF EXISTS cdeclaration;
DROP TABLE IF EXISTS postdeclaration;
DROP TABLE IF EXISTS likementoring;
DROP TABLE IF EXISTS file;
DROP TABLE IF EXISTS dacomment;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS record;
DROP TABLE IF EXISTS schedule;
DROP TABLE IF EXISTS matching;
DROP TABLE IF EXISTS mentoringgoods;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS location;

CREATE TABLE IF NOT EXISTS location (
    location_id int NOT NULL AUTO_INCREMENT,
    location_name varchar(255) NOT NULL,
    PRIMARY KEY (location_id)
);

CREATE TABLE IF NOT EXISTS category (
    category_id int NOT NULL AUTO_INCREMENT,
    category_name varchar(255) NOT NULL,
    category_create timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    category_update timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (category_id)
);

CREATE TABLE IF NOT EXISTS member (
    member_id int NOT NULL AUTO_INCREMENT,
    member_role tinyint NOT NULL CHECK (member_role IN(0, 1, 2, 3)),
    member_name varchar(30) NOT NULL,
    member_email varchar(255) NOT NULL UNIQUE,
    member_pw varchar(40) NOT NULL,
    member_phone varchar(20) NOT NULL UNIQUE,
    member_location varchar(255) NULL,
    member_job varchar(255) NULL,
    member_community varchar(100) NULL CHECK (member_community IN('온라인', '오프라인', '혼합')),
    member_age int NULL CHECK (member_age >= 1 AND member_age <= 101),
    member_gender int NULL,
    member_career varchar(255) NULL,
    member_porfol varchar(255) NULL,
    introduction varchar(255) NULL,
    member_point int NULL DEFAULT 0,
    member_create timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    member_update timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    member_rating decimal(2,1) NULL,
    location_id int NOT NULL,
    category_id int NOT NULL,
    PRIMARY KEY (member_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE IF NOT EXISTS mentoringgoods (
    mentoring_id int NOT NULL AUTO_INCREMENT,
    mentoring_title varchar(255) NOT NULL,
    mentoring_detail text NOT NULL,
    mentoring_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mentoring_update_dt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    mentoring_price int NOT NULL,
    mentoring_method varchar(100) NOT NULL CHECK (mentoring_method IN('온라인', '오프라인', '혼합')),
    mentoring_like int NULL DEFAULT 0,
    mentoring_time varchar(255) NOT NULL,
    mentoring_period varchar(255) NOT NULL,
    mentoring_maximum int NOT NULL,
    member_id int NOT NULL,
    category_id int NOT NULL,
    location_id int NOT NULL,
    PRIMARY KEY (mentoring_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

CREATE TABLE IF NOT EXISTS matching (
    matching_number int NOT NULL AUTO_INCREMENT,
    matching_status enum('pending','approved','rejected','canceled','finished') NOT NULL DEFAULT 'pending',
    matching_create timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    matching_start timestamp NULL DEFAULT current_timestamp,
    matching_finish timestamp NULL DEFAULT current_timestamp,
    rating_mentor decimal(2,1) NULL,
    rating_mentee decimal(2,1) NULL,
    matching_reasons varchar(255) NULL,
    member_id int NOT NULL,
    mentoring_id int NOT NULL,
    PRIMARY KEY (matching_number),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (mentoring_id) REFERENCES mentoringgoods(mentoring_id)
);

CREATE TABLE IF NOT EXISTS schedule (
    schedule_id int NOT NULL AUTO_INCREMENT,
    schedule_content varchar(255) NOT NULL,
    schedule_dt timestamp NOT NULL,
    matching_number int NOT NULL,
    PRIMARY KEY (schedule_id),
    FOREIGN KEY (matching_number) REFERENCES matching(matching_number)
);

CREATE TABLE IF NOT EXISTS record (
    record_id int NOT NULL AUTO_INCREMENT,
    record_title varchar(255) NOT NULL,
    record_text varchar(255) NOT NULL,
    record_create timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    record_update timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    member_role varchar(10) NOT NULL CHECK (member_role IN('멘토','멘티')),
    matching_number int NOT NULL,
    PRIMARY KEY (record_id),
    FOREIGN KEY (matching_number) REFERENCES matching(matching_number)
);

CREATE TABLE IF NOT EXISTS review (
    review_id int NOT NULL AUTO_INCREMENT,
    review_title varchar(255) NOT NULL,
    review_detail varchar(255) NOT NULL,
    review_create timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    review_update timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    mentoring_id int NOT NULL,
    matching_number int NOT NULL,
    PRIMARY KEY (review_id),
    FOREIGN KEY (mentoring_id) REFERENCES mentoringgoods(mentoring_id),
    FOREIGN KEY (matching_number) REFERENCES matching(matching_number)
);

CREATE TABLE IF NOT EXISTS message (
    message_id int NOT NULL AUTO_INCREMENT,
    message_title varchar(255) NOT NULL,
    message_content varchar(255) NOT NULL,
    message_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mentor_read boolean NULL DEFAULT false,
    mentee_read boolean NULL DEFAULT false,
    matching_number int NOT NULL,
    PRIMARY KEY (message_id),
    FOREIGN KEY (matching_number) REFERENCES matching(matching_number)
);

CREATE TABLE IF NOT EXISTS post (
    post_id int NOT NULL AUTO_INCREMENT,
    post_title varchar(255) NOT NULL,
    post_detail varchar(255) NOT NULL,
    post_create timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    post_update timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    post_like int NULL DEFAULT 0,
    member_id int NOT NULL,
    PRIMARY KEY (post_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

CREATE TABLE IF NOT EXISTS comment (
    comment_num int NOT NULL AUTO_INCREMENT,
    comment_text varchar(255) NOT NULL,
    comment_hide boolean NULL DEFAULT false,
    comment_create timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comment_update timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    comment_like int NULL DEFAULT 0,
    post_id int NOT NULL,
    member_id int NOT NULL,
    PRIMARY KEY (comment_num),
    FOREIGN KEY (post_id) REFERENCES post(post_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

CREATE TABLE IF NOT EXISTS dacomment (
    dacomment_num int NOT NULL AUTO_INCREMENT,
    dacomment_detail varchar(255) NOT NULL,
    dacomment_hide boolean NULL DEFAULT false,
    dacomment_create timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dacomment_update timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dacomment_like int NULL DEFAULT 0,
    comment_num int NOT NULL,
    member_id int NOT NULL,
    PRIMARY KEY (dacomment_num),
    FOREIGN KEY (comment_num) REFERENCES comment(comment_num),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

CREATE TABLE IF NOT EXISTS file (
    file_id int NOT NULL AUTO_INCREMENT,
    file_name varchar(255) NOT NULL,
    file_type varchar(255) NOT NULL,
    file_rename varchar(255) NOT NULL,
    file_path varchar(255) NOT NULL,
    file_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    file_order int NULL,
    record_id int NULL,
    mentoring_id int NULL,
    post_id int NULL,
    PRIMARY KEY (file_id),
    FOREIGN KEY (record_id) REFERENCES record(record_id),
    FOREIGN KEY (mentoring_id) REFERENCES mentoringgoods(mentoring_id),
    FOREIGN KEY (post_id) REFERENCES post(post_id)
);

CREATE TABLE IF NOT EXISTS likementoring (
    like_num int NOT NULL AUTO_INCREMENT,
    member_id int NOT NULL,
    mentoring_id int NOT NULL,
    PRIMARY KEY (like_num),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (mentoring_id) REFERENCES mentoringgoods(mentoring_id)
);

CREATE TABLE IF NOT EXISTS postdeclaration (
    declaration_num int NOT NULL AUTO_INCREMENT,
    declaration_detail varchar(255) NOT NULL,
    declaration_status boolean NULL DEFAULT false,
    declaration_create timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    post_id int NOT NULL,
    member_id1 int NOT NULL,
    member_id2 int NOT NULL,
    PRIMARY KEY (declaration_num),
    FOREIGN KEY (post_id) REFERENCES post(post_id),
    FOREIGN KEY (member_id1) REFERENCES member(member_id),
    FOREIGN KEY (member_id2) REFERENCES member(member_id)
);

CREATE TABLE IF NOT EXISTS cdeclaration (
    cdeclaration_num int NOT NULL AUTO_INCREMENT,
    cdeclaration_detail varchar(255) NOT NULL,
    cdeclaration_status boolean NULL DEFAULT false,
    cdeclaration_create timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comment_num int NOT NULL,
    member_id1 int NOT NULL,
    member_id2 int NOT NULL,
    PRIMARY KEY (cdeclaration_num),
    FOREIGN KEY (comment_num) REFERENCES comment(comment_num),
    FOREIGN KEY (member_id1) REFERENCES member(member_id),
    FOREIGN KEY (member_id2) REFERENCES member(member_id)
);

CREATE TABLE IF NOT EXISTS memberclaration (
    memreport_id int NOT NULL AUTO_INCREMENT,
    memreport_detail varchar(255) NOT NULL,
    memreport_status boolean NULL DEFAULT false,
    memreport_create timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    member_id1 int NOT NULL,
    member_id2 int NOT NULL,
    PRIMARY KEY (memreport_id),
    FOREIGN KEY (member_id1) REFERENCES member(member_id),
    FOREIGN KEY (member_id2) REFERENCES member(member_id)
);

CREATE TABLE IF NOT EXISTS cash (
    cash_num int NOT NULL AUTO_INCREMENT,
    cash_amount int NOT NULL,
    cash_method varchar(255) NOT NULL,
    cash_stamp_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    member_id int NOT NULL,
    PRIMARY KEY (cash_num),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);				

-- 지역테이블

DELETE FROM location;
INSERT INTO location (location_id, location_name) VALUES
	(1, '서울특별시'),
	(2, '부산광역시'),
	(3, '대구광역시'),
	(4, '인천광역시'),
	(5, '광주광역시'),
	(6, '대전광역시'),
	(7, '울산광역시'),
	(8, '세종특별자치시'),
	(9, '경기도'),
	(10, '강원특별자치도'),
	(11, '충청북도'),
	(12, '충청남도'),
	(13, '전북특별자치도'),
	(14, '전라남도'),
	(15, '경상북도'),
	(16, '경상남도'),
	(17, '제주특별자치도');

-- 카테고리 테이블

DELETE FROM category;
INSERT INTO category (category_id, category_name, category_create, category_update) VALUES
	(1, '프로그래밍', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(2, '디자인', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(3, '마케팅', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(4, '비즈니스', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(5, '언어', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(6, '음악', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(7, '미술', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(8, '요리', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(9, '운동/건강', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(10, '학습/교육', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(11, '취업/진로', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(12, '창업', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(13, '투자/재테크', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(14, '심리상담', '2025-07-31 05:22:57', '2025-07-31 05:22:57'),
	(15, '기타', '2025-07-31 05:22:57', '2025-07-31 05:22:57');

-- 회원 테이블

DELETE FROM member;
INSERT INTO member (member_id, member_role, member_name, member_email, member_pw, member_phone, member_location, member_job, member_community, member_age, member_gender, member_career, member_porfol, introduction, member_point, member_create, member_update, member_rating, location_id, category_id) VALUES
	(11, 0, '김관리', 'admin@mentoring.com', '8d66a53a381493bec08da23cef5a43767f20a42c', '010-1000-0001', '서울특별시', '기타', '온라인', 35, 1, '시스템 관리 5년', NULL, '멘토링 플랫폼 관리자입니다.', 0, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 1, 15),
	(12, 2, '박개발', 'mentor1@test.com', '10325b2705a4fc6e02851563d586a867c5876797', '010-2000-0001', '서울특별시', '프로그래밍', '혼합', 32, 1, 'Full Stack 개발 8년, 스타트업 CTO 경험', 'github.com/parkdev', 'React, Node.js 전문 멘토입니다. 실무 중심 교육을 제공합니다.', 1200, '2025-07-31 05:22:57', '2025-07-31 05:22:57', 4.8, 1, 1),
	(13, 2, '이디자인', 'mentor2@test.com', '10325b2705a4fc6e02851563d586a867c5876797', '010-2000-0002', '경기도', '디자인', '오프라인', 29, 2, 'UI/UX 디자이너 6년, 대기업 디자인팀 리드', 'behance.net/leedesign', 'UI/UX부터 브랜딩까지 디자인 전반을 가르칩니다.', 950, '2025-07-31 05:22:57', '2025-07-31 05:22:57', 4.9, 9, 2),
	(14, 2, '최마케팅', 'mentor3@test.com', '10325b2705a4fc6e02851563d586a867c5876797', '010-2000-0003', '부산광역시', '마케팅', '온라인', 34, 1, '디지털 마케팅 10년, 마케팅 에이전시 운영', NULL, '성과 중심의 디지털 마케팅 전략을 알려드립니다.', 800, '2025-07-31 05:22:57', '2025-07-31 05:22:57', 4.7, 2, 3),
	(15, 2, '정비즈니스', 'mentor4@test.com', '10325b2705a4fc6e02851563d586a867c5876797', '010-2000-0004', '대구광역시', '비즈니스', '혼합', 38, 1, 'MBA, 컨설팅 회사 12년 근무', NULL, '비즈니스 전략 수립과 실행에 대해 멘토링합니다.', 600, '2025-07-31 05:22:57', '2025-07-31 05:22:57', 4.6, 3, 4),
	(16, 2, '한영어', 'mentor5@test.com', '10325b2705a4fc6e02851563d586a867c5876797', '010-2000-0005', '인천광역시', '언어', '온라인', 31, 2, '영어교육 전공, TESOL 자격증, 어학원 강사 7년', NULL, 'TOEIC, TOEFL, 회화까지 맞춤형 영어교육', 750, '2025-07-31 05:22:57', '2025-07-31 05:22:57', 4.8, 4, 5),
	(17, 2, '송음악', 'mentor6@test.com', '10325b2705a4fc6e02851563d586a867c5876797', '010-2000-0006', '광주광역시', '음악', '오프라인', 27, 1, '음악학원 운영 5년, 피아노 전공', NULL, '클래식부터 대중음악까지 피아노 레슨', 400, '2025-07-31 05:22:57', '2025-07-31 05:22:57', 4.5, 5, 6),
	(18, 2, '윤미술', 'mentor7@test.com', '10325b2705a4fc6e02851563d586a867c5876797', '010-2000-0007', '대전광역시', '미술', '혼합', 33, 2, '미술교육 전공, 화실 운영 8년', 'instagram.com/yoonart', '수채화, 유화 등 다양한 미술 기법 지도', 520, '2025-07-31 05:22:57', '2025-07-31 05:22:57', 4.7, 6, 7),
	(19, 2, '김요리', 'mentor8@test.com', '10325b2705a4fc6e02851563d586a867c5876797', '010-2000-0008', '울산광역시', '요리', '오프라인', 35, 2, '한식조리기능사, 레스토랑 셰프 10년', NULL, '한식, 양식, 베이킹까지 전문 요리 교육', 680, '2025-07-31 05:22:57', '2025-07-31 05:22:57', 4.6, 7, 8),
	(20, 2, '조헬스가', 'mentor9@test.com', '10325b2705a4fc6e02851563d586a867c5876797', '010-2000-0009', '세종특별자치시', '운동/건강', '오프라인', 30, 1, '생활스포츠지도사, 헬스트레이너 6년', NULL, '개인별 맞춤 운동 프로그램과 식단 관리', 590, '2025-07-31 05:22:57', '2025-07-31 05:22:57', 4.8, 8, 9),
	(21, 2, '장교육', 'mentor10@test.com', '10325b2705a4fc6e02851563d586a867c5876797', '010-2000-0010', '강원특별자치도', '학습/교육', '온라인', 40, 2, '교육학 박사, 중고등학교 교사 15년', NULL, '효과적인 학습법과 입시 전략 멘토링', 1100, '2025-07-31 05:22:57', '2025-07-31 05:22:57', 4.9, 10, 10),
	(22, 3, '신초보', 'mentee1@test.com', 'f345acab1f3990fe2df4dc302f35615b714be54a', '010-3000-0001', '서울특별시', '프로그래밍', '온라인', 25, 1, '컴퓨터공학과 졸업예정', NULL, '프로그래밍을 배우고 싶은 취준생입니다.', 100, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 1, 1),
	(23, 3, '이학생', 'mentee2@test.com', 'f345acab1f3990fe2df4dc302f35615b714be54a', '010-3000-0002', '경기도', '디자인', '혼합', 23, 2, '디자인학과 3학년', NULL, '실무 디자인 스킬을 배우고 싶습니다.', 80, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 9, 2),
	(24, 3, '강새내기', 'mentee3@test.com', 'f345acab1f3990fe2df4dc302f35615b714be54a', '010-3000-0003', '부산광역시', '마케팅', '온라인', 26, 1, '경영학과 졸업, 마케팅 업무 1년차', NULL, '디지털 마케팅 전문성을 기르고 싶습니다.', 150, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 2, 3),
	(25, 3, '류직장인', 'mentee4@test.com', 'f345acab1f3990fe2df4dc302f35615b714be54a', '010-3000-0004', '대구광역시', '비즈니스', '오프라인', 28, 2, '일반 사무직 3년차', NULL, '경영 전략과 리더십을 배우고 싶습니다.', 200, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 3, 4),
	(26, 3, '오공시생', 'mentee5@test.com', 'f345acab1f3990fe2df4dc302f35615b714be54a', '010-3000-0005', '인천광역시', '언어', '온라인', 24, 1, '영어영문학과 졸업예정', NULL, '토익 고득점과 회화 실력 향상이 목표입니다.', 120, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 4, 5),
	(27, 3, '문취미', 'mentee6@test.com', 'f345acab1f3990fe2df4dc302f35615b714be54a', '010-3000-0006', '광주광역시', '음악', '오프라인', 32, 2, '회사원, 음악 취미 시작', NULL, '성인이 되어 피아노를 배우고 싶습니다.', 90, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 5, 6),
	(28, 3, '노예술', 'mentee7@test.com', 'f345acab1f3990fe2df4dc302f35615b714be54a', '010-3000-0007', '대전광역시', '미술', '혼합', 29, 1, 'IT업계 직장인', NULL, '스트레스 해소용 미술 취미를 시작하려 합니다.', 70, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 6, 7),
	(29, 3, '백요리사', 'mentee8@test.com', 'f345acab1f3990fe2df4dc302f35615b714be54a', '010-3000-0008', '울산광역시', '요리', '오프라인', 27, 2, '신혼부부', NULL, '집에서 맛있는 요리를 만들고 싶습니다.', 110, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 7, 8),
	(30, 3, '황헬린이', 'mentee9@test.com', 'f345acab1f3990fe2df4dc302f35615b714be54a', '010-3000-0009', '세종특별자치시', '운동/건강', '오프라인', 31, 1, '사무직, 운동 초보', NULL, '건강한 몸만들기가 목표입니다.', 130, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 8, 9),
	(31, 3, '주학부모', 'mentee10@test.com', 'f345acab1f3990fe2df4dc302f35615b714be54a', '010-3000-0010', '강원특별자치도', '학습/교육', '온라인', 38, 2, '중학생 자녀를 둔 학부모', NULL, '아이의 학습 지도를 위해 교육법을 배우고 싶습니다.', 160, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 10, 10),
	(32, 1, '가일반', 'user1@test.com', '95c946bf622ef93b0a211cd0fd028dfdfcf7e39e', '010-1000-0011', '충청북도', '기타', '온라인', 30, 1, '일반 직장인', NULL, '다양한 분야에 관심이 많습니다.', 50, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 11, 15),
	(33, 1, '나회원', 'user2@test.com', '95c946bf622ef93b0a211cd0fd028dfdfcf7e39e', '010-1000-0012', '충청남도', '취업/진로', '혼합', 26, 2, '취업준비생', NULL, '진로를 고민 중인 청년입니다.', 30, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 12, 11),
	(34, 1, '다유저', 'user3@test.com', '95c946bf622ef93b0a211cd0fd028dfdfcf7e39e', '010-1000-0013', '전북특별자치도', '창업', '온라인', 33, 1, '소상공인', NULL, '사업 확장을 고민하고 있습니다.', 80, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 13, 12),
	(35, 1, '라멤버', 'user4@test.com', '95c946bf622ef93b0a211cd0fd028dfdfcf7e39e', '010-1000-0014', '전라남도', '투자/재테크', '온라인', 35, 2, '회사원', NULL, '안정적인 투자 방법을 찾고 있습니다.', 120, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 14, 13),
	(36, 1, '마사용자', 'user5@test.com', '95c946bf622ef93b0a211cd0fd028dfdfcf7e39e', '010-1000-0015', '경상북도', '심리상담', '혼합', 28, 1, '직장인', NULL, '스트레스 관리법을 배우고 싶습니다.', 60, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 15, 14),
	(37, 1, '바플랫폼', 'user6@test.com', '95c946bf622ef93b0a211cd0fd028dfdfcf7e39e', '010-1000-0016', '경상남도', '기타', '오프라인', 42, 2, '자영업자', NULL, '새로운 도전을 준비 중입니다.', 40, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 16, 15),
	(38, 1, '사커뮤니티', 'user7@test.com', '95c946bf622ef93b0a211cd0fd028dfdfcf7e39e', '010-1000-0017', '제주특별자치도', '언어', '온라인', 29, 1, '관광업계 종사자', NULL, '외국어 실력을 늘리고 싶습니다.', 90, '2025-07-31 05:22:57', '2025-07-31 05:22:57', NULL, 17, 5);

-- 멘토링상품 테이블 

DELETE FROM mentoringgoods;

-- period(mentoring_period) 포함한 올바른 INSERT
INSERT INTO mentoringgoods (
    mentoring_id, mentoring_title, mentoring_detail, mentoring_dt, mentoring_update_dt,
    mentoring_price, mentoring_method, mentoring_like, mentoring_time, mentoring_period,
    mentoring_maximum, member_id, category_id, location_id
) VALUES
    (1, '풀스택 웹 개발 입문', 'HTML/CSS/JS부터 React, Node.js까지 실전 중심으로 배웁니다.',
     '2025-07-31 06:33:24', '2025-07-31 06:33:24', 200000, '온라인', 0,
     '주 1회 2시간', '4주', 5, 12, 1, 1),

    (2, 'UI/UX 디자인 실무반', '앱과 웹 UI 디자인, 사용자 경험 설계 실습 중심 교육입니다.',
     '2025-07-31 06:43:15', '2025-07-31 06:43:15', 180000, '오프라인', 0,
     '주 2회 1시간', '6주', 8, 13, 2, 9),

    (3, '디지털 마케팅 마스터 과정', 'SNS, 블로그, 광고까지 성과 중심 마케팅 전략을 가르칩니다.',
     '2025-07-31 06:43:15', '2025-07-31 06:43:15', 150000, '온라인', 0,
     '주 1회 2시간', '4주', 8, 14, 3, 2),

    (4, '비즈니스 전략 수립 워크숍', 'SWOT 분석부터 실행 전략까지 실전 사례 기반으로 멘토링합니다.',
     '2025-07-31 06:43:15', '2025-07-31 06:43:15', 220000, '혼합', 0,
     '주 1회 2시간', '5주', 7, 16, 4, 3),

    (5, '영어 회화 실전반', '발음, 표현, 문장 구조를 실생활 위주로 익히는 영어 회화 프로그램입니다.',
     '2025-07-31 06:43:15', '2025-07-31 06:43:15', 130000, '온라인', 0,
     '주 2회 1.5시간', '4주', 7, 18, 5, 4),

    (6, '피아노 입문 클래스', '음악이 처음이어도 쉽게 배울 수 있는 클래식 피아노 입문 과정입니다.',
     '2025-07-31 06:43:15', '2025-07-31 06:43:15', 100000, '오프라인', 0,
     '주 1회 1시간', '6주', 8, 20, 6, 5);
-- 멘토링 매칭 테이블 
-- 테이블 데이터 groom.matching:~4 rows (대략적) 내보내기
DELETE FROM matching;

INSERT 
  INTO matching(matching_number, matching_status, matching_create, matching_start, matching_finish,
         rating_mentor, rating_mentee, matching_reasons, member_id, mentoring_id)
VALUES
  -- 1) 정상 종료된 매칭 (평점 존재)
 (1, 'finished', '2025-07-31 06:47:37', '2025-07-31 06:47:37', '2025-07-31 06:47:37',
   4.8, 4.5, NULL, 26, 4),

  -- 2) 멘토 거절: 일정 불가
 (2, 'rejected', '2025-07-31 06:47:37', NULL, NULL,
   NULL, NULL, '멘토 일정 불가(야간/주말 미운영)', 27, 5),

  -- 3) 멘토 거절: 정책/윤리 이슈
 (3, 'rejected', '2025-07-31 06:47:37', NULL, NULL,
   NULL, NULL, '요청 범위가 과제 대행 소지로 수락 불가', 28, 6),

  -- 4) 멘토 거절: 조건 불일치 (FK 오류 수정: 7 → 5)
 (4, 'rejected', '2025-07-31 06:47:37', NULL, NULL,
   NULL, NULL, '예산·시간 조건 불일치로 진행 불가', 29, 5);
  
-- 멘토링쪽지 테이블 
DELETE FROM message;
INSERT INTO message (message_id, message_title, message_content, message_dt, mentor_read, mentee_read, matching_number) VALUES
	(1, '질문이 있습니다!', '이번 주 강의 자료는 어디서 받을 수 있나요?', '2025-07-31 06:49:27', 0, 1, 1),
	(2, '멘토링 관련 문의', '멘토링 시간 조정이 가능할까요?', '2025-07-31 06:49:27', 0, 0, 2),
	(3, '감사 인사드립니다', '좋은 강의 감사합니다! 덕분에 많은 걸 배웠어요.', '2025-07-31 06:49:27', 1, 1, 3);

-- 멘토링기록 테이블
DELETE FROM record;
INSERT INTO record (record_id, record_title, record_text, record_create, record_update, member_role, matching_number) VALUES
	(1, '1회차 강의 정리', 'HTML 기본 구조와 시맨틱 태그에 대해 설명했습니다.', '2025-07-31 07:00:36', '2025-07-31 07:00:36', '멘토', 1),
	(2, '멘토링 피드백', '개념 설명이 명확했고 실습 예제도 이해하기 쉬웠습니다.', '2025-07-31 07:00:36', '2025-07-31 07:00:36', '멘티', 1),
	(3, '2회차 강의 요약', 'UI 툴 사용법과 프로토타입 작성 방법을 실습했습니다.', '2025-07-31 07:00:36', '2025-07-31 07:00:36', '멘토', 2);

-- 멘토링일정 테이블
DELETE FROM schedule;
INSERT INTO schedule (schedule_id, schedule_content, schedule_dt, matching_number) VALUES
	(1, '1회차 멘토링 - 프론트엔드 구조 이해', '2025-08-05 05:00:00', 1),
	(2, '2회차 멘토링 - UI 디자인 기초', '2025-08-06 10:00:00', 2),
	(3, '3회차 멘토링 - 디지털 마케팅 전략', '2025-08-07 01:30:00', 3);

-- 멘토링후기 테이블 
-- 테이블 데이터 groom.review:~3 rows (대략적) 내보내기
DELETE FROM review;
INSERT INTO review (review_id, review_title, review_detail, review_create, review_update, mentoring_id, matching_number) VALUES
	(4, '강의 너무 좋았어요!', '처음 접하는 내용이었는데 쉽게 이해됐습니다.', '2025-07-31 07:03:04', '2025-07-31 07:03:04', 4, 1),
	(5, '멘토님 설명이 친절했어요.', 'UI 디자인에 대해 막막했는데 방향을 잡게 되었습니다.', '2025-07-31 07:03:04', '2025-07-31 07:03:04', 5, 2),
	(6, '마케팅 기초를 탄탄히 다졌습니다.', '광고 운영부터 트래픽 분석까지 전반적으로 배웠어요.', '2025-07-31 07:03:04', '2025-07-31 07:03:04', 6, 3);

-- 자유게시판 테이블 
-- 테이블 데이터 groom.post:~3 rows (대략적) 내보내기
DELETE FROM post;
INSERT INTO post (post_id, post_title, post_detail, post_create, post_update, post_like, member_id) VALUES
	(1, '멘토링 플랫폼 사용 후기', '정말 유익한 경험이었고, 다음에도 또 참여하고 싶습니다.', '2025-07-31 06:06:43', '2025-07-31 06:06:43', 0, 21),
	(2, '멘토님 너무 감사합니다!', '프론트엔드 면접 준비에 큰 도움이 되었습니다.', '2025-07-31 06:06:43', '2025-07-31 06:06:43', 0, 22),
	(3, '추천 멘토링 코스 있나요?', '데이터 분석 입문자를 위한 멘토링 코스를 추천해주세요!', '2025-07-31 06:06:43', '2025-07-31 06:06:43', 0, 23);

-- 결제내역 테이블
-- 테이블 데이터 groom.cash:~3 rows (대략적) 내보내기
DELETE FROM cash;
INSERT INTO cash (cash_num, cash_amount, cash_method, cash_stamp_dt, member_id) VALUES
	(1, 50000, '카드', '2025-07-31 06:17:44', 20),
	(2, 120000, '무통장입금', '2025-07-31 06:17:44', 21),
	(3, 80000, '카카오페이', '2025-07-31 06:17:44', 22);

-- 관심상품 테이블 
-- 테이블 데이터 groom.likementoring:~3 rows (대략적) 내보내기
DELETE FROM likementoring;
INSERT INTO likementoring (like_num, member_id, mentoring_id) VALUES
	(1, 30, 4),
	(2, 31, 5),
	(3, 32, 6);

-- 댓글 테이블 
-- 테이블 데이터 groom.comment:~3 rows (대략적) 내보내기
DELETE FROM comment;
INSERT INTO comment (comment_num, comment_text, comment_hide, comment_create, comment_update, comment_like, post_id, member_id) VALUES
	(1, '좋은 정보 감사합니다!', 0, '2025-07-31 06:08:45', '2025-07-31 06:08:45', 5, 1, 28),
	(2, '이런 글은 좀 자제해 주세요.', 0, '2025-07-31 06:08:45', '2025-07-31 06:08:45', 2, 2, 29),
	(3, '공감됩니다. 저도 비슷한 경험이 있어요.', 0, '2025-07-31 06:08:45', '2025-07-31 06:08:45', 3, 3, 30);

-- 대댓글 테이블
-- 테이블 데이터 groom.dacomment:~3 rows (대략적) 내보내기
DELETE FROM dacomment;
INSERT INTO dacomment (dacomment_num, dacomment_detail, dacomment_hide, dacomment_create, dacomment_update, dacomment_like, comment_num, member_id) VALUES
	(1, '저도 그렇게 생각해요!', 0, '2025-07-31 06:10:14', '2025-07-31 06:10:14', 2, 1, 31),
	(2, '좀 더 예의를 지켜주세요.', 0, '2025-07-31 06:10:14', '2025-07-31 06:10:14', 1, 2, 32),
	(3, '그 경험 공유해주셔서 감사합니다.', 0, '2025-07-31 06:10:14', '2025-07-31 06:10:14', 4, 3, 33);

-- 파일 테이블 
-- 테이블 데이터 groom.file:~0 rows (대략적) 내보내기
DELETE FROM file;
-- 멘토링 자료 첨부 (멘토링 상품 1번에 연결)
INSERT INTO file (
  file_name, file_type, file_rename, file_path, file_order, mentoring_id) VALUES
('강의자료.pdf', 'application/pdf', 'lecture_1.pdf', '/upload/mentoring/lecture_1.pdf', 1, 1);

-- 게시글 이미지 첨부 (게시글 1번에 연결)
INSERT INTO file (
  file_name, file_type, file_rename, file_path, file_order, post_id) VALUES
('screenshot.png', 'image/png', 'screenshot_123.png', '/upload/post/screenshot_123.png', 1, 1);

-- 멘토링 기록 첨부 (기록 1번에 연결)
INSERT INTO file (
  file_name, file_type, file_rename, file_path, file_order, record_id) VALUES
('요약노트.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'summary_note.docx', '/upload/record/summary_note.docx', 1, 1);

-- 회원신고 테이블

DELETE FROM memberclaration;
INSERT INTO memberclaration (memreport_id, memreport_detail, memreport_status, memreport_create, member_id1, member_id2) VALUES
	(10, '비정상적인 활동이 의심됩니다.', 0, '2025-07-31 06:18:27', 30, 22),
	(11, '욕설 및 비방 행위가 있었습니다.', 0, '2025-07-31 06:18:27', 32, 23),
	(12, '계정 도용이 의심되어 신고합니다.', 0, '2025-07-31 06:18:27', 36, 24);

-- 게시판신고 테이블

DELETE FROM postdeclaration;
INSERT INTO postdeclaration (declaration_num, declaration_detail, declaration_status, declaration_create, post_id, member_id1, member_id2) VALUES
	(1, '광고성 글로 보여 신고합니다.', 0, '2025-07-31 06:07:50', 1, 25, 21),
	(2, '비방성 표현이 포함되어 있습니다.', 0, '2025-07-31 06:07:50', 2, 26, 22),
	(3, '커뮤니티 가이드라인 위반 의심', 0, '2025-07-31 06:07:50', 3, 27, 23);

-- 댓글신고 테이블 

DELETE FROM cdeclaration;
INSERT INTO cdeclaration (cdeclaration_num, cdeclaration_detail, cdeclaration_status, cdeclaration_create, comment_num, member_id1, member_id2) VALUES
	(1, '욕설이 포함된 댓글 같습니다.', 0, '2025-07-31 06:11:32', 1, 34, 28),
	(2, '의도적인 비방이 의심됩니다.', 0, '2025-07-31 06:11:32', 2, 35, 29),
	(3, '댓글 내용이 너무 공격적입니다.', 0, '2025-07-31 06:11:32', 3, 36, 30);


SELECT * from cash;
SELECT * from memberclaration;
SELECT * from cdeclaration;
SELECT * from postdeclaration;
SELECT * from likementoring;
SELECT * from file;
SELECT * from dacomment;
SELECT * from comment;
SELECT * from post;
SELECT * from message;
SELECT * from review;
SELECT * from record;
SELECT * from schedule;
SELECT * from matching;
SELECT * from mentoringgoods;
SELECT * from member;
SELECT * from category;
SELECT * from location;
