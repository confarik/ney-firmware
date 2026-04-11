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

# Setting up global aliases
cat << 'ALIAS_EOF' > /etc/profile.d/ney_aliases.sh
alias i='infoney'
alias w='wifiney'
alias s='ssney'
alias reset='resetney'
ALIAS_EOF
chmod +x /etc/profile.d/ney_aliases.sh

echo "Installation complete!"
echo "Commands available: wifiney, ssney, wgney, infoney, ipney, resetney"
echo "Shortcuts: 'i' (Info/Menu), 'w' (WiFi), 's' (Shadowsocks), 'reset' (Kill-Switch)"
