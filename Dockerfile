FROM maven:3.9.9-eclipse-temurin-11 AS build
WORKDIR /workspace
COPY pom.xml .
COPY src ./src
RUN mvn package

FROM eclipse-temurin:11-jre-alpine
WORKDIR /app
COPY --from=build /workspace/target/spring-boot-web.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
