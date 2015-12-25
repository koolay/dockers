FROM phusion/baseimage
MAINTAINER koolay

ENV DEBIAN_FRONTEND noninteractive

ENV FILEBEAT_VERSION=1.0.1 \
    FILEBEAT_SHA1=e64858982da59721f4cb42c720faa3fff6ed937d

RUN curl https://download.elastic.co/beats/filebeat/filebeat-${FILEBEAT_VERSION}-x86_64.tar.gz -O /tmp/filebeat.tar.gz \
    && cd /tmp

RUN echo "${FILEBEAT_SHA1} filebeat.tar.gz" | sha1sum -c - \
    && tar xzvf filebeat.tar.gz \
    && cd filebeat-* && cp filebeat /usr/local/bin/ \
    && chmod +x /usr/local/bin/filebeat

# clean

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD filebeat.yml
RUN mkdir -p /etc/service/filebeat
COPY run.sh /etc/service/filebeat/run
RUN chmod +x /etc/service/filebeat/run

CMD ["/sbin/my_init"]
