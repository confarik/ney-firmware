#!/bin/bash
# Ney Firmware Auto-Installer

if [ "$(id -u)" -ne 0 ]; then
  echo "[-] Please run as root (use sudo)"
  exit 1
fi

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
