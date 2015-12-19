FROM phusion/baseimage
MAINTAINER koolay

ENV TELEGRAF_VERSION 0.2.4
RUN curl -s -o /tmp/telegraf_latest_amd64.deb http://get.influxdb.org/telegraf/telegraf_${TELEGRAF_VERSION}_amd64.deb && \
  dpkg -i /tmp/telegraf_latest_amd64.deb && \
  rm /tmp/telegraf_latest_amd64.deb

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY telegraf.toml /config/telegraf.toml

RUN mkdir -p /etc/service/telegraf
COPY run.sh /etc/service/telegraf/run
RUN chmod +x /etc/service/telegraf/run

ENV INFLUXDB_HOST **None**

CMD ["/sbin/my_init"]
