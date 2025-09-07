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

# Xóa webapp mặc định
RUN rm -rf ./webapps/*

# Copy WAR đã build sang ROOT.war
COPY --from=build /app/target/ROOT.war ./webapps/ROOT.war

# Render cấp cổng qua biến $PORT
ENV PORT=8080
EXPOSE ${PORT}

# Cài gettext để thay thế biến $PORT trong server.xml
RUN apt-get update && apt-get install -y gettext-base \
    && mv conf/server.xml conf/server.xml.template

CMD envsubst < conf/server.xml.template > conf/server.xml && catalina.sh run




