#! /bin/bash

docker run --rm \
  -v /storage/.config/dockers/gluetun:/gluetun \
  --platform linux/arm64 \
  qmcgaw/gluetun \
  format-servers -protonvpn --output /gluetun/servers-list.md