php fpm
------

## RUN

docker run --name fpm --restart=always -d \
    -v /etc/php/5.6/fpm/conf.d \
    -v ./conf:/etc/php/5.6/fpm \
    -v myproject:/home/app/webapp
    daocloud.io/koolay/php-fpm:5.6

## About config

- user

The image has an app user with UID 9999 and home directory /home/app. Your application is supposed to run as this user. Even though Docker itself provides some isolation from the host OS, running applications without root privileges is good security practice.
Your application should be placed inside /home/app.

- fpm

https://github.com/docker-library/php/blob/005bb88143b7c54a4f86818adca6e3214f406128/5.6/fpm/Dockerfile




