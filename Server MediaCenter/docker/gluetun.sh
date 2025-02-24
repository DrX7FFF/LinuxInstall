#! /bin/bash

# https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/protonvpn.md
# https://github.com/qdm12/gluetun-wiki/blob/main/setup/advanced/vpn-port-forwarding.md
# https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-v3.1.x)
  # -e VPN_PORT_FORWARDING_UP_COMMAND=/bin/sh -c 'wget -O- --retry-connrefused --post-data "json={\"listen_port\":{{PORTS}}}" http://127.0.0.1:8080/api/v2/app/setPreferences 2>&1' \


docker run -d \
  --name=vpn \
  --cap-add NET_ADMIN \
  --device /dev/net/tun \
  -e VPN_SERVICE_PROVIDER=protonvpn \
  -e VPN_TYPE=wireguard \
  -e WIREGUARD_PRIVATE_KEY=uM/X6zSy5yX4q5b35IE7asKaghWp22APULlvUxFnx0U= \
  -e SERVER_COUNTRIES=France \
  -e PORT_FORWARD_ONLY=on \
  -e HTTP_CONTROL_SERVER_ADDRESS=':8080' \
  -e HTTP_CONTROL_SERVER_LOG=on \
  -e VPN_PORT_FORWARDING=on \
  -e VPN_PORT_FORWARDING_PROVIDER=protonvpn \
  -e VPN_PORT_FORWARDING_UP_COMMAND='/bin/sh -c "wget -O- --retry-connrefused --post-data \"json={\"listen_port\":${{PORTS}}}\" http://127.0.0.1:8082/api/v2/app/setPreferences 2>&1"' \
  -p 7878:7878 \
  -p 8000:8000 \
  -p 8080:8080/tcp \
  -p 8082:8082 \
  -p 8989:8989 \
  -p 9117:9117 \
  -p 9696:9696 \
  -p 51820:51820/udp \
  -v /storage/.config/dockers/gluetun:/gluetun \
  --restart unless-stopped \
  --platform linux/arm64 \
  qmcgaw/gluetun

# Inutile car recherche du serveur automatiquement
  # -e SERVER_HOSTNAMES="node-fr-15.protonvpn.net" \

# Gluetun
  # -p 8000:8000/tcp \ # API (Surement plus utile ...)

# wireguard
  # -p 51820:51820/udp \ # ???

# qBitTorrent
  # -p 8082:8082 \ # WEB GUI
# qBitTorrent mais pas exposé au LAN
  # -p 6881:6881 \
  # -p 6881:6881/udp \

# Jackett
  # -p 9117:9117 \ WEB GUI

# Radarr
  # -p 7878:7878 \ # WEB GUI

# Powlarr
#   -p 9696:9696 \ # WEB GUI

# Flaresolverr 
#   -p 8191:8191 \ # API (non utilisé sur le LAN)

# Sonarr
#   -p 8989:8989 \ WEB GUI

# Pyload
  # -p 8000:8000 \  # WEB GUI (non modificable)
  # -p 9666:9666 \  # Click and Load API (non utilisé)
