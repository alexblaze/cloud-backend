# Cloudflare Pages Deployment Setup

## Problem Solved ✅

The error `mvn: not found` occurred because Cloudflare Pages doesn't have Maven installed by default. We've configured a **GitHub Actions workflow** to build the JAR first, then deploy to Cloudflare.

---

## Setup Steps

### Step 1: Add GitHub Secrets

1. Go to your GitHub repository
2. Settings → Secrets and variables → Actions
3. Add these secrets:
   ```
   CLOUDFLARE_API_TOKEN     (your Cloudflare API token)
   CLOUDFLARE_ACCOUNT_ID    (your Cloudflare account ID)
   ```

**How to get these:**
- API Token: https://dash.cloudflare.com/profile/api-tokens
- Account ID: https://dash.cloudflare.com (shown in sidebar or URL)

### Step 2: Push to GitHub

```bash
cd /Users/sanzay/Desktop/Projects/cloud-backend

# Initialize git (if not done)
git init

# Add all files
git add .

# Commit
git commit -m "Configure Cloudflare Pages deployment with GitHub Actions"

# Add remote and push
git remote add origin https://github.com/YOUR_USERNAME/cloud-backend.git
git branch -M main
git push -u origin main
```

### Step 3: Connect Cloudflare Pages

1. Go to https://dash.cloudflare.com
2. Navigate to **Pages**
3. Click **Create a project**
4. Choose **Connect to Git**
5. Select your GitHub repository `cloud-backend`
6. **Build settings:**
   - Framework preset: `None`
   - Build command: `(leave empty - handled by GitHub Actions)`
   - Build output directory: `(leave empty)`
7. Click **Save and Deploy**

---

## How It Works

```
Your Push to GitHub
       ↓
GitHub Actions Workflow Triggered
       ↓
✅ Build JAR with Maven (on GitHub runner with Java/Maven)
✅ Run Tests
✅ Upload Artifact
       ↓
Deploy to Cloudflare Pages
       ↓
Your API Live! 🎉
```

**Workflow file:** `.github/workflows/build-deploy.yml`

---

## API Endpoints

Once deployed, your API will be available at:

```
https://cloud-backend.pages.dev/api/hello
https://cloud-backend.pages.dev/api/health
https://cloud-backend.pages.dev/api/
```

Test with:
```bash
curl https://cloud-backend.pages.dev/api/hello
# Response: "Hello"
```

---

## Troubleshooting

### GitHub Actions Build Fails
1. Check Actions tab in GitHub
2. Click failed workflow
3. View build logs
4. Common issues:
   - Java not found: Ensure `setup-java@v4` step runs first
   - Maven cache issue: Clear cache and retry

### Cloudflare Deployment Fails
1. Check deployment logs in Pages
2. Verify secrets are set correctly
3. Check API token permissions

### API Not Responding
1. Verify Cloudflare domain is configured
2. Check DNS records point to Cloudflare
3. Check firewall rules aren't blocking

---

## Configuration Files

| File | Purpose |
|------|---------|
| `.github/workflows/build-deploy.yml` | CI/CD pipeline - builds JAR and deploys |
| `wrangler.toml` | Cloudflare Pages configuration |
| `pom.xml` | Maven build configuration |

---

## Environment Variables

Set production environment variables in Cloudflare:

1. Go to Pages → Your Project → Settings
2. Environment variables section
3. Add for **Production:**
   - `SERVER_PORT`: `8080`
   - `LOG_LEVEL`: `INFO`

---

## Manual Deployment Alternative

If GitHub Actions isn't working, you can manually deploy:

```bash
# 1. Build locally
mvn clean package

# 2. Install Wrangler
npm install -g wrangler

# 3. Login
wrangler login

# 4. Deploy
wrangler pages deploy target/cloud-api-1.0.0.jar
```

---

## Next Steps

1. ✅ Push code to GitHub
2. ✅ Add Cloudflare secrets to GitHub
3. ✅ Connect Cloudflare Pages
4. ✅ Monitor first deployment
5. ✅ Test API endpoints

**Your Spring Boot API will be automatically built and deployed on every push to main!**

---

## Support

- [Cloudflare Pages Documentation](https://developers.cloudflare.com/pages/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
