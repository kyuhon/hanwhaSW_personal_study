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
    ORDER BY c.id DESC;
    
SELECT A.ID, A.name, A.STATUS, A.LAST_INSPECT_DATE, C.cum_id
FROM item A
JOIN contract_with_item B ON A.ID = B.ITEM_ID
JOIN contract C ON B.CONTRACT_ID = C.ID
JOIN approval D ON C.id = D.contract_id
WHERE approval_date IS NOT NULL AND A.status = "S" AND C.ID = 1
ORDER BY A.id DESC;

SELECT id, payment_due, payment_actual, overdue_days, payment_status, con_id
FROM payment_details
WHERE con_id = 4;

SELECT
        v.approval_mapping_id   AS approvalMappingId,
        v.approver_emp_id       AS approverEmpId,
        v.approval_step         AS approvalStep,
        v.is_approved           AS isApproved,
        v.approval_code         AS approvalCode,
        v.approval_title        AS approvalTitle,
        v.request_date          AS requestDate,
        v.request_emp_id        AS requestEmpId,
        v.employee_code         AS employeeCode,
        v.employee_name         AS employeeName,
        v.position_name         AS positionName
    FROM v_approval_payment_manage v
    WHERE v.approver_emp_id = 6
      AND v.is_approved = 'U'
      AND NOT EXISTS (
          SELECT 1
          FROM v_approval_payment_manage prev
          WHERE prev.approval_code = v.approval_code
            AND prev.approval_step < v.approval_step
            AND prev.is_approved != 'Y'
      )
    ORDER BY v.request_date DESC;


UPDATE `item`
SET `status` = 'P';

SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM customer;
SET FOREIGN_KEY_CHECKS = 1;

