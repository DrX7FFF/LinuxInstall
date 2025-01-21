#! /bin/bash

docker run -d \
  --name jackett \
  --network container:protonwire \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -e AUTO_UPDATE=true \
  -v /storage/.config/dockers/jackett:/config \
  -v /storage/.config/dockers/jackett/blackhole:/downloads \
  --restart unless-stopped \
  --platform linux/arm64 \
  lscr.io/linuxserver/jackett:latest
