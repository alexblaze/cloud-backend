#!/bin/bash
# Build and push Docker image to container registry

set -e

IMAGE_NAME="cloud-api"
IMAGE_TAG="latest"

echo "🔨 Building Docker image..."
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

echo "✅ Docker image built successfully!"
echo ""
echo "📦 Image details:"
echo "  Name: ${IMAGE_NAME}:${IMAGE_TAG}"
echo ""
echo "🚀 To run locally:"
echo "  docker run -p 8080:8080 ${IMAGE_NAME}:${IMAGE_TAG}"
echo ""
echo "📤 To push to registry (update your registry URL):"
echo "  docker tag ${IMAGE_NAME}:${IMAGE_TAG} your-registry/${IMAGE_NAME}:${IMAGE_TAG}"
echo "  docker push your-registry/${IMAGE_NAME}:${IMAGE_TAG}"
