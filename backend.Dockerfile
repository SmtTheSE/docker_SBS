# Use Amazon Corretto 17 as the base image (multi-platform support)
FROM amazoncorretto:17-alpine-jdk

# Set working directory
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

# Make mvnw executable
RUN chmod +x ./mvnw

# Install Maven dependencies
RUN ./mvnw dependency:go-offline -B

# Copy the source code
COPY src src

# Expose port 8080
EXPOSE 8080

# Build the application
RUN ./mvnw clean package -DskipTests

# Run the application
ENTRYPOINT ["java", "-jar", "target/SBS_StudentServing_System-0.0.1-SNAPSHOT.jar"]