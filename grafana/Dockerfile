FROM phusion/baseimage
MAINTAINER koolay

ENV GRAFANA_VERSION 2.6.0

RUN apt-get update && \
    apt-get -y install libfontconfig wget adduser openssl ca-certificates && \
    apt-get clean && \
    wget https://grafanarel.s3.amazonaws.com/builds/grafana_${GRAFANA_VERSION}_amd64.deb -O /tmp/grafana.deb && \
    dpkg -i /tmp/grafana.deb && \
    rm /tmp/grafana.deb

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

RUN mkdir -p /etc/service/grafana
COPY run.sh /etc/service/grafana/run
RUN chmod +x /etc/service/grafana/run

CMD ["/sbin/my_init"]
