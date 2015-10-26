FROM koolay/alpine-base:3.2

EXPOSE 3306

RUN apk --update add mysql
RUN mkdir -p /opt/data/
RUN mkdir -p /etc/mysql/conf.d

RUN chown -R mysql /opt/data/
RUN chown -R mysql /etc/mysql/

ADD mysql.service /etc/service/mysql/run
RUN chmod 775 -R /etc/service/mysql/

VOLUME ["/opt/data"]
CMD ["s6-svscan", "-t0", "/etc/service"]
