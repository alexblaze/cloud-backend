# Cloud API - Spring Boot Application

A simple Spring Boot REST API that returns "Hello" as response, designed to be deployed on Cloudflare with Docker.

## Features

- ✅ Simple REST API endpoint (`/api/hello`)
- ✅ Health check endpoint (`/api/health`)
- ✅ Docker support for containerization
- ✅ Spring Boot 3.2 with Java 21
- ✅ Actuator endpoints for monitoring
- ✅ Unit tests included

## Project Structure

```
cloud-backend/
├── src/
│   ├── main/
│   │   ├── java/com/example/api/
│   │   │   ├── CloudApiApplication.java
│   │   │   └── controller/
│   │   │       └── HelloController.java
│   │   └── resources/
│   │       └── application.properties
│   └── test/
│       └── java/com/example/api/
│           └── CloudApiApplicationTests.java
├── Dockerfile
├── pom.xml
├── .gitignore
└── README.md
```

## Prerequisites

- Java 21 or higher
- Maven 3.9+
- Docker (for containerization)
- Git (for version control)

## Local Development

### Build the Project

```bash
mvn clean package
```

### Run Locally

```bash
mvn spring-boot:run
```

The application will start on `http://localhost:8080`

### Test the API

```bash
# Test hello endpoint
curl http://localhost:8080/api/hello

# Test health endpoint
curl http://localhost:8080/api/health

# Test root endpoint
curl http://localhost:8080/api/
```

### Run Tests

```bash
mvn test
```

## Docker

### Build Docker Image

```bash
docker build -t cloud-api:latest .
```

### Run Docker Container

```bash
docker run -p 8080:8080 cloud-api:latest
```

The application will be accessible at `http://localhost:8080/api/hello`

## API Endpoints

| Method | Endpoint | Response | Description |
|--------|----------|----------|-------------|
| GET | `/api/hello` | "Hello" | Returns simple hello message |
| GET | `/api/health` | "OK" | Health check endpoint |
| GET | `/api/` | "Welcome to Cloud API" | Root API endpoint |
| GET | `/actuator/health` | JSON | Spring Boot health endpoint |

## Deployment to Cloudflare

### Option 1: Docker on Cloudflare Pages (Using Pages Functions)

1. Create a Cloudflare Worker to proxy requests to your Docker container
2. Build and push the Docker image to your container registry
3. Deploy the container to your hosting service

### Option 2: Using GitHub Actions for CI/CD

The project is ready to use with GitHub Actions for automated builds and deployments.

### Steps to Deploy

1. **Push to Git**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Spring Boot Hello API"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/cloud-backend.git
   git push -u origin main
   ```

2. **Setup Cloudflare Integration**
   - Connect your GitHub repository to Cloudflare Pages
   - Configure build settings:
     - Build command: `mvn clean package`
     - Build output directory: `target`

3. **Deploy**
   - Push changes to your repository
   - Cloudflare will automatically trigger the build and deployment

## Environment Variables

Configure via `application.properties`:

```properties
server.port=8080
logging.level.root=INFO
```

## Monitoring and Health Checks

Spring Boot Actuator is enabled and provides:

- Health endpoint: `/actuator/health`
- Info endpoint: `/actuator/info`

## Troubleshooting

### Port Already in Use
```bash
# Change server.port in application.properties
server.port=8081
```

### Build Fails
```bash
# Clean Maven cache
mvn clean
mvn install
```

### Docker Build Issues
```bash
# Build with verbose output
docker build -t cloud-api:latest . --progress=plain
```

## Configuration Files

- `pom.xml` - Maven dependencies and build configuration
- `application.properties` - Spring Boot application configuration
- `Dockerfile` - Docker container configuration
- `.gitignore` - Git ignore patterns

## License

This project is open source and available under the MIT License.

## Support

For issues or questions, please check the Spring Boot documentation:
- [Spring Boot Official Documentation](https://spring.io/projects/spring-boot)
- [Spring REST Documentation](https://spring.io/guides/gs/rest-service/)
