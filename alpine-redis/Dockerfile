
FROM koolay/alpine-base:3.2

# Install redis
RUN apk --update add redis && \
    rm -rf /var/cache/apk/* && \
    mkdir /data && \
    chown -R redis:redis /data && \
    echo -e "include /etc/redis-local.conf\n" >> /etc/redis.conf

ADD conf/redis.conf /etc/redis.conf
ADD conf/redis-local.conf /etc/redis-local.conf
ADD redis.service /etc/service/redis/run

RUN chmod 775  -R /etc/service/redis/
RUN chmod 775 /etc/redis-local.conf
RUN chmod 775 -R /etc/redis.conf && chmod 777 -R /etc/redis-local.conf

VOLUME ["/data"]

# Expose the ports for redis
EXPOSE 6379

# Run services located in /etc/service directory
CMD ["s6-svscan", "-t0", "/etc/service"]
