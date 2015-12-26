FROM koolay/alpine-java:latest

MAINTAINER koolay

ENV LOGSTASH_PATH /opt/logstash
ENV LOGSTASH_VERSION 2.1.1
RUN cd /tmp && wget https://download.elastic.co/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz
RUN tar -zxf logstash-${LOGSTASH_VERSION}.tar.gz && mv logstash-${LOGSTASH_VERSION} ${LOGSTASH_PATH}

RUN mkdir -p /etc/ssl/private/ && mkdir -p /etc/ssl/certs/
ADD logstash.crt /etc/ssl/certs/logstash.crt
ADD logstash.key /etc/ssl/private/logstash.key

RUN mkdir -p /etc/service/logstash
ADD run.sh /etc/service/logstash/run

RUN adduser -S logstash
RUN chown logstash -R /etc/ssl/private \
    && chown logstash -R /etc/ssl/certs \
    && chmod +x /etc/service/logstash/run

CMD ["s6-svscan", "-t0", "/etc/service"]
