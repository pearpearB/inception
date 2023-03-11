FROM	debian:buster

RUN	apt-get update && apt-get upgrade -y
RUN	apt-get install -y \
	nginx \
	openssl \
	vim

COPY    ./conf/default /etc/nginx/sites-available/default

# -x509: 인증서 종류 -nodes: 비밀번호 없이 인증서 생성
RUN	openssl req -newkey rsa:2048 -x509 -nodes -days 365 \ 
	-subj "/C=KR/ST=Seoul/O=42Seoul/OU=Lee" \
	-keyout /etc/ssl/private/private_inception_server.key -out /etc/ssl/certs/inception_server.crt

EXPOSE	443 

ENTRYPOINT	["nginx", "-g", "daemon off;"]
