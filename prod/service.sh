#!/usr/bin/env bash



docker network create \
  --driver=overlay \
  --subnet=192.168.10.0/24 \
  --attachable \
  app