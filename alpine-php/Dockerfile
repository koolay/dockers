
FROM koolay/alpine-base:3.2

RUN apk --update --no-progress add build-base php-dev autoconf \
        php-fpm php-mcrypt php-curl php-gd php-json php-openssl \
        php-pdo_mysql php-pdo_sqlite php-phar php-iconv php-ctype php-memcache \
	&& rm -rf /var/cache/apk/* \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN wget http://xdebug.org/files/xdebug-2.3.3.tgz \
    && tar -zxvf xdebug-2.3.3.tgz && cd xdebug-2.3.3 \
    && phpize && ./configure --enable-xdebug && make && make install

RUN adduser -S www-data
RUN chown www-data:www-data /app
ADD fpm.service /etc/service/php-fpm/run
RUN chmod 775  -R /etc/service/php-fpm/

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
VOLUME ["/app"]
EXPOSE 9000
CMD ["s6-svscan", "-t0", "/etc/service"]

