#!/bin/bash
# Setup script for initial project configuration

echo "🔧 Setting up Cloud API project..."
echo ""

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. Please install Java 21 or higher."
    exit 1
fi

# Check Java version
JAVA_VERSION=$(java -version 2>&1 | grep -oP '(?<=version ")[^"]*' | cut -d'.' -f1)
echo "✅ Java version: $JAVA_VERSION found"

# Check if Maven is installed
if ! command -v mvn &> /dev/null; then
    echo "❌ Maven is not installed. Please install Maven 3.9 or higher."
    exit 1
fi

echo "✅ Maven found"
echo ""

# Make scripts executable
chmod +x run.sh
chmod +x build-docker.sh

echo "✅ Scripts made executable"
echo ""

# Build the project
echo "🏗️  Building project..."
mvn clean package -DskipTests

echo ""
echo "✅ Setup completed successfully!"
echo ""
echo "📚 Next steps:"
echo "  1. Run locally: ./run.sh"
echo "  2. Build Docker: ./build-docker.sh"
echo "  3. Push to Git: git push origin main"
echo ""
