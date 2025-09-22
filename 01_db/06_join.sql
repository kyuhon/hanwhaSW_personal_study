-- join
-- 관계를 맺은 두개 이상의 테이블을 한번에 조회하고 싶을 때

-- 메뉴명과 카테고리명을 한번에 보고싶다.
SELECT * FROM tbl_menu;
SELECT * FROM tbl_category;

-- 1) '메뉴명'과 카테고리명'이 각각 어떤 테이블에 존재하나?(두 개 이상이면)
-- 2) tbl_menu와 tbl_category에서 확인을 하고 서로 관계를 맺었는지 확인
-- 3) join으로 해결 가능함을 확인
SELECT *
FROM tbl_menu JOIN tbl_category ON tbl_menu.category_code = tbl_category.category_code;
-- on은 조인을 위한 반드시 관계있는 컬럼을 토대로 조건을 작성할 것

-- 별칭을 활용한 조인 사용
-- 테이블에 별칭 추가 시에는 as를 붙여도 안붙여도 된다.(통일감 있게)
SELECT *
	FROM tbl_menu AS a
	JOIN tbl_category b ON a.category_code = b.category_code;
	
DESC tbl_menu;
DESC tbl_category;
	