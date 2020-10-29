FROM openjdk:12

#maintainer
MAINTAINER "shiphub@decathlon.net"
ENV JAVA_OPTS=${JAVA_OPTS:-""}
ENV LOG_FOLDER=${LOG_FOLDER:-"/logs"}

ENV APP_TIMEZONE=UTC
ENV TZ=UTC

VOLUME ["${LOG_FOLDER}"]

ARG JAR_FILE

#indicate module
COPY target/server-0.0.1-SNAPSHOT.jar app.jar
COPY src/main/resources /usr/src/

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone
CMD java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar