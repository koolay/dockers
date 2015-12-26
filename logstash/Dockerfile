FROM koolay/alpine-java:latest

MAINTAINER koolay

ENV LOGSTASH_PATH /opt/logstash
RUN mkdir -p ${LOGSTASH_PATH}
RUN curl -s -o /tmp/logstash.tar.gz https://download.elastic.co/logstash/logstash/logstash-2.1.1.tar.gz
RUN ls -al /tmp
RUN cd /tmp && tar -zxf logstash.tar.gz && ls /tmp && mv logstash-2.1.1 ${LOGSTASH_PATH}

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
