#!/bin/bash -x

if [[ -f /etc/default/docker ]]; then
  echo "Setting DNS to 192.84.137.2"
  sed -i -e 's/#DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"/DOCKER_OPTS="--dns 192.84.137.2 --dns 8.8.8.8 --dns 8.8.4.4"/g' /etc/default/docker
else
  echo "File not found, perhaps on a not ubuntu-based distro..."
fi
if [[ -f /etc/default/docker.io ]]; then
  echo "Setting DNS to 192.84.137.2"
  sed -i -e 's/#DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"/DOCKER_OPTS="--dns 192.84.137.2 --dns 8.8.8.8 --dns 8.8.4.4"/g' /etc/default/docker.io
else
  echo "File not found, perhaps on a not ubuntu-based distro..."
fi
echo "restarting docker daemon..."
service docker stop > /dev/null 2>&1
if ! service docker start; then
  echo "couldn't, please start/restart it manually..."
fi
