#!/bin/bash -x

if [[ -f /etc/default/docker ]]; then
  echo "Setting DNS to 192.84.137.2"
  echo "DOCKER_OPTS="--dns 192.84.137.2 --dns 8.8.8.8 --dns 8.8.4.4"" >> /etc/default/docker
else
  echo "File not found, perhaps on a not ubuntu-based distro..."
fi

echo "restarting docker daemon..."
service docker stop > /dev/null 2>&1
[[ ! service docker start ]] && echo "couldn't, please start/restart it manually..."

