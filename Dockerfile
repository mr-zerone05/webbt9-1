# Bước 1: Build với Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Bước 2: Deploy vào Tomcat
FROM tomcat:11.0.10-jdk17-temurin
WORKDIR /usr/local/tomcat
RUN rm -rf webapps/*

# Copy WAR (đã đổi đúng tên)
COPY --from=build /app/target/ch09_ex1_download.war ./webapps/ch09_ex1_download.war

EXPOSE 8080
CMD ["catalina.sh", "run"]

