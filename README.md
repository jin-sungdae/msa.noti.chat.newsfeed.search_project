# MSA Notification System

## 프로젝트 개요
이 프로젝트는 **마이크로서비스 아키텍처(MSA)** 기반으로 **알림(Notification) 시스템**을 구축하는 프로젝트입니다.

알림 시스템은 다음과 같은 주요 기능을 제공합니다:
- **푸시 알림 (APNs, FCM)**
- **이메일 알림**
- **SMS 알림**
- **Kafka 기반 이벤트 스트리밍**
- **MySQL 기반 데이터 저장 및 조회**
- **Redis 기반 캐싱**
- **ElasticSearch를 활용한 검색 최적화**

## 📌 기술 스택
| 분류  | 기술 |
|---|---|
| **프레임워크** | Spring Boot 3.0.2 |
| **데이터베이스** | MySQL 8.0, Redis, ElasticSearch 8.1.3 |
| **메시지 브로커** | Apache Kafka 3.9.0 |
| **API Gateway** | Spring Cloud Gateway |
| **서비스 레지스트리** | Eureka Discovery Service |
| **환경 설정 관리** | Spring Cloud Config |
| **컨테이너 관리** | Docker, Docker Compose |
| **빌드 도구** | Maven |
| **배포** | Kubernetes (추후 확장 가능) |

---
## 🚀 실행 방법
### 1️⃣ **Docker 환경에서 실행**
```sh
docker-compose up -d
```

### 2️⃣ **개별 컨테이너 실행** (예: `notification-service`)
```sh
docker-compose up -d notification-service
```

### 3️⃣ **MySQL 컨테이너 접속**
```sh
docker exec -it mysql bash
mysql -u root -p
# 비밀번호: 5131
```

---
## 📂 프로젝트 구조
```plaintext
msa/
├── api-gateway/           # API 게이트웨이
├── common-lib/           # 공통 라이브러리 (모든 서비스가 참조)
├── config-server/        # Spring Cloud Config Server
├── discovery-server/     # Eureka Service Registry
├── notification-service/ # 알림 서비스
├── newsfeed-service/     # 뉴스피드 서비스
├── chat-service/         # 실시간 채팅 서비스
├── search-service/       # 검색 서비스
├── database/             # MySQL 초기화 스크립트 및 Mock 데이터
│   ├── init-mysql.sql    # 테이블 생성 SQL
│   ├── mock-data.sql     # 100만 개 데이터 삽입 SQL
├── docker-compose.yml    # 전체 MSA 환경을 구성하는 Docker 설정
└── README.md             # 프로젝트 개요 및 실행 방법
```

---
## ✅ 데이터베이스 스키마 (MySQL)
### 1️⃣ **Users 테이블** (사용자 정보 저장)
```sql
CREATE TABLE users (
   id BIGINT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(255) NOT NULL,
   email VARCHAR(255) UNIQUE,
   phone VARCHAR(20) UNIQUE,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 2️⃣ **Devices 테이블** (사용자의 기기 정보 저장)
```sql
CREATE TABLE devices (
   id BIGINT PRIMARY KEY AUTO_INCREMENT,
   user_id BIGINT NOT NULL,
   device_token VARCHAR(512) NOT NULL,
   platform ENUM('iOS', 'Android') NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
```

### 3️⃣ **Notifications 테이블** (알림 정보 저장)
```sql
CREATE TABLE notifications (
   id BIGINT PRIMARY KEY AUTO_INCREMENT,
   user_id BIGINT NOT NULL,
   event_id VARCHAR(255) UNIQUE NOT NULL,
   message TEXT NOT NULL,
   type ENUM('EMAIL', 'SMS', 'PUSH') NOT NULL,
   status ENUM('PENDING', 'SENT', 'FAILED', 'RETRYING') DEFAULT 'PENDING',
   sent_at TIMESTAMP NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
```

### 4️⃣ **Notification Logs 테이블** (알림 전송 로그)
```sql
CREATE TABLE notification_logs (
   id BIGINT PRIMARY KEY AUTO_INCREMENT,
   notification_id BIGINT NOT NULL,
   status ENUM('SENT', 'FAILED', 'RETRYING') NOT NULL,
   retry_count INT DEFAULT 0,
   error_message TEXT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (notification_id) REFERENCES notifications(id) ON DELETE CASCADE
);
```

---
## 🎯 API 명세
### 1️⃣ **사용자 등록 API**
**`POST /users`** - 새 사용자를 등록합니다.
```json
{
    "name": "홍길동",
    "email": "gildong@example.com",
    "phone": "01012345678"
}
```

### 2️⃣ **알림 전송 API**
**`POST /notifications/send`** - 특정 사용자에게 알림을 전송합니다.
```json
{
    "user_id": 1,
    "message": "배송이 완료되었습니다!",
    "type": "PUSH"
}
```

### 3️⃣ **알림 조회 API**
**`GET /notifications?user_id=1`** - 특정 사용자의 알림 기록을 조회합니다.
```json
[
    {
        "id": 1,
        "message": "배송이 완료되었습니다!",
        "status": "SENT"
    },
    {
        "id": 2,
        "message": "새로운 이벤트가 있습니다!",
        "status": "PENDING"
    }
]
```

---
## 🚀 확장 계획
- **RabbitMQ 지원 추가 (Kafka 대체 가능)**
- **Kubernetes 배포 자동화 (Helm Charts 적용)**
- **실시간 알림 WebSocket 지원**

---
## 🛠️ 주요 명령어
### ✅ 컨테이너 정리 후 재실행
```sh
docker-compose down -v
docker-compose up -d
```

### ✅ MySQL 수동 접속
```sh
docker exec -it mysql bash
mysql -u root -p
```

### ✅ 특정 서비스만 실행 (예: `notification-service`)
```sh
docker-compose up -d notification-service
```

---
## 📌 참고
- **Spring Boot 공식 문서:** [https://spring.io/projects/spring-boot](https://spring.io/projects/spring-boot)
- **Kafka 공식 문서:** [https://kafka.apache.org/documentation](https://kafka.apache.org/documentation)
- **MySQL 공식 문서:** [https://dev.mysql.com/doc/](https://dev.mysql.com/doc/)

