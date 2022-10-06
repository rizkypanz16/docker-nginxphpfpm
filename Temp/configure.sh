#!/bin/bash
sed -i 's/listen.owner = www-data/listen.owner = nginx/g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/listen.group = www-data/listen.group = nginx/g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/user = www-data/user = nginx/g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/group = www-data/group = nginx/g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.4/fpm/php.ini
