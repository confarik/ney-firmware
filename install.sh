#!/bin/bash
# Ney Firmware Support Installer

if [ "$(id -u)" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

cd "$(dirname "$0")"

echo "Installing Linux Ney Firmware..."
cp -r usr/bin/* /usr/bin/
chmod +x /usr/bin/*ney*
chmod +x /usr/bin/infoney

echo "Installation complete!"
echo "Commands available: wifiney, ssney, wgney, infoney, ipney, resetney"
