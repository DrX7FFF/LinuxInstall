#! /bin/bash

  # -p 8000:8000 \
  # -p 9666:9666 \

docker run -d \
  --name=pyload \
  --network container:vpn \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -e UMASK=000 \
  -v /storage/.config/dockers/pyload:/config \
  -v /media/HD1:/downloads  \
  --restart unless-stopped \
  --platform linux/arm64 \
  lscr.io/linuxserver/pyload-ng:arm64v8-latest
