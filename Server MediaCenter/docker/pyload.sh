#! /bin/bash

docker run -d \
  --name=pyload \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -e UMASK=000 \
  -p 8000:8000 \
  -p 9666:9666 \
  -v /storage/.config/dockers/pyload/config:/config \
  -v /var/media/HD1:/downloads  \
  --restart unless-stopped \
  lscr.io/linuxserver/pyload-ng:arm64v8-latest
