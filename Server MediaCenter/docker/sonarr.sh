#! /bin/bash

#   -v /path/to/downloadclient-downloads:/downloads `#optional` \
#   -p 8989:8989 \

docker run -d \
  --name=sonarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -v /storage/.config/dockers/sonarr/data:/config \
  -v /var/media/HD1/torrentTVShown:/tv \
  --restart unless-stopped \
  --platform linux/arm64 \
  lscr.io/linuxserver/sonarr:latest
