FROM nginx:1.20.1

MAINTAINER rizkypanji6483@gmail.com

RUN apt-get update -y && \
    apt-get install -y nano wget gnupg gnupg1 gnupg2 nginx curl lsb-release apt-transport-https ca-certificates && \
    curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg && \
    sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' && \
    apt-get update -y && \
    export RUNLEVEL=1 && \
    apt-get install -y php7.4 php7.4-cli php7.4-common php7.4-opcache php7.4-curl php7.4-mbstring php7.4-mysql php7.4-zip php7.4-xml php7.4-gd php7.4-fpm && \
    php -v
RUN service php7.4-fpm start
RUN ps -aux | grep nginx
RUN mv /etc/php/7.4/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/www-default.conf
RUN mv /etc/php/7.4/fpm/php.ini /etc/php/7.4/fpm/php-default.ini
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY php.ini /etc/php/7.4/fpm/php.ini
RUN service php7.4-fpm restart

RUN mkdir -p /var/www/example.com
COPY example.com.conf /etc/nginx/conf.d/example.com.conf
RUN echo "<?php phpinfo(); ?>" >> /var/www/example.com/test.php

EXPOSE 80

ENTRYPOINT service php7.4-fpm start && service nginx start && bash


