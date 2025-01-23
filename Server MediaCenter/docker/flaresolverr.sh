#! /bin/bash

#   -p 8191:8191 \

docker run -d \
  --name=flaresolverr \
  --network container:vpn \
  -e LOG_LEVEL=info \
  --restart unless-stopped \
  --platform linux/arm64 \
  ghcr.io/flaresolverr/flaresolverr:latest
