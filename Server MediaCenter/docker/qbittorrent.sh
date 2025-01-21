#! /bin/bash

docker run -d \
  --name qbittorrent \
  --network container:protonwire \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -e WEBUI_PORT=8082 \
  -e TORRENTING_PORT=6881 \
  -v /storage/.config/dockers/qbittorrent:/config \
  -v /var/media/HD1/torrent:/downloads \
  --restart unless-stopped \
  --platform linux/arm64 \
  lscr.io/linuxserver/qbittorrent:latest
