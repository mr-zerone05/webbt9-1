# ============================
# Bước 1: Build bằng Maven
# ============================
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ============================
# Bước 2: Deploy lên Tomcat
# ============================
FROM tomcat:11.0.10-jdk17-temurin
WORKDIR /usr/local/tomcat

# Xóa ứng dụng mặc định
RUN rm -rf ./webapps/*

# Copy WAR đã build sang Tomcat
COPY --from=build /app/target/ch09_ex1_download.war ./webapps/ROOT.war

# Render sẽ gán biến $PORT (ngẫu nhiên), Tomcat cần nghe trên port đó
ENV PORT=8080
EXPOSE ${PORT}

# Sửa file cấu hình server.xml để Tomcat dùng $PORT thay vì mặc định 8080
RUN sed -i 's/port="8080"/port="${PORT}"/' conf/server.xml

# Chạy Tomcat
CMD ["catalina.sh", "run"]




