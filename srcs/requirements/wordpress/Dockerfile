FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y wget \
	php8.3 php-fpm php-mysql mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

# ...