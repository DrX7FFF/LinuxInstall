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

# Powlarr
#   -p 9696:9696 \

# Flaresolverr 
#   -p 8191:8191 \

# Sonarr
#   -p 8989:8989 \

docker run -d \
  --name vpn \
  --cap-add NET_ADMIN \
  --device /dev/net/tun \
  -e VPN_SERVICE_PROVIDER=protonvpn \
  -e VPN_TYPE=wireguard \
  -e WIREGUARD_PRIVATE_KEY=uM/X6zSy5yX4q5b35IE7asKaghWp22APULlvUxFnx0U= \
  -e SERVER_COUNTRIES=France \
  -e SERVER_HOSTNAMES="node-fr-15.protonvpn.net" \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -p 7878:7878 \
  -p 8082:8082 \
  -p 8191:8191 \
  -p 8989:8989 \
  -p 9117:9117 \
  -p 9696:9696 \
  -p 51820:51820/udp \
  --restart unless-stopped \
  --platform linux/arm64 \
  qmcgaw/gluetun
