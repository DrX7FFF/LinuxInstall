#! /bin/bash

echo "Public IP :"
curl http://192.168.1.102:8400/v1/publicip/ip

echo "Port Forwarded :"
curl http://192.168.1.102:8400/v1/openvpn/portforwarded

echo "DNS Status :"
curl http://192.168.1.102:8400/v1/dns/status

echo "Update Status :"
curl http://192.168.1.102:8400/v1/updater/status

# curl http://192.168.1.102:8400/v1/openvpn/status
