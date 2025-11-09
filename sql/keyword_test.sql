CREATE TABLE keyword_test (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,   -- 기본키 자동 증가
    keyword VARCHAR(50) NOT NULL,           -- 감정 키워드
    emotion_type VARCHAR(20) NOT NULL       -- 감정 유형 (긍정 / 부정 / 중립)
);


INSERT INTO keyword_test (keyword, emotion_type) VALUES
-- 긍정
('행복', '긍정'),
('감사', '긍정'),
('기쁨', '긍정'),
('즐거움', '긍정'),
('만족', '긍정'),
('편안', '긍정'),
('설렘', '긍정'),
('자랑스러움', '긍정'),
('성취', '긍정'),
('안정', '긍정'),
('희망', '긍정'),
('여유', '긍정'),

-- 부정
('슬픔', '부정'),
('화남', '부정'),
('짜증', '부정'),
('걱정', '부정'),
('불안', '부정'),
('후회', '부정'),
('외로움', '부정'),
('힘듦', '부정'),
('좌절', '부정'),
('피곤', '부정'),
('우울', '부정'),
('공허', '부정'),

-- 중립 / 기타
('평범', '중립'),
('무난', '중립'),
('보통', '중립'),
('조용함', '중립'),
('생각', '중립'),
('집중', '중립');

SHOW VARIABLES LIKE 'character_set%';

ALTER DATABASE Oops_Log CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
