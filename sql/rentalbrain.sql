-- 계약 개요
SELECT
c.id,
c.contract_code,
c.name,
c.start_date,
c.contract_period,
c.monthly_payment,
c.total_amount,
c.pay_method,
c.special_content,
t.id,
t.customer_code,
t.in_charge,
t.call_num
 FROM contract c
 LEFT JOIN customer t ON c.cum_id=t.id
WHERE c.id=1;


-- 계약 수납연체건수
SELECT
    COUNT(*) AS n_count
FROM payment_details
WHERE con_id = 4
  AND payment_status = 'N';
  

-- 계약 진행률
SELECT
    id AS contract_id,
    start_date,
    contract_period,

    -- 진행률 (%)
    LEAST(
        ROUND(
            TIMESTAMPDIFF(MONTH, start_date, NOW())
            / contract_period * 100
        ),
        100
    ) AS progress_rate
FROM contract
WHERE id = 1;


-- 렌탈 자산 개수
SELECT
	COUNT(*) AS a_count
FROM contract_with_item
WHERE contract_id = 1;





-- 아이템 목록 조회
SELECT
    i.name,
    COUNT(cwi.id) AS quantity
FROM contract_with_item cwi
JOIN item i ON cwi.item_id = i.id
WHERE cwi.contract_id = 1
GROUP BY i.name;

-- 해당 아이템 상세 조회

SELECT
    i.id                AS itemId,
    i.item_code         AS itemCode,
    i.name       			AS name,
    i.last_inspect_date AS latelyInspectDate
FROM contract_with_item cwi
JOIN item i ON cwi.item_id = i.id
WHERE cwi.contract_id = 1;


SELECT
        c.id             AS customerId,
        c.customer_code  AS customerCode,
        c.name           AS customerName,
        c.in_charge      AS inCharge,
        s.name           AS segmentName
    FROM customer c
    LEFT JOIN segment s
        ON c.segment_id = s.id
    WHERE c.is_deleted = 'N'
      AND c.segment_id <> 6
    ORDER BY c.id DESC
