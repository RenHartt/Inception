FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb_script.sh /mariadb_script.sh
RUN chmod +x /mariadb_script.sh

CMD ["/mariadb_script.sh"]
