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

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/index.html /var/www/html/index.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
