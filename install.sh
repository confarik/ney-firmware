#!/bin/bash
# Ney Firmware Installer

if [ "$(id -u)" -ne 0 ]; then
  echo "Please run as root (sudo ./install.sh)"
  exit 1
fi

echo "Installing Linux Ney Firmware..."
cp -r usr/bin/* /usr/bin/
chmod +x /usr/bin/*ney*

echo "Installation complete!"
echo "You can now run commands like: wifiney, ssney, wgney, infoney"
