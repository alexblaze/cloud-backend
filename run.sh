#!/bin/bash
# Run the Spring Boot application locally

echo "🚀 Starting Spring Boot application..."
echo ""
echo "Building project..."
mvn clean package -DskipTests

echo ""
echo "✅ Build completed!"
echo ""
echo "Starting application on http://localhost:8080"
echo ""
echo "Available endpoints:"
echo "  - http://localhost:8080/api/hello"
echo "  - http://localhost:8080/api/health"
echo "  - http://localhost:8080/api/"
echo ""
echo "Press Ctrl+C to stop the application"
echo ""

mvn spring-boot:run
