FROM	debian:buster

RUN	apt-get update && apt-get upgrade -y
RUN	apt-get install -y \
	mariadb-server \
	procps \
	vim

COPY	./tools/mariadb_setup.sh /

RUN	sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306

CMD	["/bin/bash", "/mariadb_setup.sh"]
