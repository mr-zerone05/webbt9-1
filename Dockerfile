# ---------- STAGE 1: build WAR ----------
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app

# copy sources (pom + src + webapp)
COPY pom.xml .
COPY src ./src
# nếu có file khác (webapp in root), copy toàn bộ
COPY . .

# Build artifact (ROOT.war)
RUN mvn -B clean package -DskipTests

# ---------- STAGE 2: runtime Tomcat ----------
FROM tomcat:11.0.10-jdk17-temurin AS runtime
ENV CATALINA_HOME=/usr/local/tomcat
WORKDIR $CATALINA_HOME

# remove default webapps
RUN rm -rf $CATALINA_HOME/webapps/*

# copy WAR built from previous stage -> ROOT.war
COPY --from=build /app/target/ROOT.war $CATALINA_HOME/webapps/ROOT.war

# prepare server.xml.template (disable shutdown port and keep ${PORT})
RUN sed -e 's/port="8005"/port="-1"/' $CATALINA_HOME/conf/server.xml \
    | sed -e 's/port="8080"/port="${PORT}"/' > $CATALINA_HOME/conf/server.xml.template \
    && rm -f $CATALINA_HOME/conf/server.xml

# install envsubst and tidy tools for the entrypoint
RUN apt-get update \
    && apt-get install -y --no-install-recommends gettext-base procps curl \
    && rm -rf /var/lib/apt/lists/*

# copy entrypoint
COPY docker-entrypoint.sh $CATALINA_HOME/docker-entrypoint.sh
RUN chmod +x $CATALINA_HOME/docker-entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["./docker-entrypoint.sh"]







