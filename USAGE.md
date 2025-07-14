# 🚀 Usage – Vuln Scanner

This guide explains how to install and use the `vuln-scan.sh` tool to perform automated reconnaissance and vulnerability scanning on a domain.

---

## 📦 Installation

Make sure these tools are installed before running the script:

```bash
# Install required tools using Go and apt
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo apt install nmap -y

# Clone dirsearch
git clone https://github.com/maurosoria/dirsearch.git
