FROM	debian:buster

RUN	apt-get update && apt-get upgrade -y
RUN	apt-get install -y \
	mariadb-server \
	vim

COPY	./tools/mariadb_setup.sh /

# 127.0.0.1은 localhost로, 외부에서 접근할 수 없다. 127.0.0.1로 root와 비밀번호를 설정한 다음에,
# 0.0.0.0 모두 접근 가능하도록 열어둔다.
RUN	sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306

CMD	["/bin/bash", "/mariadb_setup.sh"]
