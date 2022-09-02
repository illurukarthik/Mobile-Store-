FROM openjdk:8-jdk-alpine
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
COPY target/mobilestore-0.0.1-SNAPSHOT.jar mobilestore-0.0.1-SNAPSHOT.jar
EXPOSE 8099
ENTRYPOINT ["java","-jar","mobilestore-0.0.1-SNAPSHOT.jar"]
