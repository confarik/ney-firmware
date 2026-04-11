#!/bin/bash
# Ney Firmware Support Installer

if [ "$(id -u)" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

cd "$(dirname "$0")"

echo "Installing Linux Ney Firmware Dependencies..."
apt update
apt install -y fzf NetworkManager openvpn wireguard iptables vnstat resolvconf sudo curl wget jq

echo "Creating dummy structure for clean OS..."
mkdir -p /etc/NetworkManager/system-connections/
mkdir -p /etc/default
touch /etc/default/openvpn

echo "Installing Linux Ney Firmware Scripts..."
cp -r usr/bin/* /usr/bin/
chmod +x /usr/bin/*ney*

# Setting up global aliases
cat << 'ALIAS_EOF' > /etc/profile.d/ney_aliases.sh
alias i='iney'
alias w='wifiney'
alias s='ssney'
alias reset='resetney'
ALIAS_EOF
chmod +x /etc/profile.d/ney_aliases.sh

echo "Installation complete!"
echo "Commands available: wifiney, ssney, wgney, iney, ipney, resetney"
echo "Shortcuts: 'i' (Interactive Menu), 'w' (WiFi), 's' (Shadowsocks), 'reset' (Kill-Switch)"
