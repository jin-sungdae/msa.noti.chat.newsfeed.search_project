# Stage 1: Build common-lib
FROM maven:3.8.7-eclipse-temurin-17 AS common-builder
WORKDIR /app/common
 # 공통 모듈의 POM 복사
COPY common-lib/pom.xml .
 # 소스 복사
COPY common-lib/src ./src
 # ✅ 공통 모듈 빌드 후 .m2에 저장
RUN mvn clean install -DskipTests

# Stage 2: Build notification-service
FROM maven:3.8.7-eclipse-temurin-17 AS notification-builder
WORKDIR /app/notification
 # ✅ 공통 모듈 공유
COPY --from=common-builder /root/.m2 /root/.m2
COPY notification-service/pom.xml .
COPY notification-service/src ./src
# ✅ 공통 모듈을 참조하여 빌드
RUN mvn clean package -DskipTests

# Stage 3: Runtime 환경 (경량 이미지)
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=notification-builder /app/notification/target/notification-service-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
