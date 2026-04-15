# Linux Ney Firmware

Ney Firmware is a powerful, flexible Linux network routing and VPN tunneling toolkit. 
Fully optimized and completely decoupled from legacy SHC compile constraints, offering universal OS compatibility.

## Modules Included:
- `ssney` / `wgney` / `ovpnney` (Shadowsocks, Wireguard, OpenVPN Handlers)
- `wifiney` (HostAPD / WLAN bridging)
- `infoney` (TUI Data Dashboard)
- `ipney` / `macney` (Routing & Subnet rules)

## Preparation (Crucial for DKMS Drivers):
On a fresh Raspberry Pi OS image, you MUST update the system kernel headers before installing to ensure the Wi-Fi USB dongle drivers compile successfully.
```bash
sudo apt-get update && sudo apt-get upgrade -y
sudo reboot
```

## Installation:
After the reboot, reconnect and download the installer:
```bash
curl -sL https://raw.githubusercontent.com/confarik/ney-firmware/main/install.sh | sudo bash
```

## Contact
Telegram: @confxwho
