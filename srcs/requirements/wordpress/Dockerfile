FROM	debian:buster

RUN	apt-get update && apt-get upgrade -y
RUN	apt-get install -y \
	mariadb-client \
	wget \
	php7.3-fpm \
	php-cli \
	php-mysql \
	vim

COPY	./tools/wordpress_setup.sh /

# php-fpm.sock 파일을 통해 nginx와 통신한다.
# 기본 설정으로 같은 컨네이너 내에서는 php7.3-fpm.sock 파일을 통해 통신하는 설정이다.
# 외부에서 접근할 수 있도록 0.0.0.0:9000 을 보고 새로운 fd를 생성하고 통신한다.
RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN	mkdir -p /var/www/wordpress
# www-data:www-data 권한은 wordpress 설치 시에 필요
RUN	chown -R  www-data:www-data /var/www/wordpress/

# php-fpm.sock 파일이 생성되는 경로,
# php-fpm.sock 파일을 통해 nginx와 통신한다.
# 없으면 실행이 안 됨!
RUN	mkdir -p /run/php/ 
# wp-config.php 파일이 생성되는 경로, 기본 시작 디렉토리 설정
WORKDIR	/var/www/wordpress

EXPOSE	9000

ENTRYPOINT	["/bin/bash", "/wordpress_setup.sh"]
