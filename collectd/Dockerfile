FROM phusion/baseimage
MAINTAINER koolay

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends build-essential

RUN apt-get install -yq libcurl4-gnutls-dev tcpdump

RUN curl -s -o /tmp/collectd.tar.bz2 https://collectd.org/files/collectd-5.5.0.tar.bz2
RUN cd /tmp && tar -jxf collectd.tar.bz2 \
    && cd collectd* \
    && ./configure && make all install

RUN apt-get remove --purge -y build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD collectd.conf /opt/collectd/etc/collectd.conf
RUN mkdir -p /etc/service/collectd
COPY run.sh /etc/service/collectd/run
RUN chmod +x /etc/service/collectd/run

ADD init.sh /etc/my_init.d/init.sh
RUN chmod +x /etc/my_init.d/init.sh
CMD ["/sbin/my_init"]
