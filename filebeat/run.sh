#!/bin/sh
echo start filebeat ..
exec /usr/local/bin/filebeat -e -c /filebeat.yml
