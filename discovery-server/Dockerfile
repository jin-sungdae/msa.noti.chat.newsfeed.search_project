# 1. OpenJDK 17 기반 이미지 사용
FROM openjdk:17-jdk-slim

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. Maven 설치 (Maven 캐시를 활용하여 빌드 속도 향상)
RUN apt-get update && apt-get install -y maven

# 4. 프로젝트의 모든 파일 복사
COPY . .

# 5. .jar 파일이 없으면 mvn package 실행
RUN test -f target/discovery-server-0.0.1-SNAPSHOT.jar || mvn clean package -DskipTests

# 6. 컨테이너 실행 시 JAR 파일 실행
CMD ["java", "-jar", "target/discovery-server-0.0.1-SNAPSHOT.jar"]
