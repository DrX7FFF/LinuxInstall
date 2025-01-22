#! /bin/bash

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
  --name protonwire \
  --init \
  --cap-add=NET_ADMIN \
  --sysctl net.ipv4.conf.all.rp_filter=2 \
  --sysctl net.ipv6.conf.all.disable_ipv6=1 \
  -e PROTONVPN_SERVER="node-nl-96.protonvpn.net" \
  -e DEBUG=0 \
  -e KILL_SWITCH=1 \
  -e WIREGUARD_PRIVATE_KEY="OIBT7avl5u6UWdDEJtq9CIKUW2wsLXXppNuH7tFmbkw=" \
  --tmpfs /tmp \
  -p 51820:51820/udp \
  -p 9117:9117 \
  -p 8082:8082 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -p 7878:7878 \
  --restart unless-stopped \
  --platform linux/arm64 \
  ghcr.io/tprasadtp/protonwire:latest
