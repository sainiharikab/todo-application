# write your Docker file code here
# Use Maven to build the project

FROM maven:3.9.9-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean install

# Use Openjdk 17 to run the project
FROM openjdk:17-jdk-slim

WORKDIR /app
COPY --from=build /app/target/*.jar /app/todo-application.jar

EXPOSE 8081
CMD ["java", "-jar", "/app/todo-application.jar"]
