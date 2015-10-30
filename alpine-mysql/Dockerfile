FROM koolay/alpine-base:3.2

EXPOSE 3306

RUN addgroup -g 999 mysql && adduser -D  -G mysql -s /bin/false -u 999 mysql
RUN apk --update add mysql
RUN mkdir -p /opt/data/
RUN mkdir -p /etc/mysql/conf.d

RUN chown -R mysql:mysql /opt/data/
RUN chown -R mysql:mysql /etc/mysql/

ADD mysql.service /etc/service/mysql/run
RUN chmod 775 -R /etc/service/mysql/

VOLUME ["/opt/data"]
CMD ["s6-svscan", "-t0", "/etc/service"]
