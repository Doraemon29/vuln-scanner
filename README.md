# vuln-scanner
A bash script to scan domains using subfinder, httpx, dirsearch, nmap, and nuclei
# 🔍 Vuln Scanner

[![License](https://img.shields.io/github/license/Mrsdebug/vuln-scanner?color=green)](LICENSE)
[![Issues](https://img.shields.io/github/issues/Mrsdebug/vuln-scanner)](https://github.com/Mrsdebug/vuln-scanner/issues)
[![Stars](https://img.shields.io/github/stars/Mrsdebug/vuln-scanner?style=social)](https://github.com/Mrsdebug/vuln-scanner/stargazers)

A fully automated bash-based vulnerability scanning tool that uses:

- 🔎 `subfinder` – Subdomain discovery
- 🌐 `httpx` – Filter live subdomains
- 📂 `dirsearch` – Directory brute-forcing
- 📡 `nmap` – Port scanning
- ⚡ `nuclei` – Vulnerability scanning

---

## 🚀 Features

- Auto-scans subdomains for any domain
- Filters live hosts with HTTP services
- Bruteforces directories for hidden paths
- Performs fast port scans
- Scans known vulnerabilities using nuclei templates
- Generates organized results in a domain-based folder

---

## 🛠️ Installation

Make sure the following tools are installed:

```bash
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
git clone https://github.com/maurosoria/dirsearch.git
sudo apt install nmap -y
```

Then clone this repository:

```bash
git clone https://github.com/Mrsdebug/vuln-scanner.git
cd vuln-scanner
chmod +x Vuln-scan.sh
```

---

## 🧪 Usage

```bash
./vuln-scan.sh example.com
```

Results will be stored in a folder named `example.com_scan`.

---

## 📁 Output Structure

```
example.com_scan/
├── subdomains.txt       # All discovered subdomains
├── live.txt             # Live HTTP subdomains
├── dirsearch/           # Dirsearch results
├── nmap.txt             # Nmap port scan results
└── nuclei.txt           # Nuclei vulnerabilities
```

---


## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

## 🙋‍♀️ Author

Created with ❤️ by [Rutu](https://github.com/)
