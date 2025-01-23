#! /bin/bash

#   -p 9696:9696 \

docker run -d \
  --name prowlarr \
  --network container:vpn \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -v /storage/.config/dockers/prowlarr/data:/config \
  --restart unless-stopped \
  --platform linux/arm64 \
  lscr.io/linuxserver/prowlarr:latest
