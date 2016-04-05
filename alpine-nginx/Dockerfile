#
# Nginx image
#

FROM daocloud.io/koolay/alpine-base:latest

# Nginx and Consul template version
ENV NGINX_VERSION=1.9.13 NGINX_HOME=/usr/share/nginx

# Build Nginx from source and install consul template
RUN \
  build_pkgs="build-base linux-headers openssl-dev pcre-dev wget zlib-dev" && \
  runtime_pkgs="ca-certificates openssl pcre zlib" && \
  apk --update add ${build_pkgs} ${runtime_pkgs}

RUN \
  cd /tmp && \
  wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
  tar xzf nginx-${NGINX_VERSION}.tar.gz && \
  cd /tmp/nginx-${NGINX_VERSION} && \
    ./configure \
        --prefix=${NGINX_HOME} \
        --conf-path=/etc/nginx/nginx.conf \
        --with-http_ssl_module \
        --with-http_gzip_static_module \
        --with-http_realip_module \
        --with-http_ssl_module \
        --with-http_addition_module \
        --with-http_sub_module \
        --with-http_dav_module \
        --with-http_flv_module \
        --with-http_mp4_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_random_index_module \
        --with-http_secure_link_module \
        --with-http_stub_status_module \
        --with-http_auth_request_module \
        --with-mail \
        --with-mail_ssl_module \
        --with-file-aio \
        --with-ipv6 \
        --with-threads \
        --with-stream \
        --with-stream_ssl_module \
        --with-http_v2_module \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --pid-path=/var/run/nginx.pid \
        --with-http_stub_status_module \
        --sbin-path=/usr/sbin/nginx && \
    make && \
    make install && \
    apk del ${build_pkgs} && \
    rm -rf /tmp/*

# Forward request and error logs to docker log collector
RUN mkdir -p /app/logs/ && mkdir -p /app/www/
RUN adduser -S www
RUN chown www -R /app && chown www -R /etc/nginx

#ADD conf/ /etc/nginx/

RUN ln -sf /dev/stdout /app/logs/access.log
RUN ln -sf /dev/stderr /app/logs/error.log

# Add Nginx
ADD nginx.service /etc/service/nginx/run
RUN chmod 775  -R /etc/service/nginx/

# Expose HTTP and HTTPS ports
EXPOSE 8080 443
VOLUME ["/app","/etc/nginx"]

# Run services located in /etc/service directory
CMD ["s6-svscan", "-t0", "/etc/service"]
