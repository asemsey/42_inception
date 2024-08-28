#!/bin/bash

setup() {
    cat << EOF > db.sql
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\` ;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}' ;
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}' ;
FLUSH PRIVILEGES;
EOF
    mysqld --user=mysql --bootstrap < db.sql
    rm -f db.sql
}

# ---------------------------------------------------------------------

if [ ! -d "/var/lib/mysql/${SQL_DATABASE}" ]; then
    echo "running setup..."
	setup
fi

echo "ready :)"
exec /usr/sbin/mysqld --datadir=/var/lib/mysql --user=mysql
