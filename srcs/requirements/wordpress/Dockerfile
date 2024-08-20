FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y wget \
	php-fpm php7.4 php-mysql mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xvf latest.tar.gz && rm latest.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

# docker build -t my_wp .
# docker run --rm -it my_wp