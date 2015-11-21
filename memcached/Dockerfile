FROM phusion/baseimage

MAINTAINER koolay

COPY run /etc/service/memcached/run
RUN chmod +x /etc/service/memcached/run

RUN apt-get update
RUN apt-get install -y memcached
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /wheels/*

EXPOSE 11211
CMD ["/sbin/my_init"]
