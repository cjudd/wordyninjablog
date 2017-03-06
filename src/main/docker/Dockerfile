FROM openjdk:8-jdk
VOLUME /tmp
ADD wordyninjablog.war app.war
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS="-Dspring.profiles.active=docker"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.war" ]