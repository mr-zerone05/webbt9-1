# Bước 1: Build bằng Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Bước 2: Deploy lên Tomcat
FROM tomcat:11.0.10-jdk17-temurin
WORKDIR /usr/local/tomcat
RUN rm -rf webapps/*

# Copy WAR với tên mặc định (artifactId-version.war)
COPY --from=build /app/target/ch09_ex1_download-1.0-SNAPSHOT.war ./webapps/ch09_ex1_download.war

EXPOSE 8080
CMD ["catalina.sh", "run"]


