# Stage 1: Build
FROM maven:3.9.4-eclipse-temurin-17 AS build

WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the rest of the project
COPY . .

# Compile and package with Shade plugin
RUN mvn package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the shaded jar from the build stage
COPY --from=build /app/target/sample-java-project-1.0.0.jar app.jar


# Run the shaded jar
ENTRYPOINT ["java", "-jar", "app.jar"]
