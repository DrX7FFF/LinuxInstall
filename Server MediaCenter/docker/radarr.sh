#! /bin/bash

#   -p 7878:7878 \

# Optional Volumes:
#   -v /path/to/movies:/movies `#optional` \
#   -v /path/to/download-client-downloads:/downloads `#optional` \


docker run -d \
  --name=radarr \
  --network container:protonwire \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -v /storage/.config/dockers/radarr/data:/config \
  -v /var/media/HD1/radarr/movies:/movies \
  -v /var/media/HD1/radarr/download-client-downloads:/downloads \
  --restart unless-stopped \
  --platform linux/arm64 \
  lscr.io/linuxserver/radarr:latest
