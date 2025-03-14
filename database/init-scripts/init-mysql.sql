-- ✅ 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS user_db;
CREATE DATABASE IF NOT EXISTS notification_db;
CREATE DATABASE IF NOT EXISTS chat_db;
CREATE DATABASE IF NOT EXISTS newsfeed_db;
CREATE DATABASE IF NOT EXISTS search_db;

-- 계정이 모든 DB에 접근 가능하도록 설정
GRANT ALL PRIVILEGES ON user_db.* TO 'sjin'@'%';
GRANT ALL PRIVILEGES ON notification_db.* TO 'sjin'@'%';
GRANT ALL PRIVILEGES ON chat_db.* TO 'sjin'@'%';
GRANT ALL PRIVILEGES ON newsfeed_db.* TO 'sjin'@'%';
GRANT ALL PRIVILEGES ON search_db.* TO 'sjin'@'%';
FLUSH PRIVILEGES;


USE user_db;


-- 사용자 테이블
CREATE TABLE user (
                       user_index BIGINT PRIMARY KEY AUTO_INCREMENT,
                       name VARCHAR(255) NOT NULL,
                       user_id VARCHAR(255) NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       birth VARCHAR(255) NOT NULL,
                       email VARCHAR(255) UNIQUE,
                       phoneNumber VARCHAR(20) UNIQUE,
                       address VARCHAR(255) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_detail (
        user_detail_id BIGINT PRIMARY KEY AUTO_INCREMENT,
        user_index BIGINT NOT NULL,
        user_type ENUM('PLAYER', 'AUTO', 'AI') NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)


-- 사용자 디바이스 테이블 (푸시 알림 발송용)
CREATE TABLE device (
                         id BIGINT PRIMARY KEY AUTO_INCREMENT,
                         user_id BIGINT NOT NULL,
                         device_token VARCHAR(512) NOT NULL,
                         platform ENUM('iOS', 'Android', 'WEB') NOT NULL,
                         last_active TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



USE notification_db;



-- 알림 테이블 (알림 기본 정보 저장)
CREATE TABLE notifications (
                               id BIGINT PRIMARY KEY AUTO_INCREMENT,
                               user_id BIGINT NOT NULL,
                               event_id VARCHAR(255) UNIQUE NOT NULL, -- 중복 전송 방지
                               message TEXT NOT NULL,
                               notification_type ENUM('EMAIL', 'SMS', 'PUSH') NOT NULL,
                               status ENUM('PENDING', 'SENT', 'FAILED', 'RETRYING', 'PERMANENT_FAILED') NOT NULL DEFAULT 'PENDING',
                               sent_at TIMESTAMP NULL,
                               retry_count INT DEFAULT 0,
                                is_read BOOLEAN DEFAULT FALSE,
                                read_at TIMESTAMP NULL,
                               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 알림 발송 이력 테이블 (재시도 및 전송 실패 이력 관리)
CREATE TABLE notification_logs (
                                   id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                   notification_id BIGINT NOT NULL,
                                   event_type ENUM('CREATED', 'SENT', 'FAILED', 'RETRIED') NOT NULL,
                                   retry_count INT DEFAULT 0,
                                   error_message TEXT NULL,
                                   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 알림 템플릿 테이블 (미리 정의된 템플릿 사용)
CREATE TABLE notification_templates (
                                        id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                        notification_type ENUM('EMAIL', 'SMS', 'PUSH') NOT NULL,
                                        template_name VARCHAR(255) UNIQUE NOT NULL,
                                        content TEXT NOT NULL,
                                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 사용자 알림 설정 (수신 여부 관리)
CREATE TABLE notification_preferences (
                                          id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                          user_id BIGINT NOT NULL,
                                          email_enabled BOOLEAN DEFAULT TRUE,
                                          sms_enabled BOOLEAN DEFAULT TRUE,
                                          push_enabled BOOLEAN DEFAULT TRUE,
                                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- 재시도 큐 테이블 (notification_retry_queue)
CREATE TABLE notification_retry_queue (
                                          id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                          notification_id BIGINT NOT NULL,
                                          retry_count INT DEFAULT 0,
                                          next_retry_at TIMESTAMP NOT NULL,
                                          status ENUM('PENDING', 'PROCESSING', 'FAILED') DEFAULT 'PENDING',
                                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO notification_templates (type, template_name, content, created_at) VALUES
                                                                                  ('PUSH', 'welcome_push', '{username}님, 환영합니다! 앱을 즐겨보세요!', NOW()),
                                                                                  ('SMS', 'order_sms', '{username}님, 주문 {orderNumber}이 완료되었습니다.', NOW()),
                                                                                  ('EMAIL', 'reset_password_email', '{username}님, 비밀번호를 재설정하려면 여기를 클릭하세요.', NOW());




USE newsfeed_db;
CREATE TABLE IF NOT EXISTS newsfeed (
                                        id INT AUTO_INCREMENT PRIMARY KEY,
                                        content TEXT NOT NULL,
                                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

USE chat_db;
CREATE TABLE IF NOT EXISTS chat_messages (
                                             id INT AUTO_INCREMENT PRIMARY KEY,
                                             sender VARCHAR(255) NOT NULL,
    receiver VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

USE search_db;
CREATE TABLE IF NOT EXISTS search_index (
                                            id INT AUTO_INCREMENT PRIMARY KEY,
                                            keyword VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
