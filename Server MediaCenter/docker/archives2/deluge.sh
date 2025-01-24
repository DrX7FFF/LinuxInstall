#! /bin/bash

#   -p 8112:8112 \
#   -p 6881:6881 \
#   -p 6881:6881/udp \
#   -p 58846:58846 #optional Deamon port \
#optional
#   -e DELUGE_LOGLEVEL=error  \

docker run -d \
  --name deluge \
  --network container:vpn \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -e DELUGE_LOGLEVEL=error \
  -v /storage/.config/dockers/deluge/config:/config \
  -v /var/media/HD1/torrent:/downloads \
  --restart unless-stopped \
  --platform linux/arm64 \
  lscr.io/linuxserver/deluge:latest
