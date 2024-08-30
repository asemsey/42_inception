FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y wget\
	php-fpm\
	php-mysql\
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf && \
	mkdir -p /run/php /var/www/html /var/log/php
COPY ./conf/wp-config.sh /usr/local/bin/wp-config.sh

RUN chmod +x /usr/local/bin/wp-config.sh

EXPOSE 9000
CMD [ "/usr/local/bin/wp-config.sh" ]