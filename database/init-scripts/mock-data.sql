-- notification_db에 100만 개 데이터 삽입
USE notification_db;
-- 🚀 100만 개 사용자 삽입
-- ✅ 중복을 방지하면서 100만 개 사용자 삽입

INSERT INTO users (name, email, phone)
SELECT
    LEFT(MD5(RAND()), 10),  -- 랜덤 10자리 문자열 (이름)
    CONCAT(LEFT(MD5(RAND()), 10), '@example.com'),  -- 랜덤 이메일
    CONCAT(
    LPAD(FLOOR(RAND() * 1000), 3, '0'), '-',  -- 000 ~ 999 (첫 번째 블록)
    LPAD(FLOOR(RAND() * 10000), 4, '0'), '-',  -- 0000 ~ 9999 (두 번째 블록)
    LPAD(FLOOR(RAND() * 10000), 4, '0')  -- 0000 ~ 9999 (세 번째 블록)
    )  -- 랜덤 전화번호 (000-0000-0000 ~ 999-9999-9999)
FROM (SELECT 1 FROM information_schema.tables LIMIT 1000000) temp;





-- 🚀 100만 개 디바이스 삽입 (각 사용자당 1~3개 디바이스)
INSERT INTO devices (user_id, device_token, platform)
SELECT
    id AS user_id,
    UUID() AS device_token,
    IF(FLOOR(RAND() * 2) = 0, 'iOS', 'Android') AS platform
FROM users;

-- 🚀 100만 개 알림 삽입
INSERT INTO notifications (user_id, event_id, message, type, status)
SELECT
    user_id,
    UUID(),
    CONCAT('알림 메시지 ', id),
    IF(FLOOR(RAND() * 3) = 0, 'EMAIL', IF(FLOOR(RAND() * 3) = 1, 'SMS', 'PUSH')),
    'PENDING'
FROM devices
         LIMIT 1000000;

-- 🚀 100만 개 알림 발송 이력 삽입
INSERT INTO notification_logs (notification_id, status, retry_count)
SELECT
    id AS notification_id,
    IF(FLOOR(RAND() * 3) = 0, 'SENT', IF(FLOOR(RAND() * 3) = 1, 'FAILED', 'RETRYING')),
    FLOOR(RAND() * 3) AS retry_count
FROM notifications
         LIMIT 1000000;

-- 🚀 100만 개 사용자 알림 설정 삽입
INSERT INTO notification_preferences (user_id, email_enabled, sms_enabled, push_enabled)
SELECT
    id AS user_id,
    IF(FLOOR(RAND() * 2) = 0, TRUE, FALSE),
    IF(FLOOR(RAND() * 2) = 0, TRUE, FALSE),
    IF(FLOOR(RAND() * 2) = 0, TRUE, FALSE)
FROM users
         LIMIT 1000000;


-- newsfeed_db에 100만 개 데이터 삽입
USE newsfeed_db;

CALL InsertNewsfeed(1000000);

-- chat_db에 100만 개 데이터 삽입
USE chat_db;

CALL InsertChatMessages(1000000);

-- search_db에 100만 개 데이터 삽입
USE search_db;

CALL InsertSearchIndex(1000000);
