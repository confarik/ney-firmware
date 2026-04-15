#!/bin/bash
# Ney Firmware Auto-Installer

if [ "$(id -u)" -ne 0 ]; then
  echo "[-] Please run as root (use sudo)"
  exit 1
fi

echo "[*] Synchronizing system clock to prevent APT signature errors..."
# Fallback time sync if NTP is failing (reads standard HTTP Date header)
date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep -i Date: | sed 's/^[ \t]*Date:[ \t]*//g')" 2>/dev/null || true

echo "[*] Updating system sources..."
apt-get update -y
apt-get install curl jq -y

echo "[*] Downloading Ney Firmware DEB package..."
curl -sLOO https://github.com/confarik/ney-firmware/raw/refs/heads/main/ney-firmware_1.0.deb

echo "[*] Installing Ney Firmware package..."
dpkg -i ney-firmware_1.0.deb || true

echo "[*] Resolving dependencies and drivers (this may take 5-10 minutes)..."
apt-get --fix-broken install -y

echo "[*] Initializing Network Interfaces and Bridges..."
# Using yes to automatically pass 'y' to resetney
yes y | resetney || true

echo "========================================="
echo "[+] SUCCESS: Ney Firmware is installed & armed!"
echo "[+] You can now type 'i' at any time to open the menu."
echo "========================================="
