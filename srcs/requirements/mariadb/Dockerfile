FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y mariadb-server &&\
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY ./conf/99-server.cnf /etc/mysql/mariadb.conf.d/99-server.cnf
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY ./conf/script.sh usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

EXPOSE 3306

CMD [ "/usr/local/bin/script.sh" ]

# docker build -t my_db .
# docker run --rm -it my_db
