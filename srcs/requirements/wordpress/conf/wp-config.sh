#!/bin/bash

cd /var/www/html

wp core download --allow-root

# wait for mariadb to start
sleep 10

# configure and install wordpress
wp config create	--allow-root --force \
	--url="$WP_URL" \
	--dbname="$SQL_DATABASE" \
	--dbuser="$SQL_USER" \
	--dbpass="$SQL_PASSWORD" \
	--dbhost="mariadb:3306"

wp core install	--allow-root \
	--url="$WP_URL" \
	--title="$WP_TITLE" \
	--admin_user="$WP_ADMIN" \
	--admin_password="$WP_ADMIN_PASS" \
	--admin_email="$WP_ADMIN_MAIL" \
	--skip-email

wp user create	--allow-root \
	$WP_USER_NAME $WP_USER_EMAIL \
	--user_pass="$WP_USER_PASS"

# run php-fpm
php-fpm7.4 -F