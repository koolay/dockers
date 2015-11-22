FROM phusion/baseimage
MAINTAINER koolay

RUN apt-get update
RUN apt-get install -y python-dev libxslt1-dev libxml2-dev libmysqlclient-dev patch
RUN curl -SL 'https://bootstrap.pypa.io/get-pip.py' | python \
    && pip install --no-cache-dir --upgrade pip==7.1.2

RUN apt-get install -y libffi-dev libssl-dev
RUN pip install -U wheel

RUN mkdir -p /conf /data /wheels

RUN pip wheel --wheel-dir=/wheels sentry[mysql] && pip install --find-links=/wheels sentry[mysql]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /wheels/*
COPY run /etc/service/sentry/run
ADD init.sh /etc/my_init.d/init.sh
RUN chmod +x /etc/service/sentry/run
RUN chmod +x /etc/my_init.d/init.sh

ADD sentry.conf.py /sentry.conf.py

EXPOSE 9876

CMD ["/sbin/my_init"]
