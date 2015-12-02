#!/usr/bin/env sh

set -eu

DOCKER_HOST_IP=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')
echo "$DOCKER_HOST_IP dev.myapp.com" >> /etc/hosts

RUN sed 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf
RUN sed 's/;session.save_path = "/var/lib/php5"/;session.save_path=$DOCKER_HOST_IP:$MEMCACHED_PORT/' -i /etc/php5/fpm/php.ini

"$@"
