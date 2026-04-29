# Deployment Guide

This guide explains how to deploy the Spring Boot API to Cloudflare.

## Prerequisites

- GitHub account with the repository pushed
- Cloudflare account with domain
- Docker container registry access (Docker Hub, GitHub Container Registry, etc.)

## Deployment Options

### Option 1: Cloudflare Pages + Docker (Recommended)

1. **Build and Push Docker Image**
   ```bash
   # Build locally
   docker build -t your-registry/cloud-api:latest .
   
   # Push to registry
   docker push your-registry/cloud-api:latest
   ```

2. **Deploy to Cloudflare Pages**
   - Go to Cloudflare Dashboard
   - Navigate to Pages
   - Create a new project
   - Connect your GitHub repository
   - Set build settings:
     - Build command: `mvn clean package`
     - Build output: `target`
   - Deploy

### Option 2: Using GitHub Actions CI/CD

The repository includes GitHub Actions workflows that automatically:
- Build the project
- Run tests
- Create Docker image
- Notify when ready for deployment

#### Setup:

1. **Add Cloudflare Secrets to GitHub**
   ```
   Go to: Settings → Secrets and variables → Actions
   Add:
   - CLOUDFLARE_API_TOKEN
   - CLOUDFLARE_ACCOUNT_ID
   - CLOUDFLARE_ZONE_ID (optional)
   ```

2. **Push to Main Branch**
   ```bash
   git add .
   git commit -m "Deploy to Cloudflare"
   git push origin main
   ```

3. **Monitor Deployment**
   - Check GitHub Actions tab
   - Verify workflows complete successfully
   - Check Cloudflare Pages for live deployment

### Option 3: Manual Deployment via Cloudflare CLI

1. **Install Wrangler CLI**
   ```bash
   npm install -g @cloudflare/wrangler
   ```

2. **Authenticate**
   ```bash
   wrangler login
   ```

3. **Deploy**
   ```bash
   wrangler deploy
   ```

## Environment Configuration

### Local Development
```bash
# Run with local configuration
./run.sh
```

### Production Deployment
Set these environment variables in Cloudflare:
- `SERVER_PORT=8080`
- `ENVIRONMENT=production`
- `LOG_LEVEL=INFO`

## Testing Deployment

Once deployed, test your endpoints:

```bash
# Replace with your Cloudflare domain
curl https://your-domain.com/api/hello
# Expected: "Hello"

curl https://your-domain.com/api/health
# Expected: "OK"

curl https://your-domain.com/actuator/health
# Expected: JSON health status
```

## Docker Registry Options

### GitHub Container Registry
```bash
# Login
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

# Build and tag
docker build -t ghcr.io/YOUR_USERNAME/cloud-api:latest .

# Push
docker push ghcr.io/YOUR_USERNAME/cloud-api:latest
```

### Docker Hub
```bash
# Login
docker login

# Build and tag
docker build -t your-username/cloud-api:latest .

# Push
docker push your-username/cloud-api:latest
```

## Troubleshooting

### Build Fails on Cloudflare
- Check Maven cache: `mvn clean`
- Verify Java version compatibility
- Check pom.xml for dependency issues

### Application Won't Start
- Check logs: Go to Pages → Deployments → View Details
- Verify port configuration (should be 8080)
- Check environment variables

### API Endpoints Not Accessible
- Verify domain DNS records point to Cloudflare
- Check firewall rules in Cloudflare
- Verify application is running: `/actuator/health`

## Scaling and Performance

- Monitor via Cloudflare Analytics
- Adjust JVM memory in Dockerfile:
  ```dockerfile
  ENTRYPOINT ["java", "-Xmx1024m", "-Xms512m", "-jar", "app.jar"]
  ```

## Security Best Practices

1. **Enable Cloudflare Security**
   - Enable WAF (Web Application Firewall)
   - Setup DDoS protection
   - Use Cloudflare security headers

2. **API Security**
   - Implement authentication (JWT/OAuth)
   - Add rate limiting
   - Use HTTPS only

3. **Secrets Management**
   - Never commit secrets to Git
   - Use GitHub Secrets for CI/CD
   - Use Cloudflare KV for runtime secrets

## Monitoring

Access monitoring endpoints:

```bash
# Health check
curl https://your-domain.com/actuator/health

# Application info
curl https://your-domain.com/actuator/info

# Cloudflare Analytics
# https://dash.cloudflare.com → your domain → Analytics
```

## Rollback

```bash
# Revert to previous deployment in Cloudflare Pages
# Go to Pages → Deployments → Select previous version → Rollback
```

## Support

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Cloudflare Pages Documentation](https://developers.cloudflare.com/pages/)
- [Docker Documentation](https://docs.docker.com/)
