#!/bin/sh
echo "start php5-fpm ..."
exec /sbin/setuser app /usr/sbin/php-fpm5.6 -F > /dev/stdout 2>&1
