# Stage 1: 공통 모듈 빌드
FROM maven:3.8.7-eclipse-temurin-17 AS common-builder
WORKDIR /app/common

COPY common-lib/pom.xml .
COPY common-lib/src ./src
RUN mvn clean install -DskipTests

# Stage 2: admin Server 빌드 (WAR 파일 생성)
FROM maven:3.8.7-eclipse-temurin-17 AS admin-builder
WORKDIR /app/Admin

COPY --from=common-builder /root/.m2 /root/.m2
COPY admin-server/pom.xml .
COPY admin-server/src ./src

RUN mvn clean package -DskipTests

# Stage 3: 실행용 컨테이너
FROM tomcat:10-jdk17-temurin
WORKDIR /usr/local/tomcat

# unzip 패키지 설치
RUN apt-get update && apt-get install -y unzip

# 기존 Webapps 제거
RUN rm -rf webapps/*

# Tomcat 포트 변경
RUN sed -i 's/port="8080"/port="1114"/g' /usr/local/tomcat/conf/server.xml

RUN sed -i '/<\/web-app>/i \
  <jsp-config>\n\
    <taglib>\n\
        <taglib-uri>http://jakarta.apache.org/taglibs/standard/permittedTaglibs</taglib-uri>\n\
        <taglib-location>/WEB-INF/lib/jstl.jar</taglib-location>\n\
    </taglib>\n\
  </jsp-config>\n\
' /usr/local/tomcat/conf/web.xml


# WAR 파일 복사
COPY --from=admin-builder /app/Admin/target/admin-server-0.0.1-SNAPSHOT.war webapps/ROOT.war

# 🛠️ WAR 파일 압축 해제
RUN mkdir -p /usr/local/tomcat/webapps/ROOT && \
    unzip webapps/ROOT.war -d webapps/ROOT && \
    rm -f webapps/ROOT.war

# 📂 lib-provided에서 lib으로 파일 이동 (WAR 압축 해제 후 실행)
RUN if [ -d "/usr/local/tomcat/webapps/ROOT/WEB-INF/lib-provided" ]; then \
        cp -r /usr/local/tomcat/webapps/ROOT/WEB-INF/lib-provided/* /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/; \
    fi

# Tomcat 실행
CMD ["catalina.sh", "run"]


