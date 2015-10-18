#!/usr/bin/env sh

set -eu

DOCKER_HOST_IP=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')
echo "$DOCKER_HOST_IP localhost" >> /etc/hosts

"$@"
