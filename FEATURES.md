# ✨ Features – Vuln Scanner

A powerful and automated domain reconnaissance & vulnerability scanning tool.

---

## 🔍 Subdomain Enumeration
- Uses **subfinder** to gather subdomains from multiple public sources.
- Outputs a clean list of subdomains for further probing.

## 🌐 Live Host Detection
- Filters **live subdomains** using **httpx**.
- Supports HTTPS, redirects, status codes, and more.

## 📂 Directory Enumeration
- Uses **dirsearch** to find hidden directories and files.
- Fast brute-forcing with customizable extensions like `.php`, `.html`, `.js`, etc.

## 📡 Port Scanning
- Scans for open ports using **nmap** (top 1000 ports).
- Detects basic services running on the host.

## ⚡ Vulnerability Scanning
- Runs **nuclei** with up-to-date community templates.
- Detects misconfigurations, outdated software, and known CVEs.

## 📁 Organized Output
- Creates a folder with all scans sorted:
