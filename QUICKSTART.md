# Quick Start Guide

## ⚡ Quick Setup (5 minutes)

### 1. Install Dependencies
```bash
# Ensure Java 21 is installed
java -version

# If needed, install Java 21
# macOS: brew install openjdk@21
# Ubuntu: sudo apt-get install openjdk-21-jdk
```

### 2. Build Locally
```bash
mvn clean package
```

### 3. Run the Application
```bash
mvn spring-boot:run
# or use the script
./run.sh
```

### 4. Test the API
```bash
# In another terminal
curl http://localhost:8080/api/hello
# Response: "Hello"
```

## 🐳 Using Docker

### Build Docker Image
```bash
docker build -t cloud-api:latest .
# or use the script
./build-docker.sh
```

### Run Docker Container
```bash
docker run -p 8080:8080 cloud-api:latest
```

### Using Docker Compose
```bash
docker-compose up
```

## 📤 Push to Git

### Initial Setup
```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Spring Boot Hello API"

# Add remote (replace with your repository URL)
git remote add origin https://github.com/YOUR_USERNAME/cloud-backend.git

# Create main branch and push
git branch -M main
git push -u origin main
```

### Regular Updates
```bash
git add .
git commit -m "Your commit message"
git push origin main
```

## ☁️ Deploy to Cloudflare Pages

### Step 1: Connect Repository
1. Go to https://dash.cloudflare.com
2. Navigate to Pages
3. Click "Create a project"
4. Select "Connect to Git"
5. Choose your GitHub repository

### Step 2: Configure Build
- Build command: `mvn clean package`
- Build output directory: `target`
- Root directory: `/`

### Step 3: Deploy
- Click "Save and Deploy"
- Cloudflare will automatically build and deploy

### Step 4: Access Your API
```bash
# Replace with your Cloudflare domain
curl https://your-domain.pages.dev/api/hello
```

## 📁 Project Structure

```
cloud-backend/
├── src/
│   ├── main/java/com/example/api/
│   │   ├── CloudApiApplication.java      # Main app
│   │   └── controller/
│   │       └── HelloController.java      # REST endpoints
│   ├── main/resources/
│   │   └── application.properties        # Configuration
│   └── test/                             # Tests
├── Dockerfile                            # Docker image
├── docker-compose.yml                    # Docker compose
├── pom.xml                              # Maven dependencies
├── .github/workflows/                   # GitHub Actions
├── README.md                            # Documentation
├── DEPLOYMENT.md                        # Deployment guide
├── QUICKSTART.md                        # This file
├── run.sh                               # Run locally
├── build-docker.sh                      # Build Docker
└── setup.sh                             # Setup project
```

## 🛠️ Common Commands

| Command | Purpose |
|---------|---------|
| `mvn clean package` | Build JAR file |
| `mvn spring-boot:run` | Run locally |
| `mvn test` | Run tests |
| `./run.sh` | Quick start script |
| `docker build -t cloud-api:latest .` | Build Docker image |
| `docker run -p 8080:8080 cloud-api:latest` | Run Docker |
| `docker-compose up` | Run with docker-compose |
| `git push origin main` | Push to GitHub |

## 📊 API Endpoints

```
GET /api/hello                  → "Hello"
GET /api/health                 → "OK"
GET /api/                       → "Welcome to Cloud API"
GET /actuator/health           → JSON health info
GET /actuator/info             → JSON application info
```

## ✅ Verification Checklist

- [ ] Java 21 installed
- [ ] Maven builds successfully
- [ ] Local app runs on port 8080
- [ ] API endpoints respond correctly
- [ ] Docker image builds
- [ ] Repository pushed to GitHub
- [ ] Cloudflare Pages deployment triggered
- [ ] Live endpoints accessible

## 🔗 Useful Links

- [Spring Boot Starter Guide](https://spring.io/guides/gs/spring-boot/)
- [Cloudflare Pages Docs](https://developers.cloudflare.com/pages/)
- [Docker Documentation](https://docs.docker.com/)
- [Maven Documentation](https://maven.apache.org/)
- [Java Documentation](https://docs.oracle.com/javase/)

## 💡 Tips

1. **Local development**: Use `mvn spring-boot:run` for hot reload
2. **Docker testing**: Use `docker run -it cloud-api:latest` for interactive mode
3. **Debugging**: Set `logging.level.root=DEBUG` in application.properties
4. **Performance**: Adjust `-Xmx512m` in Dockerfile for your needs

## 🆘 Need Help?

1. Check [README.md](README.md) for detailed documentation
2. Review [DEPLOYMENT.md](DEPLOYMENT.md) for deployment issues
3. Check application logs: `docker logs <container-id>`
4. View GitHub Actions logs for build issues

---

**You're all set!** 🚀 Your Spring Boot API is ready for Cloudflare deployment.
