# Bước 1: Build với Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy toàn bộ project vào container
COPY . .

# Clean và package ra file WAR
RUN mvn clean package -DskipTests

# Bước 2: Chạy với Tomcat
FROM tomcat:11.0.10-jdk17-temurin
WORKDIR /usr/local/tomcat

# Xóa các webapp mặc định (ROOT, examples…)
RUN rm -rf webapps/*

# Copy file WAR từ Maven build vào Tomcat
COPY --from=build /app/target/ch09_ex1_download-1.0-SNAPSHOT.war ./webapps/ch09_ex1_download.war

# Mở port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
