#!/bin/bash

# Check for domain argument
if [ -z "$1" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

DOMAIN=$1
OUTPUT_DIR="${DOMAIN}_scan"
SUBDOMAIN_FILE="$OUTPUT_DIR/subdomains.txt"
LIVE_FILE="$OUTPUT_DIR/live.txt"
DIRSEARCH_OUTPUT="$OUTPUT_DIR/dirsearch"
NMAP_OUTPUT="$OUTPUT_DIR/nmap.txt"
NUCLEI_OUTPUT="$OUTPUT_DIR/nuclei.txt"

# Create output directory
mkdir -p "$OUTPUT_DIR"
mkdir -p "$DIRSEARCH_OUTPUT"

echo "[+] Scanning Domain: $DOMAIN"
echo "[1] Running Subfinder..."
subfinder -d "$DOMAIN" -silent -o "$SUBDOMAIN_FILE"

echo "[2] Filtering live domains using httpx..."
httpx -silent -l "$SUBDOMAIN_FILE" -o "$LIVE_FILE"

echo "[3] Running Dirsearch on live subdomains..."
while read -r URL; do
  echo "[Dirsearch] Scanning $URL..."
  python3 dirsearch/dirsearch.py -u "$URL" -e php,html,js,txt -o "$DIRSEARCH_OUTPUT/$(echo $URL | sed 's|https\?://||').txt"
done < "$LIVE_FILE"

echo "[4] Running Nmap on live hosts (top 1000 ports)..."
while read -r URL; do
  HOST=$(echo $URL | awk -F/ '{print $3}')
  echo "[Nmap] Scanning $HOST..."
  nmap -T4 -F "$HOST" >> "$NMAP_OUTPUT"
done < "$LIVE_FILE"

echo "[5] Running Nuclei on live domains..."
nuclei -l "$LIVE_FILE" -o "$NUCLEI_OUTPUT"

echo ""
echo "===== Vulnerabilities Found (Nuclei Results) ====="
cat "$NUCLEI_OUTPUT"

echo ""
echo "[✓] Scan Completed. All results saved in: $OUTPUT_DIR"
