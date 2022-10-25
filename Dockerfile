FROM openjdk:17-jdk-slim-buster
WORKDIR /app


CMD echo $(ls)

COPY /target/* build/lib/

COPY /target/discovery-service-0.0.1-SNAPSHOT.jar build/app.jar

WORKDIR /app/build
ENTRYPOINT java -jar app.jar