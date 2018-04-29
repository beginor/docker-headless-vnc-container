#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
docker build --no-cache --rm --tag beginor/ubuntu-dev-vnc --file Dockerfile.ubuntu.xfce.vnc .
docker tag beginor/ubuntu-dev-vnc beginor/ubuntu-dev-vnc:$(date +%Y%m%d)
