# Local Development Guide for Windows

This guide provides step-by-step instructions for setting up and running the academic project website locally on **Windows computers using WSL2 and Docker**.

## Prerequisites

Before starting, ensure you have:
- **Windows 10** (version 2004 and higher) or **Windows 11**
- **Administrator access** to your Windows computer
- **Stable internet connection** for downloads

> **Note**:  Ubuntu 20.04 LTS comes with **Python 3.8.10** pre-installed, which is the recommended version if you need Python for other development tasks.

## Step 1: Install WSL2 and Ubuntu

**Follow the official Microsoft guide to install WSL2 and Ubuntu 20.04 LTS:**

👉 **[Official WSL2 Installation Guide](https://learn.microsoft.com/en-us/windows/wsl/install)**

**Quick Summary:**
1. Open **PowerShell as Administrator**
2. Run: `wsl --install -d Ubuntu-20.04`
3. Restart your computer when prompted
4. Launch Ubuntu from Start Menu and create username/password

**Verify installation:**
```bash
wsl --version
# Should show WSL version 2.x.x
```

## Step 2: Install Docker Desktop

1. **Download**: [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/)
2. **Install** with default settings (ensure "Use WSL 2 instead of Hyper-V" is checked)
3. **Launch** Docker Desktop from Start Menu
4. **Enable WSL2 Integration**:
   - Go to Settings → Resources → WSL Integration
   - Enable integration with Ubuntu-20.04
   - Click Apply & Restart

**Verify installation** in your Ubuntu terminal:
```bash
docker --version
docker compose version
```

## Step 3: Run the Website

1. **Open Ubuntu terminal** and navigate to your project (that download from github):

2. **Start the website**:
```bash
docker compose up
```

3. **Open your browser** and go to: **http://localhost:8080**

4. **Stop the server** when done:
```bash
# Press Ctrl+C in terminal, or run:
docker compose down
```

## Development Workflow

- **Edit files** in `index.html` or `static/` folder
- **Save changes** - they appear immediately in browser
- **Refresh browser** to see updates
- **No server restart** needed

## Project Structure
```
Academic-project-page-template/
├── index.html              # Main webpage
├── static/
│   ├── css/               # Stylesheets
│   ├── images/            # Add your images here
│   ├── pdfs/              # Add PDFs here
│   └── videos/            # Add videos here
├── Dockerfile             # Docker configuration
└── docker-compose.yml    # Docker setup
```

## Common Issues & Solutions

### Docker Issues
- **"docker: command not found"** → Ensure Docker Desktop is running
- **"permission denied"** → Run: `sudo usermod -aG docker $USER` then restart terminal
- **"port already allocated"** → Use different port or stop conflicting services

### WSL2 Issues  
- **Can't access localhost:8080** → Try `127.0.0.1:8080` or check Windows Firewall
- **Slow performance** → Keep project in WSL2 filesystem (`/home/...` not `/mnt/c/...`)

### Website Issues
- **Blank page** → Check `index.html` exists and Docker container is running
- **Images not showing** → Verify files are in `static/images/` with correct names
- **Styling broken** → Check CSS files exist in `static/css/`

## Quick Commands

| Command | Purpose |
|---------|---------|
| `docker compose up` | Start website |
| `docker compose down` | Stop website |
| `docker compose logs` | View server logs |
| `wsl --version` | Check WSL2 version |

---

**Success Check**: If you can see your website at http://localhost:8080 with proper styling and images, everything is working correctly!
