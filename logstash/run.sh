#!/bin/bash

set -e

echo "test logstash config .."
exec $LOGSTASH_Path/bin/logstash -f first-pipeline.conf --configtest
echo "start logstash .."
exec $LOGSTASH_Path/bin/logstash -f first-pipeline.conf
