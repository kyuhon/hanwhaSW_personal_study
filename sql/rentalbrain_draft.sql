SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS employee_auth;

CREATE TABLE employee_auth (
                               id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                               auth_id   BIGINT UNSIGNED NOT NULL,
                               emp_id    BIGINT UNSIGNED NOT NULL,
                               PRIMARY KEY (id)
);

DROP TABLE IF EXISTS channel;

CREATE TABLE channel (
                         id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                         name  VARCHAR(255)    NOT NULL,
                         PRIMARY KEY (id)
);

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
                          id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                          name  VARCHAR(255)    NOT NULL,
                          in_charge VARCHAR(255)    NOT NULL,
                          dept  VARCHAR(255)    NULL,
                          call_num  VARCHAR(255)    NOT NULL, -- 'call'은 예약어일 가능성이 있어 call_num 등으로 쓰는 것이 안전하나, 일단 원본 유지하려면 백틱(`) 권장. 여기선 VARCHAR 문맥상 유지합니다.
                          phone VARCHAR(255)    NULL,
                          email VARCHAR(255)    NOT NULL,
                          business_num  VARCHAR(255)    NOT NULL,
                          addr  VARCHAR(255)    NOT NULL,
                          last_transaction  DATETIME    NULL,
                          first_contract_date   DATETIME    NULL,
                          memo  VARCHAR(2000)   NULL,
                          star  INTEGER NULL,
                          channel_id    BIGINT UNSIGNED NOT NULL,
                          segment_id    BIGINT UNSIGNED NOT NULL,
                          PRIMARY KEY (id)
);

DROP TABLE IF EXISTS notification_receiver;

CREATE TABLE notification_receiver (
                                       id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                                       is_read   VARCHAR(1) NOT NULL DEFAULT 'N',
                                       noti_id   BIGINT UNSIGNED NOT NULL,
                                       emp_id    BIGINT UNSIGNED NOT NULL,
                                       PRIMARY KEY (id)
);

DROP TABLE IF EXISTS item_overdue;

CREATE TABLE item_overdue (
                              id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                              count INTEGER NOT NULL,
                              due_date  DATETIME    NOT NULL,
                              overdue_period    INTEGER NOT NULL,
                              status    VARCHAR(1)  NULL,
                              contract_id   BIGINT UNSIGNED NOT NULL,
                              cum_id    BIGINT UNSIGNED NOT NULL,
                              PRIMARY KEY (id)
);

DROP TABLE IF EXISTS survey_category;

CREATE TABLE survey_category (
                                 id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                                 name  VARCHAR(255)    NOT NULL,
                                 PRIMARY KEY (id)
);

DROP TABLE IF EXISTS segment;

CREATE TABLE segment (
                         id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                         name  VARCHAR(255)    NOT NULL,
                         content   VARCHAR(2000)   NULL,
                         total_charge  BIGINT  NULL,
                         segment_period    INTEGER  NULL,
                         is_contracted BOOLEAN NULL,
                         overdued  INTEGER  UNSIGNED NULL,
                         PRIMARY KEY (id)
);

DROP TABLE IF EXISTS approval_mapping;

CREATE TABLE approval_mapping (
                                  id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                                  emp_id    BIGINT UNSIGNED NOT NULL,
                                  approval_id   BIGINT UNSIGNED NOT NULL,
                                  step  INTEGER NULL,
                                  is_approved   VARCHAR(1)  NULL,
                                  reject_reason VARCHAR(255)    NULL,
                                  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS login_history;

CREATE TABLE login_history (
                               id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                               login_success_date    DATETIME    NULL,
                               login_is_succeed  VARCHAR(1)  NOT NULL,
                               login_ip  VARCHAR(255)    NULL,
                               emp_id    BIGINT UNSIGNED NOT NULL,
                               PRIMARY KEY (id)
);

DROP TABLE IF EXISTS approval;

CREATE TABLE approval (
                          id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                          title VARCHAR(255)    NOT NULL,
                          content   VARCHAR(2000)   NOT NULL,
                          request_date  DATETIME    NOT NULL,
                          approval_date DATETIME    NOT NULL,
                          status    VARCHAR(1)  NOT NULL,
                          contract_id   BIGINT UNSIGNED NOT NULL,
                          emp_id    BIGINT UNSIGNED NOT NULL,
                          PRIMARY KEY (id)
);

DROP TABLE IF EXISTS issued_coupon;

CREATE TABLE issued_coupon (
                               id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                               issued_date   DATETIME    NOT NULL,
                               is_used   VARCHAR(1)  NOT NULL,
                               used_date DATETIME    NULL,
                               end_date  DATETIME    NULL,
                               coupon_id BIGINT UNSIGNED NOT NULL,
                               cum_id    BIGINT UNSIGNED NOT NULL,
                               PRIMARY KEY (id)
);

DROP TABLE IF EXISTS survey;

CREATE TABLE survey (
                        id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                        name  VARCHAR(255)    NOT NULL,
                        link  VARCHAR(255)    NULL,
                        status    VARCHAR(255)    NULL,
                        start_date    DATETIME    NULL,
                        end_date  DATETIME    NULL,
                        ai_response   VARCHAR(2000)   NULL,
                        category_id   BIGINT UNSIGNED NOT NULL,
                        PRIMARY KEY (id)
);

DROP TABLE IF EXISTS coupon;

CREATE TABLE coupon (
                        id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                        name  VARCHAR(255)    NOT NULL,
                        rate  INTEGER NOT NULL,
                        content   VARCHAR(255)    NULL,
                        type  VARCHAR(1)  NOT NULL,
                        start_date    DATETIME    NULL,
                        end_date  DATETIME    NULL,
                        date_period   INTEGER NULL,
                        min_fee   INTEGER NULL,
                        max_num   INTEGER NULL,
                        segment_id    BIGINT UNSIGNED NOT NULL,
                        PRIMARY KEY (id)
);

DROP TABLE IF EXISTS quote;

/* [수정 1] channel_id 타입을 BIGINT UNSIGNED로 변경하여 channel 테이블과 일치시킴 */
CREATE TABLE quote (
                       id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                       status    VARCHAR(1)  NOT NULL,
                       counseling_date   DATETIME    NOT NULL,
                       counselor VARCHAR(255)    NOT NULL,
                       summary   VARCHAR(255)    NULL,
                       content   VARCHAR(2000)   NULL,
                       channel_id    BIGINT UNSIGNED  NOT NULL,
                       cum_id    BIGINT UNSIGNED NOT NULL,
                       PRIMARY KEY (id)
);

DROP TABLE IF EXISTS emp_position;

CREATE TABLE emp_position (
                              id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                              position_name VARCHAR(255)    NOT NULL,
                              description   VARCHAR(255)    NULL,
                              PRIMARY KEY (id)
);

DROP TABLE IF EXISTS promotion;

CREATE TABLE promotion (
                           id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                           name  VARCHAR(255)    NOT NULL,
                           start_date    DATETIME    NOT NULL,
                           end_date  DATETIME    NOT NULL,
                           status    VARCHAR(1)  NOT NULL,
                           type  VARCHAR(1)  NOT NULL,
                           trigger_val   VARCHAR(255)    NULL, -- 'trigger'는 예약어이므로 trigger_val 등으로 변경 권장
                           content   VARCHAR(255)    NULL,
                           segment_id    BIGINT UNSIGNED NOT NULL,
                           PRIMARY KEY (id)
);

DROP TABLE IF EXISTS item;

CREATE TABLE item (
                      id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                      name  VARCHAR(255)    NOT NULL,
                      serial_num    VARCHAR(255)    NOT NULL,
                      monthly_price INTEGER NOT NULL,
                      status    VARCHAR(1)  NOT NULL,
                      start_date    DATETIME    NULL,
                      last_inspect_date DATETIME    NULL,
                      sales INTEGER  NULL,
                      repair_cost   INTEGER  NULL,
                      category_id   BIGINT UNSIGNED NOT NULL,
                      PRIMARY KEY (id)
);

DROP TABLE IF EXISTS pay_overdue;

CREATE TABLE pay_overdue (
                             id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                             paid_date DATETIME    NULL,
                             due_date  DATETIME    NOT NULL,
                             overdue_period    INTEGER NOT NULL,
                             status    VARCHAR(1)  NULL,
                             contract_id   BIGINT UNSIGNED NOT NULL,
                             cum_id    BIGINT UNSIGNED NOT NULL,
                             PRIMARY KEY (id)
);

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
                          id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                          emp_id    VARCHAR(255)    NOT NULL,
                          pwd   VARCHAR(255)    NOT NULL,
                          phone VARCHAR(255)    NOT NULL,
                          email VARCHAR(255)    NULL,
                          addr  VARCHAR(255)    NOT NULL,
                          birthday  DATETIME    NOT NULL,
                          gender    VARCHAR(1)  NOT NULL,
                          status    VARCHAR(1)  NULL,
                          dept  VARCHAR(255)    NOT NULL,
                          hire_date DATETIME    NOT NULL,
                          resign_date   DATETIME    NULL,
                          position_id   BIGINT UNSIGNED NOT NULL,
                          PRIMARY KEY (id)
);

DROP TABLE IF EXISTS emp_position_auth;

CREATE TABLE emp_position_auth (
                                   id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                                   position_id   BIGINT UNSIGNED NOT NULL,
                                   auth_id   BIGINT UNSIGNED NOT NULL,
                                   PRIMARY KEY (id)
);

DROP TABLE IF EXISTS after_service;

CREATE TABLE after_service (
                               id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                               engineer  VARCHAR(255)    NOT NULL,
                               type  VARCHAR(1)  NOT NULL,
                               due_date  DATETIME    NOT NULL,
                               status    VARCHAR(1)  NOT NULL,
                               item_id   BIGINT UNSIGNED NOT NULL,
                               cum_id    BIGINT UNSIGNED NOT NULL,
                               PRIMARY KEY (id)
);

DROP TABLE IF EXISTS contract;

CREATE TABLE contract (
                          id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                          name  VARCHAR(255)    NOT NULL,
                          start_date    DATETIME    NOT NULL,
                          contract_period    INTEGER NOT NULL,
                          status    VARCHAR(1)  NOT NULL,
                          monthly_payment   INTEGER NULL,
                          total_amount  INTEGER NOT NULL,
                          pay_method    VARCHAR(1)  NOT NULL,
                          pay_date  VARCHAR(255)    NULL,
                          special_content   VARCHAR(2000)   NULL,
                          cum_id    BIGINT UNSIGNED NOT NULL,
                          PRIMARY KEY (id)
);

DROP TABLE IF EXISTS feedback;

CREATE TABLE feedback (
                          id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                          title VARCHAR(255)    NOT NULL,
                          content   VARCHAR(2000)   NOT NULL,
                          star  INTEGER NULL,
                          create_date   DATETIME    NULL,
                          action    VARCHAR(255)    NULL,
                          cum_id    BIGINT UNSIGNED NOT NULL,
                          category_id   BIGINT UNSIGNED NOT NULL,
                          emp_id    BIGINT UNSIGNED NOT NULL,
                          channel_id    BIGINT UNSIGNED NOT NULL,
                          PRIMARY KEY (id)
);

DROP TABLE IF EXISTS support_category;

CREATE TABLE support_category (
                                  id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                                  name  VARCHAR(255)    NOT NULL,
                                  type  VARCHAR(1)  NOT NULL,
                                  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS promotion_log;

CREATE TABLE promotion_log (
                               id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                               participation_date    DATETIME    NOT NULL,
                               cum_id    BIGINT UNSIGNED NOT NULL,
                               promotion_id  BIGINT UNSIGNED NOT NULL,
                               PRIMARY KEY (id)
);

DROP TABLE IF EXISTS contract_with_item;

CREATE TABLE contract_with_item (
                                    id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                                    contract_id   BIGINT UNSIGNED NOT NULL,
                                    item_id   BIGINT UNSIGNED NOT NULL,
                                    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS auth_list;

CREATE TABLE auth_list (
                           id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                           auth  VARCHAR(255)    NOT NULL,
                           description   VARCHAR(255)    NULL,
                           PRIMARY KEY (id)
);

DROP TABLE IF EXISTS item_category;

CREATE TABLE item_category (
                               id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                               name  VARCHAR(255)    NOT NULL,
                               PRIMARY KEY (id)
);

DROP TABLE IF EXISTS customer_support;

CREATE TABLE customer_support (
                                  id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                                  title VARCHAR(255)    NOT NULL,
                                  content   VARCHAR(2000)   NOT NULL,
                                  status    VARCHAR(1)  NOT NULL,
                                  create_date   DATETIME    NULL,
                                  action    VARCHAR(255)    NULL,
                                  cum_id    BIGINT UNSIGNED NOT NULL,
                                  emp_id    BIGINT UNSIGNED NOT NULL,
                                  category_id   BIGINT UNSIGNED NOT NULL,
                                  channel_id    BIGINT UNSIGNED NOT NULL,
                                  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS notification;

/* [수정 2] ENUM 타입을 VARCHAR로 변경하여 문법 오류 해결 */
CREATE TABLE notification (
                              id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                              type  VARCHAR(50) NULL,
                              title VARCHAR(255)    NULL,
                              message   VARCHAR(2000)   NULL,
                              created_at    DATETIME    NULL,
                              target_type   VARCHAR(50) NOT NULL,
                              target_id BIGINT UNSIGNED NULL,
                              PRIMARY KEY (id)
);

/* 외래키 설정 */

ALTER TABLE employee_auth
    ADD CONSTRAINT FK_auth_list_TO_employee_auth FOREIGN KEY (auth_id) REFERENCES auth_list (id),
    ADD CONSTRAINT FK_employee_TO_employee_auth FOREIGN KEY (emp_id) REFERENCES employee (id);

ALTER TABLE customer
    ADD CONSTRAINT FK_channel_TO_customer FOREIGN KEY (channel_id) REFERENCES channel (id),
    ADD CONSTRAINT FK_segment_TO_customer FOREIGN KEY (segment_id) REFERENCES segment (id);

ALTER TABLE notification_receiver
    ADD CONSTRAINT FK_notification_TO_notification_receiver FOREIGN KEY (noti_id) REFERENCES notification (id),
    ADD CONSTRAINT FK_employee_TO_notification_receiver FOREIGN KEY (emp_id) REFERENCES employee (id);

ALTER TABLE item_overdue
    ADD CONSTRAINT FK_contract_TO_item_overdue FOREIGN KEY (contract_id) REFERENCES contract (id),
    ADD CONSTRAINT FK_customer_TO_item_overdue FOREIGN KEY (cum_id) REFERENCES customer (id);

ALTER TABLE approval_mapping
    ADD CONSTRAINT FK_employee_TO_approval_mapping FOREIGN KEY (emp_id) REFERENCES employee (id),
    ADD CONSTRAINT FK_approval_TO_approval_mapping FOREIGN KEY (approval_id) REFERENCES approval (id);

ALTER TABLE login_history
    ADD CONSTRAINT FK_employee_TO_login_history FOREIGN KEY (emp_id) REFERENCES employee (id);

ALTER TABLE approval
    ADD CONSTRAINT FK_contract_TO_approval FOREIGN KEY (contract_id) REFERENCES contract (id),
    ADD CONSTRAINT FK_employee_TO_approval FOREIGN KEY (emp_id) REFERENCES employee (id);

ALTER TABLE issued_coupon
    ADD CONSTRAINT FK_coupon_TO_issued_coupon FOREIGN KEY (coupon_id) REFERENCES coupon (id),
    ADD CONSTRAINT FK_customer_TO_issued_coupon FOREIGN KEY (cum_id) REFERENCES customer (id);

ALTER TABLE survey
    ADD CONSTRAINT FK_survey_category_TO_survey FOREIGN KEY (category_id) REFERENCES survey_category (id);

ALTER TABLE coupon
    ADD CONSTRAINT FK_segment_TO_coupon FOREIGN KEY (segment_id) REFERENCES segment (id);

ALTER TABLE quote
    ADD CONSTRAINT FK_channel_TO_quote FOREIGN KEY (channel_id) REFERENCES channel (id),
    ADD CONSTRAINT FK_customer_TO_quote FOREIGN KEY (cum_id) REFERENCES customer (id);

ALTER TABLE promotion
    ADD CONSTRAINT FK_segment_TO_promotion FOREIGN KEY (segment_id) REFERENCES segment (id);

ALTER TABLE item
    ADD CONSTRAINT FK_item_category_TO_item FOREIGN KEY (category_id) REFERENCES item_category (id);

ALTER TABLE pay_overdue
    ADD CONSTRAINT FK_contract_TO_pay_overdue FOREIGN KEY (contract_id) REFERENCES contract (id),
    ADD CONSTRAINT FK_customer_TO_pay_overdue FOREIGN KEY (cum_id) REFERENCES customer (id);

ALTER TABLE employee
    ADD CONSTRAINT FK_emp_position_TO_employee FOREIGN KEY (position_id) REFERENCES emp_position (id);

ALTER TABLE emp_position_auth
    ADD CONSTRAINT FK_emp_position_TO_emp_position_auth FOREIGN KEY (position_id) REFERENCES emp_position (id),
    ADD CONSTRAINT FK_auth_list_TO_emp_position_auth FOREIGN KEY (auth_id) REFERENCES auth_list (id);

ALTER TABLE after_service
    ADD CONSTRAINT FK_item_TO_after_service FOREIGN KEY (item_id) REFERENCES item (id),
    ADD CONSTRAINT FK_customer_TO_after_service FOREIGN KEY (cum_id) REFERENCES customer (id);

ALTER TABLE contract
    ADD CONSTRAINT FK_customer_TO_contract FOREIGN KEY (cum_id) REFERENCES customer (id);

ALTER TABLE feedback
    ADD CONSTRAINT FK_customer_TO_feedback FOREIGN KEY (cum_id) REFERENCES customer (id),
    ADD CONSTRAINT FK_support_category_TO_feedback FOREIGN KEY (category_id) REFERENCES support_category (id),
    ADD CONSTRAINT FK_employee_TO_feedback FOREIGN KEY (emp_id) REFERENCES employee (id),
    ADD CONSTRAINT FK_channel_TO_feedback FOREIGN KEY (channel_id) REFERENCES channel (id);

ALTER TABLE promotion_log
    ADD CONSTRAINT FK_customer_TO_promotion_log FOREIGN KEY (cum_id) REFERENCES customer (id),
    ADD CONSTRAINT FK_promotion_TO_promotion_log FOREIGN KEY (promotion_id) REFERENCES promotion (id);

ALTER TABLE contract_with_item
    ADD CONSTRAINT FK_contract_TO_contract_with_item FOREIGN KEY (contract_id) REFERENCES contract (id),
    ADD CONSTRAINT FK_item_TO_contract_with_item FOREIGN KEY (item_id) REFERENCES item (id);

ALTER TABLE customer_support
    ADD CONSTRAINT FK_customer_TO_customer_support FOREIGN KEY (cum_id) REFERENCES customer (id),
    ADD CONSTRAINT FK_employee_TO_customer_support FOREIGN KEY (emp_id) REFERENCES employee (id),
    ADD CONSTRAINT FK_support_category_TO_customer_support FOREIGN KEY (category_id) REFERENCES support_category (id),
    ADD CONSTRAINT FK_channel_TO_customer_support FOREIGN KEY (channel_id) REFERENCES channel (id);
SET FOREIGN_KEY_CHECKS = 1;