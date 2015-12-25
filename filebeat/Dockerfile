FROM phusion/baseimage
MAINTAINER koolay

ENV DEBIAN_FRONTEND noninteractive

ENV FILEBEAT_VERSION=1.0.1

RUN curl https://download.elastic.co/beats/filebeat/filebeat-${FILEBEAT_VERSION}-x86_64.tar.gz -O /tmp/filebeat.tar.gz \
    && cd /tmp

RUN tar xzvf filebeat.tar.gz \
    && cd filebeat-* && cp filebeat /usr/local/bin/ \
    && chmod +x /usr/local/bin/filebeat

# clean

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD filebeat.yml
RUN mkdir -p /etc/service/filebeat
COPY run.sh /etc/service/filebeat/run
RUN chmod +x /etc/service/filebeat/run

CMD ["/sbin/my_init"]
