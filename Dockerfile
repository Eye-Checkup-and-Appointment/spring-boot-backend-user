# Use an official Maven runtime as a parent image
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Build the application with Maven
RUN mvn clean install -DskipTests
RUN mvn package

# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory to /app
WORKDIR /app

# Copy the JAR file from the build stage to the current directory
COPY --from=build /app/target/deployment.jar ./app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
