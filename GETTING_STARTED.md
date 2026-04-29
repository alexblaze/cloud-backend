# Getting Started with Cloud API

## ✅ Project Setup Complete!

Your Spring Boot REST API is now ready for deployment to Cloudflare. Here's what's been created:

### 📦 What's Included

**Core Application:**
- Spring Boot 3.2 REST API with Java 21
- `/api/hello` endpoint returning "Hello"
- `/api/health` endpoint for health checks
- `/api/` root endpoint
- Spring Actuator endpoints for monitoring

**Build & Deployment:**
- Maven configuration (pom.xml)
- Docker support with multi-stage build
- Docker Compose for local development
- GitHub Actions CI/CD workflows
- Cloudflare Pages configuration

**Documentation:**
- README.md - Full documentation
- QUICKSTART.md - 5-minute quick start
- DEPLOYMENT.md - Cloudflare deployment guide
- This file (GETTING_STARTED.md)

**Helper Scripts:**
- `run.sh` - Run locally
- `build-docker.sh` - Build Docker image
- `setup.sh` - Initial setup

---

## 🚀 Quick Start

### 1. Run Locally (Development)

```bash
cd /Users/sanzay/Desktop/Projects/cloud-backend

# Option A: Using Maven
mvn spring-boot:run

# Option B: Using JAR
java -jar target/cloud-api-1.0.0.jar

# Option C: Using script
./run.sh
```

Then test:
```bash
curl http://localhost:8080/api/hello
# Response: "Hello"
```

### 2. Build Docker Image

```bash
# Option A: Using script
./build-docker.sh

# Option B: Using Docker command
docker build -t cloud-api:latest .
```

### 3. Run Docker Container

```bash
# Using docker-compose (easiest)
docker-compose up

# Or using docker directly
docker run -p 8080:8080 cloud-api:latest
```

### 4. Push to Git

```bash
# Initialize git (if not already done)
git init
git add .
git commit -m "Initial commit: Spring Boot Hello API"
git remote add origin https://github.com/YOUR_USERNAME/cloud-backend.git
git branch -M main
git push -u origin main
```

### 5. Deploy to Cloudflare Pages

1. Go to https://dash.cloudflare.com
2. Navigate to Pages
3. Click "Create a project" → "Connect to Git"
4. Select your repository
5. Build settings:
   - Build command: `mvn clean package`
   - Build output: `target`
6. Click "Save and Deploy"

**That's it!** Your API will be live at `https://your-domain.pages.dev/api/hello`

---

## 📁 Project Structure

```
cloud-backend/
│
├── src/
│   ├── main/
│   │   ├── java/com/example/api/
│   │   │   ├── CloudApiApplication.java       # Main Spring Boot app
│   │   │   └── controller/
│   │   │       └── HelloController.java       # REST endpoints
│   │   └── resources/
│   │       └── application.properties         # Configuration
│   │
│   └── test/
│       └── java/com/example/api/
│           └── CloudApiApplicationTests.java  # Unit tests
│
├── .github/
│   └── workflows/
│       ├── build-deploy.yml                   # CI/CD pipeline
│       └── test.yml                           # Test workflow
│
├── pom.xml                                    # Maven configuration
├── Dockerfile                                 # Docker image
├── docker-compose.yml                         # Docker Compose setup
├── wrangler.toml                              # Cloudflare config
│
├── run.sh                                     # Run locally script
├── build-docker.sh                            # Build Docker script
├── setup.sh                                   # Setup script
│
├── README.md                                  # Full documentation
├── QUICKSTART.md                              # Quick start guide
├── DEPLOYMENT.md                              # Deployment guide
├── GETTING_STARTED.md                         # This file
├── .env.example                               # Example env vars
└── .gitignore                                 # Git ignore rules
```

---

## 🔧 Configuration

### Application Properties
Edit `src/main/resources/application.properties`:

```properties
# Server
server.port=8080

# Logging
logging.level.root=INFO
logging.level.com.example.api=DEBUG

# Actuator
management.endpoints.web.exposure.include=health,info
```

### Environment Variables
Copy `.env.example` to `.env`:

```bash
cp .env.example .env
```

Edit `.env` with your settings:

```env
SERVER_PORT=8080
ENVIRONMENT=development
LOG_LEVEL=INFO
```

---

## 🧪 Testing

### Run Unit Tests

```bash
mvn test
```

### Manual API Testing

```bash
# Hello endpoint
curl http://localhost:8080/api/hello

# Health check
curl http://localhost:8080/api/health

# Root endpoint
curl http://localhost:8080/api/

# Actuator health info
curl http://localhost:8080/actuator/health
```

### Using Docker

```bash
# Run tests in Docker
docker-compose exec cloud-api mvn test

# Check logs
docker-compose logs -f cloud-api
```

---

## 📊 API Reference

| Endpoint | Method | Response | Purpose |
|----------|--------|----------|---------|
| `/api/hello` | GET | "Hello" | Main API endpoint |
| `/api/health` | GET | "OK" | Health status |
| `/api/` | GET | "Welcome to Cloud API" | Root endpoint |
| `/actuator/health` | GET | JSON | Detailed health info |
| `/actuator/info` | GET | JSON | Application info |

---

## 🔗 Deployment Options

### Option 1: Cloudflare Pages (Recommended) ⭐
- **Easiest setup**
- **Free hosting**
- **Automatic deploys from Git**
- Steps above in "Deploy to Cloudflare Pages"

### Option 2: Docker Registry + Hosting
- Build Docker image
- Push to Docker Hub or GitHub Container Registry
- Deploy to any hosting service (AWS, Azure, etc.)

### Option 3: Self-Hosted
- Build JAR with `mvn clean package`
- Run JAR on your server
- Use reverse proxy (Nginx) in front

---

## 🆘 Troubleshooting

### Port 8080 Already in Use
```bash
# Kill the process on port 8080
lsof -ti:8080 | xargs kill -9

# Or change port in application.properties
server.port=8081
```

### Build Fails
```bash
# Clean Maven cache
mvn clean

# Update dependencies
mvn dependency:resolve
```

### Docker Issues
```bash
# Check image
docker images | grep cloud-api

# Remove old images
docker rmi cloud-api:latest

# Build fresh
docker build -t cloud-api:latest .
```

### Application Won't Start
```bash
# Check logs
java -jar target/cloud-api-1.0.0.jar

# Verbose logging
JAVA_OPTS="-Xmx512m -Xms256m" java -jar target/cloud-api-1.0.0.jar
```

---

## 📚 Dependencies

**Spring Boot:**
- spring-boot-starter-web
- spring-boot-starter-actuator
- spring-boot-starter-test

**Java Version:** 21+
**Maven Version:** 3.9+
**Docker:** (Optional, for containerization)

---

## 🔐 Security Best Practices

1. **Never commit secrets**
   - Use `.env.example` as template
   - Add `.env` to `.gitignore`

2. **Use GitHub Secrets for CI/CD**
   - Store API tokens
   - Store credentials

3. **Enable Cloudflare Security**
   - Enable WAF
   - Setup DDoS protection
   - Use security headers

4. **Keep Dependencies Updated**
   ```bash
   mvn versions:display-dependency-updates
   ```

---

## 📈 Next Steps

1. **Add Authentication**
   - Implement JWT/OAuth
   - Secure endpoints

2. **Add Database**
   - Spring Data JPA
   - PostgreSQL/MySQL

3. **Add Validation**
   - Request validation
   - Error handling

4. **Monitor Performance**
   - Cloudflare Analytics
   - Application logs

5. **Scale Application**
   - Load balancing
   - Caching strategies

---

## 🎯 Checklist Before Going Live

- [ ] Source code pushed to GitHub
- [ ] Tests passing locally (`mvn test`)
- [ ] Docker image builds successfully
- [ ] API endpoints tested (`curl`)
- [ ] Cloudflare Pages connected
- [ ] Environment variables configured
- [ ] Monitoring/logging enabled
- [ ] Security headers configured
- [ ] README documentation complete
- [ ] HTTPS enabled on Cloudflare

---

## 📖 Documentation Links

- [Spring Boot Guide](https://spring.io/guides/gs/spring-boot/)
- [Maven Documentation](https://maven.apache.org/)
- [Docker Documentation](https://docs.docker.com/)
- [Cloudflare Pages](https://developers.cloudflare.com/pages/)
- [Java Documentation](https://docs.oracle.com/javase/)

---

## 💬 Support & Help

1. **Check Documentation**
   - README.md
   - QUICKSTART.md
   - DEPLOYMENT.md

2. **Review Logs**
   - Local: Application console output
   - Docker: `docker logs <container_id>`
   - Cloudflare: Pages → Deployments → View Details

3. **Common Issues**
   - Port conflicts: Change `server.port`
   - Build failures: Run `mvn clean`
   - Docker issues: Remove old images

---

## 🎉 You're Ready!

Your Spring Boot Cloud API is fully configured and ready for:
- ✅ Local development
- ✅ Docker containerization
- ✅ GitHub version control
- ✅ Cloudflare deployment
- ✅ CI/CD automation

**Start deploying:** Push to GitHub and watch Cloudflare automatically build and deploy!

```bash
git push origin main
```

Happy coding! 🚀
