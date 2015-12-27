FROM koolay/alpine-java:latest

MAINTAINER koolay
ENV LOGSTASH_HOME /opt/logstash
RUN curl -s -o /tmp/logstash.tar.gz https://download.elastic.co/logstash/logstash/logstash-2.1.1.tar.gz
RUN cd /tmp && tar -zxf logstash.tar.gz
RUN mkdir /opt && mv /tmp/logstash-2.1.1 $LOGSTASH_HOME
RUN chmod +x -R ${LOGSTASH_HOME}/bin/plugin
RUN apk add --update bash

ENV JAVA_OPTS ""
RUN ${LOGSTASH_HOME}/bin/plugin install logstash-input-beats
RUN ${LOGSTASH_HOME}/bin/plugin update logstash-input-beats
RUN ${LOGSTASH_HOME}/bin/plugin install logstash-output-influxdb
RUN ${LOGSTASH_HOME}/bin/plugin update logstash-output-influxdb

ADD conf /etc/logstash
ADD init.sh /opt/init
RUN chmod +x /opt/init

RUN mkdir -p /etc/service/logstash
ADD run.sh /etc/service/logstash/run
RUN chmod +x /etc/service/logstash/run
ENTRYPOINT ["/opt/init"]
CMD ["s6-svscan", "-t0", "/etc/service"]
