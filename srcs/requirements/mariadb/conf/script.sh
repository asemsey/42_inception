#!/bin/bash

cat << EOF > db.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES on \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

mysqld --user=mysql --bootstrap < db.sql
rm -f db.sql

exec /usr/sbin/mysqld --datadir=/var/lib/mysql --user=mysql
