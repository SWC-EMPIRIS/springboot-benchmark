# Build stage
FROM maven:3.8-openjdk-17 AS builder

ARG BRANCH=main
ARG REPO_URL=https://github.com/SWC-EMPIRIS/springboot-benchmark

WORKDIR /build

# Clone repository and build
RUN git clone -b ${BRANCH} ${REPO_URL} . && \
    mvn clean package

# Runtime stage
FROM openjdk:17-slim

WORKDIR /app

# Copy the built jar from builder stage
COPY --from=builder /build/target/benchmark.jar .

# Expose the application port (adjust if needed)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "benchmark.jar"]
