#! /bin/bash

# https://github.com/Eiqnepm/portcheck

docker run -d \
  --name portcheck \
  --network container:vpn \
  -e QBITTORRENT_PORT=6881 \
  -e QBITTORRENT_WEBUI_PORT=8082 \
  -e QBITTORRENT_USERNAME="user" \
  -e QBITTORRENT_PASSWORD="406p4hh8BmOR0w" \
  --restart unless-stopped \
  --platform linux/arm64 \
  eiqnepm/portcheck:latest