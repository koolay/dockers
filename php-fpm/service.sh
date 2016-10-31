#!/bin/sh
echo "start php5-fpm ..."
exec /sbin/setuser app /usr/sbin/php5-fpm -F > /dev/stdout 2>&1
