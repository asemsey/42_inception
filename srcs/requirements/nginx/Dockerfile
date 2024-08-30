FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y nginx \
	openssl \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/asemsey.crt \
	-keyout /etc/nginx/ssl/asemsey.key \
	-subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42 School/OU=asemsey/CN=asemsey/"

EXPOSE 443

COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]

# docker build -t my_nginx .
# docker run --rm -it -p 443:443 my_nginx
