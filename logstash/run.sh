#!/bin/bash

set -e

unset JAVA_OPTS
echo "start logstash .."
exec $LOGSTASH_HOME/bin/logstash -f /etc/logstash
