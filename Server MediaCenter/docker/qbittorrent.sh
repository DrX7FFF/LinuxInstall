#! /bin/bash

  # -e TORRENTING_PORT=6881 \
  # -v /var/media/HD1/download:/downloads \
  # -e PUID=1000 \
  # -e PGID=1000 \
  # -v /storage/.config/dockers/downloads:/downloads \


source utils.sh

port=$(check_Port)
if [ $? -eq 0 ]; then
  echo "Port : $port"
else
  echo "Erreur lors du contrôle de Port."
  exit 1
fi

docker run -d \
  --name=qbittorrent \
  --network container:vpn \
  -e PUID=0 \
  -e PGID=0 \
  -e TZ=Europe/Paris \
  -e WEBUI_PORT=8082 \
  -e TORRENTING_PORT="$port" \
  -v /storage/.config/dockers/qbittorrent:/config \
  -v /media/HD1:/data \
  --restart unless-stopped \
  --platform linux/arm64 \
  lscr.io/linuxserver/qbittorrent:latest


# docker run -d \
#   --name=qbittorrent \
#   --network container:vpn \
#   -e PUID=0 \
#   -e PGID=0 \
#   -e TZ=Europe/Paris \
#   -e WEBUI_PORT=8082 \
#   -v /storage/.config/dockers/qbittorrent:/config \
#   -v /media/HD1/downloads:/data/downloads \
#   --restart unless-stopped \
#   --platform linux/arm64 \
#   lscr.io/linuxserver/qbittorrent:latest
