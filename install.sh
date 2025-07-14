#!/bin/bash

echo "[*] Installing required tools..."

go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

if [ ! -d "dirsearch" ]; then
  git clone https://github.com/maurosoria/dirsearch.git
fi

sudo apt update && sudo apt install -y nmap

echo "[✓] All tools installed successfully."
