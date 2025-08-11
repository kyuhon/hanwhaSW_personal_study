-- REQ-074 회원은 게시글의 제목과 내용을 작성해야 한다.
INSERT INTO post (post_title, post_detail, member_id)
VALUES ('제목 예시', '내용 예시입니다.', 1);


-- REQ-075 게시글에 파일을 등록할 수 있다.
INSERT INTO file (
    file_name, file_type, file_rename, file_path, file_order, post_id
) VALUES (
    'image2.jpg', 'image/jpeg2', '20250801_abc1234.jpg', '/uploads/20250801/', 1, 10
);


-- REQ-076 회원은 게시글에 좋아요 1개를 줄 수 있다.
UPDATE post
SET post_like = post_like + 1
WHERE post_id = 3;


-- REQ-077 본인이 작성한 게시글의 내용을 수정할 수 있다.
UPDATE post
SET post_detail = '수정된 게시글 내용입니다.'
WHERE post_id = 1;


-- REQ-078 작성한 본인의 글은 삭제 할 수 있다.
DELETE FROM post WHERE member_id = 1;


-- REQ-079 좋아요가 높은 순으로 조회할 수 있다.
SELECT * FROM post
ORDER BY post_like DESC;


-- REQ-080 악성 게시글은 신고할 수 있다.
insert into postdeclaration (declaration_detail) VALUES ('신고합니다아아아아.');


-- REQ-081 해당 게시판을 삭제 할 수 있다.
DELETE FROM post WHERE post_id = 2;


-- REQ-082 회원은 게시글에 댓글을 남길 수 있고, 익명 여부 설정이 가능하다.
INSERT INTO comment (comment_text, comment_hide, post_id, member_id)
VALUES ('실명 댓글입니다.', FALSE, 1, 123);


-- REQ-083 본인의 댓글은 언제든지 삭제 할 수 있다.
DELETE FROM comment WHERE comment_num = 3 AND member_id = 30;


-- REQ-084 악성 댓글 및 욕설 댓글은 신고할 수 있다.
INSERT INTO cdeclaration (cdeclaration_detail, cdeclaration_status, comment_num, member_id2)
VALUES ('실명 댓글입니다.', FALSE, 2, 30);


-- REQ-085 해당 댓글을 삭제할 수 있다.
DELETE FROM comment WHERE comment_num = 2;


-- REQ-086 회원은 댓글에 대댓글을 남길 수 있고, 익명 여부 설정이 가능하다.
INSERT INTO dacomment (dacomment_detail, dacomment_hide, comment_num)
VALUES ('대댓글입니다.',FALSE,4);
INSERT INTO cdeclaration (cdeclaration_detail, cdeclaration_status, comment_num, member_id2)
VALUES ('실명 댓글입니다.', FALSE, 2, 30);


-- REQ-087 본인의 대댓글은 언제든지 삭제 할 수 있다.
DELETE from dacomment WHERE dacomment_num = 5 AND member_id = 0;
DELETE FROM cdeclaration WHERE cdeclaration_num = 6;



-- REQ-088 악성 대댓글 및 욕설 대댓글은 신고할 수 있다.
INSERT INTO cdeclaration (cdeclaration_detail, cdeclaration_status, comment_num, member_id2)
VALUES ('너무 문제가 많아요.', FALSE, 3, 40);









