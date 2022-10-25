#FROM openjdk:17-jdk-slim-buster
FROM maven:latest AS app

COPY pom.xml .

RUN mvn -B -f pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve

COPY . .

RUN mvn -B -s /usr/share/maven/ref/settings-docker.xml package -DskipTests


FROM openjdk:8-jdk as production

WORKDIR /app

COPY --from=app /target/ .

ENTRYPOINT ["java", "-jar", "/app/SimpleSpringBootWithDiscovery-0.0.1-SNAPSHOT.jar"]

#CMD ["--spring.profiles.active=blah"]