FROM phusion/baseimage
MAINTAINER koolay

RUN apt-get update
RUN apt-get install -y php5-dev php5-fpm php5-cli php5-memcached \
    php5-mysql php5-pgsql php5-sqlite php5-gd php5-json \
    php5-curl php5-intl php5-mcrypt php5-imagick php5-imap ca-certificates

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get install -y wget
RUN wget http://xdebug.org/files/xdebug-2.3.3.tgz \
    && tar -zxvf xdebug-2.3.3.tgz && cd xdebug-2.3.3 \
    && phpize && ./configure --enable-xdebug && make && make install

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /wheels/*
RUN mkdir /app && chown www-data:www-data /app
RUN mkdir -p /etc/service/fpm
COPY fpm.service /etc/service/fpm/run
RUN chmod +x /etc/service/fpm/run

ADD init.sh /etc/my_init.d/init.sh
RUN chmod +x /etc/my_init.d/init.sh

VOLUME ["/app"]
EXPOSE 9000
CMD ["/sbin/my_init"]

