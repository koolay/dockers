#!/bin/sh
echo "start php5-fpm ..."
exec /usr/sbin/php5-fpm -F > /dev/stdout 2>&1
