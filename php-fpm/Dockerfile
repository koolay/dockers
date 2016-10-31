FROM phusion/baseimage:0.9.19
MAINTAINER koolay

ENV LANG en_US.UTF-8
# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y --allow-unauthenticated --no-install-recommends \
    php5.6-dev php5.6-fpm php5.6-cli php5.6-memcached \
    php5.6-mysql php5.6-gd php5.6-json php5.6-ldap \
    php5.6-curl php5.6-intl php5.6-mcrypt php5.6-imagick php5.6-imap ca-certificates

RUN php5enmod mcrypt && php5enmod memcached

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -o /tmp/xdebug-2.3.3.tgz -fSL http://xdebug.org/files/xdebug-2.3.3.tgz \
    && cd /tmp ** tar -zxvf xdebug-2.3.3.tgz && cd xdebug-2.3.3 \
    && phpize && ./configure --enable-xdebug && make && make install

RUN apt-get -y purge firefox php7* && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /wheels/*
RUN mkdir -p /etc/service/fpm
COPY run.sh /etc/service/fpm/run
RUN sed 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf
COPY init.sh /etc/my_init.d/init.sh

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

VOLUME ["/home/app/webapp"]
