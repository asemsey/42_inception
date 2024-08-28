FROM debian:bullseye

RUN apt-get update \
	&& apt-et install wget\
	php-fpm\
	php-mysql\
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/wp-config.sh /usr/local/bin/wp-config.sh

RUN chmod +x /usr/local/bin/wp-config.sh
RUN mkdir -p /run/php /var/www /var/log/php

EXPOSE 9000
CMD [ "/usr/local/bin/wp-config.sh" ]