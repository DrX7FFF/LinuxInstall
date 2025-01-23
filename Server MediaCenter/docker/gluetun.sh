#! /bin/bash

# https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/protonvpn.md


# wireguard
  # -p 51820:51820/udp \
# qBitTorrent
  # -p 8082:8082 \
  # -p 6881:6881 \
  # -p 6881:6881/udp \

# Jackett
  # -p 9117:9117 \

# Deluge
  # -p 8112:8112 \
  # -p 6881:6881 \
  # -p 6881:6881/udp \

# Radarr
  # -p 7878:7878 \

  
docker run -d \
  --name vpn \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  -e VPN_SERVICE_PROVIDER=protonvpn \
  -e VPN_TYPE=wireguard \
  -e WIREGUARD_PRIVATE_KEY=OIBT7avl5u6UWdDEJtq9CIKUW2wsLXXppNuH7tFmbkw= \
  -e SERVER_COUNTRIES=Netherlands \
  -e SERVER_HOSTNAMES="node-nl-149.protonvpn.net" \
  -p 51820:51820/udp \
  -p 9117:9117 \
  -p 8082:8082 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -p 7878:7878 \
  --restart unless-stopped \
  --platform linux/arm64 \
  qmcgaw/gluetun
