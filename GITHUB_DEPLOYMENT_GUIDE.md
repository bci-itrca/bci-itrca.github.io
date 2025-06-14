# GitHub Pages Deployment Guide

Complete step-by-step guide to deploy your website to GitHub Pages using an organization.

## Prerequisites

- GitHub account
- Local website files
- Git installed on your system
- Command line access (Terminal/PowerShell/WSL)

## Table of Contents

1. [Create GitHub Organization](#1-create-github-organization)
2. [Create Repository](#2-create-repository)
3. [Generate Personal Access Token](#3-generate-personal-access-token)
4. [Initialize Local Repository](#4-initialize-local-repository)
5. [Push Local Files to GitHub](#5-push-local-files-to-github)
6. [Enable GitHub Pages](#6-enable-github-pages)
7. [Verify Deployment](#7-verify-deployment)
8. [Troubleshooting](#8-troubleshooting)

---

## 1. Create GitHub Organization

### Step 1.1: Access Organization Creation
1. **Sign in** to your GitHub account at [github.com](https://github.com)
2. **Click your profile picture** (top right corner)
3. **Select "Your organizations"** from the dropdown menu
4. **Click "New organization"** (green button)

### Step 1.2: Choose Plan
1. **Select "Create a free organization"**
2. **Click "Continue"**

### Step 1.3: Set Up Organization
1. **Organization account name:** Enter your desired name (e.g., `bci-itrca`)
   - Must be unique across GitHub
   - Will become part of your website URL
   - Cannot be easily changed later
2. **Contact email:** Enter your email address
3. **This organization belongs to:** Select "My personal account"
4. **Click "Next"**

### Step 1.4: Complete Setup
1. **Skip member invitation** by clicking "Complete setup"
2. **Skip the survey** or fill it out (optional)
3. **Your organization is now created!**

---

## 2. Create Repository

### Step 2.1: Create New Repository
1. **In your organization**, click "Create a new repository"
2. **Repository name:** `[organization-name].github.io`
   - Example: `bci-itrca.github.io`
   - Must match organization name exactly
3. **Description:** (Optional) "Publication website for iTRCA"
4. **Visibility:** Select "Public" (required for free GitHub Pages)
5. **Initialize options:** Leave all unchecked for now
6. **Click "Create repository"**

### Step 2.2: Note Repository Details
- Repository URL: `https://github.com/[org-name]/[org-name].github.io`
- Future website URL: `https://[org-name].github.io`

---

## 3. Generate Personal Access Token

### Step 3.1: Navigate to Token Settings
1. **Click your profile picture** → "Settings"
2. **Scroll down** to "Developer settings" (bottom left sidebar)
3. **Click "Personal access tokens"** → "Tokens (classic)"
4. **Click "Generate new token"** → "Generate new token (classic)"

### Step 3.2: Configure Token
1. **Note:** Enter descriptive name (e.g., "GitHub Pages Deployment")
2. **Expiration:** Choose duration
   - 30 days (more secure)
   - 90 days (balanced)
   - No expiration (less secure but convenient)
3. **Select scopes:** Check the following boxes:
   - ✅ **repo** (Full control of private repositories)
   - ✅ **workflow** (Update GitHub Action workflows)
   - ✅ **write:org** (Organization access - if needed)

### Step 3.3: Generate and Save Token
1. **Click "Generate token"**
2. **⚠️ IMPORTANT:** Copy the token immediately and save it securely
3. **You will NOT be able to see this token again**

---

## 4. Initialize Local Repository

### Step 4.1: Navigate to Your Project Folder
```bash
# Navigate to your website folder
cd /path/to/your/website/folder

# For WSL users (example path):
cd ~/personalweb/PublicationWeb/iTRCA
```

### Step 4.2: Check Current Git Status
```bash
# Check if git is already initialized
git status

# If git is not initialized, you'll see: "not a git repository"
# If git exists, you'll see current status
```

### Step 4.3: Initialize Git Repository (if needed)
```bash
# Initialize git repository (only if not already done)
git init

# Add all files to staging
git add .

# Make initial commit
git commit -m "Initial commit - iTRCA publication website"
```

### Step 4.4: Set Up Remote Repository

#### Check and Update Remote
```bash
# Check current remote configuration
git remote -v

# If remote already exists, update it to point to your new repository
git remote set-url origin https://github.com/[org-name]/[org-name].github.io.git

# Example:
git remote set-url origin https://github.com/bci-itrca/bci-itrca.github.io.git

# If no remote exists, add it
git remote add origin https://github.com/[org-name]/[org-name].github.io.git

# Verify the setup
git remote -v
```

### Step 4.5: Common Remote Errors

#### "fatal: remote origin already exists"
```bash
# Update the existing remote
git remote set-url origin https://github.com/[org-name]/[org-name].github.io.git
```

#### "fatal: No such remote 'origin'"
```bash
# Add remote for the first time
git remote add origin https://github.com/[org-name]/[org-name].github.io.git
```

---

## 5. Push Local Files to GitHub

### Step 5.1: Set Main Branch
```bash
# Ensure you're on main branch
git branch -M main
```

### Step 5.2: Push to GitHub
```bash
# Push files to GitHub
git push -u origin main
```

### Step 5.3: Authenticate
When prompted:
- **Username:** Your GitHub username (e.g., `alvishub`)
- **Password:** Paste your Personal Access Token (NOT your GitHub password)

### Step 5.4: Alternative Authentication Setup
```bash
# To store credentials for future use:
git config --global credential.helper store

# Then push (you'll only need to enter credentials once)
git push -u origin main
```

---

## 6. Enable GitHub Pages

### Step 6.1: Access Repository Settings
1. **Go to your repository** on GitHub
2. **Click "Settings"** tab (in the repository, not your profile)
3. **Scroll down** and click "Pages" in the left sidebar

### Step 6.2: Configure GitHub Pages
1. **Source:** Select "Deploy from a branch"
2. **Branch:** Select "main"
3. **Folder:** Select "/ (root)"
4. **Click "Save"**

### Step 6.3: Custom Domain (Optional)
If you have a custom domain:
1. **Custom domain:** Enter your domain name
2. **Enforce HTTPS:** Check this box (recommended)
3. **Click "Save"**

---

## 7. Verify Deployment

### Step 7.1: Check Build Status
1. **Go to "Actions" tab** in your repository
2. **Look for "pages build and deployment"** workflow
3. **Green checkmark** = successful deployment
4. **Red X** = deployment failed (check logs)

### Step 7.2: Access Your Website
1. **Wait 5-10 minutes** for initial deployment
2. **Visit your website:** `https://[org-name].github.io`
3. **Check Settings → Pages** for deployment status and URL

### Step 7.3: Verify File Structure
Ensure your repository contains:
```
your-repo/
├── index.html          # Main page (required)
├── static/
│   ├── css/
│   ├── js/
│   ├── images/
│   └── ...
└── other-files...
```

---

## 8. Troubleshooting

### Common Issues and Solutions

#### 8.1: "Fatal: remote origin already exists"
```bash
# Solution: Update existing remote
git remote set-url origin https://github.com/[org-name]/[org-name].github.io.git
```

#### 8.2: Authentication Failed
- **Problem:** Using GitHub password instead of Personal Access Token
- **Solution:** Use Personal Access Token as password
- **Generate new token** if needed (Section 3)

#### 8.3: Website Not Loading
- **Check:** Repository name matches `[org-name].github.io` exactly
- **Check:** `index.html` exists in root directory
- **Check:** All file paths in HTML are relative (not absolute)
- **Wait:** Initial deployment can take up to 10 minutes

#### 8.4: 404 Error on Website
- **Check:** Main HTML file is named `index.html`
- **Check:** File is in root directory, not in a subfolder
- **Check:** Repository is public

#### 8.5: Changes Not Reflecting
- **Wait:** Changes can take 5-10 minutes to propagate
- **Check:** Files were properly committed and pushed
- **Hard refresh:** Ctrl+F5 (Windows) or Cmd+Shift+R (Mac)

### Getting Help

#### Check Deployment Status
1. **Repository → Settings → Pages:** Shows current status
2. **Repository → Actions:** Shows build logs
3. **Repository → Environments:** Shows deployment history

#### Useful Commands
```bash
# Check git status
git status

# Check remote repositories
git remote -v

# Check recent commits
git log --oneline

# Force push (use carefully)
git push --force-with-lease origin main
```

---

## 9. Updating Your Website

### Step 9.1: Make Local Changes
1. **Edit your files** locally
2. **Test changes** locally if possible

### Step 9.2: Commit and Push Changes
```bash
# Add modified files
git add .

# Commit changes
git commit -m "Update website content"

# Push to GitHub
git push origin main
```

### Step 9.3: Verify Updates
1. **Check Actions tab** for successful deployment
2. **Wait 5-10 minutes** for changes to appear
3. **Visit your website** to confirm updates

---

## 10. Best Practices

### Security
- **Set token expiration** for better security
- **Don't share** your Personal Access Token
- **Use specific scopes** when creating tokens
- **Regenerate tokens** periodically

### File Management
- **Use relative paths** in HTML/CSS files
- **Optimize images** for web (compress large files)
- **Test locally** before pushing to GitHub
- **Use meaningful commit messages**

### Organization Management
- **Use descriptive organization names**
- **Set up proper member permissions**
- **Document your repositories**
- **Regular maintenance and updates**

---

## Quick Reference

### Key URLs
- **Organization:** `https://github.com/[org-name]`
- **Repository:** `https://github.com/[org-name]/[org-name].github.io`
- **Website:** `https://[org-name].github.io`
- **Settings:** Repository → Settings → Pages

### Essential Commands
```bash
# Setup
git init
git add .
git commit -m "Initial commit"
git remote add origin [URL]
git push -u origin main

# Updates
git add .
git commit -m "Update message"
git push origin main
```

### File Requirements
- **Main page:** `index.html` in root directory
- **Repository visibility:** Public (for free accounts)
- **Repository name:** Must match `[org-name].github.io`

---

**Last Updated:** June 2025
**For support:** Check GitHub's official documentation or community forums
