
FROM koolay/alpine-base:3.2

RUN apk --update --no-progress add \
        php-fpm php-mcrypt php-curl php-gd php-json php-openssl \
        php-pdo_mysql php-pdo_sqlite php-phar php-iconv php-ctype \
	&& rm -rf /var/cache/apk/* \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN adduser -S www-data
#RUN addgroup -S www-data

ADD fpm.service /etc/service/php-fpm/run
RUN chmod 775  -R /etc/service/php-fpm/

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9000
CMD ["s6-svscan", "-t0", "/etc/service"]

